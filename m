Content-Type: multipart/mixed; boundary="===============2716609199403984203=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [RFC][PATCH] Small rework on report formatter side
Date: Wed, 10 Oct 2012 11:13:52 -0700
Message-ID: <20121010181352.GA4628@swordfish.datadirect.datadirectnet.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2716609199403984203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

below is initial version of rework I was talking about. Igor did most part =
of it (introduced =

report_formatter_base class), so mine are just minor tweaks. I'm glad still=
 no one mentioned
templates, just kidding.

one thing I don't really like so far is

        else if (type =3D=3D REPORT_OFF)
               formatter =3D new report_formatter();

which is just cryptic and thus look wrong.
perhaps we need something like `new report_formatter_basic()' here (which w=
ill require header
file rename).

please review and comment.

------------------------------------------------------------------------

    Small rework on report formatter side:
    =

    - make report_formatter a basic class (previously was interface). hence=
 we can
    remove empty report_formatter interface implementation.
    =

    - drop report-formatter-null class
    =

    - in report maker now we create report_formatter instance for REPORT_OF=
F mode
    =

    - rename report_formatter_base to report_formatter_string_base, so clas=
s name tells
    a bit more, later we can create report_formatter_xml_base/report_format=
ter_json_base/etc.


Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---
 src/Makefile.am                      |   1 -
 src/report/report-formatter-base.cpp |  14 +--
 src/report/report-formatter-base.h   |   2 +-
 src/report/report-formatter-csv.h    |   2 +-
 src/report/report-formatter-html.h   |   2 +-
 src/report/report-formatter-null.cpp | 179 -------------------------------=
----
 src/report/report-formatter-null.h   |  66 -------------
 src/report/report-formatter.h        |  38 ++++----
 src/report/report-maker.cpp          |   3 +-
 9 files changed, 30 insertions(+), 277 deletions(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index ccf3f0c..1a64622 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -34,7 +34,6 @@ powertop_SOURCES =3D parameters/persistent.cpp parameters=
/learn.cpp parameters/par
 		report/report-formatter-base.cpp report/report-formatter-base.h \
 		report/report-formatter-csv.cpp report/report-formatter-csv.h \
 		report/report-formatter-html.cpp report/report-formatter-html.h \
-		report/report-formatter-null.cpp report/report-formatter-null.h \
 		main.cpp css.h powertop.css cpu/intel_gpu.cpp
 =

 =

diff --git a/src/report/report-formatter-base.cpp b/src/report/report-forma=
tter-base.cpp
index 4b448be..c6d5d9d 100644
--- a/src/report/report-formatter-base.cpp
+++ b/src/report/report-formatter-base.cpp
@@ -36,7 +36,7 @@
 /* ***********************************************************************=
* */
 =

 const char *
-report_formatter_base::get_result()
+report_formatter_string_base::get_result()
 {
 	return result.c_str();
 }
@@ -44,7 +44,7 @@ report_formatter_base::get_result()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_base::clear_result()
+report_formatter_string_base::clear_result()
 {
 	result.clear();
 }
@@ -52,7 +52,7 @@ report_formatter_base::clear_result()
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_base::add(const char *str)
+report_formatter_string_base::add(const char *str)
 {
 	assert(str);
 =

@@ -62,7 +62,7 @@ report_formatter_base::add(const char *str)
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_base::add_exact(const char *str)
+report_formatter_string_base::add_exact(const char *str)
 {
 	assert(str);
 =

@@ -74,7 +74,7 @@ report_formatter_base::add_exact(const char *str)
 #define LINE_SIZE 8192
 =

 void
-report_formatter_base::addv(const char *fmt, va_list ap)
+report_formatter_string_base::addv(const char *fmt, va_list ap)
 {
 	char str[LINE_SIZE];
 =

@@ -87,7 +87,7 @@ report_formatter_base::addv(const char *fmt, va_list ap)
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_base::addf(const char *fmt, ...)
+report_formatter_string_base::addf(const char *fmt, ...)
 {
 	va_list ap;
 =

@@ -101,7 +101,7 @@ report_formatter_base::addf(const char *fmt, ...)
 /* ***********************************************************************=
* */
 =

 void
-report_formatter_base::addf_exact(const char *fmt, ...)
+report_formatter_string_base::addf_exact(const char *fmt, ...)
 {
 	char str[LINE_SIZE];
 	va_list ap;
diff --git a/src/report/report-formatter-base.h b/src/report/report-formatt=
er-base.h
index 7063174..e35a2ff 100644
--- a/src/report/report-formatter-base.h
+++ b/src/report/report-formatter-base.h
@@ -28,7 +28,7 @@
 =

 #include "report-formatter.h"
 =

-class report_formatter_base: public report_formatter
+class report_formatter_string_base: public report_formatter
 {
 public:
 	virtual const char *get_result();
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index fbec0c9..8dd2976 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -44,7 +44,7 @@
 =

 /* ***********************************************************************=
* */
 =

-class report_formatter_csv: public report_formatter_base
+class report_formatter_csv: public report_formatter_string_base
 {
 public:
 	report_formatter_csv();
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 1c3eb4a..4d00efe 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -55,7 +55,7 @@ struct html_cell {
 =

 /* ***********************************************************************=
* */
 =

-class report_formatter_html: public report_formatter_base
+class report_formatter_html: public report_formatter_string_base
 {
 public:
 	report_formatter_html();
diff --git a/src/report/report-formatter-null.cpp b/src/report/report-forma=
tter-null.cpp
deleted file mode 100644
index 22da7a0..0000000
--- a/src/report/report-formatter-null.cpp
+++ /dev/null
@@ -1,179 +0,0 @@
-/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *	http://www.samsung.com/
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Null report generator.
- * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
- * 2012.10 */
-
-#include <stdarg.h>
-
-#include "report-formatter-null.h"
-
-/* ***********************************************************************=
* */
-
-report_formatter_null::report_formatter_null()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::finish_report()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-const char *
-report_formatter_null::get_result()
-{
-	return "";
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::clear_result()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::add(const char *str UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::addv(const char *fmt UNUSED, va_list ap UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::add_header(const char *header UNUSED, int level UNU=
SED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::begin_section(section_type stype UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::end_section()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::begin_table(table_type ttype UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::end_table()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::begin_row(row_type rtype UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::end_row()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::begin_cell(cell_type ctype UNUSED)
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::end_cell()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::add_empty_cell()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::begin_paragraph()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::end_paragraph()
-{
-	/* Do nothing */
-}
-
-/* ***********************************************************************=
* */
-
-void
-report_formatter_null::set_cpu_number(int nr UNUSED)
-{
-	/* Do nothing */
-}
diff --git a/src/report/report-formatter-null.h b/src/report/report-formatt=
er-null.h
deleted file mode 100644
index 51493ee..0000000
--- a/src/report/report-formatter-null.h
+++ /dev/null
@@ -1,66 +0,0 @@
-/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *	http://www.samsung.com/
- *
- * This file is part of PowerTOP
- *
- * This program file is free software; you can redistribute it and/or modi=
fy it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but WIT=
HOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- * for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program in a file named COPYING; if not, write to the
- * Free Software Foundation, Inc,
- * 51 Franklin Street, Fifth Floor,
- * Boston, MA 02110-1301 USA
- * or just google for it.
- *
- * Null report generator.
- * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
- * 2012.10 */
-
-#ifndef _REPORT_FORMATTER_NULL_H_
-#define _REPORT_FORMATTER_NULL_H_
-
-#include "report-formatter.h"
-
-/* ***********************************************************************=
* */
-
-class report_formatter_null: public report_formatter
-{
-public:
-	report_formatter_null();
-
-	void finish_report();
-	const char *get_result();
-	void clear_result();
-
-	void add(const char *str);
-	void addv(const char *fmt, va_list ap);
-
-	void add_header(const char *header, int level);
-
-	void begin_section(section_type stype);
-	void end_section();
-
-	void begin_table(table_type ttype);
-	void end_table();
-
-	void begin_row(row_type rtype);
-	void end_row();
-
-	void begin_cell(cell_type ctype);
-	void end_cell();
-	void add_empty_cell();
-
-	void begin_paragraph();
-	void end_paragraph();
-
-	void set_cpu_number(int nr);
-};
-
-#endif /* _REPORT_FORMATTER_NULL_H_ */
diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index cec0796..7f9f544 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -28,38 +28,38 @@
 =

 #include "report-maker.h"
 =

-class report_formatter /* Interface */
+class report_formatter
 {
 public:
 	virtual ~report_formatter() {}
 =

-	virtual void finish_report() =3D 0;
-	virtual const char *get_result() =3D 0;
-	virtual void clear_result() =3D 0;
+	virtual void finish_report() {};
+	virtual const char *get_result() {return "Basic report_formatter::get_res=
ul call\n";};
+	virtual void clear_result() {};
 =

-	virtual void add(const char *str) =3D 0;
-	virtual void addv(const char *fmt, va_list ap) =3D 0;
+	virtual void add(const char *str) {};
+	virtual void addv(const char *fmt, va_list ap) {};
 =

-	virtual void add_header(const char *header, int level) =3D 0;
+	virtual void add_header(const char *header, int level) {};
 =

-	virtual void begin_section(section_type stype) =3D 0;
-	virtual void end_section() =3D 0;
+	virtual void begin_section(section_type stype) {};
+	virtual void end_section() {};
 =

-	virtual void begin_table(table_type ttype) =3D 0;
-	virtual void end_table() =3D 0;
+	virtual void begin_table(table_type ttype) {};
+	virtual void end_table() {};
 =

-	virtual void begin_row(row_type rtype) =3D 0;
-	virtual void end_row() =3D 0;
+	virtual void begin_row(row_type rtype) {};
+	virtual void end_row() {};
 =

-	virtual void begin_cell(cell_type ctype) =3D 0;
-	virtual void end_cell() =3D 0;
-	virtual void add_empty_cell() =3D 0;
+	virtual void begin_cell(cell_type ctype) {};
+	virtual void end_cell() {};
+	virtual void add_empty_cell() {};
 =

-	virtual void begin_paragraph() =3D 0;
-	virtual void end_paragraph() =3D 0;
+	virtual void begin_paragraph() {};
+	virtual void end_paragraph() {};
 =

 	/* For quad-colouring CPU tables in HTML */
-	virtual void set_cpu_number(int nr) =3D 0;
+	virtual void set_cpu_number(int nr) {};
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index 4a68a8c..eef0fb1 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -31,7 +31,6 @@
 #include "report-maker.h"
 #include "report-formatter-csv.h"
 #include "report-formatter-html.h"
-#include "report-formatter-null.h"
 =

 /* ***********************************************************************=
* */
 =

@@ -114,7 +113,7 @@ report_maker::setup_report_formatter()
 	else if (type =3D=3D REPORT_CSV)
 		formatter =3D new report_formatter_csv();
 	else if (type =3D=3D REPORT_OFF)
-		formatter =3D new report_formatter_null();
+		formatter =3D new report_formatter();
 	else
 		assert(false);
 }



--===============2716609199403984203==--

