Content-Type: multipart/mixed; boundary="===============8530123777020253420=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 4/8] Mark pretty_print_init as initialized
Date: Tue, 14 Oct 2014 11:09:15 -0700
Message-ID: <1413310159-30577-5-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413310159-30577-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8530123777020253420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

There is a check for it, but it's never actually set.  Now it's set.

v2: rebased atop 41c54e8

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/lib.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/lib.cpp b/src/lib.cpp
index cce7973..437803b 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -408,6 +408,8 @@ static void init_pretty_print(void)
 	pretty_prints["[12] i8042"] =3D _("PS/2 Touchpad / Keyboard / Mouse");
 	pretty_prints["ahci"] =3D _("SATA controller");
 	pretty_prints["usb-device-8087-0020"] =3D _("Intel built in USB hub");
+
+	pretty_print_init =3D 1;
 }
 =

 =

-- =

2.1.2


--===============8530123777020253420==--

