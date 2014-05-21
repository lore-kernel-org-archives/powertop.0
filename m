Content-Type: multipart/mixed; boundary="===============1749782205308475546=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH] Bug-fix: html & csv report core indexes
Date: Wed, 21 May 2014 16:51:15 -0700
Message-ID: <1400716276-26453-2-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1400716276-26453-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1749782205308475546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch allows the supported no Intel CPUs to be included on html &
CSV reports.  It fixes the rows index needed for package data.
Additionally, fixes the calculation of title indexes when cores are absent
from the CPU.  These changes are related to C-states and P-states
reports

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/cpu/cpu.cpp |   30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 0a7c487..72d5726 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -466,7 +466,7 @@ void report_display_cpu_cstates(void)
 			continue;
 		/* Tables for PKG, CORE, CPU */
 		pkg_tbl_size.cols=3D2;
-		pkg_tbl_size.rows=3D cstates_num+1;
+		pkg_tbl_size.rows=3D ((cstates_num+1)-LEVEL_HEADER)+1;
 		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
 =

 		core_tbl_size.cols=3D2;
@@ -608,12 +608,18 @@ void report_display_cpu_cstates(void)
 		}
 =

 		/* Report Output */
-		title=3Dtitle/core_num;
+		if(core_num > 0)
+			title=3Dtitle/core_num;
+		else if( _core->children.size() > 0)
+			title=3Dtitle/_core->children.size();
+
 		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows,  pkg_tbl_size.col=
s);
 		report.add_table(pkg_data, &std_table_css);
-		init_core_table_attr(&std_table_css, title+1, core_tbl_size.rows,
+		if (!_core->can_collapse()){
+			init_core_table_attr(&std_table_css, title+1, core_tbl_size.rows,
 				core_tbl_size.cols);
-		report.add_table(core_data, &std_table_css);
+			report.add_table(core_data, &std_table_css);
+		}
 		init_cpu_table_attr(&std_table_css, title+1, cpu_tbl_size.rows,
 				cpu_tbl_size.cols);
 		report.add_table(cpu_data, &std_table_css);
@@ -625,7 +631,7 @@ void report_display_cpu_pstates(void)
 {
 	char buffer[512], buffer2[512], tmp_num[50];
 	unsigned int package, core, cpu;
-	int line;
+	int line, title=3D0;
 	class abstract_cpu *_package, * _core, * _cpu;
 	unsigned int i, pstates_num;
 	const char* core_type =3D NULL;
@@ -671,7 +677,7 @@ void report_display_cpu_pstates(void)
 =

 		/*  Tables for PKG, CORE, CPU */
 		pkg_tbl_size.cols=3D2;
-		pkg_tbl_size.rows=3Dpstates_num+2;
+		pkg_tbl_size.rows=3D((pstates_num+1)-LEVEL_HEADER)+2;
 		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
 =

 		core_tbl_size.cols=3D2;
@@ -790,10 +796,16 @@ void report_display_cpu_pstates(void)
 		}
 		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows, pkg_tbl_size.cols=
);
 		report.add_table(pkg_data, &std_table_css);
-		init_core_table_attr(&std_table_css, (pstates_num+2),
+		if(!_core->can_collapse()){
+			title=3Dpstates_num+2;
+			init_core_table_attr(&std_table_css, title,
 				core_tbl_size.rows, core_tbl_size.cols);
-		report.add_table(core_data, &std_table_css);
-		init_cpu_table_attr(&std_table_css, (pstates_num+2),
+			report.add_table(core_data, &std_table_css);
+		} else {
+			title=3Dpstates_num+1;
+		}
+
+		init_cpu_table_attr(&std_table_css, title,
 				cpu_tbl_size.rows, cpu_tbl_size.cols);
 		report.add_table(cpu_data, &std_table_css);
 	}
-- =

1.7.9.5


--===============1749782205308475546==--

