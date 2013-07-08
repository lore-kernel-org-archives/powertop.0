Content-Type: multipart/mixed; boundary="===============6435162893057963715=="
MIME-Version: 1.0
From: Niels Penneman <niels at penneman.org>
Subject: Re: [Powertop] Intel GPU statistics on multi-GPU systems
Date: Mon, 08 Jul 2013 12:55:07 +0200
Message-ID: <CALRbN8Dt7-Xc=hnZyZpYxRaH8+dJaZTaAc8GPNx=OneTB-nG5w@mail.gmail.com>
In-Reply-To: 20130708103934.GA4232@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6435162893057963715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Updated patch below.


From: Niels Penneman <niels.penneman(a)elis.ugent.be>
Date: Mon, 8 Jul 2013 14:53:23 +0200
Subject: [PATCH] Probe for Intel GPU

---
 src/cpu/cpu.cpp       | 60
++++++++++++++++++++++++++++++++++++++++++++++-----
 src/cpu/intel_cpus.h  |  2 ++
 src/cpu/intel_gpu.cpp | 21 ++++++++++++------
 3 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 5d0db28..4d61a71 100644
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

-static class abstract_cpu * new_i965_gpu(void)
+static class abstract_cpu * new_i965_gpu(int sysfs_num)
 {
     class abstract_cpu *ret =3D NULL;

     ret =3D new class i965_core;
     ret->childcount =3D 0;
     ret->set_type("GPU");
+    static_cast<class i965_core *>(ret)->sysfs_num =3D sysfs_num;

     return ret;
 }
@@ -260,7 +263,7 @@ static void handle_one_cpu(unsigned int number, char
*vendor, int family, int mo
     all_cpus[number] =3D cpu;
 }

-static void handle_i965_gpu(void)
+static void handle_i965_gpu(int gpu)
 {
     unsigned int core_number =3D 0;
     class abstract_cpu *package;
@@ -274,11 +277,55 @@ static void handle_i965_gpu(void)
         package->children.resize(core_number + 1, NULL);

     if (!package->children[core_number]) {
-        package->children[core_number] =3D new_i965_gpu();
+        package->children[core_number] =3D new_i965_gpu(gpu);
         package->childcount++;
     }
 }

+static int probe_i965_gpu()
+{
+    DIR *dir;
+    struct dirent *entry;
+    int gpu =3D -1;
+
+    dir =3D opendir("/sys/class/drm");
+    if (!dir)
+        return false;
+    while ((entry =3D readdir(dir))) {
+        ifstream file;
+        char filename[PATH_MAX];
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
+            gpu =3D atoi(&entry->d_name[4]);
+            break;
+        }
+    }
+    closedir(dir);
+    return gpu;
+}
+

 void enumerate_cpus(void)
 {
@@ -290,6 +337,8 @@ void enumerate_cpus(void)
     int family =3D 0;
     int model =3D 0;

+    int gpu;
+
     file.open("/proc/cpuinfo",  ios::in);

     if (!file)
@@ -350,8 +399,9 @@ void enumerate_cpus(void)

     file.close();

-    if (access("/sys/class/drm/card0/power/rc6_residency_ms", R_OK) =3D=3D=
 0)
-        handle_i965_gpu();
+    gpu =3D probe_i965_gpu();
+    if (gpu >=3D 0)
+        handle_i965_gpu(gpu);

     perf_events =3D new perf_power_bundle();

diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
index 64d74f2..af70bde 100644
--- a/src/cpu/intel_cpus.h
+++ b/src/cpu/intel_cpus.h
@@ -137,6 +137,8 @@ private:
     struct timeval    after;

 public:
+    int sysfs_num;
+
     virtual void    measurement_start(void);
     virtual void    measurement_end(void);
     virtual int     can_collapse(void) { return 0;};
diff --git a/src/cpu/intel_gpu.cpp b/src/cpu/intel_gpu.cpp
index e0f4ac2..1e4b228 100644
--- a/src/cpu/intel_gpu.cpp
+++ b/src/cpu/intel_gpu.cpp
@@ -43,11 +43,15 @@
 void i965_core::measurement_start(void)
 {
     ifstream file;
+    char filename[PATH_MAX];

     gettimeofday(&before, NULL);
-    rc6_before =3D read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms=
",
NULL);
-    rc6p_before =3D
read_sysfs("/sys/class/drm/card0/power/rc6p_residency_ms", NULL);
-    rc6pp_before =3D
read_sysfs("/sys/class/drm/card0/power/rc6pp_residency_ms", NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6_residency_ms",
sysfs_num);
+    rc6_before =3D read_sysfs(filename, NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6p_residency_ms",
sysfs_num);
+    rc6p_before =3D read_sysfs(filename, NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6pp_residency_ms",
sysfs_num);
+    rc6pp_before =3D read_sysfs(filename, NULL);

     update_cstate("gpu c0", "Powered On", 0, 0, 1, 0);
     update_cstate("gpu rc6", "RC6", 0, rc6_before, 1, 1);
@@ -101,11 +105,16 @@ char * i965_core::fill_cstate_line(int line_nr, char
*buffer, const char *separa

 void i965_core::measurement_end(void)
 {
+    char filename[512];
+
     gettimeofday(&after, NULL);

-    rc6_after =3D read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms",
NULL);
-    rc6p_after =3D
read_sysfs("/sys/class/drm/card0/power/rc6p_residency_ms", NULL);
-    rc6pp_after =3D
read_sysfs("/sys/class/drm/card0/power/rc6pp_residency_ms", NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6_residency_ms",
sysfs_num);
+    rc6_after =3D read_sysfs(filename, NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6p_residency_ms",
sysfs_num);
+    rc6p_after =3D read_sysfs(filename, NULL);
+    sprintf(filename, "/sys/class/drm/card%d/power/rc6pp_residency_ms",
sysfs_num);
+    rc6pp_after =3D read_sysfs(filename, NULL);
 }

 char * i965_core::fill_pstate_line(int line_nr, char *buffer)
-- =

1.8.1.5




On Mon, Jul 8, 2013 at 12:39 PM, Sergey Senozhatsky <
sergey.senozhatsky(a)gmail.com> wrote:

> On (07/08/13 14:30), Niels Penneman wrote:
> [..]
> > >> +
> > > do we really need to store 512 bytes instead of 4? as a public member?
> > >
> > > btw, why 512?
> >
> > Indeed, we can store GPU number instead. I looked at how paths were
> > stored throughout powertop and found buffer sizes of 256 for filenames,
> > so I doubled it to 512 when adding '/sys/class/drm' etc. GPU number is
> > better though, I'll edit the patch.
> >
>
> thanks.
>
>
> [..]
> > >> +    char filename[512];
> > >>
> > > 4K
> > Did you mean buffer size should be 4k ? It would be helpful if powertop
> > sources actually had constants for this.
> >
>
> better to use standard ones.
>
>
> linux/limits.h
> [..]
> #define NAME_MAX         255    /* # chars in a file name */
> #define PATH_MAX        4096    /* # chars in a path name including nul
> [..]
>
>         -ss
>



-- =

Niels Penneman
Computer Systems Lab
Electronics and Information Systems Department
Ghent University

--===============6435162893057963715==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VXBkYXRlZCBwYXRjaCBiZWxvdy48YnI+PGJyPjxicj5Gcm9tOiBOaWVs
cyBQZW5uZW1hbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5pZWxzLnBlbm5lbWFuQGVsaXMudWdlbnQu
YmUiPm5pZWxzLnBlbm5lbWFuQGVsaXMudWdlbnQuYmU8L2E+Jmd0Ozxicj5EYXRlOiBNb24sIDgg
SnVsIDIwMTMgMTQ6NTM6MjMgKzAyMDA8YnI+U3ViamVjdDogW1BBVENIXSBQcm9iZSBmb3IgSW50
ZWwgR1BVPGJyPgo8YnI+LS0tPGJyPqBzcmMvY3B1L2NwdS5jcHCgoKCgoKAgfCA2MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS08YnI+oHNyYy9jcHUv
aW50ZWxfY3B1cy5ooCB8oCAyICsrPGJyPqBzcmMvY3B1L2ludGVsX2dwdS5jcHAgfCAyMSArKysr
KysrKysrKystLS0tLS08YnI+oDMgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pPGJyPgo8YnI+ZGlmZiAtLWdpdCBhL3NyYy9jcHUvY3B1LmNwcCBiL3NyYy9j
cHUvY3B1LmNwcDxicj5pbmRleCA1ZDBkYjI4Li40ZDYxYTcxIDEwMDY0NDxicj4tLS0gYS9zcmMv
Y3B1L2NwdS5jcHA8YnI+KysrIGIvc3JjL2NwdS9jcHUuY3BwPGJyPkBAIC0yMiwxMSArMjIsMTMg
QEA8YnI+oCAqIEF1dGhvcnM6PGJyPqAgKqCgoCBBcmphbiB2YW4gZGUgVmVuICZsdDs8YSBocmVm
PSJtYWlsdG86YXJqYW5AbGludXguaW50ZWwuY29tIj5hcmphbkBsaW51eC5pbnRlbC5jb208L2E+
Jmd0Ozxicj4KoCAqLzxicj4rI2luY2x1ZGUgJmx0O2NjdHlwZSZndDs8YnI+oCNpbmNsdWRlICZs
dDtpb3N0cmVhbSZndDs8YnI+oCNpbmNsdWRlICZsdDtmc3RyZWFtJmd0Ozxicj6gI2luY2x1ZGUg
Jmx0O3ZlY3RvciZndDs8YnI+oCNpbmNsdWRlICZsdDtzdHJpbmcuaCZndDs8YnI+oCNpbmNsdWRl
ICZsdDtzdGRsaWIuaCZndDs8YnI+KyNpbmNsdWRlICZsdDtkaXJlbnQuaCZndDs8YnI+oCNpbmNs
dWRlICZsdDtuY3Vyc2VzLmgmZ3Q7PGJyPgqgI2luY2x1ZGUgJmx0O3VuaXN0ZC5oJmd0Ozxicj6g
I2luY2x1ZGUgJnF1b3Q7Y3B1LmgmcXVvdDs8YnI+QEAgLTE1MSwxMyArMTUzLDE0IEBAIHN0YXRp
YyBjbGFzcyBhYnN0cmFjdF9jcHUgKiBuZXdfY29yZShpbnQgY29yZSwgaW50IGNwdSwgY2hhciAq
IHZlbmRvciwgaW50IGZhbWlsPGJyPqCgoKAgcmV0dXJuIHJldDs8YnI+oH08YnI+oDxicj4tc3Rh
dGljIGNsYXNzIGFic3RyYWN0X2NwdSAqIG5ld19pOTY1X2dwdSh2b2lkKTxicj4KK3N0YXRpYyBj
bGFzcyBhYnN0cmFjdF9jcHUgKiBuZXdfaTk2NV9ncHUoaW50IHN5c2ZzX251bSk8YnI+oHs8YnI+
oKCgoCBjbGFzcyBhYnN0cmFjdF9jcHUgKnJldCA9IE5VTEw7PGJyPqA8YnI+oKCgoCByZXQgPSBu
ZXcgY2xhc3MgaTk2NV9jb3JlOzxicj6goKCgIHJldC0mZ3Q7Y2hpbGRjb3VudCA9IDA7PGJyPqCg
oKAgcmV0LSZndDtzZXRfdHlwZSgmcXVvdDtHUFUmcXVvdDspOzxicj4KK6CgoCBzdGF0aWNfY2Fz
dCZsdDtjbGFzcyBpOTY1X2NvcmUgKiZndDsocmV0KS0mZ3Q7c3lzZnNfbnVtID0gc3lzZnNfbnVt
Ozxicj6gPGJyPqCgoKAgcmV0dXJuIHJldDs8YnI+oH08YnI+QEAgLTI2MCw3ICsyNjMsNyBAQCBz
dGF0aWMgdm9pZCBoYW5kbGVfb25lX2NwdSh1bnNpZ25lZCBpbnQgbnVtYmVyLCBjaGFyICp2ZW5k
b3IsIGludCBmYW1pbHksIGludCBtbzxicj6goKCgIGFsbF9jcHVzW251bWJlcl0gPSBjcHU7PGJy
PgqgfTxicj6gPGJyPi1zdGF0aWMgdm9pZCBoYW5kbGVfaTk2NV9ncHUodm9pZCk8YnI+K3N0YXRp
YyB2b2lkIGhhbmRsZV9pOTY1X2dwdShpbnQgZ3B1KTxicj6gezxicj6goKCgIHVuc2lnbmVkIGlu
dCBjb3JlX251bWJlciA9IDA7PGJyPqCgoKAgY2xhc3MgYWJzdHJhY3RfY3B1ICpwYWNrYWdlOzxi
cj5AQCAtMjc0LDExICsyNzcsNTUgQEAgc3RhdGljIHZvaWQgaGFuZGxlX2k5NjVfZ3B1KHZvaWQp
PGJyPgqgoKCgIKCgoCBwYWNrYWdlLSZndDtjaGlsZHJlbi5yZXNpemUoY29yZV9udW1iZXIgKyAx
LCBOVUxMKTs8YnI+oDxicj6goKCgIGlmICghcGFja2FnZS0mZ3Q7Y2hpbGRyZW5bY29yZV9udW1i
ZXJdKSB7PGJyPi2goKAgoKCgIHBhY2thZ2UtJmd0O2NoaWxkcmVuW2NvcmVfbnVtYmVyXSA9IG5l
d19pOTY1X2dwdSgpOzxicj4roKCgIKCgoCBwYWNrYWdlLSZndDtjaGlsZHJlbltjb3JlX251bWJl
cl0gPSBuZXdfaTk2NV9ncHUoZ3B1KTs8YnI+CqCgoKAgoKCgIHBhY2thZ2UtJmd0O2NoaWxkY291
bnQrKzs8YnI+oKCgoCB9PGJyPqB9PGJyPqA8YnI+K3N0YXRpYyBpbnQgcHJvYmVfaTk2NV9ncHUo
KTxicj4rezxicj4roKCgIERJUiAqZGlyOzxicj4roKCgIHN0cnVjdCBkaXJlbnQgKmVudHJ5Ozxi
cj4roKCgIGludCBncHUgPSAtMTs8YnI+Kzxicj4roKCgIGRpciA9IG9wZW5kaXIoJnF1b3Q7L3N5
cy9jbGFzcy9kcm0mcXVvdDspOzxicj4KK6CgoCBpZiAoIWRpcik8YnI+K6CgoCCgoKAgcmV0dXJu
IGZhbHNlOzxicj4roKCgIHdoaWxlICgoZW50cnkgPSByZWFkZGlyKGRpcikpKSB7PGJyPiugoKAg
oKCgIGlmc3RyZWFtIGZpbGU7PGJyPiugoKAgoKCgIGNoYXIgZmlsZW5hbWVbUEFUSF9NQVhdOzxi
cj4roKCgIKCgoCBjaGFyICpwOzxicj4roKCgIKCgoCB1aW50MTZfdCB2ZW5kb3I7PGJyPis8YnI+
K6CgoCCgoKAgLyogTWF0Y2ggb25seSBjYXJkTiBlbnRyaWVzIChOPTAsMSwuLi4pICovPGJyPgor
oKCgIKCgoCBpZiAoc3RybmNtcChlbnRyeS0mZ3Q7ZF9uYW1lLCAmcXVvdDtjYXJkJnF1b3Q7LCA0
KSAhPSAwKTxicj4roKCgIKCgoCCgoKAgY29udGludWU7PGJyPiugoKAgoKCgIHAgPSAmYW1wO2Vu
dHJ5LSZndDtkX25hbWVbNF07PGJyPiugoKAgoKCgIHdoaWxlICgqcCAmYW1wOyZhbXA7IHN0ZDo6
aXNkaWdpdCgqcCsrKSk7PGJyPiugoKAgoKCgIGlmICgqcCk8YnI+K6CgoCCgoKAgoKCgIGNvbnRp
bnVlOzxicj4KKzxicj4roKCgIKCgoCAvKiBDaGVjayBmb3IgSW50ZWwgdmVuZG9yIElEICovPGJy
PiugoKAgoKCgIHNwcmludGYoZmlsZW5hbWUsICZxdW90Oy9zeXMvY2xhc3MvZHJtLyVzL2Rldmlj
ZS92ZW5kb3ImcXVvdDssIGVudHJ5LSZndDtkX25hbWUpOzxicj4roKCgIKCgoCBmaWxlLm9wZW4o
ZmlsZW5hbWUpOzxicj4roKCgIKCgoCBpZiAoZmlsZSkgezxicj4roKCgIKCgoCCgoKAgZmlsZSAm
Z3Q7Jmd0OyBoZXggJmd0OyZndDsgdmVuZG9yOzxicj4KK6CgoCCgoKAgoKCgIGZpbGUuY2xvc2Uo
KTs8YnI+K6CgoCCgoKAgfTxicj4roKCgIKCgoCBpZiAodmVuZG9yICE9IDB4ODA4Nik8YnI+K6Cg
oCCgoKAgoKCgIGNvbnRpbnVlOzxicj4rPGJyPiugoKAgoKCgIC8qIENoZWNrIGZvciBvbmUgb2Yg
dGhlIGludGVyZXN0aW5nIGZpbGVzICovPGJyPiugoKAgoKCgIHNwcmludGYoZmlsZW5hbWUsICZx
dW90Oy9zeXMvY2xhc3MvZHJtLyVzL3Bvd2VyL3JjNl9yZXNpZGVuY3lfbXMmcXVvdDssIGVudHJ5
LSZndDtkX25hbWUpOzxicj4KK6CgoCCgoKAgaWYgKGFjY2VzcyhmaWxlbmFtZSwgUl9PSykgPT0g
MCkgezxicj4roKCgIKCgoCCgoKAgZ3B1ID0gYXRvaSgmYW1wO2VudHJ5LSZndDtkX25hbWVbNF0p
Ozxicj4roKCgIKCgoCCgoKAgYnJlYWs7PGJyPiugoKAgoKCgIH08YnI+K6CgoCB9PGJyPiugoKAg
Y2xvc2VkaXIoZGlyKTs8YnI+K6CgoCByZXR1cm4gZ3B1Ozxicj4rfTxicj4rPGJyPqA8YnI+oHZv
aWQgZW51bWVyYXRlX2NwdXModm9pZCk8YnI+CqB7PGJyPkBAIC0yOTAsNiArMzM3LDggQEAgdm9p
ZCBlbnVtZXJhdGVfY3B1cyh2b2lkKTxicj6goKCgIGludCBmYW1pbHkgPSAwOzxicj6goKCgIGlu
dCBtb2RlbCA9IDA7PGJyPqA8YnI+K6CgoCBpbnQgZ3B1Ozxicj4rPGJyPqCgoKAgZmlsZS5vcGVu
KCZxdW90Oy9wcm9jL2NwdWluZm8mcXVvdDssoCBpb3M6OmluKTs8YnI+oDxicj6goKCgIGlmICgh
ZmlsZSk8YnI+QEAgLTM1MCw4ICszOTksOSBAQCB2b2lkIGVudW1lcmF0ZV9jcHVzKHZvaWQpPGJy
PgqgPGJyPqCgoKAgZmlsZS5jbG9zZSgpOzxicj6gPGJyPi2goKAgaWYgKGFjY2VzcygmcXVvdDsv
c3lzL2NsYXNzL2RybS9jYXJkMC9wb3dlci9yYzZfcmVzaWRlbmN5X21zJnF1b3Q7LCBSX09LKSA9
PSAwKTxicj4toKCgIKCgoCBoYW5kbGVfaTk2NV9ncHUoKTs8YnI+K6CgoCBncHUgPSBwcm9iZV9p
OTY1X2dwdSgpOzxicj4roKCgIGlmIChncHUgJmd0Oz0gMCk8YnI+K6CgoCCgoKAgaGFuZGxlX2k5
NjVfZ3B1KGdwdSk7PGJyPgqgPGJyPqCgoKAgcGVyZl9ldmVudHMgPSBuZXcgcGVyZl9wb3dlcl9i
dW5kbGUoKTs8YnI+oDxicj5kaWZmIC0tZ2l0IGEvc3JjL2NwdS9pbnRlbF9jcHVzLmggYi9zcmMv
Y3B1L2ludGVsX2NwdXMuaDxicj5pbmRleCA2NGQ3NGYyLi5hZjcwYmRlIDEwMDY0NDxicj4tLS0g
YS9zcmMvY3B1L2ludGVsX2NwdXMuaDxicj4rKysgYi9zcmMvY3B1L2ludGVsX2NwdXMuaDxicj5A
QCAtMTM3LDYgKzEzNyw4IEBAIHByaXZhdGU6PGJyPgqgoKCgIHN0cnVjdCB0aW1ldmFsoKCgIGFm
dGVyOzxicj6gPGJyPqBwdWJsaWM6PGJyPiugoKAgaW50IHN5c2ZzX251bTs8YnI+Kzxicj6goKCg
IHZpcnR1YWwgdm9pZKCgoCBtZWFzdXJlbWVudF9zdGFydCh2b2lkKTs8YnI+oKCgoCB2aXJ0dWFs
IHZvaWSgoKAgbWVhc3VyZW1lbnRfZW5kKHZvaWQpOzxicj6goKCgIHZpcnR1YWwgaW50oKCgoCBj
YW5fY29sbGFwc2Uodm9pZCkgeyByZXR1cm4gMDt9Ozxicj4KZGlmZiAtLWdpdCBhL3NyYy9jcHUv
aW50ZWxfZ3B1LmNwcCBiL3NyYy9jcHUvaW50ZWxfZ3B1LmNwcDxicj5pbmRleCBlMGY0YWMyLi4x
ZTRiMjI4IDEwMDY0NDxicj4tLS0gYS9zcmMvY3B1L2ludGVsX2dwdS5jcHA8YnI+KysrIGIvc3Jj
L2NwdS9pbnRlbF9ncHUuY3BwPGJyPkBAIC00MywxMSArNDMsMTUgQEA8YnI+oHZvaWQgaTk2NV9j
b3JlOjptZWFzdXJlbWVudF9zdGFydCh2b2lkKTxicj4KoHs8YnI+oKCgoCBpZnN0cmVhbSBmaWxl
Ozxicj4roKCgIGNoYXIgZmlsZW5hbWVbUEFUSF9NQVhdOzxicj6gPGJyPqCgoKAgZ2V0dGltZW9m
ZGF5KCZhbXA7YmVmb3JlLCBOVUxMKTs8YnI+LaCgoCByYzZfYmVmb3JlID0gcmVhZF9zeXNmcygm
cXVvdDsvc3lzL2NsYXNzL2RybS9jYXJkMC9wb3dlci9yYzZfcmVzaWRlbmN5X21zJnF1b3Q7LCBO
VUxMKTs8YnI+LaCgoCByYzZwX2JlZm9yZSA9IHJlYWRfc3lzZnMoJnF1b3Q7L3N5cy9jbGFzcy9k
cm0vY2FyZDAvcG93ZXIvcmM2cF9yZXNpZGVuY3lfbXMmcXVvdDssIE5VTEwpOzxicj4KLaCgoCBy
YzZwcF9iZWZvcmUgPSByZWFkX3N5c2ZzKCZxdW90Oy9zeXMvY2xhc3MvZHJtL2NhcmQwL3Bvd2Vy
L3JjNnBwX3Jlc2lkZW5jeV9tcyZxdW90OywgTlVMTCk7PGJyPiugoKAgc3ByaW50ZihmaWxlbmFt
ZSwgJnF1b3Q7L3N5cy9jbGFzcy9kcm0vY2FyZCVkL3Bvd2VyL3JjNl9yZXNpZGVuY3lfbXMmcXVv
dDssIHN5c2ZzX251bSk7PGJyPiugoKAgcmM2X2JlZm9yZSA9IHJlYWRfc3lzZnMoZmlsZW5hbWUs
IE5VTEwpOzxicj4KK6CgoCBzcHJpbnRmKGZpbGVuYW1lLCAmcXVvdDsvc3lzL2NsYXNzL2RybS9j
YXJkJWQvcG93ZXIvcmM2cF9yZXNpZGVuY3lfbXMmcXVvdDssIHN5c2ZzX251bSk7PGJyPiugoKAg
cmM2cF9iZWZvcmUgPSByZWFkX3N5c2ZzKGZpbGVuYW1lLCBOVUxMKTs8YnI+K6CgoCBzcHJpbnRm
KGZpbGVuYW1lLCAmcXVvdDsvc3lzL2NsYXNzL2RybS9jYXJkJWQvcG93ZXIvcmM2cHBfcmVzaWRl
bmN5X21zJnF1b3Q7LCBzeXNmc19udW0pOzxicj4KK6CgoCByYzZwcF9iZWZvcmUgPSByZWFkX3N5
c2ZzKGZpbGVuYW1lLCBOVUxMKTs8YnI+oDxicj6goKCgIHVwZGF0ZV9jc3RhdGUoJnF1b3Q7Z3B1
IGMwJnF1b3Q7LCAmcXVvdDtQb3dlcmVkIE9uJnF1b3Q7LCAwLCAwLCAxLCAwKTs8YnI+oKCgoCB1
cGRhdGVfY3N0YXRlKCZxdW90O2dwdSByYzYmcXVvdDssICZxdW90O1JDNiZxdW90OywgMCwgcmM2
X2JlZm9yZSwgMSwgMSk7PGJyPkBAIC0xMDEsMTEgKzEwNSwxNiBAQCBjaGFyICogaTk2NV9jb3Jl
OjpmaWxsX2NzdGF0ZV9saW5lKGludCBsaW5lX25yLCBjaGFyICpidWZmZXIsIGNvbnN0IGNoYXIg
KnNlcGFyYTxicj4KoDxicj6gdm9pZCBpOTY1X2NvcmU6Om1lYXN1cmVtZW50X2VuZCh2b2lkKTxi
cj6gezxicj4roKCgIGNoYXIgZmlsZW5hbWVbNTEyXTs8YnI+Kzxicj6goKCgIGdldHRpbWVvZmRh
eSgmYW1wO2FmdGVyLCBOVUxMKTs8YnI+oDxicj4toKCgIHJjNl9hZnRlciA9IHJlYWRfc3lzZnMo
JnF1b3Q7L3N5cy9jbGFzcy9kcm0vY2FyZDAvcG93ZXIvcmM2X3Jlc2lkZW5jeV9tcyZxdW90Oywg
TlVMTCk7PGJyPgotoKCgIHJjNnBfYWZ0ZXIgPSByZWFkX3N5c2ZzKCZxdW90Oy9zeXMvY2xhc3Mv
ZHJtL2NhcmQwL3Bvd2VyL3JjNnBfcmVzaWRlbmN5X21zJnF1b3Q7LCBOVUxMKTs8YnI+LaCgoCBy
YzZwcF9hZnRlciA9IHJlYWRfc3lzZnMoJnF1b3Q7L3N5cy9jbGFzcy9kcm0vY2FyZDAvcG93ZXIv
cmM2cHBfcmVzaWRlbmN5X21zJnF1b3Q7LCBOVUxMKTs8YnI+K6CgoCBzcHJpbnRmKGZpbGVuYW1l
LCAmcXVvdDsvc3lzL2NsYXNzL2RybS9jYXJkJWQvcG93ZXIvcmM2X3Jlc2lkZW5jeV9tcyZxdW90
Oywgc3lzZnNfbnVtKTs8YnI+CiugoKAgcmM2X2FmdGVyID0gcmVhZF9zeXNmcyhmaWxlbmFtZSwg
TlVMTCk7PGJyPiugoKAgc3ByaW50ZihmaWxlbmFtZSwgJnF1b3Q7L3N5cy9jbGFzcy9kcm0vY2Fy
ZCVkL3Bvd2VyL3JjNnBfcmVzaWRlbmN5X21zJnF1b3Q7LCBzeXNmc19udW0pOzxicj4roKCgIHJj
NnBfYWZ0ZXIgPSByZWFkX3N5c2ZzKGZpbGVuYW1lLCBOVUxMKTs8YnI+K6CgoCBzcHJpbnRmKGZp
bGVuYW1lLCAmcXVvdDsvc3lzL2NsYXNzL2RybS9jYXJkJWQvcG93ZXIvcmM2cHBfcmVzaWRlbmN5
X21zJnF1b3Q7LCBzeXNmc19udW0pOzxicj4KK6CgoCByYzZwcF9hZnRlciA9IHJlYWRfc3lzZnMo
ZmlsZW5hbWUsIE5VTEwpOzxicj6gfTxicj6gPGJyPqBjaGFyICogaTk2NV9jb3JlOjpmaWxsX3Bz
dGF0ZV9saW5lKGludCBsaW5lX25yLCBjaGFyICpidWZmZXIpPGJyPi0tIDxicj4xLjguMS41PGJy
Pjxicj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIE1vbiwgSnVsIDgsIDIwMTMgYXQgMTI6MzkgUE0sIFNlcmdleSBT
ZW5vemhhdHNreSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vu
b3poYXRza3lAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2VyZ2V5LnNlbm96aGF0c2t5QGdt
YWlsLmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNv
bGlkO3BhZGRpbmctbGVmdDoxZXgiPk9uICgwNy8wOC8xMyAxNDozMCksIE5pZWxzIFBlbm5lbWFu
IHdyb3RlOjxicj4KWy4uXTxicj4KPGRpdiBjbGFzcz0iaW0iPiZndDsgJmd0OyZndDsgKzxicj4K
Jmd0OyAmZ3Q7IGRvIHdlIHJlYWxseSBuZWVkIHRvIHN0b3JlIDUxMiBieXRlcyBpbnN0ZWFkIG9m
IDQ/IGFzIGEgcHVibGljIG1lbWJlcj88YnI+CiZndDsgJmd0Ozxicj4KJmd0OyAmZ3Q7IGJ0dywg
d2h5IDUxMj88YnI+CiZndDs8YnI+CiZndDsgSW5kZWVkLCB3ZSBjYW4gc3RvcmUgR1BVIG51bWJl
ciBpbnN0ZWFkLiBJIGxvb2tlZCBhdCBob3cgcGF0aHMgd2VyZTxicj4KJmd0OyBzdG9yZWQgdGhy
b3VnaG91dCBwb3dlcnRvcCBhbmQgZm91bmQgYnVmZmVyIHNpemVzIG9mIDI1NiBmb3IgZmlsZW5h
bWVzLDxicj4KJmd0OyBzbyBJIGRvdWJsZWQgaXQgdG8gNTEyIHdoZW4gYWRkaW5nICYjMzk7L3N5
cy9jbGFzcy9kcm0mIzM5OyBldGMuIEdQVSBudW1iZXIgaXM8YnI+CiZndDsgYmV0dGVyIHRob3Vn
aCwgSSYjMzk7bGwgZWRpdCB0aGUgcGF0Y2guPGJyPgomZ3Q7PGJyPgo8YnI+CjwvZGl2PnRoYW5r
cy48YnI+Cjxicj4KPGJyPgpbLi5dPGJyPgo8ZGl2IGNsYXNzPSJpbSI+Jmd0OyAmZ3Q7Jmd0OyAr
IKAgoGNoYXIgZmlsZW5hbWVbNTEyXTs8YnI+CiZndDsgJmd0OyZndDs8YnI+CiZndDsgJmd0OyA0
Szxicj4KJmd0OyBEaWQgeW91IG1lYW4gYnVmZmVyIHNpemUgc2hvdWxkIGJlIDRrID8gSXQgd291
bGQgYmUgaGVscGZ1bCBpZiBwb3dlcnRvcDxicj4KJmd0OyBzb3VyY2VzIGFjdHVhbGx5IGhhZCBj
b25zdGFudHMgZm9yIHRoaXMuPGJyPgomZ3Q7PGJyPgo8YnI+CjwvZGl2PmJldHRlciB0byB1c2Ug
c3RhbmRhcmQgb25lcy48YnI+Cjxicj4KPGJyPgpsaW51eC9saW1pdHMuaDxicj4KWy4uXTxicj4K
I2RlZmluZSBOQU1FX01BWCCgIKAgoCCgIDI1NSCgIKAvKiAjIGNoYXJzIGluIGEgZmlsZSBuYW1l
ICovPGJyPgojZGVmaW5lIFBBVEhfTUFYIKAgoCCgIKA0MDk2IKAgoC8qICMgY2hhcnMgaW4gYSBw
YXRoIG5hbWUgaW5jbHVkaW5nIG51bDxicj4KWy4uXTxicj4KPHNwYW4gY2xhc3M9IkhPRW5aYiI+
PGZvbnQgY29sb3I9IiM4ODg4ODgiPjxicj4KoCCgIKAgoCAtc3M8YnI+CjwvZm9udD48L3NwYW4+
PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj5OaWVscyBQ
ZW5uZW1hbjxicj5Db21wdXRlciBTeXN0ZW1zIExhYjxicj5FbGVjdHJvbmljcyBhbmQgSW5mb3Jt
YXRpb24gU3lzdGVtcyBEZXBhcnRtZW50PGJyPkdoZW50IFVuaXZlcnNpdHkKPC9kaXY+Cg==

--===============6435162893057963715==--

