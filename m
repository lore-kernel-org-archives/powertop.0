Content-Type: multipart/mixed; boundary="===============3888676630757797820=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 28/31] report: logo size & menu compatibility
Date: Mon, 18 Nov 2013 12:27:19 -0800
Message-ID: <1384806442-20294-29-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3888676630757797820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fixed css on logo to show image in real size.  Additionaly changed the
tags in navigation from nav to div to enable compatibility with the new
navigation menu and IE.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/powertop.css                     |    5 +++--
 src/report/report-formatter-html.cpp |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index ff86880..847f25f 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -105,8 +105,9 @@ body {
 =

 img.pwtop_logo{
 	float:left;
-	height:90px;
-	width: 400px;
+	height:40%;
+	width: 40%;
+	padding:20px;
 }
 =

 .sys_info
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index d6a8a6a..f52408b 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -520,7 +520,7 @@ report_formatter_html::add_title(struct tag_attr *title=
_att, const char *title)
 void
 report_formatter_html::add_navigation()
 {
-	add_exact("<br/><nav id=3D\"main_menu\"> </nav>\n");
+	add_exact("<br/><div id=3D\"main_menu\"> </div>\n");
 }
 =

 void
-- =

1.7.9.5


--===============3888676630757797820==--

