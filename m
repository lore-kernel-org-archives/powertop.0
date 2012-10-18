Content-Type: multipart/mixed; boundary="===============5011885425438106199=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [RFC/PATCH] devices: Use new(std::nothrow) for creating
 devices
Date: Fri, 19 Oct 2012 00:32:48 +0900
Message-ID: <1350574368-4657-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5011885425438106199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When allocation fails, just skip the device and proceed if possible.
This is also for consistency with others.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/devices/ahci.cpp           |    5 ++++-
 src/devices/alsa.cpp           |    5 ++++-
 src/devices/backlight.cpp      |    5 ++++-
 src/devices/i915-gpu.cpp       |    6 ++++--
 src/devices/rfkill.cpp         |    5 ++++-
 src/devices/runtime_pm.cpp     |    4 +++-
 src/devices/thinkpad-fan.cpp   |    8 +++++---
 src/devices/thinkpad-light.cpp |    6 ++++--
 src/devices/usb.cpp            |    6 ++++--
 9 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 1fe39c7..13d881f 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -275,7 +275,10 @@ void create_all_ahcis(void)
 		file.close();
 		sprintf(filename, "/sys/class/scsi_host/%s", entry->d_name);
 =

-		bl =3D new class ahci(entry->d_name, filename);
+		bl =3D new(std::nothrow) class ahci(entry->d_name, filename);
+		if (!bl)
+			continue;
+
 		all_devices.push_back(bl);
 		register_parameter("ahci-link-power-active", 0.6);  /* active sata link =
takes about 0.6 W */
 		register_parameter("ahci-link-power-partial");
diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 4f5d3f9..e42146d 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -176,7 +176,10 @@ void create_all_alsa(void)
 =

 		sprintf(filename, "/sys/class/sound/card0/%s", entry->d_name);
 =

-		bl =3D new class alsa(entry->d_name, filename);
+		bl =3D new(std::nothrow) class alsa(entry->d_name, filename);
+		if (!bl)
+			continue;
+
 		all_devices.push_back(bl);
 		register_parameter("alsa-codec-power", 0.5);
 	}
diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index b8c9147..447e6dc 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -171,7 +171,10 @@ void create_all_backlights(void)
 		if (entry->d_name[0] =3D=3D '.')
 			continue;
 		sprintf(filename, "/sys/class/backlight/%s", entry->d_name);
-		bl =3D new class backlight(entry->d_name, filename);
+		bl =3D new(std::nothrow) class backlight(entry->d_name, filename);
+		if (!bl)
+			continue;
+
 		all_devices.push_back(bl);
 		register_parameter("backlight");
 		register_parameter("backlight-power");
diff --git a/src/devices/i915-gpu.cpp b/src/devices/i915-gpu.cpp
index bcc07cc..1e68ee5 100644
--- a/src/devices/i915-gpu.cpp
+++ b/src/devices/i915-gpu.cpp
@@ -76,10 +76,12 @@ void create_i915_gpu(void)
 			return;
 	}
 =

-	register_parameter("gpu-operations");
+	gpu =3D new(std::nothrow) class i915gpu();
+	if (!gpu)
+		return;
 =

-	gpu =3D new class i915gpu();
 	all_devices.push_back(gpu);
+	register_parameter("gpu-operations");
 }
 =

 =

diff --git a/src/devices/rfkill.cpp b/src/devices/rfkill.cpp
index 2404432..ec98000 100644
--- a/src/devices/rfkill.cpp
+++ b/src/devices/rfkill.cpp
@@ -163,7 +163,10 @@ void create_all_rfkills(void)
 		}
 =

 		sprintf(filename, "/sys/class/rfkill/%s", entry->d_name);
-		bl =3D new class rfkill(name, filename);
+		bl =3D new(std::nothrow) class rfkill(name, filename);
+		if (!bl)
+			continue;
+
 		all_devices.push_back(bl);
 	}
 	closedir(dir);
diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 0d13cab..c8dc0f5 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -199,7 +199,9 @@ static void do_bus(const char *bus)
 		if (!device_has_runtime_pm(filename))
 			continue;
 =

-		dev =3D new class runtime_pmdevice(entry->d_name, filename);
+		dev =3D new(std::nothrow) class runtime_pmdevice(entry->d_name, filename=
);
+		if (!dev)
+			continue;
 =

 		if (strcmp(bus, "pci") =3D=3D 0) {
 			uint16_t vendor =3D 0, device =3D 0;
diff --git a/src/devices/thinkpad-fan.cpp b/src/devices/thinkpad-fan.cpp
index 9f470e4..3b1684c 100644
--- a/src/devices/thinkpad-fan.cpp
+++ b/src/devices/thinkpad-fan.cpp
@@ -82,12 +82,14 @@ void create_thinkpad_fan(void)
 	if (access(filename, R_OK) !=3D0)
 		return;
 =

+	fan =3D new(std::nothrow) class thinkpad_fan();
+	if (!fan)
+		return;
+
+	all_devices.push_back(fan);
 	register_parameter("thinkpad-fan", 10);
 	register_parameter("thinkpad-fan-sqr", 5);
 	register_parameter("thinkpad-fan-cub", 10);
-
-	fan =3D new class thinkpad_fan();
-	all_devices.push_back(fan);
 }
 =

 =

diff --git a/src/devices/thinkpad-light.cpp b/src/devices/thinkpad-light.cpp
index e5fde10..4316be3 100644
--- a/src/devices/thinkpad-light.cpp
+++ b/src/devices/thinkpad-light.cpp
@@ -80,10 +80,12 @@ void create_thinkpad_light(void)
 	if (access(filename, R_OK) !=3D0)
 		return;
 =

-	register_parameter("thinkpad-light", 10);
+	light =3D new(std::nothrow) class thinkpad_light();
+	if (!light)
+		return;
 =

-	light =3D new class thinkpad_light();
 	all_devices.push_back(light);
+	register_parameter("thinkpad-light", 10);
 }
 =

 =

diff --git a/src/devices/usb.cpp b/src/devices/usb.cpp
index e7542a8..f637e63 100644
--- a/src/devices/usb.cpp
+++ b/src/devices/usb.cpp
@@ -233,9 +233,11 @@ void create_all_usb_devices(void)
 		if (result_device_exists(device_name))
 			continue;
 =

-		usb =3D new class usbdevice(device_name, filename, devid_name);
-		all_devices.push_back(usb);
+		usb =3D new(std::nothrow) class usbdevice(device_name, filename, devid_n=
ame);
+		if (!usb)
+			continue;
 =

+		all_devices.push_back(usb);
 		register_parameter(devid_name, 0.1);
 	}
 	closedir(dir);
-- =

1.7.9.2


--===============5011885425438106199==--

