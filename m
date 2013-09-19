Content-Type: multipart/mixed; boundary="===============7208512317458259260=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 4/8] network: use updated process_directory()
Date: Thu, 19 Sep 2013 15:50:11 +0300
Message-ID: <20130919125011.GI2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7208512317458259260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

check for passed `lo' d_name

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/devices/network.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index 3b67610..d0827ef 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -30,7 +30,6 @@
 =

 #include <stdio.h>
 #include <sys/types.h>
-#include <dirent.h>
 #include <libgen.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -344,11 +343,13 @@ const char * network::device_name(void)
 	return name;
 }
 =

-void netdev_callback(const char *d_name)
+static void netdev_callback(const char *d_name)
 {
 	std::string f_name("/sys/class/net/");
-	f_name.append(d_name);
+	if (strcmp(d_name, "lo") =3D=3D 0)
+		return;
 =

+	f_name.append(d_name);
 	network *bl =3D new(std::nothrow) class network(d_name, f_name.c_str());
 	if (bl) {
 		all_devices.push_back(bl);
@@ -356,7 +357,6 @@ void netdev_callback(const char *d_name)
 	}
 }
 =

-
 void create_all_nics(callback fn)
 {
 	if (!fn)

--===============7208512317458259260==--

