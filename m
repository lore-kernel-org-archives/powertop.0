Content-Type: multipart/mixed; boundary="===============3326473375172835211=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Remove unneded escaping backslashes from CSS
Date: Fri, 14 Sep 2012 13:46:52 +0400
Message-ID: <1347616012-26879-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3326473375172835211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove unneded escaping backslashes from CSS.
---
 src/powertop.css |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index 087e384..5d303dc 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -21,14 +21,14 @@ $(document).ready(function(){
 	$('#tuning h2').addClass('hide');
 	$('#tuning table').addClass('hide');
 =

-	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSyste=
m()\">System Info<\\/div>');
-	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSumma=
ry()\">Summary<\\/div>');
-	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpuid=
le()\">CPU Idle<\\/div>');
-	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpufr=
eq()\">CPU Frequency<\\/div>');
-	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSoftw=
are()\">Software info<\\/div>');
-	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDevic=
e()\">Device Info<\\/div>');
-	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTunin=
g()\">Tuning<\\/div>');
-	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll()=
\">All<\\/div>');
+	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSyste=
m()\">System Info</div>');
+	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSumma=
ry()\">Summary</div>');
+	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCpuid=
le()\">CPU Idle</div>');
+	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCpufr=
eq()\">CPU Frequency</div>');
+	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSoftw=
are()\">Software info</div>');
+	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDevic=
e()\">Device Info</div>');
+	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTunin=
g()\">Tuning</div>');
+	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAll()=
\">All</div>');
 	$('#top .SummaryButton').toggleClass('pressed');
 =

     }
-- =

1.7.5.4


--===============3326473375172835211==--

