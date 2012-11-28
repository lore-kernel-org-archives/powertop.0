Content-Type: multipart/mixed; boundary="===============7678511131729681403=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] report: fixed crash when writing report to RO
 filesystem
Date: Wed, 28 Nov 2012 16:42:41 +0100
Message-ID: <1354117361-29155-1-git-send-email-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7678511131729681403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
---
 src/report/report.cpp | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/src/report/report.cpp b/src/report/report.cpp
index 51bc6a7..c018bb1 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -183,13 +183,16 @@ void init_report_output(char *filename_str, int itera=
tions)
 =

 void finish_report_output(void)
 {
-	fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), reporto=
ut.filename);
 	if (reporttype =3D=3D REPORT_OFF)
 		return;
 =

 	report.finish_report();
-	fputs(report.get_result(), reportout.report_file);
-	fdatasync(fileno(reportout.report_file));
-	fclose(reportout.report_file);
+	if (reportout.report_file)
+	{
+		fprintf(stderr, _("PowerTOP outputing using base filename %s\n"), report=
out.filename);
+		fputs(report.get_result(), reportout.report_file);
+		fdatasync(fileno(reportout.report_file));
+		fclose(reportout.report_file);
+	}
 	report.clear_result();
 }
-- =

1.7.11.7


--===============7678511131729681403==--

