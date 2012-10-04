Content-Type: multipart/mixed; boundary="===============6226983628231603702=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [RFC][PATCH 1/2] Adding report generator facility
Date: Thu, 04 Oct 2012 09:08:24 -0700
Message-ID: <CAMFVxVjsokAKf=GZkPLyghbxgXNYQPfWPhMeWaOqyso+5m73XA@mail.gmail.com>
In-Reply-To: 1349283900-26721-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6226983628231603702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for your patch submittal. I will be reviewing and testing shortly.
-Chris


On Wed, Oct 3, 2012 at 10:05 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> wro=
te:
> This report generator adds the facility to generate correctly parsable
> reports in HTML and CSV format. It separates document structure from
> text formatting, enhances code readability and simplifies report generati=
ng.
> Also it makes possible adding other formats such as TXT or XML.
>
> This report generator implements the following document structure:
>         body
>           \---> section
>                   |---> header
>                   |---> paragraph
>                   \---> table
>                           \---> table row
>                                   \---> table cell
>
> The report body consists of a number of sections (a.k.a. <div>s,
> a.k.a. tabs).
> Each section can contain headers (<h1>, <h2>, <h3>), paragraphs (<p>)
> and tables (<table>).
>
> A header is a single line of text.
>
> Paragraphs can contain only text.
>
> A table consists of table rows. A table row consists of table cells.
> A table cell can contain only text.
>
> Each section, table, row or cell could have its own formatting.
> To distinguish elements from others of its type, each element could have
> an unique identifier (see enums section_type, table_type, row_type and
> cell_type below). These identifiers are used in formatter implementations
> to produce special formatting.
>
> Example of usage:
>         report_maker report(REPORT_OFF);
>
>         report.set_type(REPORT_HTML);
>         report.begin_section();
>                 report.add_header("Big report");
>                 report.begin_paragraph("Some text");
>                 report.begin_table();
>                         report.begin_row();
>                                 report.begin_cell();
>                                         report.add("Something");
>                                 report.begin_cell(CELL_SPECIAL);
>                                         report.add("Foo bar");
>         report.finish_report();
>         const char *result =3D report.get_result();
> ---
>  po/Makevars                          |    2 +-
>  src/Makefile.am                      |    4 +
>  src/report/report-formatter-csv.cpp  |  274 ++++++++++++++++++
>  src/report/report-formatter-csv.h    |   89 ++++++
>  src/report/report-formatter-html.cpp |  514 ++++++++++++++++++++++++++++=
++++++
>  src/report/report-formatter-html.h   |  127 +++++++++
>  src/report/report-formatter-null.cpp |  179 ++++++++++++
>  src/report/report-formatter-null.h   |   67 +++++
>  src/report/report-formatter.h        |   63 ++++
>  src/report/report-maker.cpp          |  331 ++++++++++++++++++++++
>  src/report/report-maker.h            |  209 ++++++++++++++
>  11 files changed, 1858 insertions(+), 1 deletions(-)
>  create mode 100644 src/report/report-formatter-csv.cpp
>  create mode 100644 src/report/report-formatter-csv.h
>  create mode 100644 src/report/report-formatter-html.cpp
>  create mode 100644 src/report/report-formatter-html.h
>  create mode 100644 src/report/report-formatter-null.cpp
>  create mode 100644 src/report/report-formatter-null.h
>  create mode 100644 src/report/report-formatter.h
>  create mode 100644 src/report/report-maker.cpp
>  create mode 100644 src/report/report-maker.h
>
> diff --git a/po/Makevars b/po/Makevars
> index f28386a..bbb9ebe 100644
> --- a/po/Makevars
> +++ b/po/Makevars
> @@ -8,7 +8,7 @@ subdir =3D po
>  top_builddir =3D ..
>
>  # These options get passed to xgettext.
> -XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_
> +XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --keyword=3D__
>
>  # This is the copyright holder that gets inserted into the header of the
>  # $(DOMAIN).pot file.  Set this to the copyright holder of the surroundi=
ng
> diff --git a/src/Makefile.am b/src/Makefile.am
> index d233d85..d82dee2 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -30,6 +30,10 @@ powertop_SOURCES =3D parameters/persistent.cpp paramet=
ers/learn.cpp parameters/par
>                 calibrate/calibrate.h measurement/measurement.cpp measure=
ment/power_supply.cpp \
>                 measurement/measurement.h measurement/acpi.cpp measuremen=
t/sysfs.h measurement/sysfs.cpp \
>                 measurement/acpi.h measurement/extech.cpp measurement/pow=
er_supply.h measurement/extech.h \
> +               report/report-maker.cpp report/report-maker.h report/repo=
rt-formatter.h \
> +               report/report-formatter-csv.cpp report/report-formatter-c=
sv.h \
> +               report/report-formatter-html.cpp report/report-formatter-=
html.h \
> +               report/report-formatter-null.cpp report/report-formatter-=
null.h \
>                 main.cpp css.h powertop.css cpu/intel_gpu.cpp
>
>
> diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-form=
atter-csv.cpp
> new file mode 100644
> index 0000000..fc3c1d4
> --- /dev/null
> +++ b/src/report/report-formatter-csv.cpp
> @@ -0,0 +1,274 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * CSV report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#define _BSD_SOURCE
> +
> +#include <stdio.h>
> +#include <stdarg.h>
> +
> +#include "report-formatter-csv.h"
> +
> +static const char report_csv_header[] =3D "PowerTOP Report";
> +
> +/* *********************************************************************=
*** */
> +
> +report_formatter_csv::report_formatter_csv()
> +{
> +       add_doc_header();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::finish_report()
> +{
> +       /* Do nothing special */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_csv::get_result()
> +{
> +       return result.c_str();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::clear_result()
> +{
> +       result.clear();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add(const char *str)
> +{
> +       result +=3D escape_string(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add_exact(const char *str)
> +{
> +       result +=3D std::string(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +#define LINE_SIZE 8192
> +
> +void
> +report_formatter_csv::addv(const char *fmt, va_list ap)
> +{
> +       char str[LINE_SIZE];
> +
> +       vsnprintf(str, sizeof(str), fmt, ap);
> +       add(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::addf(const char *fmt, ...)
> +{
> +       va_list ap;
> +
> +       va_start(ap, fmt);
> +       addv(fmt, ap);
> +       va_end(ap);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add_doc_header()
> +{
> +       add_header(report_csv_header, 1);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add_header(const char *header, int level)
> +{
> +       text_start =3D result.length();
> +       csv_need_quotes =3D false;
> +       addf("%.*s%s%.*s", 4 - level, "***", header, 4 - level, "***");
> +       add_quotes();
> +       add_exact("\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::begin_section(section_type stype)
> +{
> +       /* Do nothing special */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::end_section()
> +{
> +       /* Do nothing special */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::begin_table(table_type ttype)
> +{
> +       add_exact("\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::end_table()
> +{
> +       add_exact("\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::begin_row(row_type rtype)
> +{
> +       table_cell_number =3D 0;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::end_row()
> +{
> +       add_exact("\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::begin_cell(cell_type ctype)
> +{
> +       if (table_cell_number > 0)
> +#ifdef REPORT_CSV_ADD_SPACE
> +               add_exact(", ");
> +#else /* !REPORT_CSV_ADD_SPACE */
> +               add_exact(",");
> +#endif /* !REPORT_CSV_ADD_SPACE */
> +
> +       text_start =3D result.length();
> +       csv_need_quotes =3D false;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add_quotes()
> +{
> +#ifdef REPORT_CSV_ESCAPE_EMPTY
> +       if (csv_need_quotes || result.length() =3D=3D text_start) {
> +#else /* !REPORT_CSV_ESCAPE_EMPTY */
> +       if (csv_need_quotes)
> +#endif /* !REPORT_CSV_ESCAPE_EMPTY */
> +               result.insert(text_start, "\"");
> +               add_exact("\"");
> +       }
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::end_cell()
> +{
> +       add_quotes();
> +       table_cell_number++;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::add_empty_cell()
> +{
> +       /* Do nothing special */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::begin_paragraph()
> +{
> +       text_start =3D result.length();
> +       csv_need_quotes =3D false;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::end_paragraph()
> +{
> +       add_quotes();
> +       add_exact("\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +std::string
> +report_formatter_csv::escape_string(const char *str)
> +{
> +       std::string res;
> +
> +       if (!str)
> +               return "";
> +
> +       for (const char *i =3D str; *i; i++) {
> +               switch (*i) {
> +                       case '"':
> +                               res +=3D '"';
> +                       case ' ':
> +                       case ',':
> +                       case '\n':
> +                               csv_need_quotes =3D true;
> +                               break;
> +               }
> +
> +               res +=3D *i;
> +       }
> +
> +       return res;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_csv::set_cpu_number(int nr UNUSED)
> +{
> +       /* Do nothing */
> +}
> diff --git a/src/report/report-formatter-csv.h b/src/report/report-format=
ter-csv.h
> new file mode 100644
> index 0000000..27b74f0
> --- /dev/null
> +++ b/src/report/report-formatter-csv.h
> @@ -0,0 +1,89 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * CSV report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#ifndef __REPORT_FORMATTER_CSV_H__
> +#define __REPORT_FORMATTER_CSV_H__
> +
> +#include <string>
> +
> +#include "report-formatter.h"
> +
> +/* "a,b,c" vs "a, b, c" */
> +#define REPORT_CSV_ADD_SPACE
> +
> +/* Whether to escape with quotes empty cell values */
> +#define REPORT_CSV_ESCAPE_EMPTY
> +
> +/* *********************************************************************=
*** */
> +
> +class report_formatter_csv: public report_formatter
> +{
> +public:
> +       report_formatter_csv();
> +
> +       /* Implementing report_formatter interface */
> +       void finish_report();
> +       const char *get_result();
> +       void clear_result();
> +
> +       void add(const char *str);
> +       void addv(const char *fmt, va_list ap);
> +
> +       void add_header(const char *header, int level);
> +
> +       void begin_section(section_type stype);
> +       void end_section();
> +
> +       void begin_table(table_type ttype);
> +       void end_table();
> +
> +       void begin_row(row_type rtype);
> +       void end_row();
> +
> +       void begin_cell(cell_type ctype);
> +       void end_cell();
> +       void add_empty_cell();
> +
> +       void begin_paragraph();
> +       void end_paragraph();
> +
> +       void set_cpu_number(int nr);
> +
> +private:
> +       std::string escape_string(const char *str);
> +
> +       void add_doc_header();
> +
> +       void add_exact(const char *str);
> +       void addf(const char *fmt, ...)
> +                               __attribute__ ((format (printf, 2, 3)));
> +       void add_quotes();
> +
> +       std::string result;
> +       bool csv_need_quotes;
> +       size_t table_cell_number, text_start;
> +};
> +
> +#endif /* __REPORT_FORMATTER_CSV_H__ */
> diff --git a/src/report/report-formatter-html.cpp b/src/report/report-for=
matter-html.cpp
> new file mode 100644
> index 0000000..9f9cd32
> --- /dev/null
> +++ b/src/report/report-formatter-html.cpp
> @@ -0,0 +1,514 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * HTML report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#define _BSD_SOURCE
> +
> +#include <stdio.h>
> +#include <stdarg.h>
> +
> +#include "report-formatter-html.h"
> +#include "css.h" /* For HTML-report header */
> +
> +/* *********************************************************************=
*** */
> +
> +#ifdef EXTERNAL_CSS_FILE /* Where is it defined? */
> +static const char report_html_alternative_head[] =3D
> +       "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"=
 "
> +               "\"http://www.w3.org/TR/html4/loose.dtd\">\n"
> +       "<html>\n"
> +       "<head>\n"
> +       "<title>PowerTOP report</title>\n"
> +       "<link rel=3D\"stylesheet\" href=3D\"powertop.css\">\n"
> +       "</head>\n"
> +       "<body>\n";
> +#endif /* EXTERNAL_CSS_FILE */
> +
> +/* *********************************************************************=
*** */
> +
> +static const char report_html_footer[] =3D
> +       "</body>\n"
> +       "</html>\n";
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::init_markup()
> +{
> +       /*          stype               id */
> +       set_section(SECTION_DEFAULT);
> +       set_section(SECTION_SYSINFO,    "system");
> +       set_section(SECTION_CPUIDLE,    "cpuidle");
> +       set_section(SECTION_CPUFREQ,    "cpufreq");
> +       set_section(SECTION_DEVPOWER,   "device");
> +       set_section(SECTION_SOFTWARE,   "software");
> +       set_section(SECTION_SUMMARY,    "summary");
> +       set_section(SECTION_TUNING,     "tuning");
> +
> +       /*        ttype          width */
> +       set_table(TABLE_DEFAULT, "");
> +       set_table(TABLE_WIDE,    "100%");
> +
> +       /*       ctype                          is_header, width, colspan=
 */
> +       set_cell(CELL_DEFAULT);
> +       set_cell(CELL_SEPARATOR,                false,  "2%");
> +       set_cell(CELL_SYSINFO,                  false,  "20%");
> +       set_cell(CELL_FIRST_PACKAGE_HEADER,     true,   "25%",  2);
> +       set_cell(CELL_EMPTY_PACKAGE_HEADER,     true,   "",     2);
> +       set_cell(CELL_CORE_HEADER,              true,   "25%",  2);
> +       set_cell(CELL_CPU_HEADER,               true,   "",     2);
> +       set_cell(CELL_STATE_NAME,               false,  "10%");
> +       set_cell(CELL_EMPTY_PACKAGE_STATE,      false,  "",     2);
> +       set_cell(CELL_PACKAGE_STATE_VALUE);
> +       set_cell(CELL_CORE_STATE_VALUE);
> +       set_cell(CELL_CPU_STATE_VALUE);
> +       set_cell(CELL_DEVPOWER_HEADER,          true,   "10%");
> +       set_cell(CELL_DEVPOWER_DEV_NAME,        true);
> +       set_cell(CELL_DEVPOWER_POWER);
> +       set_cell(CELL_DEVPOWER_UTIL);
> +       set_cell(CELL_DEVACTIVITY_PROCESS,      true,   "40%");
> +       set_cell(CELL_DEVACTIVITY_DEVICE,       true);
> +       set_cell(CELL_SOFTWARE_HEADER,          true,   "10%");
> +       set_cell(CELL_SOFTWARE_PROCESS,         true,   "10%");
> +       set_cell(CELL_SOFTWARE_DESCRIPTION,     true);
> +       set_cell(CELL_SOFTWARE_POWER);
> +       set_cell(CELL_SUMMARY_HEADER,           true,   "10%");
> +       set_cell(CELL_SUMMARY_CATEGORY,         true,   "10%");
> +       set_cell(CELL_SUMMARY_DESCRIPTION,      true);
> +       set_cell(CELL_SUMMARY_ITEM);
> +       set_cell(CELL_TUNABLE_HEADER,           true);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_html::get_row_style(row_type rtype)
> +{
> +       switch (rtype) {
> +               case ROW_SYSINFO:
> +                       return get_style_pair("system_even", "system_odd"=
);
> +               case ROW_DEVPOWER:
> +                       return get_style_pair("device_even", "device_odd"=
);
> +               case ROW_SOFTWARE:
> +               case ROW_SUMMARY:
> +                       return get_style_pair("process_even", "process_od=
d");
> +               case ROW_TUNABLE:
> +                       return get_style_pair("tunable_even", "tunable_od=
d");
> +               case ROW_TUNABLE_BAD:
> +                       return get_style_pair("tunable_even_bad",
> +                                                          "tunable_odd_b=
ad");
> +               default:
> +                       return "";
> +       };
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_html::get_cell_style(cell_type ctype)
> +{
> +       switch (ctype) {
> +               case CELL_FIRST_PACKAGE_HEADER:
> +               case CELL_EMPTY_PACKAGE_HEADER:
> +                       return "package_header";
> +               case CELL_CORE_HEADER:
> +                       return "core_header";
> +               case CELL_CPU_HEADER:
> +                       return "cpu_header";
> +               case CELL_STATE_NAME:
> +                       return get_style_pair("cpu_even_freq",
> +                                             "cpu_odd_freq");
> +               case CELL_PACKAGE_STATE_VALUE:
> +                       return get_style_pair("package_even",
> +                                             "package_odd");
> +               case CELL_CORE_STATE_VALUE:
> +                       return get_style_pair("core_even",
> +                                             "core_odd");
> +               case CELL_CPU_STATE_VALUE:
> +                       return get_style_quad("cpu_even_even", "cpu_even_=
odd",
> +                                             "cpu_odd_even", "cpu_odd_od=
d",
> +                                             cpu_nr);
> +               case CELL_DEVPOWER_DEV_NAME:
> +               case CELL_DEVACTIVITY_PROCESS:
> +               case CELL_DEVACTIVITY_DEVICE:
> +                       return "device";
> +               case CELL_DEVPOWER_POWER:
> +                       return "device_power";
> +               case CELL_DEVPOWER_UTIL:
> +                       return "device_util";
> +               case CELL_SOFTWARE_PROCESS:
> +               case CELL_SOFTWARE_DESCRIPTION:
> +               case CELL_SUMMARY_CATEGORY:
> +               case CELL_SUMMARY_DESCRIPTION:
> +                       return "process";
> +               case CELL_SOFTWARE_POWER:
> +               case CELL_SUMMARY_ITEM:
> +                       return "process_power";
> +               case CELL_TUNABLE_HEADER:
> +                       return "tunable";
> +               default:
> +                       return "";
> +       };
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +report_formatter_html::report_formatter_html()
> +{
> +       init_markup();
> +       add_doc_header();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_html::get_style_pair(const char *even, const char *odd)
> +{
> +       if (!(table_row_number & 1) && even)
> +               return even;
> +
> +       if ((table_row_number & 1) && odd)
> +               return odd;
> +
> +       return "";
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_html::get_style_quad(const char *even_even,
> +                                  const char *even_odd, const char *odd_=
even,
> +                                  const char *odd_odd, int alt_cell_numb=
er)
> +{
> +       int cell;
> +
> +       cell =3D (alt_cell_number !=3D -1 ? alt_cell_number : table_cell_=
number);
> +       if (!(table_row_number & 1) && !(cell & 1) && even_even)
> +               return even_even;
> +
> +       if (!(table_row_number & 1) && (cell & 1) && even_odd)
> +               return even_odd;
> +
> +       if ((table_row_number & 1) && !(cell & 1) && odd_even)
> +               return odd_even;
> +
> +       if ((table_row_number & 1) && (cell & 1) && odd_odd)
> +               return odd_odd;
> +
> +       return "";
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::finish_report()
> +{
> +       add_doc_footer();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_html::get_result()
> +{
> +       return result.c_str();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::clear_result()
> +{
> +       result.clear();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::set_section(section_type stype, const char *id)
> +{
> +       sections[stype].id =3D id;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::set_table(table_type ttype, const char *width)
> +{
> +       tables[ttype].width =3D width;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::set_cell(cell_type ctype, bool is_header,
> +                            const char *width, int colspan)
> +{
> +       cells[ctype].is_header =3D is_header;
> +       cells[ctype].width     =3D width;
> +       cells[ctype].colspan   =3D colspan;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add(const char *str)
> +{
> +       result +=3D escape_string(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add_exact(const char *str)
> +{
> +       result +=3D std::string(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +#define LINE_SIZE 8192
> +
> +void
> +report_formatter_html::addv(const char *fmt, va_list ap)
> +{
> +       char str[LINE_SIZE];
> +
> +       vsnprintf(str, sizeof(str), fmt, ap);
> +       add(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::addf_exact(const char *fmt, ...)
> +{
> +       char str[LINE_SIZE];
> +       va_list ap;
> +
> +       va_start(ap, fmt);
> +       vsnprintf(str, sizeof(str), fmt, ap);
> +       add_exact(str);
> +       va_end(ap);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add_doc_header()
> +{
> +#ifdef EXTERNAL_CSS_FILE /* Where is it defined? */
> +       add_exact(report_html_alternative_head);
> +#else /* !EXTERNAL_CSS_FILE */
> +       add_exact(css);
> +#endif /* !EXTERNAL_CSS_FILE */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add_doc_footer()
> +{
> +       add_exact(report_html_footer);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add_header(const char *header, int level)
> +{
> +       addf_exact("<h%d>", level);
> +       add(header);
> +       addf_exact("</h%d>\n", level);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::begin_section(section_type stype)
> +{
> +       if (sections[stype].id[0])
> +               addf_exact("<div id=3D\"%s\">", sections[stype].id);
> +       else
> +               add_exact("<div>");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::end_section()
> +{
> +       add_exact("</div>\n\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::begin_table(table_type ttype)
> +{
> +       table_row_number =3D 0;
> +       add_exact("<table");
> +       if (tables[ttype].width[0])
> +               addf_exact(" width=3D\"%s\"", tables[ttype].width);
> +
> +       add_exact(">\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::end_table()
> +{
> +       add_exact("</table>\n\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::begin_row(row_type rtype)
> +{
> +       const char *row_style;
> +
> +       table_cell_number =3D 0;
> +       add_exact("<tr");
> +       row_style =3D get_row_style(rtype);
> +       if (row_style[0])
> +               addf_exact(" class=3D\"%s\"", row_style);
> +
> +       add_exact(">\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::end_row()
> +{
> +       add_exact("</tr>\n");
> +       table_row_number++;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::begin_cell(cell_type ctype)
> +{
> +       const char *cell_style;
> +
> +       current_cell =3D ctype;
> +       if (cells[ctype].is_header)
> +               add_exact("\t<th");
> +       else
> +               add_exact("\t<td");
> +
> +       if (cells[ctype].width[0])
> +               addf_exact(" width=3D\"%s\"", cells[ctype].width);
> +
> +       if (cells[ctype].colspan > 1)
> +               addf_exact(" colspan=3D\"%d\"", cells[ctype].colspan);
> +
> +       cell_style =3D get_cell_style(ctype);
> +       if (cell_style[0])
> +               addf_exact(" class=3D\"%s\"", cell_style);
> +
> +       add_exact(">");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::end_cell()
> +{
> +       if (!cells[current_cell].is_header)
> +               add_exact("</td>\n");
> +       else
> +               add_exact("</th>\n");
> +
> +       table_cell_number++;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::add_empty_cell()
> +{
> +       add_exact("&nbsp;");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::begin_paragraph()
> +{
> +       add_exact("<p>");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::end_paragraph()
> +{
> +       add_exact("</p>\n");
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +std::string
> +report_formatter_html::escape_string(const char *str)
> +{
> +       std::string res;
> +
> +       for (const char *i =3D str; *i; i++) {
> +               switch (*i) {
> +                       case '<':
> +                               res +=3D "&lt;";
> +                               continue;
> +                       case '>':
> +                               res +=3D "&gt;";
> +                               continue;
> +                       case '&':
> +                               res +=3D "&amp;";
> +                               continue;
> +#ifdef REPORT_HTML_ESCAPE_QUOTES
> +                       case '"':
> +                               res +=3D "&quot;";
> +                               continue;
> +                       case '\'':
> +                               res +=3D "&apos;";
> +                               continue;
> +#endif /* REPORT_HTML_ESCAPE_QUOTES */
> +               }
> +
> +               res +=3D *i;
> +       }
> +
> +       return res;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_html::set_cpu_number(int nr)
> +{
> +       cpu_nr =3D nr;
> +}
> diff --git a/src/report/report-formatter-html.h b/src/report/report-forma=
tter-html.h
> new file mode 100644
> index 0000000..6123da5
> --- /dev/null
> +++ b/src/report/report-formatter-html.h
> @@ -0,0 +1,127 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * HTML report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#ifndef __REPORT_FORMATTER_HTML_H__
> +#define __REPORT_FORMATTER_HTML_H__
> +
> +#include <string>
> +
> +#include "report-formatter.h"
> +
> +/* Whether to replace " and ' in HTML by &quot; and &apos; respectively =
*/
> +/*#define REPORT_HTML_ESCAPE_QUOTES*/
> +
> +/* *********************************************************************=
*** */
> +
> +struct html_section {
> +       const char *id;
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +struct html_table {
> +       const char *width;
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +struct html_cell {
> +       bool is_header;
> +       const char *width;
> +       int colspan;
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +class report_formatter_html: public report_formatter
> +{
> +public:
> +       report_formatter_html();
> +
> +       /* Implementing report_formatter interface */
> +       void finish_report();
> +       const char *get_result();
> +       void clear_result();
> +
> +       void add(const char *str);
> +       void addv(const char *fmt, va_list ap);
> +
> +       void add_header(const char *header, int level);
> +
> +       void begin_section(section_type stype);
> +       void end_section();
> +
> +       void begin_table(table_type ttype);
> +       void end_table();
> +
> +       void begin_row(row_type rtype);
> +       void end_row();
> +
> +       void begin_cell(cell_type ctype);
> +       void end_cell();
> +       void add_empty_cell();
> +
> +       void begin_paragraph();
> +       void end_paragraph();
> +
> +       void set_cpu_number(int nr);
> +
> +private:
> +       /* Document structure related functions */
> +       void init_markup();
> +       void set_section(section_type stype, const char *id =3D "");
> +       void set_table(table_type ttype, const char *width =3D "");
> +       void set_cell(cell_type ctype, bool is_header =3D false,
> +                       const char *width =3D "", int colspan =3D 1);
> +
> +       /* HTML table elements CSS classes */
> +       const char *get_cell_style(cell_type ctype);
> +       const char *get_row_style(row_type rtype);
> +       const char *get_style_pair(const char *even, const char *odd);
> +       const char *get_style_quad(const char *even_even,
> +                                  const char *even_odd,
> +                                  const char *odd_even,
> +                                  const char *odd_odd,
> +                                  int alt_cell_number =3D -1);
> +
> +       std::string escape_string(const char *str);
> +
> +       void add_doc_header();
> +       void add_doc_footer();
> +
> +       void add_exact(const char *str);
> +       void addf_exact(const char *fmt, ...)
> +                               __attribute__ ((format (printf, 2, 3)));
> +
> +       std::string result;
> +       html_section sections[SECTION_MAX];
> +       html_table tables[TABLE_MAX];
> +       html_cell cells[CELL_MAX];
> +       size_t table_row_number, table_cell_number;
> +       cell_type current_cell;
> +       int cpu_nr;
> +};
> +
> +#endif /* __REPORT_FORMATTER_HTML_H__ */
> diff --git a/src/report/report-formatter-null.cpp b/src/report/report-for=
matter-null.cpp
> new file mode 100644
> index 0000000..22da7a0
> --- /dev/null
> +++ b/src/report/report-formatter-null.cpp
> @@ -0,0 +1,179 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * Null report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#include <stdarg.h>
> +
> +#include "report-formatter-null.h"
> +
> +/* *********************************************************************=
*** */
> +
> +report_formatter_null::report_formatter_null()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::finish_report()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_formatter_null::get_result()
> +{
> +       return "";
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::clear_result()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::add(const char *str UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::addv(const char *fmt UNUSED, va_list ap UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::add_header(const char *header UNUSED, int level U=
NUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::begin_section(section_type stype UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::end_section()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::begin_table(table_type ttype UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::end_table()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::begin_row(row_type rtype UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::end_row()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::begin_cell(cell_type ctype UNUSED)
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::end_cell()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::add_empty_cell()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::begin_paragraph()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::end_paragraph()
> +{
> +       /* Do nothing */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_formatter_null::set_cpu_number(int nr UNUSED)
> +{
> +       /* Do nothing */
> +}
> diff --git a/src/report/report-formatter-null.h b/src/report/report-forma=
tter-null.h
> new file mode 100644
> index 0000000..95e1a32
> --- /dev/null
> +++ b/src/report/report-formatter-null.h
> @@ -0,0 +1,67 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * Null report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#ifndef __REPORT_FORMATTER_NULL_H__
> +#define __REPORT_FORMATTER_NULL_H__
> +
> +#include "report-formatter.h"
> +
> +/* *********************************************************************=
*** */
> +
> +class report_formatter_null: public report_formatter
> +{
> +public:
> +       report_formatter_null();
> +
> +       /* Implementing report_formatter interface */
> +       void finish_report();
> +       const char *get_result();
> +       void clear_result();
> +
> +       void add(const char *str);
> +       void addv(const char *fmt, va_list ap);
> +
> +       void add_header(const char *header, int level);
> +
> +       void begin_section(section_type stype);
> +       void end_section();
> +
> +       void begin_table(table_type ttype);
> +       void end_table();
> +
> +       void begin_row(row_type rtype);
> +       void end_row();
> +
> +       void begin_cell(cell_type ctype);
> +       void end_cell();
> +       void add_empty_cell();
> +
> +       void begin_paragraph();
> +       void end_paragraph();
> +
> +       void set_cpu_number(int nr);
> +};
> +
> +#endif /* __REPORT_FORMATTER_NULL_H__ */
> diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
> new file mode 100644
> index 0000000..14f991b
> --- /dev/null
> +++ b/src/report/report-formatter.h
> @@ -0,0 +1,63 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * report_formatter interface.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#ifndef __REPORT_FORMATTER_H__
> +#define __REPORT_FORMATTER_H__
> +
> +#include "report-maker.h"
> +
> +class report_formatter /* Interface */
> +{
> +public:
> +       virtual void finish_report() =3D 0;
> +       virtual const char *get_result() =3D 0;
> +       virtual void clear_result() =3D 0;
> +
> +       virtual void add(const char *str) =3D 0;
> +       virtual void addv(const char *fmt, va_list ap) =3D 0;
> +
> +       virtual void add_header(const char *header, int level) =3D 0;
> +
> +       virtual void begin_section(section_type stype) =3D 0;
> +       virtual void end_section() =3D 0;
> +
> +       virtual void begin_table(table_type ttype) =3D 0;
> +       virtual void end_table() =3D 0;
> +
> +       virtual void begin_row(row_type rtype) =3D 0;
> +       virtual void end_row() =3D 0;
> +
> +       virtual void begin_cell(cell_type ctype) =3D 0;
> +       virtual void end_cell() =3D 0;
> +       virtual void add_empty_cell() =3D 0;
> +
> +       virtual void begin_paragraph() =3D 0;
> +       virtual void end_paragraph() =3D 0;
> +
> +       /* For quad-colouring CPU tables in HTML */
> +       virtual void set_cpu_number(int nr) =3D 0;
> +};
> +
> +#endif /* __REPORT_FORMATTER_H__ */
> diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
> new file mode 100644
> index 0000000..4a68a8c
> --- /dev/null
> +++ b/src/report/report-maker.cpp
> @@ -0,0 +1,331 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * Generic report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#define NDEBUG /* Enable asserts */
> +
> +#include <assert.h>
> +#include <stdarg.h>
> +
> +#include "report-maker.h"
> +#include "report-formatter-csv.h"
> +#include "report-formatter-html.h"
> +#include "report-formatter-null.h"
> +
> +/* *********************************************************************=
*** */
> +
> +report_maker::report_maker(report_type t)
> +{
> +       type =3D t;
> +       formatter =3D NULL;
> +       setup_report_formatter();
> +       clear_result(); /* To reset state and add document header */
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +report_maker::~report_maker()
> +{
> +       if (formatter)
> +               delete formatter;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::finish_report()
> +{
> +       if (section_opened)
> +               end_section();
> +
> +       formatter->finish_report();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +const char *
> +report_maker::get_result()
> +{
> +       return formatter->get_result();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::clear_result()
> +{
> +       formatter->clear_result();
> +       section_opened   =3D false;
> +       table_opened     =3D false;
> +       cell_opened      =3D false;
> +       row_opened       =3D false;
> +       paragraph_opened =3D false;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +report_type
> +report_maker::get_type()
> +{
> +       return type;
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::set_type(report_type t)
> +{
> +       clear_result();
> +       type =3D t;
> +       setup_report_formatter();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::setup_report_formatter()
> +{
> +       if (formatter)
> +               delete formatter;
> +
> +       if (type =3D=3D REPORT_HTML)
> +               formatter =3D new report_formatter_html();
> +       else if (type =3D=3D REPORT_CSV)
> +               formatter =3D new report_formatter_csv();
> +       else if (type =3D=3D REPORT_OFF)
> +               formatter =3D new report_formatter_null();
> +       else
> +               assert(false);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::add(const char *str)
> +{
> +       assert(str);
> +       assert(section_opened);
> +
> +       formatter->add(str);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::addf(const char *fmt, ...)
> +{
> +       va_list ap;
> +
> +       assert(fmt);
> +       assert(section_opened);
> +
> +       va_start(ap, fmt);
> +       formatter->addv(fmt, ap);
> +       va_end(ap);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::add_header(const char *header, int level)
> +{
> +       assert(header);
> +       assert(section_opened);
> +       assert(level > 0 && level < 4);
> +
> +       if (table_opened)
> +               end_table();
> +       else if (paragraph_opened)
> +               end_paragraph();
> +
> +       formatter->add_header(header, level);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::begin_section(section_type stype)
> +{
> +       assert(stype >=3D 0 && stype < SECTION_MAX);
> +
> +       if (section_opened)
> +               end_section(); /* Close previous */
> +
> +       section_opened =3D true;
> +       formatter->begin_section(stype);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::end_section()
> +{
> +       assert(section_opened);
> +
> +       if (table_opened)
> +               end_table();
> +       else if (paragraph_opened)
> +               end_paragraph();
> +
> +       section_opened =3D false;
> +       formatter->end_section();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::begin_table(table_type ttype)
> +{
> +       assert(ttype >=3D 0 && ttype < TABLE_MAX);
> +       assert(section_opened);
> +
> +       if (table_opened)
> +               end_table(); /* Close previous */
> +       else if (paragraph_opened)
> +               end_paragraph();
> +
> +       table_opened =3D true;
> +       formatter->begin_table(ttype);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::end_table()
> +{
> +       assert(section_opened);
> +       assert(table_opened);
> +
> +       if (row_opened)
> +               end_row();
> +
> +       table_opened =3D false;
> +       formatter->end_table();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::begin_row(row_type rtype)
> +{
> +       assert(section_opened);
> +       assert(table_opened);
> +       assert(rtype >=3D 0 && rtype < ROW_MAX);
> +
> +       if (row_opened)
> +               end_row(); /* Close previous */
> +
> +       row_opened =3D true;
> +       formatter->begin_row(rtype);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::end_row()
> +{
> +       assert(section_opened);
> +       assert(table_opened);
> +       assert(row_opened);
> +
> +       if (cell_opened)
> +               end_cell();
> +
> +       row_opened =3D false;
> +       formatter->end_row();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::begin_cell(cell_type ctype)
> +{
> +       assert(section_opened);
> +       assert(table_opened);
> +       assert(row_opened);
> +       assert(ctype >=3D 0 && ctype < CELL_MAX);
> +
> +       if (cell_opened)
> +               end_cell(); /* Close previous */
> +
> +       cell_opened =3D true;
> +       formatter->begin_cell(ctype);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::end_cell()
> +{
> +       assert(section_opened);
> +       assert(table_opened);
> +       assert(row_opened);
> +       assert(cell_opened);
> +
> +       cell_opened =3D false;
> +       formatter->end_cell();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::add_empty_cell()
> +{
> +       formatter->add_empty_cell();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::set_cpu_number(int nr)
> +{
> +       formatter->set_cpu_number(nr);
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::begin_paragraph()
> +{
> +       assert(section_opened);
> +
> +       if (table_opened)
> +               end_table();
> +       else if (paragraph_opened)
> +               end_paragraph(); /* Close previous */
> +
> +       paragraph_opened =3D true;
> +       formatter->begin_paragraph();
> +}
> +
> +/* *********************************************************************=
*** */
> +
> +void
> +report_maker::end_paragraph()
> +{
> +       assert(paragraph_opened);
> +
> +       paragraph_opened =3D false;
> +       formatter->end_paragraph();
> +}
> diff --git a/src/report/report-maker.h b/src/report/report-maker.h
> new file mode 100644
> index 0000000..9faad73
> --- /dev/null
> +++ b/src/report/report-maker.h
> @@ -0,0 +1,209 @@
> +/* Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + *     http://www.samsung.com/
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * Generic report generator.
> + * Written by Igor Zhbanov <i.zhbanov(a)samsung.com>
> + * 2012.10 */
> +
> +#ifndef __REPORT_MAKER_H__
> +#define __REPORT_MAKER_H__
> +
> +/* This report generator implements the following document structure:
> + *     body
> + *       \---> section
> + *               |---> header
> + *               |---> paragraph
> + *               \---> table
> + *                       \---> table row
> + *                               \---> table cell
> + *
> + * The report body consists of a number of sections (a.k.a. <div>s,
> + * a.k.a. tabs).
> + * Each section can contain headers (<h1>, <h2>, <h3>), paragraphs (<p>)
> + * and tables (<table>).
> + *
> + * A header is a single line of text.
> + *
> + * Paragraphs can contain only text.
> + *
> + * A table consists of table rows. A table row consists of table cells.
> + * A table cell can contain only text.
> + *
> + * Each section, table, row or cell could have its own formatting.
> + * To distinguish elements from others of its type, each element could h=
ave
> + * an unique identifier (see enums section_type, table_type, row_type and
> + * cell_type below). These identifiers are used in formatter implementat=
ions
> + * to produce special formatting.
> + *
> + * Example of usage:
> + *     report_maker report(REPORT_OFF);
> + *
> + *     report.set_type(REPORT_HTML);
> + *     report.begin_section();
> + *             report.add_header("Big report");
> + *             report.begin_paragraph("Some text");
> + *             report.begin_table();
> + *                     report.begin_row();
> + *                             report.begin_cell();
> + *                                     report.add("Something");
> + *                             report.begin_cell(CELL_SPECIAL);
> + *                                     report.add("Foo bar");
> + *     report.finish_report();
> + *     const char *result =3D report.get_result();
> + */
> +
> +#include <stdarg.h>
> +
> +#include <string>
> +
> +/* Conditional gettext. We need original strings for CSV. */
> +#define __(STRING) \
> +       ((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRIN=
G))
> +
> +#ifndef UNUSED
> +#define UNUSED __attribute__((unused))
> +#endif /* UNUSED */
> +
> +/* *********************************************************************=
*** */
> +
> +enum report_type {
> +       REPORT_OFF,
> +       REPORT_HTML,
> +       REPORT_CSV
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +enum section_type {
> +       SECTION_DEFAULT,
> +       SECTION_SYSINFO,
> +       SECTION_CPUIDLE,
> +       SECTION_CPUFREQ,
> +       SECTION_DEVPOWER,
> +       SECTION_SOFTWARE,
> +       SECTION_SUMMARY,
> +       SECTION_TUNING,
> +       SECTION_MAX /* Must be last in this enum */
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +enum table_type {
> +       TABLE_DEFAULT,
> +       TABLE_WIDE,
> +       TABLE_MAX /* Must be last in this enum */
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +enum row_type {
> +       ROW_DEFAULT,
> +       ROW_SYSINFO,
> +       ROW_DEVPOWER,
> +       ROW_SOFTWARE,
> +       ROW_SUMMARY,
> +       ROW_TUNABLE,
> +       ROW_TUNABLE_BAD,
> +       ROW_MAX /* Must be last in this enum */
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +enum cell_type {
> +       CELL_DEFAULT,
> +       CELL_SYSINFO,
> +       CELL_FIRST_PACKAGE_HEADER,
> +       CELL_EMPTY_PACKAGE_HEADER,
> +       CELL_CORE_HEADER,
> +       CELL_CPU_HEADER,
> +       CELL_STATE_NAME,
> +       CELL_EMPTY_PACKAGE_STATE,
> +       CELL_PACKAGE_STATE_VALUE,
> +       CELL_CORE_STATE_VALUE,
> +       CELL_CPU_STATE_VALUE,
> +       CELL_SEPARATOR,
> +       CELL_DEVPOWER_HEADER,
> +       CELL_DEVPOWER_DEV_NAME,
> +       CELL_DEVPOWER_POWER,
> +       CELL_DEVPOWER_UTIL,
> +       CELL_DEVACTIVITY_PROCESS,
> +       CELL_DEVACTIVITY_DEVICE,
> +       CELL_SOFTWARE_HEADER,
> +       CELL_SOFTWARE_PROCESS,
> +       CELL_SOFTWARE_DESCRIPTION,
> +       CELL_SOFTWARE_POWER,
> +       CELL_SUMMARY_HEADER,
> +       CELL_SUMMARY_CATEGORY,
> +       CELL_SUMMARY_DESCRIPTION,
> +       CELL_SUMMARY_ITEM,
> +       CELL_TUNABLE_HEADER,
> +       CELL_UNTUNABLE_HEADER,
> +       CELL_MAX /* Must be last in this enum */
> +};
> +
> +/* *********************************************************************=
*** */
> +
> +class report_formatter;
> +
> +class report_maker
> +{
> +public:
> +       report_maker(report_type t);
> +       ~report_maker();
> +
> +       report_type get_type();
> +       void set_type(report_type t);
> +
> +       void addf(const char *fmt, ...)
> +                               __attribute__ ((format (printf, 2, 3)));
> +
> +       void finish_report();
> +       const char *get_result();
> +       void clear_result();
> +
> +       void add(const char *str);
> +
> +       void add_header(const char *header, int level =3D 2);
> +       void begin_section(section_type stype =3D SECTION_DEFAULT);
> +       void begin_table(table_type ttype =3D TABLE_DEFAULT);
> +       void begin_row(row_type rtype =3D ROW_DEFAULT);
> +       void begin_cell(cell_type ctype =3D CELL_DEFAULT);
> +       void add_empty_cell();
> +       void begin_paragraph();
> +
> +       void set_cpu_number(int nr);
> +
> +private:
> +       void setup_report_formatter();
> +
> +       void end_section();
> +       void end_table();
> +       void end_row();
> +       void end_cell();
> +       void end_paragraph();
> +
> +       report_type type;
> +       report_formatter *formatter;
> +       bool cell_opened, row_opened, table_opened, section_opened,
> +            paragraph_opened;
> +};
> +
> +#endif /* __REPORT_MAKER_H__ */
> --
> 1.7.5.4
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============6226983628231603702==--

