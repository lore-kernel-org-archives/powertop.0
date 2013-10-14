Content-Type: multipart/mixed; boundary="===============7359120691035410376=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 03/10] lib: introduce ui_notify_user()
Date: Mon, 14 Oct 2013 11:40:50 +0300
Message-ID: <1381740057-12499-4-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7359120691035410376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ui_notify_user(frmt, ...) prints formatted notification string at
(x:1, y:0) WINDOW position.

use fixed UI_NOTIFY_BUFF_SZ size buffer, because there seems to be
no ncurses() *print function which takes int x, int y WINDOW
coordinates and va_list.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/lib.cpp | 20 ++++++++++++++++++++
 src/lib.h   |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/src/lib.cpp b/src/lib.cpp
index f27ec2f..a8f3746 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -528,3 +528,23 @@ int write_msr(int cpu, uint64_t offset, uint64_t value)
 =

 	return retval;
 }
+
+#define UI_NOTIFY_BUFF_SZ 2048
+
+void ui_notify_user(const char *frmt, ...)
+{
+	char notify[UI_NOTIFY_BUFF_SZ];
+	va_list list;
+
+	start_color();
+	init_pair(1, COLOR_BLACK, COLOR_WHITE);
+	attron(COLOR_PAIR(1));
+	va_start(list, frmt);
+	/* there is no ncurses *print() function which takes
+	 * int x, int y and va_list, this is why we use temp
+	 * buffer */
+	vsnprintf(notify, UI_NOTIFY_BUFF_SZ - 1, frmt, list);
+	va_end(list);
+	mvprintw(1, 0, notify);
+	attroff(COLOR_PAIR(1));
+}
diff --git a/src/lib.h b/src/lib.h
index 2caf12f..adcc4a2 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -78,4 +78,6 @@ extern int read_msr(int cpu, uint64_t offset, uint64_t *v=
alue);
 extern int write_msr(int cpu, uint64_t offset, uint64_t value);
 =

 extern void align_string(char *buffer, size_t min_sz, size_t max_sz);
+
+extern void ui_notify_user(const char *frmt, ...);
 #endif
-- =

1.8.4.679.g0a1a803


--===============7359120691035410376==--

