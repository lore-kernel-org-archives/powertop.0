Content-Type: multipart/mixed; boundary="===============2571509636626911736=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 1/3] RAPL: Use Powercap sysfs
Date: Wed, 04 Jun 2014 17:35:21 -0700
Message-ID: <1401928523-3378-1-git-send-email-srinivas.pandruvada@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2571509636626911736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linux Powercap sysfs with Intel RAPL driver exists from 3.13.rc1.
Use this to estimate RAPL domain power instead of MSRs. Since
these MSRs are non-architectural, they can be changed from
processor model to model. But by using powercap sysfs, kernel
driver will take care about processor specific variations.
---
 src/cpu/rapl/rapl_interface.cpp | 91 +++++++++++++++++++++++++++++++++++++=
+++-
 src/cpu/rapl/rapl_interface.h   |  7 +++-
 2 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interface.=
cpp
index 6dd7b26..a19e0a9 100644
--- a/src/cpu/rapl/rapl_interface.cpp
+++ b/src/cpu/rapl/rapl_interface.cpp
@@ -27,6 +27,8 @@
 #include <unistd.h>
 #include <errno.h>
 #include <math.h>
+#include <stdlib.h>
+#include <dirent.h>
 #include "lib.h"
 #include "rapl_interface.h"
 =

@@ -68,7 +70,11 @@
 #define PP0_DOMAIN_PRESENT	0x04
 #define PP1_DOMAIN_PRESENT	0x08
 =

-c_rapl_interface::c_rapl_interface(int cpu) :
+c_rapl_interface::c_rapl_interface(const char *dev_name, int cpu) :
+	powercap_sysfs_present(false),
+	powercap_core_path(),
+	powercap_uncore_path(),
+	powercap_dram_path(),
 	measurment_interval(def_sampling_interval),
 	first_cpu(cpu),
 	last_pkg_energy_status(0.0),
@@ -78,10 +84,63 @@ c_rapl_interface::c_rapl_interface(int cpu) :
 {
 	uint64_t value;
 	int ret;
+	string package_path;
+	DIR *dir;
+	struct dirent *entry;
 =

 	RAPL_INFO_PRINT("RAPL device for cpu %d\n", cpu);
 =

 	rapl_domains =3D 0;
+
+	if (dev_name) {
+		string base_path =3D "/sys/class/powercap/intel-rapl/";
+		if ((dir =3D opendir(base_path.c_str())) !=3D NULL) {
+			while ((entry =3D readdir(dir)) !=3D NULL) {
+				string path =3D base_path + entry->d_name + "/name";
+				string str =3D read_sysfs_string(path);
+				if (str.length() > 0) {
+					if (str =3D=3D dev_name) {
+						package_path =3D base_path + entry->d_name + "/";
+						powercap_sysfs_present =3D true;
+						rapl_domains |=3D PKG_DOMAIN_PRESENT;
+						break;
+					}
+				}
+			}
+			closedir(dir);
+		}
+	}
+
+	if (powercap_sysfs_present) {
+		if ((dir =3D opendir(package_path.c_str())) !=3D NULL) {
+			while ((entry =3D readdir(dir)) !=3D NULL) {
+				string path =3D package_path + entry->d_name;
+				string str =3D read_sysfs_string(path + "/name");
+				if (str.length() > 0) {
+					if (str =3D=3D "core") {
+						rapl_domains |=3D PP0_DOMAIN_PRESENT;
+						powercap_core_path =3D path + "/";
+					}
+					else if (str =3D=3D "dram") {
+						rapl_domains |=3D DRAM_DOMAIN_PRESENT;
+						powercap_dram_path =3D path + "/";
+					}
+					else if (str =3D=3D "uncore") {
+						rapl_domains |=3D PP1_DOMAIN_PRESENT;
+						powercap_uncore_path =3D path + "/";
+					}
+				}
+			}
+			closedir(dir);
+		}
+
+		RAPL_INFO_PRINT("RAPL Using PowerCap Sysfs : Domain Mask %x\n",
+														rapl_domains);
+		return;
+	}
+
+	// Fallback to using MSRs
+
 	// presence of each domain
 	// Check presence of PKG domain
 	ret =3D read_msr(first_cpu, MSR_PKG_ENERY_STATUS, &value);
@@ -312,6 +371,16 @@ int c_rapl_interface::get_dram_energy_status(double *s=
tatus)
 		return -1;
 	}
 =

+	if (powercap_sysfs_present) {
+		string str =3D read_sysfs_string(powercap_dram_path + "energy_uj");
+		if (str.length() > 0) {
+			*status =3D  atof(str.c_str()) / 1000000; // uj to Js
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	ret =3D read_msr(first_cpu, MSR_DRAM_ENERY_STATUS, &value);
 	if(ret < 0)
 	{
@@ -393,6 +462,16 @@ int c_rapl_interface::get_pp0_energy_status(double *st=
atus)
 		return -1;
 	}
 =

+	if (powercap_sysfs_present) {
+		string str =3D read_sysfs_string(powercap_core_path + "energy_uj");
+		if (str.length() > 0) {
+			*status =3D atof(str.c_str()) / 1000000; // uj to Js
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	ret =3D read_msr(first_cpu, MSR_PP0_ENERY_STATUS, &value);
 	if(ret < 0)
 	{
@@ -471,6 +550,16 @@ int c_rapl_interface::get_pp1_energy_status(double *st=
atus)
 		return -1;
 	}
 =

+	if (powercap_sysfs_present) {
+		string str =3D read_sysfs_string(powercap_uncore_path + "energy_uj");
+		if (str.length() > 0) {
+			*status =3D  atof(str.c_str()) / 1000000; // uj to Js
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	ret =3D read_msr(first_cpu, MSR_PP1_ENERY_STATUS, &value);
 	if(ret < 0)
 	{
diff --git a/src/cpu/rapl/rapl_interface.h b/src/cpu/rapl/rapl_interface.h
index be863e2..744f595 100644
--- a/src/cpu/rapl/rapl_interface.h
+++ b/src/cpu/rapl/rapl_interface.h
@@ -28,6 +28,11 @@ class c_rapl_interface
 {
 private:
 	static const int def_sampling_interval =3D 1; //In seconds
+	bool powercap_sysfs_present;
+	string powercap_core_path;
+	string powercap_uncore_path;
+	string powercap_dram_path;
+
 	unsigned char rapl_domains;
 	int measurment_interval;
 	int first_cpu;
@@ -45,7 +50,7 @@ private:
 	int write_msr(int cpu, unsigned int idx, uint64_t val);
 =

 public:
-	c_rapl_interface(int cpu =3D 0);
+	c_rapl_interface(const char *dev_name =3D "package-0", int cpu =3D 0);
 =

 	int get_rapl_power_unit(uint64_t *value);
 	double get_power_unit();
-- =

1.7.11.7


--===============2571509636626911736==--

