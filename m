Content-Type: multipart/mixed; boundary="===============7910444006784645114=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 04/31] report: report maker add title and div
Date: Fri, 15 Nov 2013 16:28:51 -0800
Message-ID: <1384561758-21516-5-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7910444006784645114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Calls to add a title and add a division from report maker using report
object to the generated report.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter.h |    3 +++
 src/report/report-maker.cpp   |   18 ++++++++++++++++++
 src/report/report-maker.h     |    3 +++
 3 files changed, 24 insertions(+)

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 449fae7..78382d8 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -65,6 +65,9 @@ public:
 	virtual void add_logo() {}
 	virtual void add_header() {}
 	virtual void end_hheader() {}
+	virtual void add_div(struct tag_attr *div_attr) {}
+	virtual void end_div() {}
+	virtual void add_title(struct tag_attr *att_title, const char *title) {}
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 8eba618..ff87f1e 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -350,3 +350,21 @@ report_maker::end_hheader()
 	formatter->end_hheader();
 }
 =

+void
+report_maker::add_title(struct tag_attr *att_title, const char *title)
+{
+	formatter->add_title(att_title, title);
+}
+
+void
+report_maker::add_div(struct tag_attr * div_attr)
+{
+	formatter->add_div(div_attr);
+}
+
+void
+report_maker::end_div()
+{
+	formatter->end_div();
+}
+
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index fab9589..0c17635 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -196,6 +196,9 @@ public:
 	void add_header();
 	void end_hheader();
 	void add_logo();
+	void add_div(struct tag_attr *div_attr);
+	void end_div();
+	void add_title(struct tag_attr *att_title, const char *title);
 =

 private:
 	void setup_report_formatter();
-- =

1.7.9.5


--===============7910444006784645114==--

