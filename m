Content-Type: multipart/mixed; boundary="===============0868928428805796376=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 2/2] tuning: print executed toggle script
Date: Wed, 09 Oct 2013 16:17:34 +0300
Message-ID: <20131009131734.GB2305@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0868928428805796376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

report executed toggle_script back to user via ui_notify_user().

Example:
 Execute: echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';
 Execute: echo 'on' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---
 src/tuning/tuning.cpp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index ff3d715..5adcbfe 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -141,11 +141,15 @@ void tuning_window::repaint(void)
 void tuning_window::cursor_enter(void)
 {
 	class tunable *tun;
-
+	const char *toggle_script;
 	tun =3D all_tunables[cursor_pos];
 	if (!tun)
 		return;
+	/** device will change its state so need to store toggle script before
+	 * we toggle()*/
+	toggle_script =3D tun->toggle_script();
 	tun->toggle();
+	ui_notify_user("Execute: %s\n", toggle_script);
 }
 =

 static bool tunables_sort(class tunable * i, class tunable * j)


--===============0868928428805796376==--

