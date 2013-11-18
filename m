Content-Type: multipart/mixed; boundary="===============8725441531301445325=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 12/31] report: Logo and system Information
Date: Mon, 18 Nov 2013 12:27:03 -0800
Message-ID: <1384806442-20294-13-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8725441531301445325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reports PowerTop logo and the system information table
with the redesign css and organization.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/Makefile.am                      |    1 +
 src/report/report-data-html.cpp      |   25 +++++++++++
 src/report/report-data-html.h        |   16 +++++--
 src/report/report-formatter-csv.cpp  |   13 +++---
 src/report/report-formatter-csv.h    |    3 +-
 src/report/report-formatter-html.cpp |    8 ++--
 src/report/report-formatter-html.h   |    3 +-
 src/report/report-formatter.h        |    1 -
 src/report/report-maker.cpp          |    5 +--
 src/report/report-maker.h            |    3 +-
 src/report/report.cpp                |   81 ++++++++++++++++++++----------=
----
 11 files changed, 100 insertions(+), 59 deletions(-)
 create mode 100644 src/report/report-data-html.cpp

diff --git a/src/Makefile.am b/src/Makefile.am
index 19950a1..e19b606 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -31,6 +31,7 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		report/report-formatter-base.cpp report/report-formatter-base.h \
 		report/report-formatter-csv.cpp report/report-formatter-csv.h \
 		report/report-formatter-html.cpp report/report-formatter-html.h \
+		report/report-data-html.cpp report/report-data-html.h \
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
 		cpu/rapl/rapl_interface.cpp cpu/cpu_rapl_device.cpp cpu/rapl/rapl_interf=
ace.h\
 		cpu/dram_rapl_device.cpp devices/gpu_rapl_device.cpp cpu/cpu_rapl_device=
.h \
diff --git a/src/report/report-data-html.cpp b/src/report/report-data-html.=
cpp
new file mode 100644
index 0000000..e150961
--- /dev/null
+++ b/src/report/report-data-html.cpp
@@ -0,0 +1,25 @@
+#include "report-data-html.h"
+
+void init_div(struct tag_attr *div_attr, const char *css_class, const char=
 *css_id)
+{
+	div_attr->css_class=3Dcss_class;
+	div_attr->css_id=3Dcss_id;
+}
+
+void
+init_top_table_attr(struct table_attributes *table_css, int rows, int cols=
){
+	table_css->pos_table_title=3DL;
+	table_css->table_class=3D"emphasis1";
+	table_css->th_class=3D"table_sysinfo";
+	table_css->td_class=3D"";
+	table_css->tr_class=3D"";
+	table_css->title_mod=3D0;
+	table_css->rows=3Drows;
+	table_css->cols=3Dcols;
+}
+
+void init_title_attr(struct tag_attr *title_attr)
+{
+	title_attr->css_class=3D"content_title";
+	title_attr->css_id=3D"";
+}
diff --git a/src/report/report-data-html.h b/src/report/report-data-html.h
index 282d8b5..7db7d4b 100644
--- a/src/report/report-data-html.h
+++ b/src/report/report-data-html.h
@@ -12,11 +12,19 @@ struct table_attributes {
 	const char *th_class;
 	position pos_table_title;
 	int title_mod;
-};
-
-
-struct table_size {
 	int rows;
 	int cols;
 };
 =

+/* Definition of css atributes for the cases that apply to powertop
+ * html report
+ * */
+
+void
+init_div(struct tag_attr *div_attr, const char *css_class, const char *css=
_id);
+
+void
+init_top_table_attr(struct table_attributes *table_css, int rows, int cols=
);
+
+void
+init_title_attr(struct tag_attr *title_attr);
diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index b9336ad..086cc79 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -281,28 +281,27 @@ report_formatter_csv::add_summary_list(string *list, =
int size)
 }
 =

 void
-report_formatter_csv::add_table(string *system_data, struct table_size *si=
ze,
-		struct table_attributes* tb_attr)
+report_formatter_csv::add_table(string *system_data, struct table_attribut=
es* tb_attr)
 {
 	int i, j;
 	int offset=3D0;
 	string tmp_str=3D"";
 	int empty_row=3D0;
 	add_exact("\n");
-	for (i=3D0; i < size->rows; i++){
-		for (j=3D0; j < size->cols; j++){
-			offset =3D i * (size->cols) + j;
+	for (i=3D0; i < tb_attr->rows; i++){
+		for (j=3D0; j < tb_attr->cols; j++){
+			offset =3D i * (tb_attr->cols) + j;
 			tmp_str=3Dsystem_data[offset];
 =

 			if(tmp_str =3D=3D "&nbsp;")
 				empty_row+=3D1;
 			else{
 				addf_exact("%s", system_data[offset].c_str());
-				if(j < (size->cols - 1))
+				if(j < (tb_attr->cols - 1))
 					add_exact(",");
 			}
 		}
-		if(empty_row < size->cols)
+		if(empty_row < tb_attr->cols)
 		add_exact("\n");
 		empty_row=3D0;
 	}
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index 994b765..198f597 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -82,8 +82,7 @@ public:
 	void add_title(struct tag_attr *title_att, const char *title);
 	void add_navigation();
 	void add_summary_list(string *list, int size);
-	void add_table(string *system_data, struct table_size *size,
-			struct table_attributes *tb_attr);
+	void add_table(string *system_data, struct table_attributes *tb_attr);
 =

 private:
 	void add_doc_header();
diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index f508ae0..aeecdde 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -536,7 +536,7 @@ report_formatter_html::add_summary_list(string *list, i=
nt size)
 =

 =

 void
-report_formatter_html::add_table(string *system_data, struct table_size *s=
ize, struct table_attributes* tb_attr)
+report_formatter_html::add_table(string *system_data, struct table_attribu=
tes* tb_attr)
 {
 	int i, j;
 	int offset=3D0;
@@ -547,14 +547,14 @@ report_formatter_html::add_table(string *system_data,=
 struct table_size *size, s
 	else
 		addf_exact("<table class=3D\"%s\">\n", tb_attr->table_class);
 =

-	for (i=3D0; i < size->rows; i++){
+	for (i=3D0; i < tb_attr->rows; i++){
 		if (tb_attr->tr_class =3D=3D empty)
 			add_exact("<tr> ");
 		else
 			addf_exact("<tr class=3D\"%s\"> ", tb_attr->tr_class);
 =

-		for (j=3D0; j < size->cols; j++){
-			offset =3D i * (size->cols) + j;
+		for (j=3D0; j < tb_attr->cols; j++){
+			offset =3D i * (tb_attr->cols) + j;
 =

 			if (tb_attr->pos_table_title =3D=3D T &&  i=3D=3D0)
 				addf_exact("<th class=3D\"%s\"> %s </th> ",
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index d625ced..1ad1c68 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -94,8 +94,7 @@ public:
 	void add_title(struct tag_attr *title_att, const char *title);
 	void add_navigation();
 	void add_summary_list(string *list, int size);
-	void add_table(string *system_data, struct table_size *size,
-			struct table_attributes *tb_attr);
+	void add_table(string *system_data, struct table_attributes *tb_attr);
 =

 private:
 	/* Document structure related functions */
diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 4fe2c42..7984dc5 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -72,7 +72,6 @@ public:
 	virtual void add_navigation() {}
 	virtual void add_summary_list(string *list, int size) {}
 	virtual void add_table(string *system_data,
-			struct table_size *size,
 			struct table_attributes *tb_attr)     {}
 };
 =

diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 031b692..0fd133c 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -381,9 +381,8 @@ report_maker::add_summary_list(string *list, int size)
 }
 =

 void
-report_maker::add_table(string *system_data, struct table_size *size,
-		struct table_attributes *tb_attr)
+report_maker::add_table(string *system_data, struct table_attributes *tb_a=
ttr)
 {
-	formatter->add_table(system_data, size, tb_attr);
+	formatter->add_table(system_data, tb_attr);
 }
 =

diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index e75c99a..f6897cf 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -201,8 +201,7 @@ public:
 	void add_title(struct tag_attr *att_title, const char *title);
 	void add_navigation();
 	void add_summary_list(string *list, int size);
-	void add_table(string *system_data, struct table_size *size,
-			struct table_attributes *tb_attr);
+	void add_table(string *system_data, struct table_attributes *tb_attr);
 =

 private:
 	void setup_report_formatter();
diff --git a/src/report/report.cpp b/src/report/report.cpp
index c018bb1..3b46f58 100644
--- a/src/report/report.cpp
+++ b/src/report/report.cpp
@@ -35,6 +35,7 @@
 #include <string.h>
 #include <malloc.h>
 #include <unistd.h>
+#include "report-data-html.h"
 =

 using namespace std;
 =

@@ -101,49 +102,61 @@ static void system_info(void)
 {
 	string str, str2, str3;
 =

-	report.begin_section(SECTION_SYSINFO);
-	report.add_header("System Information");
-	report.begin_table();
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell(CELL_SYSINFO);
-	report.add("PowerTOP Version");
-	report.begin_cell();
-	report.add(POWERTOP_VERSION);
+	/* div attr css_class and css_id */
+	tag_attr div_attr;
+	init_div(&div_attr, "sys_info", "");
+
+	/* Set Table attributes, rows, and cols */
+	table_attributes sys_table;
+	init_top_table_attr(&sys_table, 5, 2);
+
+	/* Set Title attributes */
+	tag_attr title_attr;
+        init_title_attr(&title_attr);
+
+	/* Set array of data in row Major order */
+	string system_data[sys_table.rows * sys_table.cols];
+	system_data[0]=3D__("PowerTOP Version");
+	system_data[1]=3DPOWERTOP_VERSION;
 =

 	str =3D read_sysfs_string("/proc/version");
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("Kernel Version");
-	report.begin_cell();
-	report.add(str.c_str());
+	size_t  found =3D str.find(" ");
+	found =3D str.find(" ", found+1);
+	found =3D str.find(" ", found+1);
+	str =3D str.substr(0,found);
+	system_data[2]=3D__("Kernel Version");
+	system_data[3]=3Dstr.c_str();
 =

 	str  =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_vendor");
-	str2 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_name");
-	str3 =3D read_sysfs_string("/sys/devices/virtual/dmi/id/product_version");
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("System Name");
-	report.begin_cell();
-	report.addf("%s %s %s", str.c_str(), str2.c_str(), str3.c_str());
-
+	system_data[4]=3D__("System Name");
+	system_data[5]=3D str.c_str();
+	str =3D read_sysfs_string("/sys/devices/virtual/dmi/id/board_name");
+	system_data[5].append(str.c_str());
+	str =3D read_sysfs_string("/sys/devices/virtual/dmi/id/product_version");
+	system_data[5].append(str.c_str());
 	str =3D cpu_model();
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("CPU Information");
-	report.begin_cell();
-	report.addf("%lix %s", sysconf(_SC_NPROCESSORS_ONLN), str.c_str());
+	system_data[6]=3D__("CPU Information");
+	system_data[7]=3D sysconf(_SC_NPROCESSORS_ONLN);
+	system_data[7].append(str.c_str());
 =

 	str =3D read_sysfs_string("/etc/system-release");
 	if (str.length() < 1)
-		str =3D read_sysfs_string("/etc/redhat-release");
+	str =3D read_sysfs_string("/etc/redhat-release");
 	if (str.length() < 1)
-		str =3D read_os_release("/etc/os-release");
-
-	report.begin_row(ROW_SYSINFO);
-	report.begin_cell();
-	report.add("OS Information");
-	report.begin_cell();
-	report.add(str.c_str());
+	str =3D read_os_release("/etc/os-release");
+
+	system_data[8]=3D__("OS Information");
+	system_data[9]=3Dstr;
+
+	/* Report Output */
+	report.add_header();
+	report.add_logo();
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, __("System Information"));
+	report.add_table(system_data, &sys_table);
+	report.end_div();
+	report.end_hheader();
+	report.add_navigation();
 }
 =

 void init_report_output(char *filename_str, int iterations)
-- =

1.7.9.5


--===============8725441531301445325==--

