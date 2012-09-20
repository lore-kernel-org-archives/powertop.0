Content-Type: multipart/mixed; boundary="===============3226749770432720948=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] report: Try /etc/lsb-release for OS information
Date: Thu, 20 Sep 2012 23:58:29 +0900
Message-ID: <1348153109-2991-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3226749770432720948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ubuntu doesn't provide /etc/{system,redhat,os}-release but
/etc/lsb-release file.  Since it's present on any LSB (Linux Standard
Base) compliant distributions, it'd better to try to read it.

To this end, change read_os_release to receive an additional argument
to find the right line - in this case it's "DISTRIB_DESCRIPTION".

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/report.cpp |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/report.cpp b/src/report.cpp
index 6776b30..085e81b 100644
--- a/src/report.cpp
+++ b/src/report.cpp
@@ -83,12 +83,11 @@ string cpu_model(void)
 	return "";
 }
 =

-static string read_os_release(const string &filename)
+static string read_os_release(const string &filename, const char *pname)
 {
 	ifstream file;
 	char content[4096];
 	char *c;
-	const char *pname =3D "PRETTY_NAME=3D";
 	string os("");
 =

 	file.open(filename.c_str(), ios::in);
@@ -160,7 +159,9 @@ static void system_info(void)
 	if (str.length() < 1)
 		str =3D read_sysfs_string("/etc/redhat-release");
 	if (str.length() < 1)
-		str =3D read_os_release("/etc/os-release");
+		str =3D read_os_release("/etc/os-release", "PRETTY_NAME=3D");
+	if (str.length() < 1)
+		str =3D read_os_release("/etc/lsb-release", "DISTRIB_DESCRIPTION=3D");
 =

 	if (reporttype) {
 		fprintf(reportout.http_report, "<tr class=3D\"system_even\"><td>OS Infor=
mation</td><td>%s</td></tr>\n",
-- =

1.7.9.2


--===============3226749770432720948==--

