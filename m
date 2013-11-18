Content-Type: multipart/mixed; boundary="===============4756864850522786393=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 17/31] report: Fixed html summary & menu colapse
 styles
Date: Mon, 18 Nov 2013 12:27:08 -0800
Message-ID: <1384806442-20294-18-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4756864850522786393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fixed summary to only show in the summary section. Also fixed page to
avoid the menu to wrap around with the logo/system info section.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/powertop.css                     |    2 +-
 src/process/do_process.cpp           |    2 +-
 src/report/report-formatter-html.cpp |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index d724ead..38daa1f 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -262,4 +262,4 @@ div.hide {
 </head>
 =

 <body onload=3D'powertop.onload();'>
-
+<div id=3D\"main_container\">
diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index df7d646..c676978 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -1010,7 +1010,7 @@ void report_summary(void)
 =

 	/* div attr css_class and css_id */
 	tag_attr div_attr;
-	init_div(&div_attr, "summary", "");
+	init_div(&div_attr, "", "summary");
 =

 =

 	/* Set table attributes, rows, and cols */
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index aeecdde..d6a8a6a 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -52,6 +52,7 @@ static const char report_html_alternative_head[] =3D
 /* ***********************************************************************=
* */
 =

 static const char report_html_footer[] =3D
+	"</div>\n"
 	"</body>\n"
 	"</html>\n";
 =

-- =

1.7.9.5


--===============4756864850522786393==--

