Content-Type: multipart/mixed; boundary="===============6917084735671941546=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 09/10] backlight: decrease backlight() .ctor mem
 usage
Date: Mon, 14 Oct 2013 11:40:56 +0300
Message-ID: <1381740057-12499-10-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6917084735671941546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/devices/backlight.cpp | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index ebdebc8..73bdac9 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -41,15 +41,13 @@ using namespace std;
 =

 backlight::backlight(const char *_name, const char *path): device()
 {
-	char devname[128];
 	min_level =3D 0;
 	max_level =3D 0;
 	start_level =3D 0;
 	end_level =3D 0;
 	strncpy(sysfs_path, path, sizeof(sysfs_path));
 	register_sysfs_path(sysfs_path);
-	sprintf(devname, "backlight:%s", _name);
-	strncpy(name, devname, sizeof(name));
+	snprintf(name, sizeof(name) - 1, "backlight:%s", _name);
 	r_index =3D get_result_index(name);
 	r_index_power =3D 0;
 }
-- =

1.8.4.679.g0a1a803


--===============6917084735671941546==--

