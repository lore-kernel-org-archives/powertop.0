Content-Type: multipart/mixed; boundary="===============5089678162094078222=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 3/4 v1] tuning: use tunable_state enum instead of
 defines
Date: Fri, 08 Sep 2017 15:36:50 -0700
Message-ID: <20170908223651.27979-4-joe.konno@linux.intel.com>
In-Reply-To: 20170908223651.27979-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5089678162094078222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/tuning/bluetooth.cpp   |  6 +++---
 src/tuning/bluetooth.h     |  2 +-
 src/tuning/ethernet.cpp    |  4 ++--
 src/tuning/ethernet.h      |  2 +-
 src/tuning/runtime.cpp     |  2 +-
 src/tuning/runtime.h       |  2 +-
 src/tuning/tunable.h       | 14 ++++++++------
 src/tuning/tuningi2c.cpp   |  2 +-
 src/tuning/tuningi2c.h     |  2 +-
 src/tuning/tuningsysfs.cpp |  2 +-
 src/tuning/tuningsysfs.h   |  2 +-
 src/tuning/tuningusb.cpp   |  2 +-
 src/tuning/tuningusb.h     |  2 +-
 src/tuning/wifi.cpp        |  2 +-
 src/tuning/wifi.h          |  2 +-
 15 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp
index 295884952986..2e3d1ff6a013 100644
--- a/src/tuning/bluetooth.cpp
+++ b/src/tuning/bluetooth.cpp
@@ -103,16 +103,16 @@ struct hci_dev_info {
 =

 static int previous_bytes =3D -1;
 static time_t last_check_time =3D 0;
-static int last_check_result;
+static tunable_state last_check_result;
 =

-int bt_tunable::good_bad(void)
+tunable_state bt_tunable::good_bad(void)
 {
 	struct hci_dev_info devinfo;
 	FILE *file =3D 0;
 	int fd;
 	int thisbytes =3D 0;
 	int ret;
-	int result =3D TUNE_GOOD;
+	tunable_state result =3D TUNE_GOOD;
 =

 	fd =3D socket(AF_BLUETOOTH, SOCK_RAW, BTPROTO_HCI);
 	if (fd < 0)
diff --git a/src/tuning/bluetooth.h b/src/tuning/bluetooth.h
index ecb667d5da13..dd9a627c584e 100644
--- a/src/tuning/bluetooth.h
+++ b/src/tuning/bluetooth.h
@@ -35,7 +35,7 @@ class bt_tunable : public tunable {
 public:
 	bt_tunable(void);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/ethernet.cpp b/src/tuning/ethernet.cpp
index 5b128d1d98d6..2613848ed413 100644
--- a/src/tuning/ethernet.cpp
+++ b/src/tuning/ethernet.cpp
@@ -57,13 +57,13 @@ ethernet_tunable::ethernet_tunable(const char *iface) :=
 tunable("", 0.3, _("Good
 }
 =

 =

-int ethernet_tunable::good_bad(void)
+tunable_state ethernet_tunable::good_bad(void)
 {
 	int sock;
 	struct ifreq ifr;
 	struct ethtool_wolinfo wol;
 	int ret;
-	int result =3D TUNE_GOOD;
+	tunable_state result =3D TUNE_GOOD;
 =

 	memset(&ifr, 0, sizeof(struct ifreq));
 =

diff --git a/src/tuning/ethernet.h b/src/tuning/ethernet.h
index 85810fbaae91..f72987bab4ae 100644
--- a/src/tuning/ethernet.h
+++ b/src/tuning/ethernet.h
@@ -36,7 +36,7 @@ public:
 	char interf[4096];
 	ethernet_tunable(const char *iface);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/runtime.cpp b/src/tuning/runtime.cpp
index 9b6abeda0970..78a246197ddd 100644
--- a/src/tuning/runtime.cpp
+++ b/src/tuning/runtime.cpp
@@ -82,7 +82,7 @@ runtime_tunable::runtime_tunable(const char *path, const =
char *bus, const char *
 	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", runtime_pat=
h);
 }
 =

-int runtime_tunable::good_bad(void)
+tunable_state runtime_tunable::good_bad(void)
 {
 	string content;
 =

diff --git a/src/tuning/runtime.h b/src/tuning/runtime.h
index b292a0fabff3..5a29defe31f7 100644
--- a/src/tuning/runtime.h
+++ b/src/tuning/runtime.h
@@ -36,7 +36,7 @@ class runtime_tunable : public tunable {
 public:
 	runtime_tunable(const char *runtime_path, const char *bus, const char *de=
v);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/tunable.h b/src/tuning/tunable.h
index 3372378ea8ba..5ea7cdfb5389 100644
--- a/src/tuning/tunable.h
+++ b/src/tuning/tunable.h
@@ -31,11 +31,13 @@
 =

 using namespace std;
 =

-#define TUNE_GOOD    1
-#define TUNE_BAD     -1
-#define TUNE_UNFIXABLE -2
-#define TUNE_UNKNOWN 0
-#define TUNE_NEUTRAL 0
+enum tunable_state {
+	TUNE_GOOD,
+	TUNE_BAD,
+	TUNE_UNFIXABLE,
+	TUNE_NEUTRAL,
+	TUNE_UNKNOWN
+};
 =

 class tunable {
 =

@@ -53,7 +55,7 @@ public:
 	tunable(const char *str, double _score, const char *good =3D "", const ch=
ar *bad =3D "", const char *neutral =3D"");
 	virtual ~tunable() {};
 =

-	virtual int good_bad(void) { return TUNE_NEUTRAL; }
+	virtual tunable_state good_bad(void) { return TUNE_NEUTRAL; }
 =

 	virtual char *result_string(void)
 	{
diff --git a/src/tuning/tuningi2c.cpp b/src/tuning/tuningi2c.cpp
index b75e8119137d..1a2859897831 100644
--- a/src/tuning/tuningi2c.cpp
+++ b/src/tuning/tuningi2c.cpp
@@ -62,7 +62,7 @@ i2c_tunable::i2c_tunable(const char *path, const char *na=
me, bool is_adapter) :
 	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", i2c_path);
 }
 =

-int i2c_tunable::good_bad(void)
+tunable_state i2c_tunable::good_bad(void)
 {
 	string content;
 =

diff --git a/src/tuning/tuningi2c.h b/src/tuning/tuningi2c.h
index 8fd87845f325..86827215ff76 100644
--- a/src/tuning/tuningi2c.h
+++ b/src/tuning/tuningi2c.h
@@ -32,7 +32,7 @@ class i2c_tunable : public tunable {
 public:
 	i2c_tunable(const char *path, const char *name, bool is_adapter);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
index 954f52e4d81b..3aaa948d6553 100644
--- a/src/tuning/tuningsysfs.cpp
+++ b/src/tuning/tuningsysfs.cpp
@@ -51,7 +51,7 @@ sysfs_tunable::sysfs_tunable(const char *str, const char =
*_sysfs_path, const cha
 	snprintf(toggle_bad, sizeof(toggle_bad), "echo '%s' > '%s';", bad_value, =
sysfs_path);
 }
 =

-int sysfs_tunable::good_bad(void)
+tunable_state sysfs_tunable::good_bad(void)
 {
 	char current_value[4096], *c;
 	ifstream file;
diff --git a/src/tuning/tuningsysfs.h b/src/tuning/tuningsysfs.h
index 57b9de725c02..f32f8ec8e1c4 100644
--- a/src/tuning/tuningsysfs.h
+++ b/src/tuning/tuningsysfs.h
@@ -39,7 +39,7 @@ class sysfs_tunable : public tunable {
 public:
 	sysfs_tunable(const char *str, const char *sysfs_path, const char *target=
_content);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/tuningusb.cpp b/src/tuning/tuningusb.cpp
index 3b7b2b165596..8a65eb67c8ea 100644
--- a/src/tuning/tuningusb.cpp
+++ b/src/tuning/tuningusb.cpp
@@ -78,7 +78,7 @@ usb_tunable::usb_tunable(const char *path, const char *na=
me) : tunable("", 0.9,
 	snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", usb_path);
 }
 =

-int usb_tunable::good_bad(void)
+tunable_state usb_tunable::good_bad(void)
 {
 	string content;
 =

diff --git a/src/tuning/tuningusb.h b/src/tuning/tuningusb.h
index 4e27e3abd5d7..5023f9b4cf1a 100644
--- a/src/tuning/tuningusb.h
+++ b/src/tuning/tuningusb.h
@@ -37,7 +37,7 @@ class usb_tunable : public tunable {
 public:
 	usb_tunable(const char *usb_path, const char *path);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

diff --git a/src/tuning/wifi.cpp b/src/tuning/wifi.cpp
index f7a91ec36834..f957d376c940 100644
--- a/src/tuning/wifi.cpp
+++ b/src/tuning/wifi.cpp
@@ -51,7 +51,7 @@ wifi_tunable::wifi_tunable(const char *_iface) : tunable(=
"", 1.5, _("Good"), _("
 	snprintf(toggle_bad, sizeof(toggle_bad), "iw dev %s set power_save off", =
iface);
 }
 =

-int wifi_tunable::good_bad(void)
+tunable_state wifi_tunable::good_bad(void)
 {
 	if (get_wifi_power_saving(iface))
 		return TUNE_GOOD;
diff --git a/src/tuning/wifi.h b/src/tuning/wifi.h
index 50ca68c9e3ae..424fdf610f94 100644
--- a/src/tuning/wifi.h
+++ b/src/tuning/wifi.h
@@ -36,7 +36,7 @@ class wifi_tunable : public tunable {
 public:
 	wifi_tunable(const char *_iface);
 =

-	virtual int good_bad(void);
+	virtual tunable_state good_bad(void);
 =

 	virtual void toggle(void);
 =

-- =

2.13.5


--===============5089678162094078222==--

