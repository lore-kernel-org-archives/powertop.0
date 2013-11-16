Content-Type: multipart/mixed; boundary="===============8681798054309122758=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 11/31] report-csv: modular table
Date: Fri, 15 Nov 2013 16:28:58 -0800
Message-ID: <1384561758-21516-12-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8681798054309122758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generates a modular table to the csv report using the table_size and a
set of data stored in a single dimensional array stored in row major
order.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter-csv.cpp |   28 ++++++++++++++++++++++++++++
 src/report/report-formatter-csv.h   |    2 ++
 2 files changed, 30 insertions(+)

diff --git a/src/report/report-formatter-csv.cpp b/src/report/report-format=
ter-csv.cpp
index 2981940..b9336ad 100644
--- a/src/report/report-formatter-csv.cpp
+++ b/src/report/report-formatter-csv.cpp
@@ -33,6 +33,7 @@
 #include <stdarg.h>
 =

 #include "report-formatter-csv.h"
+#include "report-data-html.h"
 =

 static const char report_csv_header[] =3D "PowerTOP Report";
 =

@@ -279,3 +280,30 @@ report_formatter_csv::add_summary_list(string *list, i=
nt size)
 	add_exact("\n");
 }
 =

+void
+report_formatter_csv::add_table(string *system_data, struct table_size *si=
ze,
+		struct table_attributes* tb_attr)
+{
+	int i, j;
+	int offset=3D0;
+	string tmp_str=3D"";
+	int empty_row=3D0;
+	add_exact("\n");
+	for (i=3D0; i < size->rows; i++){
+		for (j=3D0; j < size->cols; j++){
+			offset =3D i * (size->cols) + j;
+			tmp_str=3Dsystem_data[offset];
+
+			if(tmp_str =3D=3D "&nbsp;")
+				empty_row+=3D1;
+			else{
+				addf_exact("%s", system_data[offset].c_str());
+				if(j < (size->cols - 1))
+					add_exact(",");
+			}
+		}
+		if(empty_row < size->cols)
+		add_exact("\n");
+		empty_row=3D0;
+	}
+}
diff --git a/src/report/report-formatter-csv.h b/src/report/report-formatte=
r-csv.h
index daf723e..994b765 100644
--- a/src/report/report-formatter-csv.h
+++ b/src/report/report-formatter-csv.h
@@ -82,6 +82,8 @@ public:
 	void add_title(struct tag_attr *title_att, const char *title);
 	void add_navigation();
 	void add_summary_list(string *list, int size);
+	void add_table(string *system_data, struct table_size *size,
+			struct table_attributes *tb_attr);
 =

 private:
 	void add_doc_header();
-- =

1.7.9.5


--===============8681798054309122758==--

