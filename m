Content-Type: multipart/mixed; boundary="===============7640367267253726888=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 7/8] tuning ethernet: use updated
 process_directory()
Date: Thu, 19 Sep 2013 15:46:15 +0300
Message-ID: <20130919124615.GG2300@swordfish.minsk.epam.com>
In-Reply-To: 20130919123537.GA2300@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7640367267253726888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

check for `lo' d_name in ethtunable_callback()

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/tuning/ethernet.cpp | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/tuning/ethernet.cpp b/src/tuning/ethernet.cpp
index 3164b31..3d36112 100644
--- a/src/tuning/ethernet.cpp
+++ b/src/tuning/ethernet.cpp
@@ -25,6 +25,7 @@
 =

 #include "tuning.h"
 #include "tunable.h"
+#include <sys/types.h>
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -32,12 +33,8 @@
 #include <utility>
 #include <iostream>
 #include <fstream>
-#include <unistd.h>
-#include <dirent.h>
 #include <sys/socket.h>
 #include <errno.h>
-#include <sys/types.h>
-#include <dirent.h>
 #include <linux/types.h>
 #include <net/if.h>
 #include <linux/sockios.h>
@@ -146,7 +143,10 @@ const char *ethernet_tunable::toggle_script(void)
 =

 void ethtunable_callback(const char *d_name)
 {
-	class ethernet_tunable *eth =3D new(std::nothrow) class ethernet_tunable(=
d_name);
+	class ethernet_tunable *eth;
+	if (strcmp(d_name, "lo") =3D=3D 0)
+		return;
+	eth =3D new(std::nothrow) class ethernet_tunable(d_name);
 	if (eth)
 		all_tunables.push_back(eth);
 }

--===============7640367267253726888==--

