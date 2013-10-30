Content-Type: multipart/mixed; boundary="===============7496923047868992138=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 28/29] report: logo size & menu compatibility
Date: Wed, 30 Oct 2013 14:21:19 -0700
Message-ID: <1383168080-18233-29-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7496923047868992138==
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
index 0c0f75b..1792d6b 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -96,8 +96,9 @@ body {
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
index 210a354..e18b543 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -518,7 +518,7 @@ report_formatter_html::add_title(struct tag_attr *title=
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


--===============7496923047868992138==--

