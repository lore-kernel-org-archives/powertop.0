Content-Type: multipart/mixed; boundary="===============1302807682118965011=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3 3/5] Remove another memory leak
Date: Fri, 17 Oct 2014 15:58:04 -0700
Message-ID: <1413586686-28602-4-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413586686-28602-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1302807682118965011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

Pointer gets over written without ever being properly cleaned up.  This
should solve that problem.

v2: rebased atop 41c54e8, do not delete window in clear_tunables() to
prevent double-free in close_display().

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/tuning/tuning.cpp | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 7d64cad..5414022 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -46,6 +46,8 @@
 static void sort_tunables(void);
 static bool should_clear =3D false;
 =

+class tuning_window *tune_window;
+
 class tuning_window: public tab_window {
 public:
 	virtual void repaint(void);
@@ -80,6 +82,11 @@ void initialize_tuning(void)
 	init_tuning();
 =

 	w->cursor_max =3D all_tunables.size() - 1;
+
+	if (tune_window)
+		delete tune_window;
+
+	tune_window =3D w;
 }
 =

 =

-- =

2.1.2


--===============1302807682118965011==--

