Content-Type: multipart/mixed; boundary="===============2023210278357328898=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 05/31] report-csv: title, div, logo, header
Date: Mon, 18 Nov 2013 12:26:56 -0800
Message-ID: <1384806442-20294-6-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2023210278357328898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implements csv report functionality to add title, division, header,
and logo.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp |   39 +++++++++++++++++++++++++++++++=
++++
 src/report/report-formatter-csv.h   |    8 +++++++
 2 files changed, 47 insertions(+)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index cd70d91..bd9dfd3 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -222,3 +222,42 @@ report_formatter_csv::set_cpu_number(int nr UNUSED)
 {
 	/* Do nothing */
 }
+
+/* Report Style */
+void
+report_formatter_csv::add_header()
+{
+	add_exact("\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
+}
+
+void
+report_formatter_csv::end_hheader()
+{
+	/* Do nothing */
+}
+
+void
+report_formatter_csv::add_logo()
+{
+	add_exact("\t\t\tP o w e r T o p\n");
+}
+
+
+void
+report_formatter_csv::add_div(struct tag_attr * div_attr)
+{
+	add_exact("\n");
+}
+
+void
+report_formatter_csv::end_div()
+{
+	/*Do nothing*/
+}
+
+void
+report_formatter_csv::add_title(struct tag_attr *title_att, const char *ti=
tle)
+{
+	add_exact("______________________________________________________________=
______\n");
+	addf_exact(" *  *  *   %s   *  *  *\n", title);
+}
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 8dd2976..2c1c0fd 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -71,6 +71,14 @@ public:
 =

 	void set_cpu_number(int nr);
 =

+	/* Report Style */
+	void add_logo();
+	void add_header();
+	void end_hheader();
+	void add_div(struct tag_attr *div_attr);
+	void end_div();
+	void add_title(struct tag_attr *title_att, const char *title);
+
 private:
 	void add_doc_header();
 =

-- =

1.7.9.5


--===============2023210278357328898==--

