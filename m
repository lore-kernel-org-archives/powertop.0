Content-Type: multipart/mixed; boundary="===============8231112690768065382=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso at mit.edu>
Subject: [Powertop] [PATCH] Ignore docker network interfaces
Date: Mon, 12 Feb 2018 17:57:40 -0500
Message-ID: <20180212225740.4021-1-tytso@mit.edu>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8231112690768065382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Theodore Ts'o <tytso(a)mit.edu>
---
 src/devices/network.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/devices/network.cpp b/src/devices/network.cpp
index 8087b7f..45396ee 100644
--- a/src/devices/network.cpp
+++ b/src/devices/network.cpp
@@ -351,6 +351,8 @@ static void netdev_callback(const char *d_name)
 	std::string f_name("/sys/class/net/");
 	if (strcmp(d_name, "lo") =3D=3D 0)
 		return;
+	if (strncmp(d_name, "docker", 6) =3D=3D 0)
+		return;
 =

 	f_name.append(d_name);
 =

-- =

2.16.1.72.g5be1f00a9a


--===============8231112690768065382==--

