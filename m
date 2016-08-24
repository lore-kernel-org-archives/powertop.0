Content-Type: multipart/mixed; boundary="===============2906931403831437692=="
MIME-Version: 1.0
From: =?utf-8?q?Ond=C5=99ej_Lyson=C4=9Bk_=3Colysonek_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Fixed some potentially unterminated strings
Date: Wed, 24 Aug 2016 14:09:37 +0200
Message-ID: <69f5af73-a23e-f2e8-7779-d64d9a20cbbb@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2906931403831437692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 src/cpu/cpu.cpp            | 2 +-
 src/devices/ahci.cpp       | 4 ++--
 src/devices/alsa.cpp       | 4 ++--
 src/devices/backlight.cpp  | 2 +-
 src/devices/devfreq.cpp    | 2 +-
 src/devices/network.cpp    | 4 ++--
 src/devices/rfkill.cpp     | 4 ++--
 src/measurement/acpi.cpp   | 2 +-
 src/measurement/extech.cpp | 3 ++-
 src/measurement/sysfs.cpp  | 2 +-
 src/process/interrupt.cpp  | 2 +-
 src/process/timer.cpp      | 2 +-
 src/process/work.cpp       | 2 +-
 src/tuning/ethernet.cpp    | 2 +-
 14 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 64e1d3d..a801033 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -258,7 +258,7 @@ void enumerate_cpus(void)
 				c++;
 				if (*c =3D=3D ' ')
 					c++;
-				strncpy(vendor,c, 127);
+				pt_strcpy(vendor,c);
 			}
 		}
 		if (strncmp(line, "processor\t",10) =3D=3D 0) {
diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index b8adf72..2fa2f52 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -127,12 +127,12 @@ ahci::ahci(char *_name, char *path): device()
 	start_slumber =3D 0;
 	start_devslp =3D 0;
 	start_partial =3D 0;
-	strncpy(sysfs_path, path, sizeof(sysfs_path));
+	pt_strcpy(sysfs_path, path);
 =

 	register_sysfs_path(sysfs_path);
 =

 	snprintf(devname, sizeof(devname), "ahci:%s", _name);
-	strncpy(name, devname, sizeof(name));
+	pt_strcpy(name, devname);
 	active_index =3D get_param_index("ahci-link-power-active");
 	partial_index =3D get_param_index("ahci-link-power-partial");
 =

diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index f7ba2b6..7e22975 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -51,11 +51,11 @@ alsa::alsa(const char *_name, const char *path): device=
()
 	start_active =3D 0;
 	end_inactive =3D 0;
 	start_inactive =3D 0;
-	strncpy(sysfs_path, path, sizeof(sysfs_path));
+	pt_strcpy(sysfs_path, path);
 =

 	snprintf(devname, sizeof(devname), "alsa:%s", _name);
 	snprintf(humanname, sizeof(humanname), "alsa:%s", _name);
-	strncpy(name, devname, sizeof(name));
+	pt_strcpy(name, devname);
 	rindex =3D get_result_index(name);
 =

 	guilty[0] =3D 0;
diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index 609f851..c73e4c9 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -46,7 +46,7 @@ backlight::backlight(const char *_name, const char *path)=
: device()
 	max_level =3D 0;
 	start_level =3D 0;
 	end_level =3D 0;
-	strncpy(sysfs_path, path, sizeof(sysfs_path));
+	pt_strcpy(sysfs_path, path);
 	register_sysfs_path(sysfs_path);
 	snprintf(name, sizeof(name) - 1, "backlight:%s", _name);
 	r_index =3D get_result_index(name);
diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
index 89a36d8..c958865 100644
--- a/src/devices/devfreq.cpp
+++ b/src/devices/devfreq.cpp
@@ -45,7 +45,7 @@ static vector<class devfreq *> all_devfreq;
 =

 devfreq::devfreq(const char* dpath): device()
 {
-	strncpy(dir_name, dpath, sizeof(dir_name));
+	pt_strcpy(dir_name, dpath);
 }
 =

 uint64_t devfreq::parse_freq_time(char* pchr)
diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index f8f4212..8087b7f 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -141,11 +141,11 @@ network::network(const char *_name, const char *path)=
: device()
 	valid_high =3D -1;
 	valid_powerunsave =3D -1;
 =

-	strncpy(sysfs_path, path, sizeof(sysfs_path));
+	pt_strcpy(sysfs_path, path);
 	register_sysfs_path(sysfs_path);
 	pt_strcpy(devname, _name);
 	sprintf(humanname, "nic:%s", _name);
-	strncpy(name, devname, sizeof(name));
+	pt_strcpy(name, devname);
 =

 	snprintf(devname, sizeof(devname), "%s-up", _name);
 	index_up =3D get_param_index(devname);
diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
index 2115b5b..99a652f 100644
--- a/src/devices/rfkill.cpp
+++ b/src/devices/rfkill.cpp
@@ -50,11 +50,11 @@ rfkill::rfkill(char *_name, char *path): device()
 	start_hard =3D 0;
 	end_soft =3D 0;
 	end_hard =3D 0;
-	strncpy(sysfs_path, path, sizeof(sysfs_path));
+	pt_strcpy(sysfs_path, path);
 	register_sysfs_path(sysfs_path);
 	snprintf(devname, sizeof(devname), "radio:%s", _name);
 	snprintf(humanname, sizeof(humanname), "radio:%s", _name);
-	strncpy(name, devname, sizeof(name));
+	pt_strcpy(name, devname);
 	register_parameter(devname);
 	index =3D get_param_index(devname);
 	rindex =3D get_result_index(name);
diff --git a/src/measurement/acpi.cpp b/src/measurement/acpi.cpp
index ede2782..572852c 100644
--- a/src/measurement/acpi.cpp
+++ b/src/measurement/acpi.cpp
@@ -39,7 +39,7 @@ acpi_power_meter::acpi_power_meter(const char *acpi_name)
 	rate =3D 0.0;
 	capacity =3D 0.0;
 	voltage =3D 0.0;
-	strncpy(battery_name, acpi_name, sizeof(battery_name));
+	pt_strcpy(battery_name, acpi_name);
 }
 =

 /*
diff --git a/src/measurement/extech.cpp b/src/measurement/extech.cpp
index 0849907..867aca7 100644
--- a/src/measurement/extech.cpp
+++ b/src/measurement/extech.cpp
@@ -54,6 +54,7 @@
 =

 #include "measurement.h"
 #include "extech.h"
+#include "../lib.h"
 #include <iostream>
 #include <fstream>
 #include <string.h>
@@ -268,7 +269,7 @@ static double extech_read(int fd)
 extech_power_meter::extech_power_meter(const char *extech_name)
 {
 	rate =3D 0.0;
-	strncpy(dev_name, extech_name, sizeof(dev_name));
+	pt_strcpy(dev_name, extech_name);
 	int ret;
 =

 	fd =3D open_device(dev_name);
diff --git a/src/measurement/sysfs.cpp b/src/measurement/sysfs.cpp
index 8126104..c5a7a12 100644
--- a/src/measurement/sysfs.cpp
+++ b/src/measurement/sysfs.cpp
@@ -33,7 +33,7 @@ sysfs_power_meter::sysfs_power_meter(const char *power_su=
pply_name)
 {
 	rate =3D 0.0;
 	capacity =3D 0.0;
-	strncpy(name, power_supply_name, sizeof(name));
+	pt_strcpy(name, power_supply_name);
 }
 =

 bool sysfs_power_meter::get_sysfs_attr(const char *attribute, int *value)
diff --git a/src/process/interrupt.cpp b/src/process/interrupt.cpp
index 53b0367..a6553b1 100644
--- a/src/process/interrupt.cpp
+++ b/src/process/interrupt.cpp
@@ -49,7 +49,7 @@ interrupt::interrupt(const char *_handler, int _number) :=
 power_consumer()
 	char buf[128];
 	running_since =3D 0;
 	number =3D _number;
-	strncpy(handler, _handler, 31);
+	pt_strcpy(handler, _handler);
 	raw_count =3D 0;
 	snprintf(desc, sizeof(desc), "[%i] %s", number, pretty_print(handler, buf=
, 128));
 }
diff --git a/src/process/timer.cpp b/src/process/timer.cpp
index d2b5abe..5d9d2f8 100644
--- a/src/process/timer.cpp
+++ b/src/process/timer.cpp
@@ -61,7 +61,7 @@ static bool timer_is_deferred(const char *handler)
 =

 timer::timer(unsigned long address) : power_consumer()
 {
-	strncpy(handler, kernel_function(address), 31);
+	pt_strcpy(handler, kernel_function(address));
 	raw_count =3D 0;
 	deferred =3D timer_is_deferred(handler);
 }
diff --git a/src/process/work.cpp b/src/process/work.cpp
index 797f766..1b5c71d 100644
--- a/src/process/work.cpp
+++ b/src/process/work.cpp
@@ -38,7 +38,7 @@ using namespace std;
 =

 work::work(unsigned long address) : power_consumer()
 {
-	strncpy(handler, kernel_function(address), 31);
+	pt_strcpy(handler, kernel_function(address));
 	raw_count =3D 0;
 	snprintf(desc, sizeof(desc), "%s", handler);
 }
diff --git a/src/tuning/ethernet.cpp b/src/tuning/ethernet.cpp
index 6b1f393..5b128d1 100644
--- a/src/tuning/ethernet.cpp
+++ b/src/tuning/ethernet.cpp
@@ -50,7 +50,7 @@ extern void create_all_nics(callback fn);
 ethernet_tunable::ethernet_tunable(const char *iface) : tunable("", 0.3, _=
("Good"), _("Bad"), _("Unknown"))
 {
 	memset(interf, 0, sizeof(interf));
-	strncpy(interf, iface, sizeof(interf));
+	pt_strcpy(interf, iface);
 	sprintf(desc, _("Wake-on-lan status for device %s"), iface);
 	snprintf(toggle_good, sizeof(toggle_good), "ethtool -s %s wol d;", iface);
 =

-- =

2.5.5


--===============2906931403831437692==--

