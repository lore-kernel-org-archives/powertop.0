Content-Type: multipart/mixed; boundary="===============8092377173872492410=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Fix backlight usage reporting when backlight
 control is not supported
Date: Mon, 13 Aug 2012 20:49:09 +0400
Message-ID: <1344876549-13923-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8092377173872492410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On PC file /sys/class/backlight/.../max_brightness can contain 0
when backlight control is not supported. Added check helps to avoid
dividing by zero and printing NaN.
---
 src/devices/backlight.cpp |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
index b8c9147..82cb1e0 100644
--- a/src/devices/backlight.cpp
+++ b/src/devices/backlight.cpp
@@ -145,6 +145,9 @@ double backlight::utilization(void)
 {
 	double p;
 =

+	if (max_level =3D=3D 0)
+		return 0.0;
+
 	p =3D 100.0 * (end_level + start_level) / 2 / max_level;
 	return p;
 }
-- =

1.7.5.4


--===============8092377173872492410==--

