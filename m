Content-Type: multipart/mixed; boundary="===============4761075344343323050=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Add support to store boardname in /data directory
Date: Wed, 18 Jul 2012 18:53:24 +0400
Message-ID: <1342623204-30480-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4761075344343323050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add support to store boardname in /data directory.
This patch is based on Linaro's changes.
---
 src/main.cpp |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 7a1b976..8a68533 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -240,12 +240,19 @@ static void load_board_params()
 	string boardname;
 	char filename[4096];
 =

-	boardname =3D read_sysfs_string("/etc/boardname");
+	if (access("/etc/boardname", R_OK) =3D=3D 0) {
+		boardname =3D read_sysfs_string("/etc/boardname");
 =

-	if (boardname.length() < 2)
-		return;
+		if (boardname.length() < 2)
+			return;
 =

-	sprintf(filename, "/var/cache/powertop/saved_parameters.powertop.%s", boa=
rdname.c_str());
+		sprintf(filename,
+			"/var/cache/powertop/saved_parameters.powertop.%s",
+			boardname.c_str());
+	} else if (access("/data", R_OK) =3D=3D 0)
+		sprintf(filename,"saved_parameters.powertop");
+	else
+		return;
 =

 	if (access(filename, R_OK))
 		return;
-- =

1.7.5.4


--===============4761075344343323050==--

