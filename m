Content-Type: multipart/mixed; boundary="===============7454520123065740622=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH] fix-csv: cell alignment with regional formats
Date: Fri, 13 Jun 2014 16:50:56 -0700
Message-ID: <1402703457-30614-2-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1402703457-30614-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7454520123065740622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In most languages a decimal number is expressed with a coma rather than a
dot.  This confuses the csv parsing creating new columns.
This patch separates the value with a semicolon to avoid the issue.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index f7fb313..523e79b 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -132,7 +132,7 @@ report_formatter_csv::add_summary_list(string *list, in=
t size)
 	for (i=3D0; i < size; i+=3D2){
 		addf_exact("%s %s", list[i].c_str(), list[i+1].c_str());
 		if(i < (size - 1))
-			add_exact(",");
+			add_exact(";");
 	}
 	add_exact("\n");
 }
@@ -155,7 +155,7 @@ report_formatter_csv::add_table(string *system_data, st=
ruct table_attributes* tb
 			else{
 				addf_exact("%s", system_data[offset].c_str());
 				if(j < (tb_attr->cols - 1))
-					add_exact(",");
+					add_exact(";");
 			}
 		}
 		if(empty_row < tb_attr->cols)
-- =

1.7.9.5


--===============7454520123065740622==--

