Content-Type: multipart/mixed; boundary="===============1311051574458957362=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 2/3] Use package name to identify domains
Date: Wed, 04 Jun 2014 17:35:22 -0700
Message-ID: <1401928523-3378-2-git-send-email-srinivas.pandruvada@linux.intel.com>
In-Reply-To: 1401928523-3378-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1311051574458957362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here the cpu is identifying a package id. Currently the RAPL
package name is not used, but by changing to powercap sysfs
package name, it can be used to identify RAPL package domains
in a multi processor system.
---
 src/cpu/cpu.cpp              | 4 ++--
 src/cpu/cpu_rapl_device.cpp  | 4 ++--
 src/cpu/dram_rapl_device.cpp | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index b3b6166..37cc409 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -82,14 +82,14 @@ static class abstract_cpu * new_package(int package, in=
t cpu, char * vendor, int
 	cpudev =3D new class cpudevice(_("cpu package"), packagename, ret);
 	all_devices.push_back(cpudev);
 =

-	sprintf(packagename, _("cpu rapl package %i"), cpu);
+	sprintf(packagename, _("package-%i"), cpu);
 	cpu_rapl_dev =3D new class cpu_rapl_device(cpudev, _("cpu rapl package"),=
 packagename, ret);
 	if (cpu_rapl_dev->device_present())
 		all_devices.push_back(cpu_rapl_dev);
 	else
 		delete cpu_rapl_dev;
 =

-	sprintf(packagename, _("dram rapl package %i"), cpu);
+	sprintf(packagename, _("package-%i"), cpu);
 	dram_rapl_dev =3D new class dram_rapl_device(cpudev, _("dram rapl package=
"), packagename, ret);
 	if (dram_rapl_dev->device_present())
 		all_devices.push_back(dram_rapl_dev);
diff --git a/src/cpu/cpu_rapl_device.cpp b/src/cpu/cpu_rapl_device.cpp
index be10d9e..357a1c8 100644
--- a/src/cpu/cpu_rapl_device.cpp
+++ b/src/cpu/cpu_rapl_device.cpp
@@ -33,9 +33,9 @@ cpu_rapl_device::cpu_rapl_device(cpudevice *parent, const=
 char *classname, const
 	  device_valid(false)
 {
 	if (_cpu)
-		rapl =3D new c_rapl_interface(cpu->get_first_cpu());
+		rapl =3D new c_rapl_interface(dev_name, cpu->get_first_cpu());
 	else
-		rapl =3D new c_rapl_interface(0);
+		rapl =3D new c_rapl_interface();
 	last_time =3D time(NULL);
 	if (rapl->pp0_domain_present()) {
 		device_valid =3D true;
diff --git a/src/cpu/dram_rapl_device.cpp b/src/cpu/dram_rapl_device.cpp
index fd31cb5..36d47a2 100644
--- a/src/cpu/dram_rapl_device.cpp
+++ b/src/cpu/dram_rapl_device.cpp
@@ -34,9 +34,9 @@ dram_rapl_device::dram_rapl_device(cpudevice *parent, con=
st char *classname, con
 	  device_valid(false)
 {
 	if (_cpu)
-		rapl =3D new c_rapl_interface(cpu->get_first_cpu());
+		rapl =3D new c_rapl_interface(dev_name, cpu->get_first_cpu());
 	else
-		rapl =3D new c_rapl_interface(0);
+		rapl =3D new c_rapl_interface();
 	last_time =3D time(NULL);
 	if (rapl->dram_domain_present()) {
 		device_valid =3D true;
-- =

1.7.11.7


--===============1311051574458957362==--

