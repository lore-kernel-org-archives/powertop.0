Content-Type: multipart/mixed; boundary="===============3159403664363924959=="
MIME-Version: 1.0
From: Daniel Kahn Gillmor <dkg at fifthhorseman.net>
Subject: [Powertop] [PATCH] embed self-contained javascript
Date: Sat, 07 Sep 2013 15:49:45 -0400
Message-ID: <1378583385-32426-1-git-send-email-dkg@fifthhorseman.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3159403664363924959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

using self-contained javascript offers several improvements:

 * powertop html report can be viewed offline
 * less overall javascript code is loaded when online
 * no opportunity for report leakage or modification by third parties

These changes also make it simpler to update the html report when a
new section is added: just add a new entry to powertop.blocks
dictionary, with the section's human-readable string as its value.
---
 src/powertop.css | 400 ++++++++++-----------------------------------------=
----
 1 file changed, 72 insertions(+), 328 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index c73d3e2..35f6571 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -3,276 +3,70 @@
 <head>
 <title>PowerTOP report</title>
 <meta http-equiv=3D\"content-type\" content=3D\"text/html;charset=3Dutf-8\=
">
-<script type=3D\"text/javascript\" src=3D\"http://ajax.googleapis.com/ajax=
/libs/jquery/1.7.2/jquery.min.js\"></script>
-<script type=3D\"text/javascript\">
-$(document).ready(function(){
-
-	$('#system h2').addClass('hide');
-	$('#system table').addClass('hide');
-	$('#cpuidle h2').addClass('hide');
-	$('#cpuidle table').addClass('hide');
-	$('#cpufreq h2').addClass('hide');
-	$('#cpufreq table').addClass('hide');
-	$('#software h2').addClass('hide');
-	$('#software table').addClass('hide');
-	$('#device h2').addClass('hide');
-	$('#device table').addClass('hide');
-	$('#device p').addClass('hide');
-	$('#tuning h2').addClass('hide');
-	$('#tuning table').addClass('hide');
-
-	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSyste=
m()\">System Info</div>');
-	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSumma=
ry()\">Summary</div>');
-	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpuid=
le()\">CPU Idle</div>');
-	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpufr=
eq()\">CPU Frequency</div>');
-	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSoftw=
are()\">Software info</div>');
-	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDevic=
e()\">Device Info</div>');
-	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTunin=
g()\">Tuning</div>');
-	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll()=
\">All</div>');
-	$('#top .SummaryButton').toggleClass('pressed');
-
-    }
-	);
-function toggleDummy() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-function toggleSystem() {
-		$('#system table').toggleClass('hide', false);
-		$('#system h2').toggleClass('hide', false);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', true);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-function toggleSummary() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', false);
-		$('#summary h2').toggleClass('hide', false);
-		$('#summary p').toggleClass('hide', false);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', true);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-function toggleCpuidle() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', false);
-		$('#cpuidle h2').toggleClass('hide', false);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', true);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-
-}
-function toggleCpufreq() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', false);
-		$('#cpufreq h2').toggleClass('hide', false);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', true);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-
-function toggleSoftware() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', false);
-		$('#software h2').toggleClass('hide', false);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', true);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-
-function toggleDevice() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', false);
-		$('#device h2').toggleClass('hide', false);
-		$('#device p').toggleClass('hide', false);
-		$('#tuning table').toggleClass('hide', true);
-		$('#tuning h2').toggleClass('hide', true);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', true);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', false);
+<script type=3D'text/javascript'>
+
+var powertop =3D {
+ blocks: {
+  system: 'System Info',
+  summary: 'Summary',
+  cpuidle: 'CPU Idle',
+  cpufreq: 'CPU Frequency',
+  software: 'Software Info',
+  device: 'Device Info',
+  tuning: 'Tuning' =

+ },
+ cadd: function(idx, c){ =

+   var el =3D document.getElementById(idx);
+   if (el) el.classList.add(c);
+ },
+ crm: function(id, c){ =

+   var el =3D document.getElementById(id);
+   if (el) el.classList.remove(c);
+ },
+ newbutton: function(id, txt) {
+  var x =3D document.createElement('div');
+  x.id =3D id + '_button';
+  x.className =3D 'nav_button';
+  x.textContent =3D txt;
+  x.onclick =3D function() { powertop.toggle(id); };
+  return x;
+ },
+ setupbuttons: function() {
+   var t =3D document.getElementById('top');
+   if (t) {
+     for (var b in powertop.blocks) {
+       t.appendChild(powertop.newbutton(b, powertop.blocks[b]));
+     }
+    t.appendChild(powertop.newbutton('all', 'All'));
+   }
+ },
+ toggle: function(b) {
+   powertop.baseall();
+   if (b =3D=3D 'all') {
+      for (var c in powertop.blocks) {
+        powertop.crm(c, 'hide');
+      }
+   } else {
+      powertop.crm(b, 'hide'); =

+   }
+   powertop.cadd(b + '_button', 'pressed');
+ },
+ baseall: function() {
+   for (var b in powertop.blocks) {
+     powertop.cadd(b, 'hide');
+     powertop.crm(b + '_button', 'pressed');
+   }
+   powertop.cadd('all', 'hide');
+   powertop.crm('all_button', 'pressed');
+ },
+ onload: function() {
+   powertop.setupbuttons();
+   powertop.toggle('summary');
+ } =

 }
 =

-function toggleTuning() {
-		$('#system table').toggleClass('hide', true);
-		$('#system h2').toggleClass('hide', true);
-		$('#summary table').toggleClass('hide', true);
-		$('#summary h2').toggleClass('hide', true);
-		$('#summary p').toggleClass('hide', true);
-		$('#cpuidle table').toggleClass('hide', true);
-		$('#cpuidle h2').toggleClass('hide', true);
-		$('#cpufreq table').toggleClass('hide', true);
-		$('#cpufreq h2').toggleClass('hide', true);
-		$('#software table').toggleClass('hide', true);
-		$('#software h2').toggleClass('hide', true);
-		$('#device table').toggleClass('hide', true);
-		$('#device h2').toggleClass('hide', true);
-		$('#device p').toggleClass('hide', true);
-		$('#tuning table').toggleClass('hide', false);
-		$('#tuning h2').toggleClass('hide', false);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', true);
-		$('#top .AllButton').toggleClass('pressed', false);
-}
-function toggleAll() {
-		$('#system table').toggleClass('hide', false);
-		$('#system h2').toggleClass('hide', false);
-		$('#summary table').toggleClass('hide', false);
-		$('#summary h2').toggleClass('hide', false);
-		$('#summary p').toggleClass('hide', false);
-		$('#cpuidle table').toggleClass('hide', false);
-		$('#cpuidle h2').toggleClass('hide', false);
-		$('#cpufreq table').toggleClass('hide', false);
-		$('#cpufreq h2').toggleClass('hide', false);
-		$('#software table').toggleClass('hide', false);
-		$('#software h2').toggleClass('hide', false);
-		$('#device table').toggleClass('hide', false);
-		$('#device h2').toggleClass('hide', false);
-		$('#device p').toggleClass('hide', false);
-		$('#tuning table').toggleClass('hide', false);
-		$('#tuning h2').toggleClass('hide', false);
-		$('#top .SystemButton').toggleClass('pressed', false);
-		$('#top .SummaryButton').toggleClass('pressed', false);
-		$('#top .CpuidleButton').toggleClass('pressed', false);
-		$('#top .CpufreqButton').toggleClass('pressed', false);
-		$('#top .SoftwareButton').toggleClass('pressed', false);
-		$('#top .DeviceButton').toggleClass('pressed', false);
-		$('#top .TuningButton').toggleClass('pressed', false);
-		$('#top .AllButton').toggleClass('pressed', true);
-}
 </script>
-<style type=3D\"text/css\">
+<style type=3D'text/css'>
 table
 {
 	background-color: #F8F8F8;
@@ -454,11 +248,7 @@ body {
 	padding: 0;             /* Amount of negative space around the
                                    inside of the body */
 }
-#top h1 {
-	margin: 0;
-	padding: 0;
-}
-#top h1 a {
+#top {
 	background-color: #ccc;
 	border-bottom: 1px solid #666;
 	color: #222;
@@ -483,72 +273,26 @@ body {
 	line-height: 28px;
 	border-width:0px 8px 0px 8px;
 }
-#top div.SystemButton {
-	position: absolute;
-	top: 7px;
-	left: 6px;
-}
-#top div.SummaryButton {
-	position: absolute;
-	top: 7px;
-	left: 160px;
-}
-#top div.CpuidleButton {
-	position: absolute;
-	top: 7px;
-	left: 320px;
-}
-#top div.CpufreqButton {
-	position: absolute;
-	top: 7px;
-	left: 480px;
-}
-#top div.SoftwareButton {
-	position: absolute;
-	top: 7px;
-	left: 640px;
-}
-#top div.DeviceButton {
-	position: absolute;
-	top: 7px;
-	left: 800px;
-}
-#top div.TuningButton {
-	position: absolute;
-	top: 7px;
-	left: 960px;
-}
-#top div.AllButton {
-	position: absolute;
-	top: 7px;
-	left: 1120px;
+#top div.nav_button {
+ display: inline;
+ cursor: pointer;
+ padding: 0.3em 0.5em;
+ margin: 0 0.2em;
 }
+
 div.pressed {
 	background-color: #000000;
 	border: 1px solid #000000;
 	color: #000000;
-	display: block;
-	border-width:0px 8px 0px 8px;
-	-webkit-border-top-left-radius: 8px;
-	-webkit-border-top-right-radius: 8px;
-	-webkit-border-bottom-left-radius: 8px;
-	-webkit-border-bottom-right-radius: 8px;
-}
-table.hide {
-	display: none;
+	border-radius: 8px;
 }
-h2.hide {
-	display: none;
-}
-p.hide {
-	display: none
+div.hide {
+ display: none;
 }
 </style>
 </head>
 =

-<body>
-
+<body onload=3D'powertop.onload();'>
 <div id=3D'top'>
-<h1><a href=3D'#top'>&nbsp;</a></h1>
 </div>
 =

-- =

1.8.4.rc3


--===============3159403664363924959==--

