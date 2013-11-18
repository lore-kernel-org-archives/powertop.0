Content-Type: multipart/mixed; boundary="===============6986937300321088717=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 16/31] report: CPU Idle section redesigned html
 & csv
Date: Mon, 18 Nov 2013 12:27:07 -0800
Message-ID: <1384806442-20294-17-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6986937300321088717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enables "CPU Idle" section redesign for html and csv reports preserving
translation macros.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/cpu/cpu.cpp                 |  188 +++++++++++++++++++++++++++--------=
----
 src/report/report-data-html.cpp |   39 ++++++++
 src/report/report-data-html.h   |   18 ++++
 3 files changed, 187 insertions(+), 58 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 4a7e197..b8f74a8 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -41,6 +41,7 @@
 #include "../display.h"
 #include "../report/report.h"
 #include "../report/report-maker.h"
+#include "../report/report-data-html.h"
 =

 static class abstract_cpu system_level;
 =

@@ -420,122 +421,193 @@ static int get_cstates_num(void)
 =

 void report_display_cpu_cstates(void)
 {
-	char buffer[512], buffer2[512];
+	char buffer[512], buffer2[512], tmp_num[50];
 	unsigned int package, core, cpu;
-	int line, cstates_num;
+	int line, cstates_num, title=3D0, core_num=3D0;
 	class abstract_cpu *_package, * _core, * _cpu;
 =

 	cstates_num =3D get_cstates_num();
+	/* div attr css_class and css_id */
+	tag_attr div_attr;
+	init_div(&div_attr, "clear_block", "cpuidle");
+
+	/* Set Table attributes, rows, and cols */
+	table_attributes std_table_css;
+	table_size pkg_tbl_size;
+	table_size core_tbl_size;
+	table_size cpu_tbl_size;
+
+
+	/* Set Title attributes */
+	tag_attr title_attr;
+	init_title_attr(&title_attr);
 =

-	report.begin_section(SECTION_CPUIDLE);
-	report.add_header("Processor Idle state report");
+	/* Report add section */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, __("Processor Idle State Report"));
+
+	/* Set array of data in row Major order */
+       	int idx1, idx2, idx3;
+	string tmp_str;
 =

 	for (package =3D 0; package < system_level.children.size(); package++) {
 		bool first_core =3D true;
+		idx1=3D0;
+		idx2=3D0;
+		idx3=3D0;
 =

 		_package =3D system_level.children[package];
 		if (!_package)
 			continue;
+		/* Tables for PKG, CORE, CPU */
+		pkg_tbl_size.cols=3D2;
+		pkg_tbl_size.rows=3D cstates_num+1;
+		string pkg_data[pkg_tbl_size.cols * pkg_tbl_size.rows];
+
+		core_tbl_size.cols=3D2;
+		core_tbl_size.rows=3D(cstates_num *_package->children.size())
+				+ _package->children.size();
+		string core_data[core_tbl_size.cols * core_tbl_size.rows];
+		int num_cpus=3D0;
+
+		for (core =3D 0; core < _package->children.size(); core++) {
+			_core =3D _package->children[core];
+			if (!_core)
+				continue;
+			for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
+				if (!_cpu)
+					continue;
+				_cpu =3D _core->children[cpu];
+				num_cpus+=3D1;
+			}
+		}
+
+		cpu_tbl_size.cols=3D((2 * num_cpus)+1) ;
+		cpu_tbl_size.rows=3D cstates_num * _package->children.size();
+
+		string cpu_data[cpu_tbl_size.cols * cpu_tbl_size.rows];
 =

-		report.begin_table(TABLE_WIDE);
 		for (core =3D 0; core < _package->children.size(); core++) {
+			cpu_data[idx3]=3D"&nbsp;";
+			idx3+=3D1;
 			_core =3D _package->children[core];
+
 			if (!_core)
 				continue;
 =

+			/* *** PKG STARTS *** */
 			for (line =3D LEVEL_HEADER; line <=3D cstates_num; line++) {
 				bool first_cpu =3D true;
-
 				if (!_package->has_cstate_level(line))
-					continue;
-
-				report.begin_row();
+				continue;
 				buffer[0] =3D 0;
 				buffer2[0] =3D 0;
-
 				if (line =3D=3D LEVEL_HEADER) {
 					if (first_core) {
-						report.begin_cell(CELL_FIRST_PACKAGE_HEADER);
-						report.addf(__("Package %i"), _package->get_number());
-					} else {
-						report.begin_cell(CELL_EMPTY_PACKAGE_HEADER);
-						report.add_empty_cell();
+						pkg_data[idx1]=3D__("Package");
+						idx1+=3D1;
+						sprintf(tmp_num,"%d",  _package->get_number());
+						pkg_data[idx1]=3D string(tmp_num);
+						idx1+=3D1;
 					}
 				} else if (first_core) {
-					report.begin_cell(CELL_STATE_NAME);
-					report.add(_package->fill_cstate_name(line, buffer));
-					report.begin_cell(CELL_PACKAGE_STATE_VALUE);
-					report.add(_package->fill_cstate_line(line, buffer2));
-				} else {
-					report.begin_cell(CELL_EMPTY_PACKAGE_STATE);
-					report.add_empty_cell();
+					tmp_str=3Dstring(_package->fill_cstate_name(line, buffer));
+					pkg_data[idx1]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+					idx1+=3D1;
+					tmp_str=3Dstring(_package->fill_cstate_line(line, buffer2));
+					pkg_data[idx1]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+					idx1+=3D1;
 				}
 =

-				report.begin_cell(CELL_SEPARATOR);
-				report.add_empty_cell();
-
+				/* *** CORE STARTS *** */
 				if (!_core->can_collapse()) {
 					buffer[0] =3D 0;
 					buffer2[0] =3D 0;
 =

 					if (line =3D=3D LEVEL_HEADER) {
-						report.begin_cell(CELL_CORE_HEADER);
 						/* Here we need to check for which core type we
-  						 * are using. Do not use the core type for the =

-  						 * report.addf as it breaks an important macro use =

-  						 * for translation decision making for the reports. =

-  						   */
-						const char* core_type =3D _core->get_type(); =

-					        if (core_type !=3D NULL) {	=

+						* are using. Do not use the core type for the
+						* report.addf as it breaks an important macro use
+						* for translation decision making for the reports.
+						* */
+						const char* core_type =3D _core->get_type();
+						if (core_type !=3D NULL) {
 							if (strcmp(core_type, "Core") =3D=3D 0 ) {
-								report.addf(__("Core %i"), _core->get_number());
+								core_data[idx2]=3D"";
+								idx2+=3D1;
+								sprintf(tmp_num, __("Core %d"),_core->get_number());
+								core_data[idx2]=3Dstring(tmp_num);
+								idx2+=3D1;
+								core_num+=3D1;
 							} else {
-								report.addf(__("GPU %i"), _core->get_number());
-							} =

+								core_data[idx2]=3D"";
+								idx2+=3D1;
+								sprintf(tmp_num,__("GPU %d"),_core->get_number());
+								core_data[idx2]=3Dstring(tmp_num);
+								idx2+=3D1;
+							}
 						}
-                                       } else {
-                                                report.begin_cell(CELL_STA=
TE_NAME);
-                                                report.add(_core->fill_cst=
ate_name(line, buffer));
-						report.begin_cell(CELL_CORE_STATE_VALUE);
-						report.add(_core->fill_cstate_line(line, buffer2));
+					} else {
+						tmp_str=3Dstring(_core->fill_cstate_name(line, buffer));
+						core_data[idx2]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+						idx2+=3D1;
+						tmp_str=3Dstring(_core->fill_cstate_line(line, buffer2));
+						core_data[idx2]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+						idx2+=3D1;
 					}
 				}
-
-				report.begin_cell(CELL_SEPARATOR);
-				report.add_empty_cell();
-
+				// *** CPU STARTS ***
 				for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
 					_cpu =3D _core->children[cpu];
+
 					if (!_cpu)
 						continue;
-
-					report.set_cpu_number(cpu);
 					if (line =3D=3D LEVEL_HEADER) {
-						report.begin_cell(CELL_CPU_CSTATE_HEADER);
-						report.addf(__("CPU %i"), _cpu->get_number());
+						cpu_data[idx3] =3D __("CPU");
+						idx3+=3D1;
+						sprintf(tmp_num,"%d",_cpu->get_number());
+						cpu_data[idx3]=3Dstring(tmp_num);
+						idx3+=3D1;
 						continue;
 					}
 =

 					if (first_cpu) {
-						report.begin_cell(CELL_STATE_NAME);
-						report.add(_cpu->fill_cstate_name(line, buffer));
+						title+=3D1;
+						cpu_data[idx3]=3D(string(_cpu->fill_cstate_name(line, buffer)));
+						idx3+=3D1;
 						first_cpu =3D false;
 					}
 =

 					buffer[0] =3D 0;
-					report.begin_cell(CELL_CPU_STATE_VALUE);
-					report.add(_cpu->fill_cstate_percentage(line, buffer));
-					report.begin_cell(CELL_CPU_STATE_VALUE);
-					if (line !=3D LEVEL_C0)
-						report.add(_cpu->fill_cstate_time(line, buffer));
-					else
-						report.add_empty_cell();
+					tmp_str=3Dstring(_cpu->fill_cstate_percentage(line, buffer));
+					cpu_data[idx3]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+					idx3+=3D1;
+
+					if (line !=3D LEVEL_C0){
+						tmp_str=3Dstring(_cpu->fill_cstate_time(line, buffer));
+						cpu_data[idx3]=3D(tmp_str=3D=3D"" ? "&nbsp;" : tmp_str);
+						idx3+=3D1;
+					} else {
+						cpu_data[idx3]=3D"&nbsp;";
+						idx3+=3D1;
+					}
 				}
 			}
-
 			first_core =3D false;
 		}
+
+		/* Report Output */
+		title=3Dtitle/core_num;
+		init_pkg_table_attr(&std_table_css, pkg_tbl_size.rows,  pkg_tbl_size.col=
s);
+		report.add_table(pkg_data, &std_table_css);
+		init_core_table_attr(&std_table_css, title+1, core_tbl_size.rows,
+				core_tbl_size.cols);
+		report.add_table(core_data, &std_table_css);
+		init_cpu_table_attr(&std_table_css, title+1, cpu_tbl_size.rows,
+				cpu_tbl_size.cols);
+		report.add_table(cpu_data, &std_table_css);
 	}
+	report.end_div();
 }
 =

 void report_display_cpu_pstates(void)
diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
index ed0d692..28732c9 100644
--- a/src/report/report-data-html.cpp
+++ b/src/report/report-data-html.cpp
@@ -35,6 +35,45 @@ void init_std_table_attr(struct table_attributes *table_=
css, int rows, int cols)
 	table_css->cols=3Dcols;
 }
 =

+void init_pkg_table_attr(struct table_attributes *table_css, int rows, int=
 cols){
+	table_css->table_class=3D"emphasis2 side_by_side_left";
+	table_css->tr_class=3D"";
+	table_css->th_class=3D"title";
+	table_css->td_class=3D"package";
+	table_css->pos_table_title=3DT;
+	table_css->title_mod=3D0;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
+void init_core_table_attr(struct table_attributes *table_css, int title_mo=
d,
+		int rows, int cols){
+	table_css->table_class=3D"emphasis2 side_by_side_left";
+	table_css->tr_class=3D"";
+	table_css->th_class=3D"title";
+	table_css->td_class=3D"core";
+	table_css->pos_table_title=3DTC;
+	table_css->title_mod=3Dtitle_mod;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
+void init_cpu_table_attr(struct table_attributes *table_css, int title_mod,
+		int rows, int cols){
+	table_css->table_class=3D"emphasis2 side_by_side_left";
+	table_css->tr_class=3D"";
+	table_css->th_class=3D"title";
+	table_css->td_class=3D"cpu";
+	table_css->pos_table_title=3DTLC;
+	table_css->title_mod=3Dtitle_mod;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
+
+
+
+
 /* Other Helper Functions */
 string
 double_to_string(double dval)
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 524cd24..61e75c0 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -21,6 +21,12 @@ struct table_attributes {
 	int cols;
 };
 =

+struct table_size {
+	int rows;
+	int cols;
+};
+
+
 /* Definition of css atributes for the cases that apply to powertop
  * html report
  * */
@@ -37,6 +43,18 @@ init_title_attr(struct tag_attr *title_attr);
 void
 init_std_table_attr(struct table_attributes *table_css, int rows, int cols=
);
 =

+void
+init_pkg_table_attr(struct table_attributes *table_css, int rows, int cols=
);
+
+void
+init_core_table_attr(struct table_attributes *table_css, int title_mod,
+		int rows, int cols);
+
+void
+init_cpu_table_attr(struct table_attributes *table_css, int title_mod,
+		int rows, int cols);
+
+
 /* Other helper functions */
 string
 double_to_string(double dval);
-- =

1.7.9.5


--===============6986937300321088717==--

