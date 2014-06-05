Content-Type: multipart/mixed; boundary="===============5384931628366878017=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH] Fix compile warning in cpu.cpp
Date: Wed, 04 Jun 2014 17:35:33 -0700
Message-ID: <1401928533-3421-1-git-send-email-srinivas.pandruvada@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5384931628366878017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix
cpu/cpu.cpp: In function =E2=80=98void report_display_cpu_cstates()=E2=80=
=99:
cpu/cpu.cpp:616:28: warning: =E2=80=98_core=E2=80=99 may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
cpu/cpu.cpp: In function =E2=80=98void report_display_cpu_pstates()=E2=80=
=99:
cpu/cpu.cpp:797:27: warning: =E2=80=98_core=E2=80=99 may be used uninitiali=
zed in this function [-Wmaybe-uninitialized]
---
 src/cpu/cpu.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 37cc409..d360f2f 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -428,7 +428,7 @@ void report_display_cpu_cstates(void)
 	char buffer[512], buffer2[512], tmp_num[50];
 	unsigned int package, core, cpu;
 	int line, cstates_num, title=3D0, core_num=3D0;
-	class abstract_cpu *_package, * _core, * _cpu;
+	class abstract_cpu *_package, *_core =3D NULL, * _cpu;
 	const char* core_type =3D NULL;
 =

 	cstates_num =3D get_cstates_num();
@@ -608,7 +608,7 @@ void report_display_cpu_cstates(void)
 		/* Report Output */
 		if(core_num > 0)
 			title=3Dtitle/core_num;
-		else if( _core->children.size() > 0)
+		else if(_core && _core->children.size() > 0)
 			title=3Dtitle/_core->children.size();
 =

 		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows,  pkg_tbl_size.col=
s);
@@ -630,7 +630,7 @@ void report_display_cpu_pstates(void)
 	char buffer[512], buffer2[512], tmp_num[50];
 	unsigned int package, core, cpu;
 	int line, title=3D0;
-	class abstract_cpu *_package, * _core, * _cpu;
+	class abstract_cpu *_package, *_core =3D NULL, * _cpu;
 	unsigned int i, pstates_num;
 	const char* core_type =3D NULL;
 =

@@ -794,7 +794,7 @@ void report_display_cpu_pstates(void)
 		}
 		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows, pkg_tbl_size.cols=
);
 		report.add_table(pkg_data, &std_table_css);
-		if(!_core->can_collapse()){
+		if(_core && !_core->can_collapse()){
 			title=3Dpstates_num+2;
 			init_core_table_attr(&std_table_css, title,
 				core_tbl_size.rows, core_tbl_size.cols);
-- =

1.7.11.7


--===============5384931628366878017==--

