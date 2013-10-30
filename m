Content-Type: multipart/mixed; boundary="===============9102289133389904408=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 07/29] report-maker: navigation & summary
Date: Wed, 30 Oct 2013 14:20:58 -0700
Message-ID: <1383168080-18233-8-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9102289133389904408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implements methods to generate navigation and summary from the report
object.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter.h |    3 +++
 src/report/report-maker.cpp   |   12 ++++++++++++
 src/report/report-maker.h     |    4 +++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 78382d8..5e5b8d7 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -27,6 +27,7 @@
 #define _REPORT_FORMATTER_H_
 =

 #include "report-maker.h"
+using namespace std;
 =

 class report_formatter
 {
@@ -68,6 +69,8 @@ public:
 	virtual void add_div(struct tag_attr *div_attr) {}
 	virtual void end_div() {}
 	virtual void add_title(struct tag_attr *att_title, const char *title) {}
+	virtual void add_navigation() {}
+	virtual void add_summary_list(string *list, int size) {}
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index ff87f1e..ccfbec4 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -368,3 +368,15 @@ report_maker::end_div()
 	formatter->end_div();
 }
 =

+void
+report_maker::add_navigation()
+{
+	formatter->add_navigation();
+}
+
+void
+report_maker::add_summary_list(string *list, int size)
+{
+	formatter->add_summary_list(list, size);
+}
+
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index 0c17635..6e5f4d1 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -73,7 +73,7 @@
 #include <stdarg.h>
 =

 #include <string>
-
+using namespace std;
 /* Conditional gettext. We need original strings for CSV. */
 #define __(STRING) \
 	((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRING))
@@ -199,6 +199,8 @@ public:
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
 	void add_title(struct tag_attr *att_title, const char *title);
+	void add_navigation();
+	void add_summary_list(string *list, int size);
 =

 private:
 	void setup_report_formatter();
-- =

1.7.9.5


--===============9102289133389904408==--

