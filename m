Content-Type: multipart/mixed; boundary="===============7027323354419637859=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: [Powertop] [PATCH 1/2] Fix crash due to buffer overruns
Date: Fri, 13 Nov 2015 16:50:20 +0100
Message-ID: <1447429821-1631-2-git-send-email-jengelh@inai.de>
In-Reply-To: 1447429821-1631-1-git-send-email-jengelh@inai.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7027323354419637859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

powertop does a lot of unsafe size-unchecked buffer copying.
Fix the easy ones.

Program received signal SIGABRT, Aborted.
0x00007ffff6513187 in __GI_raise (sig=3Dsig(a)entry=3D6) at ../nptl/sysdeps=
/unix/sysv/linux/raise.c:56
56        return INLINE_SYSCALL (tgkill, 3, pid, selftid, sig);
Missing separate debuginfos, use: zypper install libgcc_s1-gcc5-debuginfo-5=
.2.1+r228589-58.1.x86_64 libncurses5-debuginfo-5.9-52.2.3.x86_64 libnl3-200=
-debuginfo-3.2.25-2.1.2.x86_64 libpci3-debuginfo-3.2.1-3.1.2.x86_64 libstdc=
++6-gcc5-debuginfo-5.2.1+r228589-58.1.x86_64 libz1-debuginfo-1.2.8-5.1.2.x8=
6_64
(gdb) up
78            raise (SIGABRT);
(gdb)
    fmt=3Dfmt(a)entry=3D0x7ffff6640608 "*** %s ***: %s terminated\n") at ..=
/sysdeps/posix/libc_fatal.c:175
175           abort ();
(gdb)
    at fortify_fail.c:31
31          __libc_message (2, "*** %s ***: %s terminated\n",
(gdb)
28        __fortify_fail ("buffer overflow detected");
(gdb)
    at /usr/include/bits/string3.h:104
104       return __builtin___strcpy_chk (__dest, __src, __bos (__dest));
(gdb)
    at process/process.cpp:92
92              strcpy(comm, _comm);
(gdb) ptyp comm
type =3D char [16]
(gdb) p comm
$1 =3D "poempp_2.21_x86_"
(gdb) ptyp _comm
type =3D const char *
(gdb) p _comm
$2 =3D 0xa2d6504 "poempp_2.21_x86_\214x"
(gdb) up
    at process/process.cpp:174
174             new_proc =3D new class process(comm, pid);
(gdb) p pid
$3 =3D 30860
(gdb) ^Z
[1]+  Stopped                 gdb /usr/sbin/powertop
12:16 ares40:../powertop/powertop # cat /proc/30860/stat
30860 (poempp_2.21_x86_64-pc-linux-gnu) R 9998 9998 9998 0 -1 4218880 9662 =
0 0 0 29182 44 0 0 39 19 2 0 1014983782 39407616 9490 18446744073709551615 =
4194304 8385953 140720786688848 140720786687224 5358714 0 0 4096 1073751144=
 18446744073709551615 0 0 17 4 0 3 0 0 0 10484880 10516168 37695488 1407207=
86693790 140720786693855 140720786693855 140720786694071 0

1
---
 src/cpu/abstract_cpu.cpp       | 10 +++++-----
 src/cpu/cpu.cpp                | 14 +++++++-------
 src/cpu/cpu_linux.cpp          | 10 +++++-----
 src/cpu/cpudevice.cpp          |  5 +++--
 src/devices/ahci.cpp           |  8 ++++----
 src/devices/alsa.cpp           |  4 ++--
 src/devices/device.cpp         |  4 ++--
 src/devices/i915-gpu.cpp       |  6 +++---
 src/devices/network.cpp        | 35 ++++++++++++++++++-----------------
 src/devices/runtime_pm.cpp     |  8 ++++----
 src/devices/thinkpad-fan.cpp   |  2 +-
 src/devices/thinkpad-light.cpp |  2 +-
 src/devices/usb.cpp            |  8 ++++----
 src/devlist.cpp                |  6 +++---
 src/lib.h                      |  7 +++++++
 src/measurement/acpi.cpp       |  7 ++++---
 src/process/do_process.cpp     | 36 ++++++++++++++++++------------------
 src/process/interrupt.cpp      |  4 ++--
 src/process/process.cpp        |  7 ++++---
 src/process/processdevice.cpp  |  2 +-
 src/process/timer.cpp          |  2 +-
 src/process/work.cpp           |  2 +-
 src/tuning/bluetooth.cpp       |  4 ++--
 src/tuning/ethernet.cpp        |  4 ++--
 src/tuning/tunable.cpp         | 15 ++++++++-------
 src/tuning/tuning.cpp          |  4 ++--
 src/tuning/tuningsysfs.cpp     |  6 +++---
 src/tuning/wifi.cpp            |  2 +-
 28 files changed, 118 insertions(+), 106 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 17acb71..cacb130 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -71,9 +71,9 @@ void abstract_cpu::account_freq(uint64_t freq, uint64_t d=
uration)
 		state->freq =3D freq;
 		hz_to_human(freq, state->human_name);
 		if (freq =3D=3D 0)
-			strcpy(state->human_name, _("Idle"));
+			pt_strcpy(state->human_name, _("Idle"));
 		if (is_turbo(freq, max_frequency, max_minus_one_frequency))
-			sprintf(state->human_name, _("Turbo Mode"));
+			pt_strcpy(state->human_name, _("Turbo Mode"));
 =

 		state->after_count =3D 1;
 	}
@@ -205,8 +205,8 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 =

 	cstates.push_back(state);
 =

-	strcpy(state->linux_name, linux_name);
-	strcpy(state->human_name, human_name);
+	pt_strcpy(state->linux_name, linux_name);
+	pt_strcpy(state->human_name, human_name);
 =

 	state->line_level =3D -1;
 =

@@ -337,7 +337,7 @@ void abstract_cpu::insert_pstate(uint64_t freq, const c=
har *human_name, uint64_t
 	pstates.push_back(state);
 =

 	state->freq =3D freq;
-	strcpy(state->human_name, human_name);
+	pt_strcpy(state->human_name, human_name);
 =

 =

 	state->time_before =3D duration;
diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index ee87c04..499b752 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -78,18 +78,18 @@ static class abstract_cpu * new_package(int package, in=
t cpu, char * vendor, int
 	ret->set_type("Package");
 	ret->childcount =3D 0;
 =

-	sprintf(packagename, _("cpu package %i"), cpu);
+	snprintf(packagename, sizeof(packagename), _("cpu package %i"), cpu);
 	cpudev =3D new class cpudevice(_("cpu package"), packagename, ret);
 	all_devices.push_back(cpudev);
 =

-	sprintf(packagename, _("package-%i"), cpu);
+	snprintf(packagename, sizeof(packagename), _("package-%i"), cpu);
 	cpu_rapl_dev =3D new class cpu_rapl_device(cpudev, _("cpu rapl package"),=
 packagename, ret);
 	if (cpu_rapl_dev->device_present())
 		all_devices.push_back(cpu_rapl_dev);
 	else
 		delete cpu_rapl_dev;
 =

-	sprintf(packagename, _("package-%i"), cpu);
+	snprintf(packagename, sizeof(packagename), _("package-%i"), cpu);
 	dram_rapl_dev =3D new class dram_rapl_device(cpudev, _("dram rapl package=
"), packagename, ret);
 	if (dram_rapl_dev->device_present())
 		all_devices.push_back(dram_rapl_dev);
@@ -556,14 +556,14 @@ void report_display_cpu_cstates(void)
 							if (strcmp(core_type, "Core") =3D=3D 0 ) {
 								core_data[idx2]=3D"";
 								idx2+=3D1;
-								sprintf(tmp_num, __("Core %d"),_core->get_number());
+								snprintf(tmp_num, sizeof(tmp_num), __("Core %d"), _core->get_numbe=
r());
 								core_data[idx2]=3Dstring(tmp_num);
 								idx2+=3D1;
 								core_num+=3D1;
 							} else {
 								core_data[idx2]=3D"";
 								idx2+=3D1;
-								sprintf(tmp_num,__("GPU %d"),_core->get_number());
+								snprintf(tmp_num, sizeof(tmp_num), __("GPU %d"), _core->get_number=
());
 								core_data[idx2]=3Dstring(tmp_num);
 								idx2+=3D1;
 							}
@@ -765,7 +765,7 @@ void report_display_cpu_pstates(void)
 					if (line =3D=3D LEVEL_HEADER) {
 						core_data[idx2]=3D"";
 						idx2+=3D1;
-						sprintf(tmp_num,__("Core %d"),_core->get_number());
+						snprintf(tmp_num, sizeof(tmp_num), __("Core %d"), _core->get_number(=
));
 						core_data[idx2]=3Dstring(tmp_num);
 						idx2+=3D1;
 					} else {
@@ -786,7 +786,7 @@ void report_display_cpu_pstates(void)
 						continue;
 =

 					if (line =3D=3D LEVEL_HEADER) {
-						sprintf(tmp_num,__("CPU %d"),_cpu->get_number());
+						snprintf(tmp_num, sizeof(tmp_num), __("CPU %d"), _cpu->get_number());
 						cpu_data[idx3] =3D string(tmp_num);
 						idx3+=3D1;
 						continue;
diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
index e19fba1..deaa12c 100644
--- a/src/cpu/cpu_linux.cpp
+++ b/src/cpu/cpu_linux.cpp
@@ -64,8 +64,8 @@ void cpu_linux::parse_cstates_start(void)
 		if (strlen(entry->d_name) < 3)
 			continue;
 =

-		strcpy(linux_name, entry->d_name);
-		strcpy(human_name, linux_name);
+		pt_strcpy(linux_name, entry->d_name);
+		pt_strcpy(human_name, linux_name);
 =

 		snprintf(filename + len, 256 - len, "/%s/name", entry->d_name);
 =

@@ -76,7 +76,7 @@ void cpu_linux::parse_cstates_start(void)
 		}
 =

 		if (strcmp(human_name, "C0")=3D=3D0)
-			strcpy(human_name, _("C0 polling"));
+			pt_strcpy(human_name, _("C0 polling"));
 =

 		snprintf(filename + len, 256 - len, "/%s/usage", entry->d_name);
 		file.open(filename, ios::in);
@@ -164,8 +164,8 @@ void cpu_linux::parse_cstates_end(void)
 		if (strlen(entry->d_name) < 3)
 			continue;
 =

-		strcpy(linux_name, entry->d_name);
-		strcpy(human_name, linux_name);
+		pt_strcpy(linux_name, entry->d_name);
+		pt_strcpy(human_name, linux_name);
 =

 =

 		snprintf(filename + len, 256 - len, "/%s/usage", entry->d_name);
diff --git a/src/cpu/cpudevice.cpp b/src/cpu/cpudevice.cpp
index 371d8a8..4c7ca7b 100644
--- a/src/cpu/cpudevice.cpp
+++ b/src/cpu/cpudevice.cpp
@@ -26,13 +26,14 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
+#include "../lib.h"
 #include "../parameters/parameters.h"
 =

 =

 cpudevice::cpudevice(const char *classname, const char *dev_name, class ab=
stract_cpu *_cpu)
 {
-	strcpy(_class, classname);
-	strcpy(_cpuname, dev_name);
+	pt_strcpy(_class, classname);
+	pt_strcpy(_cpuname, dev_name);
 	cpu =3D _cpu;
 	wake_index =3D get_param_index("cpu-wakeups");;
 	consumption_index =3D get_param_index("cpu-consumption");;
diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 6ea1322..a9ca84b 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -415,18 +415,18 @@ void ahci::report_device_stats(string *ahci_data, int=
 idx)
 	printf("\nData from ahci %s\n",ahci_data[offset].c_str());
 	offset +=3D1;
 =

-	sprintf(util, "%5.1f",  active_util);
+	snprintf(util, sizeof(util), "%5.1f",  active_util);
 	ahci_data[offset]=3D util;
 	offset +=3D1;
 =

-	sprintf(util, "%5.1f",  partial_util);
+	snprintf(util, sizeof(util), "%5.1f",  partial_util);
 	ahci_data[offset]=3D util;
 	offset +=3D1;
 =

-	sprintf(util, "%5.1f",  slumber_util);
+	snprintf(util, sizeof(util), "%5.1f",  slumber_util);
 	ahci_data[offset]=3D util;
 	offset +=3D1;
 =

-	sprintf(util, "%5.1f",  devslp_util);
+	snprintf(util, sizeof(util), "%5.1f",  devslp_util);
 	ahci_data[offset]=3D util;
 }
diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 961a9e5..7bc370b 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -200,8 +200,8 @@ void alsa::register_power_with_devlist(struct result_bu=
ndle *results, struct par
 =

 const char * alsa::human_name(void)
 {
-	sprintf(temp_buf, "%s", humanname);
+	pt_strcpy(temp_buf, humanname);
 	if (strlen(guilty) > 0)
-		sprintf(temp_buf, "%s (%s)", humanname, guilty);
+		snprintf(temp_buf, sizeof(temp_buf), "%s (%s)", humanname, guilty);
 	return temp_buf;
 }
diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 91ebc12..1757a55 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -68,11 +68,11 @@ void device::register_sysfs_path(const char *path)
 {
 	char current_path[PATH_MAX + 1];
 	int iter =3D 0;
-	strcpy(current_path, path);
+	pt_strcpy(current_path, path);
 =

 	while (iter++ < 10) {
 		char test_path[PATH_MAX + 1];
-		sprintf(test_path, "%s/device", current_path);
+		snprintf(test_path, sizeof(test_path), "%s/device", current_path);
 		if (access(test_path, R_OK) =3D=3D 0)
 			strcpy(current_path, test_path);
 		else
diff --git a/src/devices/i915-gpu.cpp b/src/devices/i915-gpu.cpp
index c63e11f..d0f1d69 100644
--- a/src/devices/i915-gpu.cpp
+++ b/src/devices/i915-gpu.cpp
@@ -30,7 +30,7 @@
 #include <dirent.h>
 #include <unistd.h>
 #include <limits.h>
-
+#include "../lib.h"
 =

 using namespace std;
 =

@@ -78,11 +78,11 @@ void create_i915_gpu(void)
 	class i915gpu *gpu;
 	gpu_rapl_device *rapl_dev;
 =

-	strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_ring_dis=
patch/format");
+	pt_strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_ring_=
dispatch/format");
 =

 	if (access(filename, R_OK) !=3D0) {
 		/* try an older tracepoint */
-		strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_request=
_submit/format");
+		pt_strcpy(filename, "/sys/kernel/debug/tracing/events/i915/i915_gem_requ=
est_submit/format");
 		if (access(filename, R_OK) !=3D 0)
 			return;
 	}
diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index 002600b..f8f4212 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -40,6 +40,7 @@ using namespace std;
 =

 #include "device.h"
 #include "network.h"
+#include "../lib.h"
 #include "../parameters/parameters.h"
 #include "../process/process.h"
 extern "C" {
@@ -142,38 +143,38 @@ network::network(const char *_name, const char *path)=
: device()
 =

 	strncpy(sysfs_path, path, sizeof(sysfs_path));
 	register_sysfs_path(sysfs_path);
-	sprintf(devname, "%s", _name);
+	pt_strcpy(devname, _name);
 	sprintf(humanname, "nic:%s", _name);
 	strncpy(name, devname, sizeof(name));
 =

-	sprintf(devname, "%s-up", _name);
+	snprintf(devname, sizeof(devname), "%s-up", _name);
 	index_up =3D get_param_index(devname);
 	rindex_up =3D get_result_index(devname);
 =

-	sprintf(devname, "%s-powerunsave", _name);
+	snprintf(devname, sizeof(devname), "%s-powerunsave", _name);
 	index_powerunsave =3D get_param_index(devname);
 	rindex_powerunsave =3D get_result_index(devname);
 =

-	sprintf(devname, "%s-link-100", _name);
+	snprintf(devname, sizeof(devname), "%s-link-100", _name);
 	index_link_100 =3D get_param_index(devname);
 	rindex_link_100 =3D get_result_index(devname);
 =

-	sprintf(devname, "%s-link-1000", _name);
+	snprintf(devname, sizeof(devname), "%s-link-1000", _name);
 	index_link_1000 =3D get_param_index(devname);
 	rindex_link_1000 =3D get_result_index(devname);
 =

-	sprintf(devname, "%s-link-high", _name);
+	snprintf(devname, sizeof(devname), "%s-link-high", _name);
 	index_link_high =3D get_param_index(devname);
 	rindex_link_high =3D get_result_index(devname);
 =

-	sprintf(devname, "%s-packets", _name);
+	snprintf(devname, sizeof(devname), "%s-packets", _name);
 	index_pkts =3D get_param_index(devname);
 	rindex_pkts =3D get_result_index(devname);
 =

 	memset(line, 0, 4096);
 	filename.append("/device/driver");
 	if (readlink(filename.c_str(), line, 4096) > 0) {
-		sprintf(humanname, _("Network interface: %s (%s)"), _name,  basename(lin=
e));
+		snprintf(humanname, sizeof(humanname), _("Network interface: %s (%s)"), =
_name,  basename(line));
 	};
 }
 =

@@ -189,7 +190,7 @@ static int net_iface_up(const char *iface)
 	if (sock<0)
 		return 0;
 =

-	strcpy(ifr.ifr_name, iface);
+	pt_strcpy(ifr.ifr_name, iface);
 =

 	/* Check if the interface is up */
 	ret =3D ioctl(sock, SIOCGIFFLAGS, &ifr);
@@ -221,7 +222,7 @@ static int iface_link(const char *name)
 	if (sock<0)
 		return 0;
 =

-	strcpy(ifr.ifr_name, name);
+	pt_strcpy(ifr.ifr_name, name);
 =

 	memset(&cmd, 0, sizeof(cmd));
 =

@@ -249,7 +250,7 @@ static int iface_speed(const char *name)
 	if (sock<0)
 		return 0;
 =

-	strcpy(ifr.ifr_name, name);
+	pt_strcpy(ifr.ifr_name, name);
 =

 	memset(&cmd, 0, sizeof(cmd));
 =

@@ -353,22 +354,22 @@ static void netdev_callback(const char *d_name)
 =

 	f_name.append(d_name);
 =

-	sprintf(devname, "%s-up", d_name);
+	snprintf(devname, sizeof(devname), "%s-up", d_name);
 	register_parameter(devname);
 =

-	sprintf(devname, "%s-powerunsave", d_name);
+	snprintf(devname, sizeof(devname), "%s-powerunsave", d_name);
 	register_parameter(devname);
 =

-	sprintf(devname, "%s-link-100", d_name);
+	snprintf(devname, sizeof(devname), "%s-link-100", d_name);
 	register_parameter(devname);
 =

-	sprintf(devname, "%s-link-1000", d_name);
+	snprintf(devname, sizeof(devname), "%s-link-1000", d_name);
 	register_parameter(devname);
 =

-	sprintf(devname, "%s-link-high", d_name);
+	snprintf(devname, sizeof(devname), "%s-link-high", d_name);
 	register_parameter(devname);
 =

-	sprintf(devname, "%s-packets", d_name);
+	snprintf(devname, sizeof(devname), "%s-packets", d_name);
 	register_parameter(devname);
 =

 	network *bl =3D new(std::nothrow) class network(d_name, f_name.c_str());
diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 0f9c5a4..5c8d715 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -40,10 +40,10 @@
 =

 runtime_pmdevice::runtime_pmdevice(const char *_name, const char *path) : =
device()
 {
-	strcpy(sysfs_path, path);
+	pt_strcpy(sysfs_path, path);
 	register_sysfs_path(sysfs_path);
-	strcpy(name, _name);
-	sprintf(humanname, "runtime-%s", _name);
+	pt_strcpy(name, _name);
+	snprintf(humanname, sizeof(humanname), "runtime-%s", _name);
 =

 	index =3D get_param_index(humanname);
 	r_index =3D get_result_index(humanname);
@@ -141,7 +141,7 @@ double runtime_pmdevice::power_usage(struct result_bund=
le *result, struct parame
 =

 void runtime_pmdevice::set_human_name(char *_name)
 {
-	strcpy(humanname, _name);
+	pt_strcpy(humanname, _name);
 }
 =

 =

diff --git a/src/devices/thinkpad-fan.cpp b/src/devices/thinkpad-fan.cpp
index d9bb026..8e2ce53 100644
--- a/src/devices/thinkpad-fan.cpp
+++ b/src/devices/thinkpad-fan.cpp
@@ -78,7 +78,7 @@ void create_thinkpad_fan(void)
 	char filename[PATH_MAX];
 	class thinkpad_fan *fan;
 =

-	strcpy(filename, "/sys/devices/platform/thinkpad_hwmon/fan1_input");
+	pt_strcpy(filename, "/sys/devices/platform/thinkpad_hwmon/fan1_input");
 =

 	if (access(filename, R_OK) !=3D0)
 		return;
diff --git a/src/devices/thinkpad-light.cpp b/src/devices/thinkpad-light.cpp
index 945161a..d047ab3 100644
--- a/src/devices/thinkpad-light.cpp
+++ b/src/devices/thinkpad-light.cpp
@@ -76,7 +76,7 @@ void create_thinkpad_light(void)
 	char filename[PATH_MAX];
 	class thinkpad_light *light;
 =

-	strcpy(filename, "/sys/devices/platform/thinkpad_acpi/leds/tpacpi::thinkl=
ight/brightness");
+	pt_strcpy(filename, "/sys/devices/platform/thinkpad_acpi/leds/tpacpi::thi=
nklight/brightness");
 =

 	if (access(filename, R_OK) !=3D0)
 		return;
diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
index eb8c718..1f0e646 100644
--- a/src/devices/usb.cpp
+++ b/src/devices/usb.cpp
@@ -43,11 +43,11 @@ usbdevice::usbdevice(const char *_name, const char *pat=
h, const char *devid): de
 	char vendor[4096];
 	char product[4096];
 =

-	strcpy(sysfs_path, path);
+	pt_strcpy(sysfs_path, path);
 	register_sysfs_path(sysfs_path);
-	strcpy(name, _name);
-	strcpy(devname, devid);
-	sprintf(humanname, _("USB device: %s"), pretty_print(devid, vendor, 4096)=
);
+	pt_strcpy(name, _name);
+	pt_strcpy(devname, devid);
+	snprintf(humanname, sizeof(humanname), _("USB device: %s"), pretty_print(=
devid, vendor, 4096));
 	active_before =3D 0;
 	active_after =3D 0;
 	connected_before =3D 0;
diff --git a/src/devlist.cpp b/src/devlist.cpp
index bf48f23..e38a1ed 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -263,7 +263,7 @@ void register_devpower(const char *devstring, double po=
wer, class device *_dev)
 =

 	if (!dev) {
 		dev =3D (struct devpower *)malloc(sizeof (struct devpower));
-		strcpy(dev->device, devstring);
+		pt_strcpy(dev->device, devstring);
 		dev->power =3D 0.0;
 		devpower.push_back(dev);
 	}
@@ -333,13 +333,13 @@ void report_show_open_devices(void)
 	for (i =3D 0; i < target->size(); i++) {
 		proc[0] =3D 0;
 		if (strcmp(prev, (*target)[i]->comm) !=3D 0)
-			sprintf(proc, "%s", (*target)[i]->comm);
+			snprintf(proc, sizeof(proc), "%s", (*target)[i]->comm);
 =

 		process_data[idx]=3Dstring(proc);
 		idx+=3D1;
 		process_data[idx]=3Dstring((*target)[i]->device);
 		idx+=3D1;
-		sprintf(prev, "%s", (*target)[i]->comm);
+		snprintf(prev, sizeof(prev), "%s", (*target)[i]->comm);
 	}
 =

 	/* Report Output */
diff --git a/src/lib.h b/src/lib.h
index 5c94271..6316590 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -28,6 +28,7 @@
 #include <libintl.h>
 #include <stdint.h>
 #include <stdlib.h>
+#include <cstring>
 =

 /* Include only for Automake builds */
 #ifdef HAVE_CONFIG_H
@@ -75,6 +76,12 @@ extern char *fmt_prefix(double n, char *buf);
 extern char *pretty_print(const char *str, char *buf, int len);
 extern int equals(double a, double b);
 =

+template<size_t N> void pt_strcpy(char (&d)[N], const char *s)
+{
+	strncpy(d, s, N);
+	d[N-1] =3D '\0';
+}
+
 typedef void (*callback)(const char*);
 extern void process_directory(const char *d_name, callback fn);
 extern int utf_ok;
diff --git a/src/measurement/acpi.cpp b/src/measurement/acpi.cpp
index a55109b..c1b9520 100644
--- a/src/measurement/acpi.cpp
+++ b/src/measurement/acpi.cpp
@@ -30,6 +30,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <limits.h>
+#include "../lib.h"
 =

 using namespace std;
 =

@@ -96,7 +97,7 @@ void acpi_power_meter::measure(void)
 			c =3D strchr(c, ' ');
 			if (c) {
 				c++;
-				strcpy(rate_units, c);
+				pt_strcpy(rate_units, c);
 			} else {
 				_rate =3D 0;
 				strcpy(rate_units, "Unknown");
@@ -111,7 +112,7 @@ void acpi_power_meter::measure(void)
 			c =3D strchr(c, ' ');
 			if (c) {
 				c++;
-				strcpy(capacity_units, c);
+				pt_strcpy(capacity_units, c);
 			} else {
 				_capacity =3D 0;
 				strcpy(capacity_units, "Unknown");
@@ -125,7 +126,7 @@ void acpi_power_meter::measure(void)
 			c =3D strchr(c, ' ');
 			if (c) {
 				c++;
-				strcpy(voltage_units, c);
+				pt_strcpy(voltage_units, c);
 			} else {
 				_voltage =3D 0;
 				strcpy(voltage_units, "Unknown");
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 91dc900..391cb7f 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -857,7 +857,7 @@ void process_update_display(void)
 		format_watts(all_power[i]->Witts(), power, 10);
 		if (!show_power)
 			strcpy(power, "          ");
-		sprintf(name, "%s", all_power[i]->type());
+		snprintf(name, sizeof(name), "%s", all_power[i]->type());
 =

 		align_string(name, 14, 20);
 =

@@ -867,18 +867,18 @@ void process_update_display(void)
 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage(), all_power[i]->usage_u=
nits());
+				snprintf(usage, sizeof(usage), "%5.1f%s", all_power[i]->usage(), all_p=
ower[i]->usage_units());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
+				snprintf(usage, sizeof(usage), "%5i%s", (int)all_power[i]->usage(), al=
l_power[i]->usage_units());
 		}
 =

 		align_string(usage, 14, 20);
 =

-		sprintf(events, "%5.1f", all_power[i]->events());
+		snprintf(events, sizeof(events), "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
 		else if (all_power[i]->events() <=3D 0.3)
-			sprintf(events, "%5.2f", all_power[i]->events());
+			snprintf(events, sizeof(events), "%5.2f", all_power[i]->events());
 =

 		align_string(events, 12, 20);
 		wprintw(win, "%s  %s %s %s %s\n", power, usage, events, name, pretty_pri=
nt(all_power[i]->description(), descr, 128));
@@ -944,7 +944,7 @@ void report_process_update_display(void)
 =

 		if (!show_power)
 			strcpy(power, "          ");
-		sprintf(name, "%s", all_power[i]->type());
+		snprintf(name, sizeof(name), "%s", all_power[i]->type());
 =

 		if (strcmp(name, "Device") =3D=3D 0)
 			continue;
@@ -956,17 +956,17 @@ void report_process_update_display(void)
 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage(), all_power[i]->usage_u=
nits());
+				snprintf(usage, sizeof(usage), "%5.1f%s", all_power[i]->usage(), all_p=
ower[i]->usage_units());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
+				snprintf(usage, sizeof(usage), "%5i%s", (int)all_power[i]->usage(), al=
l_power[i]->usage_units());
 		}
-		sprintf(wakes, "%5.1f", all_power[i]->wake_ups / measurement_time);
+		snprintf(wakes, sizeof(wakes), "%5.1f", all_power[i]->wake_ups / measure=
ment_time);
 		if (all_power[i]->wake_ups / measurement_time <=3D 0.3)
-			sprintf(wakes, "%5.2f", all_power[i]->wake_ups / measurement_time);
-		sprintf(gpus, "%5.1f", all_power[i]->gpu_ops / measurement_time);
-		sprintf(disks, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / measureme=
nt_time,
+			snprintf(wakes, sizeof(wakes), "%5.2f", all_power[i]->wake_ups / measur=
ement_time);
+		snprintf(gpus, sizeof(gpus), "%5.1f", all_power[i]->gpu_ops / measuremen=
t_time);
+		snprintf(disks, sizeof(disks), "%5.1f (%5.1f)", all_power[i]->hard_disk_=
hits / measurement_time,
 				all_power[i]->disk_hits / measurement_time);
-		sprintf(xwakes, "%5.1f", all_power[i]->xwakes / measurement_time);
+		snprintf(xwakes, sizeof(xwakes), "%5.1f", all_power[i]->xwakes / measure=
ment_time);
 		if (!all_power[i]->show_events()) {
 			wakes[0] =3D 0;
 			gpus[0] =3D 0;
@@ -1087,7 +1087,7 @@ void report_summary(void)
 =

 		if (!show_power)
 			strcpy(power, "          ");
-		sprintf(name, "%s", all_power[i]->type());
+		snprintf(name, sizeof(name), "%s", all_power[i]->type());
 =

 		if (i > total)
 			break;
@@ -1099,17 +1099,17 @@ void report_summary(void)
 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage_summary(),
+				snprintf(usage, sizeof(usage), "%5.1f%s", all_power[i]->usage_summary(=
),
 					all_power[i]->usage_units_summary());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage_summary(),
+				snprintf(usage, sizeof(usage), "%5i%s", (int)all_power[i]->usage_summa=
ry(),
 					all_power[i]->usage_units_summary());
 		}
-		sprintf(events, "%5.1f", all_power[i]->events());
+		snprintf(events, sizeof(events), "%5.1f", all_power[i]->events());
 		if (!all_power[i]->show_events())
 			events[0] =3D 0;
 		else if (all_power[i]->events() <=3D 0.3)
-			sprintf(events, "%5.2f", all_power[i]->events());
+			snprintf(events, sizeof(events), "%5.2f", all_power[i]->events());
 =

 		summary_data[idx]=3Dstring(usage);
 		idx+=3D1;
diff --git a/src/process/interrupt.cpp b/src/process/interrupt.cpp
index 8ca756f..53b0367 100644
--- a/src/process/interrupt.cpp
+++ b/src/process/interrupt.cpp
@@ -51,7 +51,7 @@ interrupt::interrupt(const char *_handler, int _number) :=
 power_consumer()
 	number =3D _number;
 	strncpy(handler, _handler, 31);
 	raw_count =3D 0;
-	sprintf(desc, "[%i] %s", number, pretty_print(handler, buf, 128));
+	snprintf(desc, sizeof(desc), "[%i] %s", number, pretty_print(handler, buf=
, 128));
 }
 =

 =

@@ -98,7 +98,7 @@ class interrupt * find_create_interrupt(const char *_hand=
ler, int nr, int cpu)
 	unsigned int i;
 	class interrupt *new_irq;
 =

-	strcpy(handler, _handler);
+	pt_strcpy(handler, _handler);
 	if (strcmp(handler, "timer")=3D=3D0)
 		sprintf(handler, "timer/%i", cpu);
 =

diff --git a/src/process/process.cpp b/src/process/process.cpp
index 34dc68d..25de86f 100644
--- a/src/process/process.cpp
+++ b/src/process/process.cpp
@@ -33,6 +33,7 @@
 =

 #include <iostream>
 #include <fstream>
+#include "../lib.h"
 =

 =

 vector <class process *> all_processes;
@@ -89,7 +90,7 @@ process::process(const char *_comm, int _pid, int _tid) :=
 power_consumer()
 	char line[4097];
 	ifstream file;
 =

-	strcpy(comm, _comm);
+	pt_strcpy(comm, _comm);
 	pid =3D _pid;
 	is_idle =3D 0;
 	running =3D 0;
@@ -120,7 +121,7 @@ process::process(const char *_comm, int _pid, int _tid)=
 : power_consumer()
 	if (strncmp(_comm, "kondemand/", 10) =3D=3D 0)
 		is_idle =3D 1;
 =

-	strcpy(desc, comm);
+	pt_strcpy(desc, comm);
 =

 	sprintf(line, "/proc/%i/cmdline", _pid);
 	file.open(line, ios::binary);
@@ -130,7 +131,7 @@ process::process(const char *_comm, int _pid, int _tid)=
 : power_consumer()
 		file.close();
 		if (strlen(line) < 1) {
 			is_kernel =3D 1;
-			sprintf(desc, "[%s]", comm);
+			snprintf(desc, sizeof(desc), "[%s]", comm);
 		} else {
 			int sz =3D sizeof(desc) - 1;
 			cmdline_to_string(line);
diff --git a/src/process/processdevice.cpp b/src/process/processdevice.cpp
index 5bb269e..00f48c8 100644
--- a/src/process/processdevice.cpp
+++ b/src/process/processdevice.cpp
@@ -39,7 +39,7 @@ device_consumer::device_consumer(class device *dev) : pow=
er_consumer()
 =

 const char * device_consumer::description(void)
 {
-	sprintf(str, "%s", device->human_name());
+	snprintf(str, sizeof(str), "%s", device->human_name());
 	return str;
 }
 =

diff --git a/src/process/timer.cpp b/src/process/timer.cpp
index 1ca8c25..d2b5abe 100644
--- a/src/process/timer.cpp
+++ b/src/process/timer.cpp
@@ -125,7 +125,7 @@ const char * timer::description(void)
 	if (child_runtime > accumulated_runtime)
 		child_runtime =3D 0;
 =

-	sprintf(desc, "%s", handler);
+	snprintf(desc, sizeof(desc), "%s", handler);
 	return desc;
 }
 =

diff --git a/src/process/work.cpp b/src/process/work.cpp
index e62e5d3..797f766 100644
--- a/src/process/work.cpp
+++ b/src/process/work.cpp
@@ -40,7 +40,7 @@ work::work(unsigned long address) : power_consumer()
 {
 	strncpy(handler, kernel_function(address), 31);
 	raw_count =3D 0;
-	sprintf(desc, "%s", handler);
+	snprintf(desc, sizeof(desc), "%s", handler);
 }
 =

 =

diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index 9be327e..dab46d7 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -46,8 +46,8 @@
 bt_tunable::bt_tunable(void) : tunable("", 1.0, _("Good"), _("Bad"), _("Un=
known"))
 {
 	sprintf(desc, _("Bluetooth device interface status"));
-	strcpy(toggle_bad, "/usr/sbin/hciconfig hci0 up &> /dev/null &");
-	strcpy(toggle_good, "/usr/sbin/hciconfig hci0 down &> /dev/null");
+	pt_strcpy(toggle_bad, "/usr/sbin/hciconfig hci0 up &> /dev/null &");
+	pt_strcpy(toggle_good, "/usr/sbin/hciconfig hci0 down &> /dev/null");
 }
 =

 =

diff --git a/src/tuning/ethernet.cpp b/src/tuning/ethernet.cpp
index da04711..849b7b2 100644
--- a/src/tuning/ethernet.cpp
+++ b/src/tuning/ethernet.cpp
@@ -71,7 +71,7 @@ int ethernet_tunable::good_bad(void)
 	if (sock<0)
 		return result;
 =

-	strcpy(ifr.ifr_name, interf);
+	pt_strcpy(ifr.ifr_name, interf);
 =

 	/* Check if the interf is up */
 	ret =3D ioctl(sock, SIOCGIFFLAGS, &ifr);
@@ -107,7 +107,7 @@ void ethernet_tunable::toggle(void)
 	if (sock<0)
 		return;
 =

-	strcpy(ifr.ifr_name, interf);
+	pt_strcpy(ifr.ifr_name, interf);
 =

 	/* Check if the interface is up */
 	ret =3D ioctl(sock, SIOCGIFFLAGS, &ifr);
diff --git a/src/tuning/tunable.cpp b/src/tuning/tunable.cpp
index 83595ea..827b913 100644
--- a/src/tuning/tunable.cpp
+++ b/src/tuning/tunable.cpp
@@ -26,6 +26,7 @@
 #include "tuning.h"
 #include "tunable.h"
 #include <string.h>
+#include "../lib.h"
 =

 vector<class tunable *> all_tunables;
 vector<class tunable *> all_untunables;
@@ -34,10 +35,10 @@ vector<class tunable *> all_untunables;
 tunable::tunable(const char *str, double _score, const char *good, const c=
har *bad, const char *neutral)
 {
 	score =3D _score;
-	strcpy(desc, str);
-	strcpy(good_string, good);
-	strcpy(bad_string, bad);
-	strcpy(neutral_string, neutral);
+	pt_strcpy(desc, str);
+	pt_strcpy(good_string, good);
+	pt_strcpy(bad_string, bad);
+	pt_strcpy(neutral_string, neutral);
 }
 =

 =

@@ -45,7 +46,7 @@ tunable::tunable(void)
 {
 	score =3D 0;
 	desc[0] =3D 0;
-	strcpy(good_string, _("Good"));
-	strcpy(bad_string, _("Bad"));
-	strcpy(neutral_string, _("Unknown"));
+	pt_strcpy(good_string, _("Good"));
+	pt_strcpy(bad_string, _("Bad"));
+	pt_strcpy(neutral_string, _("Unknown"));
 }
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index a701cdb..005bb4b 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -113,8 +113,8 @@ static void __tuning_update_display(int cursor_pos)
 	for (i =3D 0; i < all_tunables.size(); i++) {
 		char res[128];
 		char desc[4096];
-		strcpy(res, all_tunables[i]->result_string());
-		strcpy(desc, all_tunables[i]->description());
+		pt_strcpy(res, all_tunables[i]->result_string());
+		pt_strcpy(desc, all_tunables[i]->description());
 		while (strlen(res) < 12)
 			strcat(res, " ");
 =

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index 811977d..7e78a52 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -44,8 +44,8 @@
 =

 sysfs_tunable::sysfs_tunable(const char *str, const char *_sysfs_path, con=
st char *_target_content) : tunable(str, 1.0, _("Good"), _("Bad"), _("Unkno=
wn"))
 {
-	strcpy(sysfs_path, _sysfs_path);
-	strcpy(target_value, _target_content);
+	pt_strcpy(sysfs_path, _sysfs_path);
+	pt_strcpy(target_value, _target_content);
 	bad_value[0] =3D 0;
 	snprintf(toggle_good, 4096, "echo '%s' > '%s';", target_value, sysfs_path=
);
 	snprintf(toggle_bad, 4096, "echo '%s' > '%s';", bad_value, sysfs_path);
@@ -69,7 +69,7 @@ int sysfs_tunable::good_bad(void)
 	if (strcmp(current_value, target_value) =3D=3D 0)
 		return TUNE_GOOD;
 =

-	strcpy(bad_value, current_value);
+	pt_strcpy(bad_value, current_value);
 	return TUNE_BAD;
 }
 =

diff --git a/src/tuning/wifi.cpp b/src/tuning/wifi.cpp
index 2763b43..783948d 100644
--- a/src/tuning/wifi.cpp
+++ b/src/tuning/wifi.cpp
@@ -44,7 +44,7 @@ extern "C" {
 =

 wifi_tunable::wifi_tunable(const char *_iface) : tunable("", 1.5, _("Good"=
), _("Bad"), _("Unknown"))
 {
-	strcpy(iface, _iface);
+	pt_strcpy(iface, _iface);
 	sprintf(desc, _("Wireless Power Saving for interface %s"), iface);
 =

 	snprintf(toggle_good, 4096, "iw dev %s set power_save on", iface);
-- =

2.4.3


--===============7027323354419637859==--

