Content-Type: multipart/mixed; boundary="===============1111989084668408046=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 02/29] report: call powertop logo
Date: Wed, 30 Oct 2013 14:20:53 -0700
Message-ID: <1383168080-18233-3-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1111989084668408046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implements add_logo in report generator

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter.h |    5 +++++
 src/report/report-maker.cpp   |   21 +++++++++++++++++++++
 src/report/report-maker.h     |    5 +++++
 3 files changed, 31 insertions(+)

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index d532f30..449fae7 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -60,6 +60,11 @@ public:
 =

 	/* For quad-colouring CPU tables in HTML */
 	virtual void set_cpu_number(int nr) {}
+
+	/* *** Report Style *** */
+	virtual void add_logo() {}
+	virtual void add_header() {}
+	virtual void end_hheader() {}
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 59e83d9..8eba618 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -329,3 +329,24 @@ report_maker::end_paragraph()
 	paragraph_opened =3D false;
 	formatter->end_paragraph();
 }
+
+
+/* *** Report Style *** */
+void
+report_maker::add_logo()
+{
+	formatter->add_logo();
+}
+
+void
+report_maker::add_header()
+{
+	formatter->add_header();
+}
+
+void
+report_maker::end_hheader()
+{
+	formatter->end_hheader();
+}
+
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index 75e0d06..fab9589 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -192,6 +192,11 @@ public:
 =

 	void set_cpu_number(int nr);
 =

+	/* *** Report Style *** */
+	void add_header();
+	void end_hheader();
+	void add_logo();
+
 private:
 	void setup_report_formatter();
 =

-- =

1.7.9.5


--===============1111989084668408046==--

