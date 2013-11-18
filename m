Content-Type: multipart/mixed; boundary="===============5980318461758405796=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 13/31] report-html-css: html 5 and css for new
 design
Date: Mon, 18 Nov 2013 12:27:04 -0800
Message-ID: <1384806442-20294-14-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5980318461758405796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Redesign css for effective readability of html report.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/powertop.css |  216 ++++++++++++++++++++++----------------------------=
----
 1 file changed, 86 insertions(+), 130 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index ce7dbb2..19b9484 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -1,13 +1,13 @@
-<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://=
www.w3.org/TR/html4/loose.dtd\">
-<html>
+<!DOCTYPE html>
+<html lang=3D'en'>
 <head>
 <title>PowerTOP report</title>
-<meta http-equiv=3D\"content-type\" content=3D\"text/html;charset=3Dutf-8\=
">
+<meta http-equiv=3D'content-type' content=3D'text/html;charset=3Dutf-8'>
+
 <script type=3D'text/javascript'>
 =

 var powertop =3D {
  blocks: {
-  system: 'System Info',
   summary: 'Summary',
   cpuidle: 'CPU Idle',
   cpufreq: 'CPU Frequency',
@@ -76,190 +76,146 @@ var powertop =3D {
    powertop.toggle('summary');
  }
 }
-
 </script>
+
 <style type=3D'text/css'>
-table
-{
-	background-color: #F8F8F8;
-	color: black;
+/* General CSS */
+*{
+	margin:0px;
+	padding:0px;
 }
 =

-th
-{
-	text-align: right;
+#main_container{
+	width: 960px;
+	margin: 2px auto;
 }
-th.device
-{
-	text-align: left;
+
+/* Top logo & system table css */
+#main_header{
+	min-width: 960px;
+	display:block;
+}
+
+img.pwtop_logo{
+	float:left;
+	height:90px;
+	width: 400px;
 }
-th.process
+
+.sys_info
 {
+	float: left;
+	height:116px;
+	width:450px;
+	font-size: 12px;
+	display: inline;
+	position relative;
 	text-align: left;
 }
 =

-th.tunable
-{
+th{
 	text-align: left;
 }
 =

-td.package_odd
+/* CSS Main Content */
+
+.content_title
 {
-	background-color: #E0ffE0;
-	color: black;
-	text-align: right;
+	color: #296629;
+	padding:0px;
+	margin:2px;
 }
-td.package_even
-{
-	background-color: #F0ffF0;
-	color: black;
-	text-align: right;
+
+#chart_div{
+	float: left;
 }
 =

-td.core_even
+.small
 {
-	background-color: #F0ffF0;
-	color: black;
-	text-align: right;
+	font-size: 10px;
 }
 =

-td.core_odd
+table.emphasis2
 {
-	background-color: #E0E0ff;
-	color: black;
-	text-align: right;
+	font-size: 13px;
+	max-width:95%;
 }
 =

-td.cpu_even_freq
-{
-	background-color: #E2E2E2;
-	color: black;
+
+th.emph_title {
+	padding:5px;
 }
 =

-td.cpu_odd_freq
-{
-	background-color: #F4f4F4;
-	color: black;
+tr.emph1:nth-child(odd) {
+	background: #ffffff;
 }
 =

-td.cpu_even_even
-{
-	background-color: #E0E0f0;
-	color: black;
-	text-align: right;
+tr.emph1:nth-child(even) {
+	background: #ebebeb;
 }
 =

-td.cpu_even_odd
-{
-	background-color: #F0f0F0;
-	color: black;
-	text-align: right;
+tr.tune:nth-child(odd) {
+	background: #fffcfc;
 }
-td.cpu_odd_even
-{
-	background-color: #E0E0ff;
-	color: black;
-	text-align: right;
+tr.tune:nth-child(even) {
+	background: #fff0f0;
 }
 =

-td.cpu_odd_odd
-{
-	background-color: #F0ffF0;
-	color: black;
-	text-align: right;
+td.no_wrap:first-child {
+	white-space:nowrap;
 }
 =

-tr.device_odd
-{
-	background-color: #E0E0E0;
-	color: black;
+.side_by_side_left{
+	float:left;
 }
-tr.device_even
-{
-	background-color: #F0f0F0;
-	color: black;
+.side_by_side_right{
+	float:right;
 }
 =

-tr.process_odd
-{
-	background-color: #E0E0E0;
-	color: black;
+#device{
+	display: inline-block;
 }
-tr.process_even
-{
-	background-color: #F0f0F0;
-	color: black;
+.clear_block{
+	clear:both;
 }
 =

-td.device_power
-{
-	text-align: right;
+td.package{
+	background-color: #e0ddfa; /*purple*/
 }
 =

-td.process_power
-{
-	text-align: right;
+td.core{
+	background-color: #d1ddff; /*ccebff; /*blue*/
 }
 =

-td.device_util
-{
-	text-align: right;
+td.cpu{
+	background-color: #ffffeb; /* yellow */
 }
 =

-tr.tunable_odd
-{
-	background-color: #E0E0E0;
-	color: black;
-}
-tr.tunable_even
-{
-	background-color: #F0f0F0;
-	color: black;
+th.title{
+	text-align: center;
+	/*border-bottom: 1px solid #666;*/
 }
 =

-tr.tunable_odd_bad
-{
-	background-color: #FFE0E0;
-	color: black;
-}
-tr.tunable_even_bad
-{
-	background-color: #FFf0F0;
-	color: black;
-}
 =

-tr.system_odd
-{
-	background-color: #E0E0E0;
-	color: black;
-}
-tr.system_even
+li.summary_list
 {
-	background-color: #F0f0F0;
-	color: black;
+	display: inline;
+	padding: 5px;
+	background-color: #f6f6f9;
+	font-size: 12px;
 }
 =

-tr.device_odd
-{
-	background-color: #E0E0E0;
-	color: black;
-}
-tr.device_even
-{
-	background-color: #F0f0F0;
-	color: black;
-}
+
+
+/*menu css*/
 =

 body {
 	background-color: #eee; /* Background color */
-	color: #222;            /* Foreground color used for text */
+	color: #222;            /* Font color */
 	font-family: Helvetica;
 	font-size: 14px;
-	margin: 0;              /* Amount of negative space around the
-                                   outside of the body */
-	padding: 0;             /* Amount of negative space around the
-                                   inside of the body */
 }
+
 #top {
 	background-color: #ccc;
 	border-bottom: 1px solid #666;
-- =

1.7.9.5


--===============5980318461758405796==--

