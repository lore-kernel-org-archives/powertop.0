Content-Type: multipart/mixed; boundary="===============6159900746028594364=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 15/15] allow none-ncurses messaging with
 ui_notify_user()
Date: Sun, 07 Sep 2014 22:27:18 +0100
Message-ID: <1410125238-29600-16-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6159900746028594364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The ui_notify_user() is made to be a function pointer, and depending on
need it will either send messages using ncurses functions or simply print
to console.  At the moment the ui_notify_user_console() is not reachable,
but that might change in future.

Proposed-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/lib.cpp  | 11 ++++++++++-
 src/lib.h    |  4 +++-
 src/main.cpp |  4 +++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index b482296..cce7973 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -531,7 +531,7 @@ int write_msr(int cpu, uint64_t offset, uint64_t value)
 =

 #define UI_NOTIFY_BUFF_SZ 2048
 =

-void ui_notify_user(const char *frmt, ...)
+void ui_notify_user_ncurses(const char *frmt, ...)
 {
 	char notify[UI_NOTIFY_BUFF_SZ];
 	va_list list;
@@ -548,3 +548,12 @@ void ui_notify_user(const char *frmt, ...)
 	mvprintw(1, 0, notify);
 	attroff(COLOR_PAIR(1));
 }
+
+void ui_notify_user_console(const char *frmt, ...)
+{
+	va_list list;
+
+	va_start(list, frmt);
+	vprintf(frmt, list);
+	va_end(list);
+}
diff --git a/src/lib.h b/src/lib.h
index 1d9fa8a..ec50946 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -83,5 +83,7 @@ extern int write_msr(int cpu, uint64_t offset, uint64_t v=
alue);
 =

 extern void align_string(char *buffer, size_t min_sz, size_t max_sz);
 =

-extern void ui_notify_user(const char *frmt, ...);
+extern void ui_notify_user_ncurses(const char *frmt, ...);
+extern void ui_notify_user_console(const char *frmt, ...);
+extern void (*ui_notify_user) (const char *frmt, ...);
 #endif
diff --git a/src/main.cpp b/src/main.cpp
index 0ae0b87..d3963ed 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -68,6 +68,7 @@
 int debug_learning =3D 0;
 unsigned time_out =3D 20;
 int leave_powertop =3D 0;
+void (*ui_notify_user) (const char *frmt, ...);
 =

 enum {
 	OPT_AUTO_TUNE =3D CHAR_MAX + 1,
@@ -384,7 +385,7 @@ int main(int argc, char **argv)
 	bindtextdomain (PACKAGE, LOCALEDIR);
 	textdomain (PACKAGE);
 #endif
-
+	ui_notify_user =3D ui_notify_user_ncurses;
 	while (1) { /* parse commandline options */
 		c =3D getopt_long(argc, argv, "cC:r:i:qt:w:Vh", long_options, &option_in=
dex);
 		/* Detect the end of the options. */
@@ -394,6 +395,7 @@ int main(int argc, char **argv)
 		case OPT_AUTO_TUNE:
 			auto_tune =3D 1;
 			leave_powertop =3D 1;
+			ui_notify_user =3D ui_notify_user_console;
 			break;
 		case 'c':
 			powertop_init();
-- =

2.1.0


--===============6159900746028594364==--

