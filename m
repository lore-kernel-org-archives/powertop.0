Content-Type: multipart/mixed; boundary="===============3240168068090102989=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: [Powertop] [PATCH 2/2] Avoid hardcoding magic values when sizeof can
 be used
Date: Fri, 13 Nov 2015 16:50:21 +0100
Message-ID: <1447429821-1631-3-git-send-email-jengelh@inai.de>
In-Reply-To: 1447429821-1631-1-git-send-email-jengelh@inai.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3240168068090102989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

---
 src/calibrate/calibrate.cpp   | 16 +++++++-------
 src/cpu/abstract_cpu.cpp      |  8 +++----
 src/cpu/cpu.cpp               |  4 ++--
 src/cpu/cpu_linux.cpp         | 26 +++++++++++-----------
 src/cpu/intel_cpus.cpp        |  6 +++---
 src/devices/ahci.cpp          | 50 +++++++++++++++++++++------------------=
----
 src/devices/alsa.cpp          | 30 +++++++++++++-------------
 src/devices/backlight.cpp     | 18 ++++++++--------
 src/devices/devfreq.cpp       |  2 +-
 src/devices/rfkill.cpp        | 30 +++++++++++++-------------
 src/devices/runtime_pm.cpp    | 26 +++++++++++-----------
 src/devices/usb.cpp           | 32 +++++++++++++--------------
 src/devlist.cpp               |  8 +++----
 src/lib.cpp                   | 10 ++++-----
 src/main.cpp                  |  6 +++---
 src/measurement/acpi.cpp      |  4 ++--
 src/measurement/sysfs.cpp     |  2 +-
 src/parameters/parameters.cpp |  4 ++--
 src/report/report.cpp         |  4 ++--
 src/tuning/ethernet.cpp       |  2 +-
 src/tuning/runtime.cpp        | 14 ++++++------
 src/tuning/tuningi2c.cpp      | 18 ++++++++--------
 src/tuning/tuningsysfs.cpp    |  8 +++----
 src/tuning/tuningusb.cpp      | 28 ++++++++++++------------
 src/tuning/wifi.cpp           |  4 ++--
 25 files changed, 180 insertions(+), 180 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index eacaeec..60ab892 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -91,20 +91,20 @@ static void find_all_usb_callback(const char *d_name)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/power/active_durati=
on", d_name);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/power/activ=
e_duration", d_name);
 	if (access(filename, R_OK) !=3D 0)
 		return;
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/power/idVendor", d_=
name);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/power/idVen=
dor", d_name);
 	file.open(filename, ios::in);
 	if (file) {
-		file.getline(filename, 4096);
+		file.getline(filename, sizeof(filename));
 		file.close();
 		if (strcmp(filename, "1d6b") =3D=3D 0)
 			return;
 	}
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/power/control", d_n=
ame);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/power/contr=
ol", d_name);
 	save_sysfs(filename);
 	usb_devices.push_back(filename);
 }
@@ -125,7 +125,7 @@ static void suspend_all_usb_devices(void)
 static void find_all_rfkill_callback(const char *d_name)
 {
 	char filename[PATH_MAX];
-	snprintf(filename, PATH_MAX, "/sys/class/rfkill/%s/soft", d_name);
+	snprintf(filename, sizeof(filename), "/sys/class/rfkill/%s/soft", d_name);
 	if (access(filename, R_OK) !=3D 0)
 		return;
 	save_sysfs(filename);
@@ -155,13 +155,13 @@ static void unrfkill_all_radios(void)
 static void find_backlight_callback(const char *d_name)
 {
 	char filename[PATH_MAX];
-	snprintf(filename, PATH_MAX, "/sys/class/backlight/%s/brightness", d_name=
);
+	snprintf(filename, sizeof(filename), "/sys/class/backlight/%s/brightness"=
, d_name);
 	if (access(filename, R_OK) !=3D 0)
 		return;
 =

 	save_sysfs(filename);
 	backlight_devices.push_back(filename);
-	snprintf(filename, PATH_MAX, "/sys/class/backlight/%s/max_brightness", d_=
name);
+	snprintf(filename, sizeof(filename), "/sys/class/backlight/%s/max_brightn=
ess", d_name);
 	blmax =3D read_sysfs(filename);
 }
 =

@@ -181,7 +181,7 @@ static void lower_backlight(void)
 static void find_scsi_link_callback(const char *d_name)
 {
 	char filename[PATH_MAX];
-	snprintf(filename, PATH_MAX, "/sys/class/scsi_host/%s/link_power_manageme=
nt_policy", d_name);
+	snprintf(filename, sizeof(filename), "/sys/class/scsi_host/%s/link_power_=
management_policy", d_name);
 	if (access(filename, R_OK)!=3D0)
 		return;
 =

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index cacb130..f419dbf 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -112,7 +112,7 @@ void abstract_cpu::measurement_start(void)
 	old_idle =3D true;
 =

 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/scali=
ng_available_frequencies", number);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/scaling_available_frequencies", number);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> max_frequency;
@@ -446,12 +446,12 @@ void abstract_cpu::wiggle(void)
 =

 	/* wiggle a CPU so that we have a record of it at the start and end of th=
e perf trace */
 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/scali=
ng_max_freq", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/scaling_max_freq", first_cpu);
 	ifile.open(filename, ios::in);
 	ifile >> maxf;
 	ifile.close();
 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/scali=
ng_min_freq", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/scaling_min_freq", first_cpu);
 	ifile.open(filename, ios::in);
 	ifile >> minf;
 	ifile.close();
@@ -462,7 +462,7 @@ void abstract_cpu::wiggle(void)
 	ofile.open(filename, ios::out);
 	ofile << minf;
 	ofile.close();
-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/scali=
ng_max_freq", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/scaling_max_freq", first_cpu);
 	ofile.open(filename, ios::out);
 	ofile << minf;
 	ofile.close();
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 499b752..9ca320f 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -157,14 +157,14 @@ static void handle_one_cpu(unsigned int number, char =
*vendor, int family, int mo
 	unsigned int core_number =3D 0;
 	class abstract_cpu *package, *core, *cpu;
 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/topology/core=
_id", number);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/topol=
ogy/core_id", number);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> core_number;
 		file.close();
 	}
 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/topology/phys=
ical_package_id", number);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/topol=
ogy/physical_package_id", number);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> package_number;
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index deaa12c..2e8dba3 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -46,7 +46,7 @@ void cpu_linux::parse_cstates_start(void)
 	char filename[256];
 	int len;
 =

-	len =3D snprintf(filename, 256, "/sys/devices/system/cpu/cpu%i/cpuidle", =
number);
+	len =3D snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu=
%i/cpuidle", number);
 =

 	dir =3D opendir(filename);
 	if (!dir)
@@ -67,18 +67,18 @@ void cpu_linux::parse_cstates_start(void)
 		pt_strcpy(linux_name, entry->d_name);
 		pt_strcpy(human_name, linux_name);
 =

-		snprintf(filename + len, 256 - len, "/%s/name", entry->d_name);
+		snprintf(filename + len, sizeof(filename) - len, "/%s/name", entry->d_na=
me);
 =

 		file.open(filename, ios::in);
 		if (file) {
-			file.getline(human_name, 64);
+			file.getline(human_name, sizeof(human_name));
 			file.close();
 		}
 =

 		if (strcmp(human_name, "C0")=3D=3D0)
 			pt_strcpy(human_name, _("C0 polling"));
 =

-		snprintf(filename + len, 256 - len, "/%s/usage", entry->d_name);
+		snprintf(filename + len, sizeof(filename) - len, "/%s/usage", entry->d_n=
ame);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> usage;
@@ -86,7 +86,7 @@ void cpu_linux::parse_cstates_start(void)
 		} else
 			continue;
 =

-		snprintf(filename + len, 256 - len, "/%s/time", entry->d_name);
+		snprintf(filename + len, sizeof(filename) - len, "/%s/time", entry->d_na=
me);
 =

 		file.open(filename, ios::in);
 		if (file) {
@@ -113,7 +113,7 @@ void cpu_linux::parse_pstates_start(void)
 		if (children[i])
 			children[i]->wiggle();
 =

-	snprintf(filename, 256, "/sys/devices/system/cpu/cpu%i/cpufreq/stats/time=
_in_state", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/stats/time_in_state", first_cpu);
 =

 	file.open(filename, ios::in);
 =

@@ -122,7 +122,7 @@ void cpu_linux::parse_pstates_start(void)
 =

 		while (file) {
 			uint64_t f;
-			file.getline(line, 1024);
+			file.getline(line, sizeof(line));
 			f =3D strtoull(line, NULL, 10);
 			account_freq(f, 0);
 		}
@@ -146,7 +146,7 @@ void cpu_linux::parse_cstates_end(void)
 	ifstream file;
 	int len;
 =

-	len =3D snprintf(filename, 256, "/sys/devices/system/cpu/cpu%i/cpuidle", =
number);
+	len =3D snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu=
%i/cpuidle", number);
 =

 	dir =3D opendir(filename);
 	if (!dir)
@@ -168,7 +168,7 @@ void cpu_linux::parse_cstates_end(void)
 		pt_strcpy(human_name, linux_name);
 =

 =

-		snprintf(filename + len, 256 - len, "/%s/usage", entry->d_name);
+		snprintf(filename + len, sizeof(filename) - len, "/%s/usage", entry->d_n=
ame);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> usage;
@@ -176,7 +176,7 @@ void cpu_linux::parse_cstates_end(void)
 		} else
 			continue;
 =

-		snprintf(filename + len, 256 - len, "/%s/time", entry->d_name);
+		snprintf(filename + len, sizeof(filename) - len, "/%s/time", entry->d_na=
me);
 =

 		file.open(filename, ios::in);
 		if (file) {
@@ -196,7 +196,7 @@ void cpu_linux::parse_pstates_end(void)
 	char filename[256];
 	ifstream file;
 =

-	snprintf(filename, 256, "/sys/devices/system/cpu/cpu%i/cpufreq/stats/time=
_in_state", number);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/stats/time_in_state", number);
 =

 	file.open(filename, ios::in);
 =

@@ -207,9 +207,9 @@ void cpu_linux::parse_pstates_end(void)
 			uint64_t f,count;
 			char *c;
 =

-			memset(line, 0, 1024);
+			memset(line, 0, sizeof(line));
 =

-			file.getline(line, 1024);
+			file.getline(line, sizeof(line));
 =

 			f =3D strtoull(line, &c, 10);
 			if (!c)
diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 999ba07..7cb9d45 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -175,7 +175,7 @@ void nhm_core::measurement_start(void)
 	}
 =

 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/stats=
/time_in_state", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/stats/time_in_state", first_cpu);
 =

 	file.open(filename, ios::in);
 =

@@ -517,7 +517,7 @@ void nhm_cpu::measurement_start(void)
 =

 	insert_cstate("active", _("C0 active"), 0, aperf_before, 1);
 =

-	snprintf(filename, PATH_MAX, "/sys/devices/system/cpu/cpu%i/cpufreq/stats=
/time_in_state", first_cpu);
+	snprintf(filename, sizeof(filename), "/sys/devices/system/cpu/cpu%i/cpufr=
eq/stats/time_in_state", first_cpu);
 =

 	file.open(filename, ios::in);
 =

@@ -526,7 +526,7 @@ void nhm_cpu::measurement_start(void)
 =

 		while (file) {
 			uint64_t f;
-			file.getline(line, 1024);
+			file.getline(line, sizeof(line));
 			f =3D strtoull(line, NULL, 10);
 			account_freq(f, 0);
 		}
diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index a9ca84b..b8adf72 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -51,7 +51,7 @@ static string disk_name(char *path, char *target, char *s=
hortname)
 	char pathname[PATH_MAX];
 	string diskname =3D "";
 =

-	snprintf(pathname, PATH_MAX, "%s/%s", path, target);
+	snprintf(pathname, sizeof(pathname), "%s/%s", path, target);
 	dir =3D opendir(pathname);
 	if (!dir)
 		return diskname;
@@ -65,10 +65,10 @@ static string disk_name(char *path, char *target, char =
*shortname)
 		if (!strchr(dirent->d_name, ':'))
 			continue;
 =

-		snprintf(line, PATH_MAX, "%s/%s/model", pathname, dirent->d_name);
+		snprintf(line, sizeof(line), "%s/%s/model", pathname, dirent->d_name);
 		file =3D fopen(line, "r");
 		if (file) {
-			if (fgets(line, 4096, file) =3D=3D NULL) {
+			if (fgets(line, sizeof(line), file) =3D=3D NULL) {
 				fclose(file);
 				break;
 			}
@@ -92,7 +92,7 @@ static string model_name(char *path, char *shortname)
 	struct dirent *dirent;
 	char pathname[PATH_MAX];
 =

-	snprintf(pathname, PATH_MAX, "%s/device", path);
+	snprintf(pathname, sizeof(pathname), "%s/device", path);
 =

 	dir =3D opendir(pathname);
 	if (!dir)
@@ -131,29 +131,29 @@ ahci::ahci(char *_name, char *path): device()
 =

 	register_sysfs_path(sysfs_path);
 =

-	snprintf(devname, 128, "ahci:%s", _name);
+	snprintf(devname, sizeof(devname), "ahci:%s", _name);
 	strncpy(name, devname, sizeof(name));
 	active_index =3D get_param_index("ahci-link-power-active");
 	partial_index =3D get_param_index("ahci-link-power-partial");
 =

-	snprintf(buffer, 4096, "%s-active", name);
+	snprintf(buffer, sizeof(buffer), "%s-active", name);
 	active_rindex =3D get_result_index(buffer);
 =

-	snprintf(buffer, 4096, "%s-partial", name);
+	snprintf(buffer, sizeof(buffer), "%s-partial", name);
 	partial_rindex =3D get_result_index(buffer);
 =

-	snprintf(buffer, 4096, "%s-slumber", name);
+	snprintf(buffer, sizeof(buffer), "%s-slumber", name);
 	slumber_rindex =3D get_result_index(buffer);
 =

-	snprintf(buffer, 4096, "%s-devslp", name);
+	snprintf(buffer, sizeof(buffer), "%s-devslp", name);
 	devslp_rindex =3D get_result_index(buffer);
 =

 	diskname =3D model_name(path, _name);
 =

 	if (strlen(diskname.c_str()) =3D=3D 0)
-		snprintf(humanname, 4096, _("SATA link: %s"), _name);
+		snprintf(humanname, sizeof(humanname), _("SATA link: %s"), _name);
 	else
-		snprintf(humanname, 4096, _("SATA disk: %s"), diskname.c_str());
+		snprintf(humanname, sizeof(humanname), _("SATA disk: %s"), diskname.c_st=
r());
 }
 =

 void ahci::start_measurement(void)
@@ -161,27 +161,27 @@ void ahci::start_measurement(void)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "%s/ahci_alpm_active", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
 	try {
 		file.open(filename, ios::in);
 		if (file) {
 			file >> start_active;
 		}
 		file.close();
-		snprintf(filename, PATH_MAX, "%s/ahci_alpm_partial", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
 		file.open(filename, ios::in);
 =

 		if (file) {
 			file >> start_partial;
 		}
 		file.close();
-		snprintf(filename, PATH_MAX, "%s/ahci_alpm_slumber", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> start_slumber;
 		}
 		file.close();
-		snprintf(filename, PATH_MAX, "%s/ahci_alpm_devslp", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> start_devslp;
@@ -203,25 +203,25 @@ void ahci::end_measurement(void)
 	double total;
 =

 	try {
-		snprintf(filename, 4096, "%s/ahci_alpm_active", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> end_active;
 		}
 		file.close();
-		snprintf(filename, 4096, "%s/ahci_alpm_partial", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> end_partial;
 		}
 		file.close();
-		snprintf(filename, 4096, "%s/ahci_alpm_slumber", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> end_slumber;
 		}
 		file.close();
-		snprintf(filename, 4096, "%s/ahci_alpm_devslp", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> end_devslp;
@@ -245,28 +245,28 @@ void ahci::end_measurement(void)
 	p =3D (end_active - start_active) / total * 100.0;
 	if (p < 0)
 		 p =3D 0;
-	snprintf(powername, 4096, "%s-active", name);
+	snprintf(powername, sizeof(powername), "%s-active", name);
 	report_utilization(powername, p);
 =

 	/* percent in partial */
 	p =3D (end_partial - start_partial) / total * 100.0;
 	if (p < 0)
 		 p =3D 0;
-	snprintf(powername, 4096, "%s-partial", name);
+	snprintf(powername, sizeof(powername), "%s-partial", name);
 	report_utilization(powername, p);
 =

 	/* percent in slumber */
 	p =3D (end_slumber - start_slumber) / total * 100.0;
 	if (p < 0)
 		 p =3D 0;
-	snprintf(powername, 4096, "%s-slumber", name);
+	snprintf(powername, sizeof(powername), "%s-slumber", name);
 	report_utilization(powername, p);
 =

 	/* percent in devslp */
 	p =3D (end_devslp - start_devslp) / total * 100.0;
 	if (p < 0)
 		 p =3D 0;
-	snprintf(powername, 4096, "%s-devslp", name);
+	snprintf(powername, sizeof(powername), "%s-devslp", name);
 	report_utilization(powername, p);
 }
 =

@@ -306,7 +306,7 @@ void create_all_ahcis(void)
 			break;
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
-		snprintf(filename, PATH_MAX, "/sys/class/scsi_host/%s/ahci_alpm_accounti=
ng", entry->d_name);
+		snprintf(filename, sizeof(filename), "/sys/class/scsi_host/%s/ahci_alpm_=
accounting", entry->d_name);
 =

 		check_file.open(filename, ios::in);
 		check_file.get();
@@ -319,7 +319,7 @@ void create_all_ahcis(void)
 			continue;
 		file << 1 ;
 		file.close();
-		snprintf(filename, PATH_MAX, "/sys/class/scsi_host/%s", entry->d_name);
+		snprintf(filename, sizeof(filename), "/sys/class/scsi_host/%s", entry->d=
_name);
 =

 		bl =3D new class ahci(entry->d_name, filename);
 		all_devices.push_back(bl);
diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 7bc370b..425b58a 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -53,32 +53,32 @@ alsa::alsa(const char *_name, const char *path): device=
()
 	start_inactive =3D 0;
 	strncpy(sysfs_path, path, sizeof(sysfs_path));
 =

-	snprintf(devname, 4096, "alsa:%s", _name);
-	snprintf(humanname, 4096, "alsa:%s", _name);
+	snprintf(devname, sizeof(devname), "alsa:%s", _name);
+	snprintf(humanname, sizeof(humanname), "alsa:%s", _name);
 	strncpy(name, devname, sizeof(name));
 	rindex =3D get_result_index(name);
 =

 	guilty[0] =3D 0;
 	model[0] =3D 0;
 	vendor[0] =3D 0;
-	snprintf(devname, 4096, "%s/modelname", path);
+	snprintf(devname, sizeof(devname), "%s/modelname", path);
 	file.open(devname);
 	if (file) {
-		file.getline(model, 4096);
+		file.getline(model, sizeof(model));
 		file.close();
 	}
-	snprintf(devname, 4096, "%s/vendor_name", path);
+	snprintf(devname, sizeof(devname), "%s/vendor_name", path);
 	file.open(devname);
 	if (file) {
-		file.getline(vendor, 4096);
+		file.getline(vendor, sizeof(vendor));
 		file.close();
 	}
 	if (strlen(model) && strlen(vendor))
-		snprintf(humanname, 4096, _("Audio codec %s: %s (%s)"), name, model, ven=
dor);
+		snprintf(humanname, sizeof(humanname), _("Audio codec %s: %s (%s)"), nam=
e, model, vendor);
 	else if (strlen(model))
-		snprintf(humanname, 4096, _("Audio codec %s: %s"), _name, model);
+		snprintf(humanname, sizeof(humanname), _("Audio codec %s: %s"), _name, m=
odel);
 	else if (strlen(vendor))
-		snprintf(humanname, 4096, _("Audio codec %s: %s"), _name, vendor);
+		snprintf(humanname, sizeof(humanname), _("Audio codec %s: %s"), _name, v=
endor);
 }
 =

 void alsa::start_measurement(void)
@@ -86,14 +86,14 @@ void alsa::start_measurement(void)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "%s/power_off_acct", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
 	try {
 		file.open(filename, ios::in);
 		if (file) {
 			file >> start_inactive;
 		}
 		file.close();
-		snprintf(filename, PATH_MAX, "%s/power_on_acct", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
 		file.open(filename, ios::in);
 =

 		if (file) {
@@ -112,14 +112,14 @@ void alsa::end_measurement(void)
 	ifstream file;
 	double p;
 =

-	snprintf(filename, PATH_MAX, "%s/power_off_acct", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
 	try {
 		file.open(filename, ios::in);
 		if (file) {
 			file >> end_inactive;
 		}
 		file.close();
-		snprintf(filename, PATH_MAX, "%s/power_on_acct", sysfs_path);
+		snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
 		file.open(filename, ios::in);
 =

 		if (file) {
@@ -158,11 +158,11 @@ static void create_all_alsa_callback(const char *d_na=
me)
 	if (strncmp(d_name, "hwC", 3) !=3D 0)
 		return;
 =

-	snprintf(filename, PATH_MAX, "/sys/class/sound/card0/%s/power_on_acct", d=
_name);
+	snprintf(filename, sizeof(filename), "/sys/class/sound/card0/%s/power_on_=
acct", d_name);
 	if (access(filename, R_OK) !=3D 0)
 		return;
 =

-	snprintf(filename, PATH_MAX, "/sys/class/sound/card0/%s", d_name);
+	snprintf(filename, sizeof(filename), "/sys/class/sound/card0/%s", d_name);
 	bl =3D new class alsa(d_name, filename);
 	all_devices.push_back(bl);
 	register_parameter("alsa-codec-power", 0.5);
diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index d12cf98..609f851 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -58,14 +58,14 @@ void backlight::start_measurement(void)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "%s/max_brightness", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/max_brightness", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> max_level;
 	}
 	file.close();
 =

-	snprintf(filename, PATH_MAX, "%s/actual_brightness", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> start_level;
@@ -91,19 +91,19 @@ static int dpms_screen_on(void)
 =

 		if (strncmp(entry->d_name, "card", 4) !=3D 0)
 			continue;
-		snprintf(filename, PATH_MAX, "/sys/class/drm/card0/%s/enabled", entry->d=
_name);
+		snprintf(filename, sizeof(filename), "/sys/class/drm/card0/%s/enabled", =
entry->d_name);
 		file.open(filename, ios::in);
 		if (!file)
 			continue;
-		file.getline(line, 4096);
+		file.getline(line, sizeof(line));
 		file.close();
 		if (strcmp(line, "enabled") !=3D 0)
 			continue;
-		snprintf(filename, PATH_MAX, "/sys/class/drm/card0/%s/dpms", entry->d_na=
me);
+		snprintf(filename, sizeof(filename), "/sys/class/drm/card0/%s/dpms", ent=
ry->d_name);
 		file.open(filename, ios::in);
 		if (!file)
 			continue;
-		file.getline(line, 4096);
+		file.getline(line, sizeof(line));
 		file.close();
 		if (strcmp(line, "On") =3D=3D 0) {
 			closedir(dir);
@@ -122,7 +122,7 @@ void backlight::end_measurement(void)
 	double p;
 	int _backlight =3D 0;
 =

-	snprintf(filename, PATH_MAX, "%s/actual_brightness", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> end_level;
@@ -137,7 +137,7 @@ void backlight::end_measurement(void)
 	}
 =

 	report_utilization(name, p);
-	snprintf(powername, 4096, "%s-power", name);
+	snprintf(powername, sizeof(powername), "%s-power", name);
 	report_utilization(powername, _backlight);
 }
 =

@@ -159,7 +159,7 @@ static void create_all_backlights_callback(const char *=
d_name)
 {
 	class backlight *bl;
 	char filename[PATH_MAX];
-	snprintf(filename, PATH_MAX, "/sys/class/backlight/%s", d_name);
+	snprintf(filename, sizeof(filename), "/sys/class/backlight/%s", d_name);
 	bl =3D new class backlight(d_name, filename);
 	all_devices.push_back(bl);
 }
diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
index afa9bb6..89a36d8 100644
--- a/src/devices/devfreq.cpp
+++ b/src/devices/devfreq.cpp
@@ -123,7 +123,7 @@ void devfreq::parse_devfreq_trans_stat(char *dname)
 	ifstream file;
 	char filename[256];
 =

-	snprintf(filename, 256, "/sys/class/devfreq/%s/trans_stat", dir_name);
+	snprintf(filename, sizeof(filename), "/sys/class/devfreq/%s/trans_stat", =
dir_name);
 	file.open(filename);
 =

 	if (!file)
diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
index 7dea12e..2115b5b 100644
--- a/src/devices/rfkill.cpp
+++ b/src/devices/rfkill.cpp
@@ -52,21 +52,21 @@ rfkill::rfkill(char *_name, char *path): device()
 	end_hard =3D 0;
 	strncpy(sysfs_path, path, sizeof(sysfs_path));
 	register_sysfs_path(sysfs_path);
-	snprintf(devname, 128, "radio:%s", _name);
-	snprintf(humanname, 4096, "radio:%s", _name);
+	snprintf(devname, sizeof(devname), "radio:%s", _name);
+	snprintf(humanname, sizeof(humanname), "radio:%s", _name);
 	strncpy(name, devname, sizeof(name));
 	register_parameter(devname);
 	index =3D get_param_index(devname);
 	rindex =3D get_result_index(name);
 =

 	memset(line, 0, 4096);
-	snprintf(filename, PATH_MAX, "%s/device/driver", path);
-	if (readlink(filename, line, 4096) > 0) {
-		snprintf(humanname, 4096, _("Radio device: %s"), basename(line));
+	snprintf(filename, sizeof(filename), "%s/device/driver", path);
+	if (readlink(filename, line, sizeof(line)) > 0) {
+		snprintf(humanname, sizeof(humanname), _("Radio device: %s"), basename(l=
ine));
 	}
-	snprintf(filename, PATH_MAX, "%s/device/device/driver", path);
-	if (readlink(filename, line, 4096) > 0) {
-		snprintf(humanname, 4096, _("Radio device: %s"), basename(line));
+	snprintf(filename, sizeof(filename), "%s/device/device/driver", path);
+	if (readlink(filename, line, sizeof(line)) > 0) {
+		snprintf(humanname, sizeof(humanname), _("Radio device: %s"), basename(l=
ine));
 	}
 }
 =

@@ -80,14 +80,14 @@ void rfkill::start_measurement(void)
 	end_hard =3D 1;
 	end_soft =3D 1;
 =

-	snprintf(filename, PATH_MAX, "%s/hard", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> start_hard;
 	}
 	file.close();
 =

-	snprintf(filename, PATH_MAX, "%s/soft", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> start_soft;
@@ -100,13 +100,13 @@ void rfkill::end_measurement(void)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "%s/hard", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> end_hard;
 	}
 	file.close();
-	snprintf(filename, PATH_MAX, "%s/soft", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
 	file.open(filename, ios::in);
 	if (file) {
 		file >> end_soft;
@@ -143,15 +143,15 @@ static void create_all_rfkills_callback(const char *d=
_name)
 	class rfkill *bl;
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "/sys/class/rfkill/%s/name", d_name);
-	strncpy(name, d_name, 4095);
+	snprintf(filename, sizeof(filename), "/sys/class/rfkill/%s/name", d_name);
+	strncpy(name, d_name, sizeof(name) - 1);
 	file.open(filename, ios::in);
 	if (file) {
 		file.getline(name, 100);
 		file.close();
 	}
 =

-	snprintf(filename, PATH_MAX, "/sys/class/rfkill/%s", d_name);
+	snprintf(filename, sizeof(filename), "/sys/class/rfkill/%s", d_name);
 	bl =3D new class rfkill(name, filename);
 	all_devices.push_back(bl);
 }
diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 5c8d715..ccfd945 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -66,14 +66,14 @@ void runtime_pmdevice::start_measurement(void)
         after_suspended_time =3D 0;
 	after_active_time =3D 0;
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_suspended_time", sysfs_pat=
h);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", s=
ysfs_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return;
 	file >> before_suspended_time;
 	file.close();
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_active_time", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysf=
s_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return;
@@ -86,14 +86,14 @@ void runtime_pmdevice::end_measurement(void)
 	char filename[PATH_MAX];
 	ifstream file;
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_suspended_time", sysfs_pat=
h);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", s=
ysfs_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return;
 	file >> after_suspended_time;
 	file.close();
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_active_time", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysf=
s_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return;
@@ -151,7 +151,7 @@ int device_has_runtime_pm(const char *sysfs_path)
 	ifstream file;
 	unsigned long value;
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_suspended_time", sysfs_pat=
h);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", s=
ysfs_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return 0;
@@ -160,7 +160,7 @@ int device_has_runtime_pm(const char *sysfs_path)
 	if (value)
 		return 1;
 =

-	snprintf(filename, PATH_MAX, "%s/power/runtime_active_time", sysfs_path);
+	snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysf=
s_path);
 	file.open(filename, ios::in);
 	if (!file)
 		return 0;
@@ -180,7 +180,7 @@ static void do_bus(const char *bus)
 	DIR *dir;
 	char filename[PATH_MAX];
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/", bus);
+	snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/", bus);
 	dir =3D opendir(filename);
 	if (!dir)
 		return;
@@ -201,25 +201,25 @@ static void do_bus(const char *bus)
 			char dev_name[4096];
 			bool is_adapter =3D false;
 =

-			snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/new_device", bus, =
entry->d_name);
+			snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/new_device=
", bus, entry->d_name);
 			if (access(filename, W_OK) =3D=3D 0)
 				is_adapter =3D true;
 =

-			snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/name", bus, entry-=
>d_name);
+			snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/name", bus=
, entry->d_name);
 			file.open(filename, ios::in);
 			if (file) {
 				getline(file, devname);
 				file.close();
 			}
 =

-			snprintf(dev_name, 4096, _("I2C %s (%s): %s"), (is_adapter ? _("Adapter=
") : _("Device")), entry->d_name, devname.c_str());
+			snprintf(dev_name, sizeof(dev_name), _("I2C %s (%s): %s"), (is_adapter =
? _("Adapter") : _("Device")), entry->d_name, devname.c_str());
 			dev->set_human_name(dev_name);
 		}
 =

 		if (strcmp(bus, "pci") =3D=3D 0) {
 			uint16_t vendor =3D 0, device =3D 0;
 =

-			snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/vendor", bus, entr=
y->d_name);
+			snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/vendor", b=
us, entry->d_name);
 =

 			file.open(filename, ios::in);
 			if (file) {
@@ -228,7 +228,7 @@ static void do_bus(const char *bus)
 			}
 =

 =

-			snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/device", bus, entr=
y->d_name);
+			snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/device", b=
us, entry->d_name);
 			file.open(filename, ios::in);
 			if (file) {
 				file >> hex >> device;
@@ -237,7 +237,7 @@ static void do_bus(const char *bus)
 =

 			if (vendor && device) {
 				char devname[4096];
-				snprintf(devname, 4096, _("PCI Device: %s"),
+				snprintf(devname, sizeof(devname), _("PCI Device: %s"),
 					pci_id_to_name(vendor, device, filename, 4095));
 				dev->set_human_name(devname);
 			}
diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
index 1f0e646..aa9c227 100644
--- a/src/devices/usb.cpp
+++ b/src/devices/usb.cpp
@@ -60,7 +60,7 @@ usbdevice::usbdevice(const char *_name, const char *path,=
 const char *devid): de
 =

 =

 	/* root ports and hubs should count as 0 power ... their activity is deri=
ved */
-	snprintf(filename, PATH_MAX, "%s/bDeviceClass", path);
+	snprintf(filename, sizeof(filename), "%s/bDeviceClass", path);
 	file.open(filename, ios::in);
 	if (file) {
 		int dclass =3D 0;
@@ -73,7 +73,7 @@ usbdevice::usbdevice(const char *_name, const char *path,=
 const char *devid): de
 =

 	vendor[0] =3D 0;
 	product[0] =3D 0;
-	snprintf(filename, PATH_MAX, "%s/manufacturer", path);
+	snprintf(filename, sizeof(filename), "%s/manufacturer", path);
 	file.open(filename, ios::in);
 	if (file) {
 		file.getline(vendor, 2047);
@@ -81,18 +81,18 @@ usbdevice::usbdevice(const char *_name, const char *pat=
h, const char *devid): de
 			vendor[0] =3D 0;
 		file.close();
 	};
-	snprintf(filename, PATH_MAX, "%s/product", path);
+	snprintf(filename, sizeof(filename), "%s/product", path);
 	file.open(filename, ios::in);
 	if (file) {
 		file.getline(product, 2040);
 		file.close();
 	};
 	if (strlen(vendor) && strlen(product))
-		snprintf(humanname, 4096, _("USB device: %s (%s)"), product, vendor);
+		snprintf(humanname, sizeof(humanname), _("USB device: %s (%s)"), product=
, vendor);
 	else if (strlen(product))
-		snprintf(humanname, 4096, _("USB device: %s"), product);
+		snprintf(humanname, sizeof(humanname), _("USB device: %s"), product);
 	else if (strlen(vendor))
-		snprintf(humanname, 4096, _("USB device: %s"), vendor);
+		snprintf(humanname, sizeof(humanname), _("USB device: %s"), vendor);
 }
 =

 =

@@ -107,14 +107,14 @@ void usbdevice::start_measurement(void)
 	connected_before =3D 0;
 	connected_after =3D 0;
 =

-	snprintf(fullpath, PATH_MAX, "%s/power/active_duration", sysfs_path);
+	snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_pa=
th);
 	file.open(fullpath, ios::in);
 	if (file) {
 		file >> active_before;
 	}
 	file.close();
 =

-	snprintf(fullpath, PATH_MAX, "%s/power/connected_duration", sysfs_path);
+	snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs=
_path);
 	file.open(fullpath, ios::in);
 	if (file) {
 		file >> connected_before;
@@ -127,14 +127,14 @@ void usbdevice::end_measurement(void)
 	ifstream file;
 	char fullpath[PATH_MAX];
 =

-	snprintf(fullpath, PATH_MAX, "%s/power/active_duration", sysfs_path);
+	snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_pa=
th);
 	file.open(fullpath, ios::in);
 	if (file) {
 		file >> active_after;
 	}
 	file.close();
 =

-	snprintf(fullpath, PATH_MAX, "%s/power/connected_duration", sysfs_path);
+	snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs=
_path);
 	file.open(fullpath, ios::in);
 	if (file) {
 		file >> connected_after;
@@ -194,24 +194,24 @@ static void create_all_usb_devices_callback(const cha=
r *d_name)
 	char vendorid[64], devid[64];
 	char devid_name[4096];
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s", d_name);
-	snprintf(device_name, PATH_MAX, "%s/power/active_duration", filename);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s", d_name);
+	snprintf(device_name, sizeof(device_name), "%s/power/active_duration", fi=
lename);
 	if (access(device_name, R_OK) !=3D 0)
 		return;
 =

-	snprintf(device_name, PATH_MAX, "%s/idVendor", filename);
+	snprintf(device_name, sizeof(device_name), "%s/idVendor", filename);
 	file.open(device_name, ios::in);
 	if (file)
 		file.getline(vendorid, 64);
 	file.close();
-	snprintf(device_name, PATH_MAX, "%s/idProduct", filename);
+	snprintf(device_name, sizeof(device_name), "%s/idProduct", filename);
 	file.open(device_name, ios::in);
 	if (file)
 		file.getline(devid, 64);
 	file.close();
 =

-	snprintf(devid_name, 4096, "usb-device-%s-%s", vendorid, devid);
-	snprintf(device_name, PATH_MAX, "usb-device-%s-%s-%s", d_name, vendorid, =
devid);
+	snprintf(devid_name, sizeof(devid_name), "usb-device-%s-%s", vendorid, de=
vid);
+	snprintf(device_name, sizeof(device_name), "usb-device-%s-%s-%s", d_name,=
 vendorid, devid);
 	if (result_device_exists(device_name))
 		return;
 =

diff --git a/src/devlist.cpp b/src/devlist.cpp
index e38a1ed..e6a4f4c 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -125,7 +125,7 @@ void collect_open_devices(void)
 		if (strcmp(entry->d_name, "self") =3D=3D 0)
 			continue;
 =

-		snprintf(filename, PATH_MAX, "/proc/%s/fd/", entry->d_name);
+		snprintf(filename, sizeof(filename), "/proc/%s/fd/", entry->d_name);
 =

 		dir2 =3D opendir(filename);
 		if (!dir2)
@@ -138,9 +138,9 @@ void collect_open_devices(void)
 				break;
 			if (!isdigit(entry2->d_name[0]))
 				continue;
-			snprintf(filename, PATH_MAX, "/proc/%s/fd/%s", entry->d_name, entry2->d=
_name);
-			memset(link, 0, PATH_MAX);
-			ret =3D readlink(filename, link, PATH_MAX - 1);
+			snprintf(filename, sizeof(filename), "/proc/%s/fd/%s", entry->d_name, e=
ntry2->d_name);
+			memset(link, 0, sizeof(link));
+			ret =3D readlink(filename, link, sizeof(link) - 1);
 			if (ret < 0)
 				continue;
 =

diff --git a/src/lib.cpp b/src/lib.cpp
index 29f109f..56e1681 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -240,7 +240,7 @@ string read_sysfs_string(const char *format, const char=
 *param)
 	char filename[PATH_MAX];
 =

 =

-	snprintf(filename, PATH_MAX, format, param);
+	snprintf(filename, sizeof(filename), format, param);
 =

 	file.open(filename, ios::in);
 	if (!file)
@@ -475,10 +475,10 @@ int read_msr(int cpu, uint64_t offset, uint64_t *valu=
e)
 	int fd;
 	char msr_path[256];
 =

-	snprintf(msr_path, 256, "/dev/cpu/%d/msr", cpu);
+	snprintf(msr_path, sizeof(msr_path), "/dev/cpu/%d/msr", cpu);
 =

 	if (access(msr_path, R_OK) !=3D 0){
-		snprintf(msr_path, 256, "/dev/msr%d", cpu);
+		snprintf(msr_path, sizeof(msr_path), "/dev/msr%d", cpu);
 =

 		if (access(msr_path, R_OK) !=3D 0){
 			fprintf(stderr,
@@ -507,10 +507,10 @@ int write_msr(int cpu, uint64_t offset, uint64_t valu=
e)
 	int fd;
 	char msr_path[256];
 =

-	snprintf(msr_path, 256, "/dev/cpu/%d/msr", cpu);
+	snprintf(msr_path, sizeof(msr_path), "/dev/cpu/%d/msr", cpu);
 =

 	if (access(msr_path, R_OK) !=3D 0){
-		snprintf(msr_path, 256, "/dev/msr%d", cpu);
+		snprintf(msr_path, sizeof(msr_path), "/dev/msr%d", cpu);
 =

 		if (access(msr_path, R_OK) !=3D 0){
 			fprintf(stderr,
diff --git a/src/main.cpp b/src/main.cpp
index 2a2a6e9..b60d7b5 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -419,7 +419,7 @@ int main(int argc, char **argv)
 			break;
 		case 'C':		/* csv report */
 			reporttype =3D REPORT_CSV;
-			snprintf(filename, PATH_MAX, "%s", optarg ? optarg : "powertop.csv");
+			snprintf(filename, sizeof(filename), "%s", optarg ? optarg : "powertop.=
csv");
 			if (!strlen(filename))
 			{
 				fprintf(stderr, _("Invalid CSV filename\n"));
@@ -435,7 +435,7 @@ int main(int argc, char **argv)
 			break;
 		case 'r':		/* html report */
 			reporttype =3D REPORT_HTML;
-			snprintf(filename, PATH_MAX, "%s", optarg ? optarg : "powertop.html");
+			snprintf(filename, sizeof(filename), "%s", optarg ? optarg : "powertop.=
html");
 			if (!strlen(filename))
 			{
 				fprintf(stderr, _("Invalid HTML filename\n"));
@@ -453,7 +453,7 @@ int main(int argc, char **argv)
 			time_out =3D (optarg ? atoi(optarg) : 20);
 			break;
 		case 'w':		/* measure workload */
-			snprintf(workload, PATH_MAX, "%s", optarg ? optarg : "");
+			snprintf(workload, sizeof(workload), "%s", optarg ? optarg : "");
 			break;
 		case 'V':
 			print_version();
diff --git a/src/measurement/acpi.cpp b/src/measurement/acpi.cpp
index c1b9520..2c9815d 100644
--- a/src/measurement/acpi.cpp
+++ b/src/measurement/acpi.cpp
@@ -73,7 +73,7 @@ void acpi_power_meter::measure(void)
 	voltage =3D 0;
 	capacity =3D 0;
 =

-	snprintf(filename, PATH_MAX, "/proc/acpi/battery/%s/state", battery_name);
+	snprintf(filename, sizeof(filename), "/proc/acpi/battery/%s/state", batte=
ry_name);
 =

 	file.open(filename, ios::in);
 	if (!file)
@@ -81,7 +81,7 @@ void acpi_power_meter::measure(void)
 =

 	while (file) {
 		char *c;
-		file.getline(line, 4096);
+		file.getline(line, sizeof(line));
 =

 		if (strstr(line, "present:") && (strstr(line, "yes") =3D=3D NULL)) {
 			return;
diff --git a/src/measurement/sysfs.cpp b/src/measurement/sysfs.cpp
index 794f88f..8126104 100644
--- a/src/measurement/sysfs.cpp
+++ b/src/measurement/sysfs.cpp
@@ -41,7 +41,7 @@ bool sysfs_power_meter::get_sysfs_attr(const char *attrib=
ute, int *value)
 	char filename[PATH_MAX];
 	bool ok;
 =

-	snprintf(filename, PATH_MAX, "/sys/class/power_supply/%s/%s", name, attri=
bute);
+	snprintf(filename, sizeof(filename), "/sys/class/power_supply/%s/%s", nam=
e, attribute);
 	*value =3D read_sysfs(filename, &ok);
 =

 	return ok;
diff --git a/src/parameters/parameters.cpp b/src/parameters/parameters.cpp
index 511cdcf..3bd5c05 100644
--- a/src/parameters/parameters.cpp
+++ b/src/parameters/parameters.cpp
@@ -454,9 +454,9 @@ char* get_param_directory(const char *filename)
 	static char tempfilename[PATH_MAX];
 =

 	if (access("/var/cache/powertop", W_OK ) =3D=3D 0)
-		snprintf(tempfilename, PATH_MAX, "/var/cache/powertop/%s", filename);
+		snprintf(tempfilename, sizeof(tempfilename), "/var/cache/powertop/%s", f=
ilename);
 	if (access("/data/local/powertop", W_OK ) =3D=3D 0)
-		snprintf(tempfilename, PATH_MAX, "/data/local/powertop/%s", filename);
+		snprintf(tempfilename, sizeof(tempfilename), "/data/local/powertop/%s", =
filename);
 =

 	return tempfilename;
 };
diff --git a/src/report/report.cpp b/src/report/report.cpp
index 6bf905b..ddb2e30 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -174,7 +174,7 @@ void init_report_output(char *filename_str, int iterati=
ons)
 	char datestr[200];
 =

 	if (iterations =3D=3D 1)
-		snprintf(reportout.filename, PATH_MAX, "%s", filename_str);
+		snprintf(reportout.filename, sizeof(reportout.filename), "%s", filename_=
str);
 	else
 	{
 		filename =3D string(filename_str);
@@ -185,7 +185,7 @@ void init_report_output(char *filename_str, int iterati=
ons)
 		memset(&stamp, 0, sizeof(time_t));
 		stamp =3D time(NULL);
 		strftime(datestr, sizeof(datestr), "%Y%m%d-%H%M%S", localtime(&stamp));
-		snprintf(reportout.filename, PATH_MAX, "%s-%s%s",
+		snprintf(reportout.filename, sizeof(reportout.filename), "%s-%s%s",
 			filename.substr(0, period).c_str(), datestr,
 			filename.substr(period).c_str());
 	}
diff --git a/src/tuning/ethernet.cpp b/src/tuning/ethernet.cpp
index 849b7b2..6b1f393 100644
--- a/src/tuning/ethernet.cpp
+++ b/src/tuning/ethernet.cpp
@@ -52,7 +52,7 @@ ethernet_tunable::ethernet_tunable(const char *iface) : t=
unable("", 0.3, _("Good
 	memset(interf, 0, sizeof(interf));
 	strncpy(interf, iface, sizeof(interf));
 	sprintf(desc, _("Wake-on-lan status for device %s"), iface);
-	snprintf(toggle_good, 4096, "ethtool -s %s wol d;", iface);
+	snprintf(toggle_good, sizeof(toggle_good), "ethtool -s %s wol d;", iface);
 =

 }
 =

diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index e226695..9b6abed 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -53,7 +53,7 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 		char filename[PATH_MAX];
 		uint16_t vendor =3D 0, device =3D 0;
 =

-		snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/vendor", bus, dev);
+		snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/vendor", bu=
s, dev);
 =

 		file.open(filename, ios::in);
 		if (file) {
@@ -62,7 +62,7 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 		}
 =

 =

-		snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/device", bus, dev);
+		snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/device", bu=
s, dev);
 		file.open(filename, ios::in);
 		if (file) {
 			file >> hex >> device;
@@ -78,8 +78,8 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 =

 =

 	}
-	snprintf(toggle_good, 4096, "echo 'auto' > '%s';", runtime_path);
-	snprintf(toggle_bad, 4096, "echo 'on' > '%s';", runtime_path);
+	snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", runtime=
_path);
+	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", runtime_pat=
h);
 }
 =

 int runtime_tunable::good_bad(void)
@@ -126,7 +126,7 @@ void add_runtime_tunables(const char *bus)
 	DIR *dir;
 	char filename[PATH_MAX];
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/", bus);
+	snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/", bus);
 	dir =3D opendir(filename);
 	if (!dir)
 		return;
@@ -140,13 +140,13 @@ void add_runtime_tunables(const char *bus)
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
 =

-		snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s/power/control", bus=
, entry->d_name);
+		snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/power/contr=
ol", bus, entry->d_name);
 =

 		if (access(filename, R_OK) !=3D 0)
 			continue;
 =

 =

-		snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s", bus, entry->d_nam=
e);
+		snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s", bus, entr=
y->d_name);
 =

 		runtime =3D new class runtime_tunable(filename, bus, entry->d_name);
 =

diff --git a/src/tuning/tuningi2c.cpp b/src/tuning/tuningi2c.cpp
index d207ca0..b75e811 100644
--- a/src/tuning/tuningi2c.cpp
+++ b/src/tuning/tuningi2c.cpp
@@ -38,7 +38,7 @@ i2c_tunable::i2c_tunable(const char *path, const char *na=
me, bool is_adapter) :
 	char filename[PATH_MAX];
 	string devname;
 =

-	snprintf(filename, PATH_MAX, "%s/name", path);
+	snprintf(filename, sizeof(filename), "%s/name", path);
 	file.open(filename, ios::in);
 	if (file) {
 		getline(file, devname);
@@ -46,20 +46,20 @@ i2c_tunable::i2c_tunable(const char *path, const char *=
name, bool is_adapter) :
 	}
 =

 	if (is_adapter) {
-		snprintf(i2c_path, PATH_MAX, "%s/device/power/control", path);
-		snprintf(filename, PATH_MAX, "%s/device", path);
+		snprintf(i2c_path, sizeof(i2c_path), "%s/device/power/control", path);
+		snprintf(filename, sizeof(filename), "%s/device", path);
 	} else {
-		snprintf(i2c_path, PATH_MAX,  "%s/power/control", path);
-		snprintf(filename, PATH_MAX, "%s/device", path);
+		snprintf(i2c_path, sizeof(i2c_path),  "%s/power/control", path);
+		snprintf(filename, sizeof(filename), "%s/device", path);
 	}
 =

 	if (device_has_runtime_pm(filename))
-		snprintf(desc, 4096, _("Runtime PM for I2C %s %s (%s)"), (is_adapter ? _=
("Adapter") : _("Device")), name, (devname.empty() ? "" : devname.c_str()));
+		snprintf(desc, sizeof(desc), _("Runtime PM for I2C %s %s (%s)"), (is_ada=
pter ? _("Adapter") : _("Device")), name, (devname.empty() ? "" : devname.c=
_str()));
 	else
-		snprintf(desc, 4096, _("I2C %s %s has no runtime power management"), (is=
_adapter ? _("Adapter") : _("Device")), name);
+		snprintf(desc, sizeof(desc), _("I2C %s %s has no runtime power managemen=
t"), (is_adapter ? _("Adapter") : _("Device")), name);
 =

-	snprintf(toggle_good, 4096, "echo 'auto' > '%s';", i2c_path);
-	snprintf(toggle_bad, 4096, "echo 'on' > '%s';", i2c_path);
+	snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", i2c_pat=
h);
+	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", i2c_path);
 }
 =

 int i2c_tunable::good_bad(void)
diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index 7e78a52..954f52e 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -47,8 +47,8 @@ sysfs_tunable::sysfs_tunable(const char *str, const char =
*_sysfs_path, const cha
 	pt_strcpy(sysfs_path, _sysfs_path);
 	pt_strcpy(target_value, _target_content);
 	bad_value[0] =3D 0;
-	snprintf(toggle_good, 4096, "echo '%s' > '%s';", target_value, sysfs_path=
);
-	snprintf(toggle_bad, 4096, "echo '%s' > '%s';", bad_value, sysfs_path);
+	snprintf(toggle_good, sizeof(toggle_good), "echo '%s' > '%s';", target_va=
lue, sysfs_path);
+	snprintf(toggle_bad, sizeof(toggle_bad), "echo '%s' > '%s';", bad_value, =
sysfs_path);
 }
 =

 int sysfs_tunable::good_bad(void)
@@ -119,8 +119,8 @@ static void add_sata_tunables_callback(const char *d_na=
me)
 	char filename[PATH_MAX];
 	char msg[4096];
 =

-	snprintf(filename, PATH_MAX, "/sys/class/scsi_host/%s/link_power_manageme=
nt_policy", d_name);
-	snprintf(msg, 4096, _("Enable SATA link power management for %s"), d_name=
);
+	snprintf(filename, sizeof(filename), "/sys/class/scsi_host/%s/link_power_=
management_policy", d_name);
+	snprintf(msg, sizeof(msg), _("Enable SATA link power management for %s"),=
 d_name);
 	add_sysfs_tunable(msg, filename,"min_power");
 }
 =

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index 12f9ce2..3b7b2b1 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -43,7 +43,7 @@ usb_tunable::usb_tunable(const char *path, const char *na=
me) : tunable("", 0.9,
 	char vendor[2048];
 	char product[2048];
 	string str1, str2;
-	snprintf(usb_path, PATH_MAX, "%s/power/control", path);
+	snprintf(usb_path, sizeof(usb_path), "%s/power/control", path);
 =

 	vendor[0] =3D 0;
 	product[0] =3D 0;
@@ -51,9 +51,9 @@ usb_tunable::usb_tunable(const char *path, const char *na=
me) : tunable("", 0.9,
 	str1 =3D read_sysfs_string("%s/idVendor", path);
 	str2 =3D read_sysfs_string("%s/idProduct", path);
 =

-	snprintf(desc, 4096, _("Autosuspend for unknown USB device %s (%s:%s)"), =
name, str1.c_str(), str2.c_str());
+	snprintf(desc, sizeof(desc), _("Autosuspend for unknown USB device %s (%s=
:%s)"), name, str1.c_str(), str2.c_str());
 =

-	snprintf(filename, PATH_MAX, "%s/manufacturer", path);
+	snprintf(filename, sizeof(filename), "%s/manufacturer", path);
 	file.open(filename, ios::in);
 	if (file) {
 		file.getline(vendor, 2047);
@@ -61,21 +61,21 @@ usb_tunable::usb_tunable(const char *path, const char *=
name) : tunable("", 0.9,
 			vendor[0] =3D 0;
 		file.close();
 	};
-	snprintf(filename, PATH_MAX, "%s/product", path);
+	snprintf(filename, sizeof(filename), "%s/product", path);
 	file.open(filename, ios::in);
 	if (file) {
 		file.getline(product, 2040);
 		file.close();
 	};
 	if (strlen(vendor) && strlen(product))
-		snprintf(desc, 4096, _("Autosuspend for USB device %s [%s]"), product, v=
endor);
+		snprintf(desc, sizeof(desc), _("Autosuspend for USB device %s [%s]"), pr=
oduct, vendor);
 	else if (strlen(product))
-		snprintf(desc, 4096, _("Autosuspend for USB device %s [%s]"), product, n=
ame);
+		snprintf(desc, sizeof(desc), _("Autosuspend for USB device %s [%s]"), pr=
oduct, name);
 	else if (strlen(vendor))
-		snprintf(desc, 4096, _("Autosuspend for USB device %s [%s]"), vendor, na=
me);
+		snprintf(desc, sizeof(desc), _("Autosuspend for USB device %s [%s]"), ve=
ndor, name);
 =

-	snprintf(toggle_good, 4096, "echo 'auto' > '%s';", usb_path);
-	snprintf(toggle_bad, 4096, "echo 'on' > '%s';", usb_path);
+	snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", usb_pat=
h);
+	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", usb_path);
 }
 =

 int usb_tunable::good_bad(void)
@@ -121,23 +121,23 @@ static void add_usb_callback(const char *d_name)
 	char filename[PATH_MAX];
 	DIR *dir;
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/power/control", d_n=
ame);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/power/contr=
ol", d_name);
 	if (access(filename, R_OK) !=3D 0)
 		return;
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/power/active_durati=
on", d_name);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/power/activ=
e_duration", d_name);
 	if (access(filename, R_OK)!=3D0)
 		return;
 =

 	/* every interface of this device should support autosuspend */
-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s", d_name);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s", d_name);
 	if ((dir =3D opendir(filename))) {
 		struct dirent *entry;
 		while ((entry =3D readdir(dir))) {
 			/* dirname: <busnum>-<devnum>...:<config num>-<interface num> */
 			if (!isdigit(entry->d_name[0]))
 				continue;
-			snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s/%s/supports_autos=
uspend", d_name, entry->d_name);
+			snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s/%s/suppor=
ts_autosuspend", d_name, entry->d_name);
 			if (access(filename, R_OK) =3D=3D 0 && read_sysfs(filename) =3D=3D 0)
 				break;
 		}
@@ -146,7 +146,7 @@ static void add_usb_callback(const char *d_name)
 			return;
 	}
 =

-	snprintf(filename, PATH_MAX, "/sys/bus/usb/devices/%s", d_name);
+	snprintf(filename, sizeof(filename), "/sys/bus/usb/devices/%s", d_name);
 	usb =3D new class usb_tunable(filename, d_name);
 	all_tunables.push_back(usb);
 }
diff --git a/src/tuning/wifi.cpp b/src/tuning/wifi.cpp
index 783948d..f7a91ec 100644
--- a/src/tuning/wifi.cpp
+++ b/src/tuning/wifi.cpp
@@ -47,8 +47,8 @@ wifi_tunable::wifi_tunable(const char *_iface) : tunable(=
"", 1.5, _("Good"), _("
 	pt_strcpy(iface, _iface);
 	sprintf(desc, _("Wireless Power Saving for interface %s"), iface);
 =

-	snprintf(toggle_good, 4096, "iw dev %s set power_save on", iface);
-	snprintf(toggle_bad, 4096, "iw dev %s set power_save off", iface);
+	snprintf(toggle_good, sizeof(toggle_good), "iw dev %s set power_save on",=
 iface);
+	snprintf(toggle_bad, sizeof(toggle_bad), "iw dev %s set power_save off", =
iface);
 }
 =

 int wifi_tunable::good_bad(void)
-- =

2.4.3


--===============3240168068090102989==--

