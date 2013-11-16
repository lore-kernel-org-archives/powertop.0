Content-Type: multipart/mixed; boundary="===============6582306074380754088=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 06/31] report-html: summary list and navigation
Date: Fri, 15 Nov 2013 16:28:53 -0800
Message-ID: <1384561758-21516-7-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6582306074380754088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generates the html tags to add navigation and summary including css
attribute support.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-html.cpp |   18 ++++++++++++++++++
 src/report/report-formatter-html.h   |    2 ++
 2 files changed, 20 insertions(+)

diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index db21c8c..8038181 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -514,3 +514,21 @@ report_formatter_html::add_title(struct tag_attr *titl=
e_att, const char *title)
 	addf_exact("<h2 class=3D\"%s\"> %s </h2>\n", title_att->css_class, title);
 }
 =

+void
+report_formatter_html::add_navigation()
+{
+	add_exact("<br/><nav id=3D\"main_menu\"> </nav>\n");
+}
+
+void
+report_formatter_html::add_summary_list(std::string *list, int size)
+{
+	int i;
+	add_exact("<div><br/> <ul>\n");
+	for (i=3D0; i < size; i+=3D2){
+		addf_exact("<li class=3D\"summary_list\"> <b> %s </b> %s </li>",
+				list[i].c_str(), list[i+1].c_str());
+	}
+	add_exact("</ul> </div> <br />\n");
+}
+
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 0f508d3..261e0dd 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -89,6 +89,8 @@ public:
 	void add_div(struct tag_attr *div_attr);
 	void end_div();
 	void add_title(struct tag_attr *title_att, const char *title);
+	void add_navigation();
+	void add_summary_list(std::string *list, int size);
 =

 private:
 	/* Document structure related functions */
-- =

1.7.9.5


--===============6582306074380754088==--

