Content-Type: multipart/mixed; boundary="===============5376198710560711561=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 2/2] runtime_pm: register parameters
Date: Wed, 19 Dec 2012 18:13:23 +0300
Message-ID: <20121219151323.GB3200@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5376198710560711561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

register parameter during runtime_pmdevice() construction, making =

call to get_parameter_value() in power_usage() valid.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/runtime_pm.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index 0d13cab..bbc3bf0 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -49,11 +49,11 @@ runtime_pmdevice::runtime_pmdevice(const char *_name, c=
onst char *path) : device
 =

 	before_suspended_time =3D 0;
 	before_active_time =3D 0;
-        after_suspended_time =3D 0;
+	after_suspended_time =3D 0;
 	after_active_time =3D 0;
-}
-
 =

+	register_parameter(humanname);
+}
 =

 void runtime_pmdevice::start_measurement(void)
 {
@@ -237,4 +237,4 @@ void create_all_runtime_pm_devices(void)
 	do_bus("spi");
 	do_bus("platform");
 	do_bus("i2c");
-}
\ No newline at end of file
+}


--===============5376198710560711561==--

