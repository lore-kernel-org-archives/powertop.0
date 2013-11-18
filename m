Content-Type: multipart/mixed; boundary="===============1659169658021830187=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 22/31] report: cleanup csv title and unused vars
Date: Mon, 18 Nov 2013 12:27:13 -0800
Message-ID: <1384806442-20294-23-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1659169658021830187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Removed old csv headder to avoid redundancy. Removed unused variables
from report.cpp str2 and str3.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp |    2 +-
 src/report/report.cpp               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index facdd4d..0ab1091 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -57,7 +57,7 @@ report_formatter_csv::finish_report()
 void
 report_formatter_csv::add_doc_header()
 {
-	add_header(report_csv_header, 1);
+	/*add_header(report_csv_header, 1);*/
 }
 =

 /* ***********************************************************************=
* */
diff --git a/src/report/report.cpp b/src/report/report.cpp
index 3b46f58..56232a6 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -100,7 +100,7 @@ static string read_os_release(const string &filename)
 =

 static void system_info(void)
 {
-	string str, str2, str3;
+	string str;
 =

 	/* div attr css_class and css_id */
 	tag_attr div_attr;
-- =

1.7.9.5


--===============1659169658021830187==--

