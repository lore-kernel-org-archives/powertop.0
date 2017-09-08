Content-Type: multipart/mixed; boundary="===============8503968394193169595=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 1/4 v1] lib: refactor pci_access checks
Date: Fri, 08 Sep 2017 15:36:48 -0700
Message-ID: <20170908223651.27979-2-joe.konno@linux.intel.com>
In-Reply-To: 20170908223651.27979-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8503968394193169595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Pull the libpci initialization bits out and into its own dedicated function.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/lib.cpp | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 5e48f375d087..2b95e64f427b 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -296,16 +296,21 @@ void format_watts(double W, char *buffer, unsigned in=
t len)
 #ifndef HAVE_NO_PCI
 static struct pci_access *pci_access;
 =

+static void check_pci_access(void)
+{
+	if (!pci_access) {
+		pci_access =3D pci_alloc();
+		pci_init(pci_access);
+	}
+}
+
 char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int l=
en)
 {
 	char *ret;
 =

 	buffer[0] =3D 0;
 =

-	if (!pci_access) {
-		pci_access =3D pci_alloc();
-		pci_init(pci_access);
-	}
+	check_pci_access();
 =

 	ret =3D pci_lookup_name(pci_access, buffer, len, PCI_LOOKUP_VENDOR | PCI_=
LOOKUP_DEVICE, vendor, device);
 =

-- =

2.13.5


--===============8503968394193169595==--

