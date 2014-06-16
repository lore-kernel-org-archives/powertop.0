Content-Type: multipart/mixed; boundary="===============0255531718468830516=="
MIME-Version: 1.0
From: Prigent, Christophe <christophe.prigent at intel.com>
Subject: Re: [Powertop] [PATCH] fix-csv: cell alignment with regional formats
Date: Mon, 16 Jun 2014 10:35:34 +0000
Message-ID: <AC81B6AA7676DD448250A85A459C1F4142B293B6@IRSMSX101.ger.corp.intel.com>
In-Reply-To: 1402703457-30614-2-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0255531718468830516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tested with regional formats "English" and "Fran=C3=A7ais", I confirm it fi=
xes the problem.

PowerTOP versionv2.6.1
commit dfc2ba97ffba44b51379fd3617a4f6fead40037d

-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Alexan=
dra Yates
Sent: Saturday, June 14, 2014 1:51 AM
To: powertop(a)lists.01.org
Subject: [Powertop] [PATCH] fix-csv: cell alignment with regional formats

In most languages a decimal number is expressed with a coma rather than a d=
ot.  This confuses the csv parsing creating new columns.
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
--
1.7.9.5

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop
---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, =

92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


--===============0255531718468830516==--

