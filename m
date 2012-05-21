Content-Type: multipart/mixed; boundary="===============1510191157941623230=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 3/3] Remove some unused variables
Date: Mon, 21 May 2012 20:20:20 +0000
Message-ID: <1337631510.2616.2.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1510191157941623230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/calibrate/calibrate.cpp |    6 ------
 src/tuning/runtime.cpp      |    2 --
 src/tuning/tuningusb.cpp    |    2 --
 3 files changed, 10 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 7dd8a5f..cf00fcf 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -145,8 +145,6 @@ static void find_all_rfkill(void)
 	if (!dir)
 		return;
 	while (1) {
-		ifstream file;
-
 		entry =3D readdir(dir);
 =

 		if (!entry)
@@ -190,8 +188,6 @@ static void find_backlight(void)
 	if (!dir)
 		return;
 	while (1) {
-		ifstream file;
-
 		entry =3D readdir(dir);
 =

 		if (!entry)
@@ -232,8 +228,6 @@ static void find_scsi_link(void)
 	if (!dir)
 		return;
 	while (1) {
-		ifstream file;
-
 		entry =3D readdir(dir);
 =

 		if (!entry)
diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index 8f428e6..b57d53e 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -83,7 +83,6 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 =

 int runtime_tunable::good_bad(void)
 {
-	ifstream file;
 	string content;
 =

 	content =3D read_sysfs_string(runtime_path);
@@ -131,7 +130,6 @@ void add_runtime_tunables(const char *bus)
 	if (!dir)
 		return;
 	while (1) {
-		ifstream file;
 		class runtime_tunable *runtime;
 =

 		entry =3D readdir(dir);
diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index b483ce2..74bbacf 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -81,7 +81,6 @@ usb_tunable::usb_tunable(const char *path, const char *na=
me) : tunable("", 0.9,
 =

 int usb_tunable::good_bad(void)
 {
-	ifstream file;
 	string content;
 =

 	content =3D read_sysfs_string(usb_path);
@@ -127,7 +126,6 @@ void add_usb_tunables(void)
 	if (!dir)
 		return;
 	while (1) {
-		ifstream file;
 		class usb_tunable *usb;
 =

 		entry =3D readdir(dir);
-- =

1.7.10


--===============1510191157941623230==--

