Content-Type: multipart/mixed; boundary="===============8742453320881513188=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 12/14] add timestamp to html report
Date: Sat, 25 Oct 2014 18:33:59 +0100
Message-ID: <1414258441-30099-13-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8742453320881513188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

2.1.2


--===============8742453320881513188==--

