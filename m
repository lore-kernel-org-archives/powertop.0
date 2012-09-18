Content-Type: multipart/mixed; boundary="===============7508622839529034645=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 1/2] devlist: Remove an unnecessary sprintf
Date: Wed, 19 Sep 2012 00:13:17 +0900
Message-ID: <1347981198-10438-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7508622839529034645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The 'filename' is not used in the loop anymore.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/devlist.cpp |    1 -
 1 file changed, 1 deletion(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 5ec0a8b..828f47f 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -147,7 +147,6 @@ void collect_open_devices(void)
 					continue;
 				dev->pid =3D strtoull(entry->d_name, NULL, 10);
 				strncpy(dev->device, link, 251);
-				sprintf(filename, "/proc/%s/comm", entry->d_name);
 				strncpy(dev->comm, read_sysfs_string("/proc/%s/comm", entry->d_name).c=
_str(), 31);
 				target->push_back(dev);
 =

-- =

1.7.9.2


--===============7508622839529034645==--

