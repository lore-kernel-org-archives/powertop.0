Content-Type: multipart/mixed; boundary="===============2776871731249117298=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 15/31] report: redesign html menu
Date: Fri, 15 Nov 2013 16:29:02 -0800
Message-ID: <1384561758-21516-16-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2776871731249117298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Changes menu design to align under logo and system Information
following dashboard design rules for readability and functionality.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/powertop.css |   57 +++++++++++++++++++++++++++-----------------------=
----
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index 19b9484..d724ead 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -44,7 +44,7 @@ var powertop =3D {
   return x;
  },
  setupbuttons: function() {
-   var t =3D document.getElementById('top');
+   var t =3D document.getElementById('main_menu');
    if (t) {
      for (var b in powertop.blocks) {
        t.appendChild(powertop.newbutton(b, powertop.blocks[b]));
@@ -216,51 +216,50 @@ body {
 	font-size: 14px;
 }
 =

-#top {
-	background-color: #ccc;
-	border-bottom: 1px solid #666;
-	color: #222;
-	display: block;
-	font-size: 20px;
+#main_menu {
+	display: inline-block;
 	font-weight: bold;
-	padding: 10px 0;
+	padding: 5px 0;
 	text-align: center;
-	text-decoration: none;
-	text-shadow: 0px 1px 1px #fff;
 	background-image: -webkit-gradient(linear, left top, left bottom,
-						from(#ccc), to(#999));
+		from(#aaa), to(#eee));
+	background: -moz-linear-gradient(top,  #aaa,  #eee);
 }
 =

 =

-#top div {
-	height: 30px;
+#main_menu div {
+	font-size: 12px;
 	font-weight: bold;
-	text-align: center;
 	color: white;
-	text-shadow: rgba(0,0,0,0.6) 0px -1px 1px;
-	line-height: 28px;
-	border-width:0px 8px 0px 8px;
 }
-#top div.nav_button {
- display: inline;
- cursor: pointer;
- padding: 0.3em 0.5em;
- margin: 0 0.2em;
+
+#main_menu div.nav_button {
+	margin: 0 0.2em;
+	display: inline;
+	cursor: pointer;
+	color: #223232;
+	font-size: 13px;
+	font-weight: bold;
+	padding: 5px;
+	text-align: center;
+	text-decoration: none;
 }
 =

 div.pressed {
-	background-color: #000000;
-	border: 1px solid #000000;
-	color: #000000;
-	border-radius: 8px;
+	border: -webkit-gradient(linear, left top, left bottom,
+		from(#b2ffb2), to(#e0ffe0));
+	border-width:0px 8px 0px 8px;
+	background: #999;
+	background-image: -webkit-gradient(linear, left top, left bottom,
+		from(#b2ffb2), to(#e0ffe0));
+	background: -moz-linear-gradient(top,  #b2ffb2,  #e0ffe0);
 }
+
 div.hide {
- display: none;
+	display: none;
 }
 </style>
 </head>
 =

 <body onload=3D'powertop.onload();'>
-<div id=3D'top'>
-</div>
 =

-- =

1.7.9.5


--===============2776871731249117298==--

