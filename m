Content-Type: multipart/mixed; boundary="===============3508278191207045989=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 04/10] tuning: print executed toggle script
Date: Mon, 14 Oct 2013 11:40:51 +0300
Message-ID: <1381740057-12499-5-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3508278191207045989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

report executed toggle_script back to user via ui_notify_user().

Example:
 >> 'auto' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';
 >> echo 'on' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/tuning/tuning.cpp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index ff3d715..3d13cc3 100644
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
+	ui_notify_user(">> %s\n", toggle_script);
 }
 =

 static bool tunables_sort(class tunable * i, class tunable * j)
-- =

1.8.4.679.g0a1a803


--===============3508278191207045989==--

