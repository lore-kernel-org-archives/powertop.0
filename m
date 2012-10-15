Content-Type: multipart/mixed; boundary="===============2188467105675811417=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] fix typo and correct coding styles in
 report_formatter
Date: Mon, 15 Oct 2012 02:25:46 -0700
Message-ID: <20121015092546.GA3140@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2188467105675811417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[PATCH] fix typo and correct coding styles in report_formatter

Igor noted a typo and coding styles errors in previous patch, correct them.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/report/report-formatter.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 7f9f544..d532f30 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -33,33 +33,33 @@ class report_formatter
 public:
 	virtual ~report_formatter() {}
 =

-	virtual void finish_report() {};
-	virtual const char *get_result() {return "Basic report_formatter::get_res=
ul call\n";};
-	virtual void clear_result() {};
+	virtual void finish_report() {}
+	virtual const char *get_result() {return "Basic report_formatter::get_res=
ult() call\n";}
+	virtual void clear_result() {}
 =

-	virtual void add(const char *str) {};
-	virtual void addv(const char *fmt, va_list ap) {};
+	virtual void add(const char *str) {}
+	virtual void addv(const char *fmt, va_list ap) {}
 =

-	virtual void add_header(const char *header, int level) {};
+	virtual void add_header(const char *header, int level) {}
 =

-	virtual void begin_section(section_type stype) {};
-	virtual void end_section() {};
+	virtual void begin_section(section_type stype) {}
+	virtual void end_section() {}
 =

-	virtual void begin_table(table_type ttype) {};
-	virtual void end_table() {};
+	virtual void begin_table(table_type ttype) {}
+	virtual void end_table() {}
 =

-	virtual void begin_row(row_type rtype) {};
-	virtual void end_row() {};
+	virtual void begin_row(row_type rtype) {}
+	virtual void end_row() {}
 =

-	virtual void begin_cell(cell_type ctype) {};
-	virtual void end_cell() {};
-	virtual void add_empty_cell() {};
+	virtual void begin_cell(cell_type ctype) {}
+	virtual void end_cell() {}
+	virtual void add_empty_cell() {}
 =

-	virtual void begin_paragraph() {};
-	virtual void end_paragraph() {};
+	virtual void begin_paragraph() {}
+	virtual void end_paragraph() {}
 =

 	/* For quad-colouring CPU tables in HTML */
-	virtual void set_cpu_number(int nr) {};
+	virtual void set_cpu_number(int nr) {}
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */


--===============2188467105675811417==--

