Content-Type: multipart/mixed; boundary="===============3511846459599587036=="
MIME-Version: 1.0
From: Niels Penneman <niels at penneman.org>
Subject: Re: [Powertop] Intel GPU statistics on multi-GPU systems
Date: Thu, 04 Jul 2013 20:33:04 +0200
Message-ID: <51D5BFE0.5050100@penneman.org>
In-Reply-To: 51D5287C.1090503@penneman.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3511846459599587036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi again,

I've noticed most of the code in powertop deals with sysfs directly, so
I guess 'scanning' sysfs looking for an Intel GPU is the way to go. I've
checked the latest version of xf86-video-intel (2.21.11) and it looks
like Intel GPUs all have the same PCI vendor ID (0x8086). Below is a
patch that looks for all items /sys/class/drm/card[0-9]+ and checks
whether the vendor is Intel. It then checks whether it can find the
power/rc6_residency_ms file like it did earlier and uses the first GPU
that passes all these checks.

What it does not fix:
- Situations where there may be multiple Intel GPUs. I don't know
whether such systems exist, and in that case each GPU would need to be
tied to a specific processor (socket).
- Hardcoded paths used to retrieve backlight information.

Side effects:
- In the case that any video driver other than Intel's exposed a
'power/rc6_residency_ms' file, the patch below will not consider the
device because it checks vendor ID. If that is not desired, the vendor
ID check should be omitted.


>From 71b0cea0b9b5cbe9ad7f673375004928ae842d9f Mon Sep 17 00:00:00 2001
From: Niels Penneman <niels.penneman(a)elis.ugent.be>
Date: Thu, 4 Jul 2013 20:20:01 +0200
Subject: [PATCH] Probe for Intel GPU

---
 src/cpu/cpu.cpp       | 60
++++++++++++++++++++++++++++++++++++++++++++++-----
 src/cpu/intel_cpus.h  |  2 ++
 src/cpu/intel_gpu.cpp | 21 ++++++++++++------
 3 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 5d0db28..7fe3f84 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -22,11 +22,13 @@
  * Authors:
  *    Arjan van de Ven <arjan(a)linux.intel.com>
  */
+#include <cctype>
 #include <iostream>
 #include <fstream>
 #include <vector>
 #include <string.h>
 #include <stdlib.h>
+#include <dirent.h>
 #include <ncurses.h>
 #include <unistd.h>
 #include "cpu.h"
@@ -151,13 +153,14 @@ static class abstract_cpu * new_core(int core, int
cpu, char * vendor, int famil
     return ret;
 }
 =

-static class abstract_cpu * new_i965_gpu(void)
+static class abstract_cpu * new_i965_gpu(const char *gpu)
 {
     class abstract_cpu *ret =3D NULL;
 =

     ret =3D new class i965_core;
     ret->childcount =3D 0;
     ret->set_type("GPU");
+    sprintf(static_cast<class i965_core *>(ret)->sysfs_dir,
"/sys/class/drm/%s/power/", gpu);
 =

     return ret;
 }
@@ -260,7 +263,7 @@ static void handle_one_cpu(unsigned int number, char
*vendor, int family, int mo
     all_cpus[number] =3D cpu;
 }
 =

-static void handle_i965_gpu(void)
+static void handle_i965_gpu(const char *gpu)
 {
     unsigned int core_number =3D 0;
     class abstract_cpu *package;
@@ -274,11 +277,56 @@ static void handle_i965_gpu(void)
         package->children.resize(core_number + 1, NULL);
 =

     if (!package->children[core_number]) {
-        package->children[core_number] =3D new_i965_gpu();
+        package->children[core_number] =3D new_i965_gpu(gpu);
         package->childcount++;
     }
 }
 =

+static bool probe_i965_gpu(char *gpu)
+{
+    DIR *dir;
+    struct dirent *entry;
+    bool found =3D false;
+
+    dir =3D opendir("/sys/class/drm");
+    if (!dir)
+        return false;
+    while ((entry =3D readdir(dir))) {
+        ifstream file;
+        char filename[4096];
+        char *p;
+        uint16_t vendor;
+
+        /* Match only cardN entries (N=3D0,1,...) */
+        if (strncmp(entry->d_name, "card", 4) !=3D 0)
+            continue;
+        p =3D &entry->d_name[4];
+        while (*p && std::isdigit(*p++));
+        if (*p)
+            continue;
+
+        /* Check for Intel vendor ID */
+        sprintf(filename, "/sys/class/drm/%s/device/vendor",
entry->d_name);
+        file.open(filename);
+        if (file) {
+            file >> hex >> vendor;
+            file.close();
+        }
+        if (vendor !=3D 0x8086)
+            continue;
+
+        /* Check for one of the interesting files */
+        sprintf(filename, "/sys/class/drm/%s/power/rc6_residency_ms",
entry->d_name);
+        if (access(filename, R_OK) =3D=3D 0) {
+            strcpy(gpu, entry->d_name);
+            found =3D true;
+            break;
+        }
+    }
+    closedir(dir);
+    return found;
+}
+
 =

 void enumerate_cpus(void)
 {
@@ -290,6 +338,8 @@ void enumerate_cpus(void)
     int family =3D 0;
     int model =3D 0;
 =

+    char gpu[256];
+
     file.open("/proc/cpuinfo",  ios::in);
 =

     if (!file)
@@ -350,8 +400,8 @@ void enumerate_cpus(void)
 =

     file.close();
 =

-    if (access("/sys/class/drm/card0/power/rc6_residency_ms", R_OK) =3D=3D=
 0)
-        handle_i965_gpu();
+    if (probe_i965_gpu(gpu))
+        handle_i965_gpu(gpu);
 =

     perf_events =3D new perf_power_bundle();
 =

diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 64d74f2..32679c1 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -137,6 +137,8 @@ private:
     struct timeval    after;
 =

 public:
+    char sysfs_dir[512];
+
     virtual void    measurement_start(void);
     virtual void    measurement_end(void);
     virtual int     can_collapse(void) { return 0;};
diff --git a/src/cpu/intel_gpu.cpp b/src/cpu/intel_gpu.cpp
index e0f4ac2..a579e28 100644
--- a/src/cpu/intel_gpu.cpp
+++ b/src/cpu/intel_gpu.cpp
@@ -43,11 +43,15 @@
 void i965_core::measurement_start(void)
 {
     ifstream file;
+    char filename[512];
 =

     gettimeofday(&before, NULL);
-    rc6_before =3D
read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms", NULL);
-    rc6p_before =3D
read_sysfs("/sys/class/drm/card0/power/rc6p_residency_ms", NULL);
-    rc6pp_before =3D
read_sysfs("/sys/class/drm/card0/power/rc6pp_residency_ms", NULL);
+    sprintf(filename, "%src6_residency_ms", sysfs_dir);
+    rc6_before =3D read_sysfs(filename, NULL);
+    sprintf(filename, "%src6p_residency_ms", sysfs_dir);
+    rc6p_before =3D read_sysfs(filename, NULL);
+    sprintf(filename, "%src6pp_residency_ms", sysfs_dir);
+    rc6pp_before =3D read_sysfs(filename, NULL);
 =

     update_cstate("gpu c0", "Powered On", 0, 0, 1, 0);
     update_cstate("gpu rc6", "RC6", 0, rc6_before, 1, 1);
@@ -101,11 +105,16 @@ char * i965_core::fill_cstate_line(int line_nr,
char *buffer, const char *separa
 =

 void i965_core::measurement_end(void)
 {
+    char filename[512];
+
     gettimeofday(&after, NULL);
 =

-    rc6_after =3D
read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms", NULL);
-    rc6p_after =3D
read_sysfs("/sys/class/drm/card0/power/rc6p_residency_ms", NULL);
-    rc6pp_after =3D
read_sysfs("/sys/class/drm/card0/power/rc6pp_residency_ms", NULL);
+    sprintf(filename, "%src6_residency_ms", sysfs_dir);
+    rc6_after =3D read_sysfs(filename, NULL);
+    sprintf(filename, "%src6p_residency_ms", sysfs_dir);
+    rc6p_after =3D read_sysfs(filename, NULL);
+    sprintf(filename, "%src6pp_residency_ms", sysfs_dir);
+    rc6pp_after =3D read_sysfs(filename, NULL);
 }
 =

 char * i965_core::fill_pstate_line(int line_nr, char *buffer)
-- =

1.8.1.5




Regards,


On 07/04/2013 09:47 AM, Niels Penneman wrote:
> Hi all,
>
> Currently powertop tries to find Intel GPU statistics in sysfs with a
> hardcoded path; in src/cpu/cpu.cpp:353-354:
>
> if (access("/sys/class/drm/card0/power/rc6_residency_ms", R_OK) =3D=3D 0)
>  handle_i965_gpu();
>
> In systems with multiple GPUs it is not guaranteed that the Intel GPU is
> labeled 'card0' in sysfs. In my system with both integrated Intel and
> discrete AMD Radeon the Intel GPU is 'card1', and powertop will not
> display GPU statistics.
>
> One possible solution would be to scan all /sys/class/drm/card[0-9]+
> folders and check the vendor & device IDs in 'device/vendor' and
> 'device/device'. Perhaps there is a better solution, e.g. by examining
> the PCI device tree.
>
>
> Regards,
>

--
Niels Penneman
Computer Systems Lab
Electronics and Information Systems Department
Ghent University


--===============3511846459599587036==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4xOSAoR05V
L0xpbnV4KQpDb21tZW50OiBVc2luZyBHbnVQRyB3aXRoIFRodW5kZXJiaXJkIC0gaHR0cDovL3d3
dy5lbmlnbWFpbC5uZXQvCgppUUljQkFFQkFnQUdCUUpSMWIvckFBb0pFTEgyOFAyQndvM0MzRThR
QUtrQ2I0OEtmcXM2aHAyRmNBQXNxZE1qCmtBb3B4azNyemN4dEM0RWc4NVR3eVJPSTdYV2FnSGlw
VC9BNTUySVZsZHVJcUFiaTZML2NVQm9lMzFCeVVFT0cKNk5KZzJVMGdzNHN1Unl6aXVWVFhkQnJt
dUtsa1B3VWl6cE56T0NBWFE1QkdNc3A5Y0Y4U2h6Z0poV3hKVWUwMApTeW1jTjIyOHFSVzBOTkJO
RHpVak5SMXBXRWV4M2tQc21RcXZaeVhZcTk0MmFKMWFDRndObXM2SFlOOThIVlFMCnp2azl3UFh3
bzlDeWtLWVhxMGhEaXZLMmFsNmdjQkVSTjl0UUtaK3M5RHF5QTNrMzVCUUdibmtEUm1na2xaclUK
YWc3TmU5bkN5NHIzUkFWd3JKK2FaajVtaXB1K3VHTnE4UVE0UWJ0dlJuSDZUSXVlM3NMOG9UNE01
eHg5ZEtHcwpCUmNwUHlPUWFGZ2U4eTRUUS9lNGtRUDRLaGhMUCszOVVvNndPUnZYMTFrQW5zU29F
UW1IOU5GREdvZzJIM1gyCk9hYkJqOWxjL1pENktuUXJUdFlwN215SSs1bVp3aFdTa01OOFhSalRZ
VmJ1WXVYT3J0VGYyNW1GdEFmcElQL2oKYkhNRkpwWXBzYmJFMXV2V3BxMWFXOERIUElBaHh1NlFw
dU1obi9vdE1vREUxUTRjL0xuckwxOXJXOXVTNStYTgp2YVVlUkV4V21ldjNOd1ZLemdkZ3JTTmlI
aWtkcWI0TXZZYytEYlpKNTVVTnBsaGVUTHFlSEI1NGpyVG5KQ01BCmFjS0VFZ3pkS2RzMXJsV3ov
ZklUUXpYYThPeE1XK09rN2xGU3FpTk5la0U4L0JsZERUakk4TGU2UjFQbjZpb3UKdE95L01ML1Vm
aHF3UlNkaEE2dVIKPWZON3IKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCg==

--===============3511846459599587036==--

