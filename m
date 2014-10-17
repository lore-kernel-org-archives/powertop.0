Content-Type: multipart/mixed; boundary="===============2312783370005714067=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3 1/5] Properly cleaning up the display tabs
Date: Fri, 17 Oct 2014 15:58:02 -0700
Message-ID: <1413586686-28602-2-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413586686-28602-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2312783370005714067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

This patch properly cleans up the display tabs so that none of the tab
data is being leaked between refresh changes

Signed-off-by: Dan Kalowsky <daniel.kalowsky(a)intel.com>

v2: rebased atop 41c54e8; there's a bug here

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/display.cpp | 11 +++++++++++
 src/display.h   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/src/display.cpp b/src/display.cpp
index 123620a..e227e74 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -87,6 +87,17 @@ void reset_display(void)
 	resetterm();
 }
 =

+void close_display(void)
+{
+	for (unsigned int i =3D 0; i < tab_windows.size(); i++) {
+		if (tab_windows[tab_names[i]])
+			delete tab_windows[tab_names[i]];
+		tab_windows[tab_names[i]] =3D NULL;
+	}
+
+	tab_names.clear();
+}
+
 =

 WINDOW *tab_bar =3D NULL;
 WINDOW *bottom_line =3D NULL;
diff --git a/src/display.h b/src/display.h
index 9af3ec0..c3e8d61 100644
--- a/src/display.h
+++ b/src/display.h
@@ -34,6 +34,7 @@ using namespace std;
 =

 extern void init_display(void);
 extern void reset_display(void);
+extern void close_display(void);
 extern int ncurses_initialized(void);
 extern void show_tab(unsigned int tab);
 extern void show_next_tab(void);
-- =

2.1.2


--===============2312783370005714067==--

