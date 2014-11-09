Content-Type: multipart/mixed; boundary="===============6873929608063599181=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 12/14] add timestamp to html report
Date: Sun, 09 Nov 2014 13:14:29 +0000
Message-ID: <1415538871-11411-13-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6873929608063599181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/report/report.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/report/report.cpp b/src/report/report.cpp
index 981e984..cd3c961 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -101,6 +101,8 @@ static string read_os_release(const string &filename)
 static void system_info(void)
 {
 	string str;
+	char version_date[64];
+	time_t now =3D time(NULL);
 =

 	/* div attr css_class and css_id */
 	tag_attr div_attr;
@@ -117,7 +119,8 @@ static void system_info(void)
 	/* Set array of data in row Major order */
 	string *system_data =3D new string[sys_table.rows * sys_table.cols];
 	system_data[0]=3D__("PowerTOP Version");
-	system_data[1]=3DPOWERTOP_VERSION;
+	snprintf(version_date, sizeof(version_date), "%s ran at %s", POWERTOP_VER=
SION, ctime(&now));
+	system_data[1]=3Dversion_date;
 =

 	str =3D read_sysfs_string("/proc/version");
 	size_t  found =3D str.find(" ");
-- =

2.1.3


--===============6873929608063599181==--

