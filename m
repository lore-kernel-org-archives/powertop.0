Content-Type: multipart/mixed; boundary="===============4364344252163045805=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 03/31] html-report: add title and div tags
Date: Fri, 15 Nov 2013 16:28:50 -0800
Message-ID: <1384561758-21516-4-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4364344252163045805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implements add_title and add_div methods that pass css attributes for
modular styling.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-data-html.h        |    4 ++++
 src/report/report-formatter-html.cpp |   33 ++++++++++++++++++++++++++++++=
+++
 src/report/report-formatter-html.h   |    5 ++++-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 src/report/report-data-html.h

diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
new file mode 100644
index 0000000..70ccbdb
--- /dev/null
+++ b/src/report/report-data-html.h
@@ -0,0 +1,4 @@
+struct tag_attr {
+	const char *css_class;
+	const char *css_id;
+};
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index 79a0c35..db21c8c 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -464,6 +464,8 @@ report_formatter_html::set_cpu_number(int nr)
 	cpu_nr =3D nr;
 }
 =

+
+/* Report Style */
 void
 report_formatter_html::add_logo()
 {
@@ -481,3 +483,34 @@ report_formatter_html::end_hheader()
 {
 	add_exact("</header>\n\n");
 }
+void
+report_formatter_html::add_div(struct tag_attr * div_attr)
+{
+	std::string empty=3D"";
+	std::string tmp_str;
+
+	if (div_attr->css_class =3D=3D empty && div_attr->css_id =3D=3D empty)
+	add_exact("<div>\n");
+
+	else if (div_attr->css_class =3D=3D empty && div_attr->css_id !=3D empty)
+	addf_exact("<div id=3D\"%s\">\n", div_attr->css_id);
+
+	else if (div_attr->css_class !=3D empty && div_attr->css_id =3D=3D empty)
+	addf_exact("<div class=3D\"%s\">\n", div_attr->css_class);
+
+	else if (div_attr->css_class !=3D empty && div_attr->css_id !=3D empty)
+	addf_exact("<div class=3D\"%s\" id=3D\"%s\">\n", div_attr->css_class, div=
_attr->css_id);
+}
+
+void
+report_formatter_html::end_div()
+{
+	add_exact("</div>\n");
+}
+
+void
+report_formatter_html::add_title(struct tag_attr *title_att, const char *t=
itle)
+{
+	addf_exact("<h2 class=3D\"%s\"> %s </h2>\n", title_att->css_class, title);
+}
+
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 1ade760..0f508d3 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -29,7 +29,7 @@
 #include <string>
 =

 #include "report-formatter-base.h"
-
+#include "report-data-html.h"
 /* Whether to replace " and ' in HTML by &quot; and &apos; respectively */
 /*#define REPORT_HTML_ESCAPE_QUOTES*/
 =

@@ -86,6 +86,9 @@ public:
 	void add_logo();
 	void add_header();
 	void end_hheader();
+	void add_div(struct tag_attr *div_attr);
+	void end_div();
+	void add_title(struct tag_attr *title_att, const char *title);
 =

 private:
 	/* Document structure related functions */
-- =

1.7.9.5


--===============4364344252163045805==--

