Content-Type: multipart/mixed; boundary="===============1075592148907865597=="
MIME-Version: 1.0
From: ayates1 <alexandra.yates at intel.com>
Subject: [Powertop] [PATCH] linux-3.9.0-ahci-alpm-with-devslp-accounting
Date: Wed, 31 Jul 2013 10:47:29 -0700
Message-ID: <1375292849-11452-2-git-send-email-alexandra.yates@intel.com>
In-Reply-To: 1375292849-11452-1-git-send-email-alexandra.yates@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1075592148907865597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: ayates1 <alexandra.yates(a)linux.intel.com>

---
 drivers/ata/ahci.h    |  17 ++++
 drivers/ata/libahci.c | 211 ++++++++++++++++++++++++++++++++++++++++++++++=
+++-
 2 files changed, 226 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
index 1145637..97208fe 100644
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@ -286,6 +286,14 @@ struct ahci_em_priv {
 	unsigned long led_state;
 };
 =

+enum ahci_port_states {
+	AHCI_PORT_NOLINK =3D 0,
+	AHCI_PORT_ACTIVE =3D 1,
+	AHCI_PORT_PARTIAL =3D 2,
+	AHCI_PORT_SLUMBER =3D 3,
+	AHCI_PORT_DEVSLP =3D 4
+};
+
 struct ahci_port_priv {
 	struct ata_link		*active_link;
 	struct ahci_cmd_hdr	*cmd_slot;
@@ -307,6 +315,15 @@ struct ahci_port_priv {
 	/* enclosure management info per PM slot */
 	struct ahci_em_priv	em_priv[EM_MAX_SLOTS];
 	char			*irq_desc;	/* desc in /proc/interrupts */
+
+	/* ALPM accounting state and stats */
+	unsigned int 		accounting_active:1;
+	u64			active_jiffies;
+	u64			partial_jiffies;
+	u64			slumber_jiffies;
+	u64			devslp_jiffies;
+	int			previous_state;
+	int			previous_jiffies;
 };
 =

 struct ahci_host_priv {
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index acfd0f7..531a034 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -100,6 +100,19 @@ static ssize_t ahci_activity_store(struct ata_device *=
dev,
 				   enum sw_activity val);
 static void ahci_init_sw_activity(struct ata_link *link);
 =

+static ssize_t ahci_alpm_show_active(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+static ssize_t ahci_alpm_show_slumber(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+static ssize_t ahci_alpm_show_devslp(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+static ssize_t ahci_alpm_show_partial(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+static ssize_t ahci_alpm_show_accounting(struct device *dev,
+				  struct device_attribute *attr, char *buf);
+static ssize_t ahci_alpm_set_accounting(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count);
 static ssize_t ahci_show_host_caps(struct device *dev,
 				   struct device_attribute *attr, char *buf);
 static ssize_t ahci_show_host_cap2(struct device *dev,
@@ -120,6 +133,13 @@ static DEVICE_ATTR(ahci_host_caps, S_IRUGO, ahci_show_=
host_caps, NULL);
 static DEVICE_ATTR(ahci_host_cap2, S_IRUGO, ahci_show_host_cap2, NULL);
 static DEVICE_ATTR(ahci_host_version, S_IRUGO, ahci_show_host_version, NUL=
L);
 static DEVICE_ATTR(ahci_port_cmd, S_IRUGO, ahci_show_port_cmd, NULL);
+static DEVICE_ATTR(ahci_alpm_active, S_IRUGO, ahci_alpm_show_active, NULL);
+static DEVICE_ATTR(ahci_alpm_partial, S_IRUGO, ahci_alpm_show_partial, NUL=
L);
+static DEVICE_ATTR(ahci_alpm_slumber, S_IRUGO, ahci_alpm_show_slumber, NUL=
L);
+static DEVICE_ATTR(ahci_alpm_devslp, S_IRUGO, ahci_alpm_show_devslp, NULL);
+static DEVICE_ATTR(ahci_alpm_accounting, S_IRUGO | S_IWUSR,
+		ahci_alpm_show_accounting, ahci_alpm_set_accounting);
+
 static DEVICE_ATTR(em_buffer, S_IWUSR | S_IRUGO,
 		   ahci_read_em_buffer, ahci_store_em_buffer);
 static DEVICE_ATTR(em_message_supported, S_IRUGO, ahci_show_em_supported, =
NULL);
@@ -132,6 +152,11 @@ struct device_attribute *ahci_shost_attrs[] =3D {
 	&dev_attr_ahci_host_cap2,
 	&dev_attr_ahci_host_version,
 	&dev_attr_ahci_port_cmd,
+	&dev_attr_ahci_alpm_active,
+	&dev_attr_ahci_alpm_partial,
+	&dev_attr_ahci_alpm_slumber,
+	&dev_attr_ahci_alpm_devslp,
+	&dev_attr_ahci_alpm_accounting,
 	&dev_attr_em_buffer,
 	&dev_attr_em_message_supported,
 	NULL
@@ -225,6 +250,182 @@ static void ahci_enable_ahci(void __iomem *mmio)
 	WARN_ON(1);
 }
 =

+static int get_current_alpm_state(struct ata_port *ap)
+{
+	u32 status =3D 0;
+
+	ahci_scr_read(&ap->link, SCR_STATUS, &status);
+
+	/* link status is in bits 11-8 */
+	status =3D status >> 8;
+	status =3D status & 0xf;
+
+	if (status =3D=3D 8)
+		return AHCI_PORT_DEVSLP;
+	if (status =3D=3D 6)
+		return AHCI_PORT_SLUMBER;
+	if (status =3D=3D 2)
+		return AHCI_PORT_PARTIAL;
+	if (status =3D=3D 1)
+		return AHCI_PORT_ACTIVE;
+	return AHCI_PORT_NOLINK;
+}
+
+static void account_alpm_stats(struct ata_port *ap)
+{
+	struct ahci_port_priv *pp;
+
+	int new_state;
+	u64 new_jiffies, jiffies_delta;
+
+	if (ap =3D=3D NULL)
+		return;
+	pp =3D ap->private_data;
+
+	if (!pp) return;
+
+	new_state =3D get_current_alpm_state(ap);
+	new_jiffies =3D jiffies;
+
+	jiffies_delta =3D new_jiffies - pp->previous_jiffies;
+
+	switch (pp->previous_state) {
+	case AHCI_PORT_NOLINK:
+		pp->active_jiffies =3D 0;
+		pp->partial_jiffies =3D 0;
+		pp->slumber_jiffies =3D 0;
+		break;
+	case AHCI_PORT_ACTIVE:
+		pp->active_jiffies +=3D jiffies_delta;
+		break;
+	case AHCI_PORT_PARTIAL:
+		pp->partial_jiffies +=3D jiffies_delta;
+		break;
+	case AHCI_PORT_SLUMBER:
+		pp->slumber_jiffies +=3D jiffies_delta;
+		break;
+	case AHCI_PORT_DEVSLP:
+		pp->devslp_jiffies +=3D jiffies_delta;
+		break;
+	default:
+		break;
+	}
+	pp->previous_state =3D new_state;
+	pp->previous_jiffies =3D new_jiffies;
+}
+
+static ssize_t ahci_alpm_show_active(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return -EINVAL;
+
+	pp =3D ap->private_data;
+	account_alpm_stats(ap);
+
+	return sprintf(buf, "%u\n", jiffies_to_msecs(pp->active_jiffies));
+}
+
+static ssize_t ahci_alpm_show_partial(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return -EINVAL;
+
+	pp =3D ap->private_data;
+	account_alpm_stats(ap);
+
+	return sprintf(buf, "%u\n", jiffies_to_msecs(pp->partial_jiffies));
+}
+
+static ssize_t ahci_alpm_show_slumber(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return -EINVAL;
+
+	pp =3D ap->private_data;
+	account_alpm_stats(ap);
+
+	return sprintf(buf, "%u\n", jiffies_to_msecs(pp->slumber_jiffies));
+}
+
+static ssize_t ahci_alpm_show_devslp(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return -EINVAL;
+
+	pp =3D ap->private_data;
+	account_alpm_stats(ap);
+
+	return sprintf(buf, "%u\n", jiffies_to_msecs(pp->devslp_jiffies));
+}
+
+static ssize_t ahci_alpm_show_accounting(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return -EINVAL;
+
+	pp =3D ap->private_data;
+
+	return sprintf(buf, "%u\n", pp->accounting_active);
+}
+
+static ssize_t ahci_alpm_set_accounting(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	unsigned long flags;
+	struct Scsi_Host *shost =3D class_to_shost(dev);
+	struct ata_port *ap =3D ata_shost_to_port(shost);
+	struct ahci_port_priv *pp;
+	void __iomem *port_mmio;
+
+	if (!ap || ata_port_is_dummy(ap))
+		return 1;
+
+	pp =3D ap->private_data;
+	port_mmio =3D ahci_port_base(ap);
+
+	if (!pp)
+		return 1;
+	if (buf[0] =3D=3D '0')
+		pp->accounting_active =3D 0;
+	if (buf[0] =3D=3D '1')
+		pp->accounting_active =3D 1;
+
+	/* we need to enable the PHYRDY interrupt when we want accounting */
+	if (pp->accounting_active) {
+		spin_lock_irqsave(ap->lock, flags);
+		pp->intr_mask |=3D PORT_IRQ_PHYRDY;
+		writel(pp->intr_mask, port_mmio + PORT_IRQ_MASK);
+		spin_unlock_irqrestore(ap->lock, flags);
+	}
+	return count;
+}
+
 static ssize_t ahci_show_host_caps(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -680,9 +881,14 @@ static int ahci_set_lpm(struct ata_link *link, enum at=
a_lpm_policy policy,
 		 * Disable interrupts on Phy Ready. This keeps us from
 		 * getting woken up due to spurious phy ready
 		 * interrupts.
+		 *
+		 * However, when accounting_active is set, we do want
+		 * the interrupts for accounting purposes.
 		 */
-		pp->intr_mask &=3D ~PORT_IRQ_PHYRDY;
-		writel(pp->intr_mask, port_mmio + PORT_IRQ_MASK);
+		if (!pp->accounting_active) {
+			pp->intr_mask &=3D ~PORT_IRQ_PHYRDY;
+			writel(pp->intr_mask, port_mmio + PORT_IRQ_MASK);
+		}
 =

 		sata_link_scr_lpm(link, policy, false);
 	}
@@ -1672,6 +1878,7 @@ static void ahci_handle_port_interrupt(struct ata_por=
t *ap,
 	/* if LPM is enabled, PHYRDY doesn't mean anything */
 	if (ap->link.lpm_policy > ATA_LPM_MAX_POWER) {
 		status &=3D ~PORT_IRQ_PHYRDY;
+		account_alpm_stats(ap);
 		ahci_scr_write(&ap->link, SCR_ERROR, SERR_PHYRDY_CHG);
 	}
 =

-- =

1.8.1.2


--===============1075592148907865597==--

