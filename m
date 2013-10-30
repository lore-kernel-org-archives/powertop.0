Content-Type: multipart/mixed; boundary="===============0664281185559469141=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 10/29] report-maker: modular table generation
Date: Wed, 30 Oct 2013 14:21:01 -0700
Message-ID: <1383168080-18233-11-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0664281185559469141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generates a modular table when using the report maker object.
It passess table_size, css_attributes, and data.  The data is stored in
a single dimensional array using row major order.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/report/report-formatter.h |    3 +++
 src/report/report-maker.cpp   |    7 +++++++
 src/report/report-maker.h     |    2 ++
 3 files changed, 12 insertions(+)

diff --git a/src/report/report-formatter.h b/src/report/report-formatter.h
index 5e5b8d7..4fe2c42 100644
--- a/src/report/report-formatter.h
+++ b/src/report/report-formatter.h
@@ -71,6 +71,9 @@ public:
 	virtual void add_title(struct tag_attr *att_title, const char *title) {}
 	virtual void add_navigation() {}
 	virtual void add_summary_list(string *list, int size) {}
+	virtual void add_table(string *system_data,
+			struct table_size *size,
+			struct table_attributes *tb_attr)     {}
 };
 =

 #endif /* _REPORT_FORMATTER_H_ */
diff --git a/src/report/report-maker.cpp b/src/report/report-maker.cpp
index ccfbec4..031b692 100644
--- a/src/report/report-maker.cpp
+++ b/src/report/report-maker.cpp
@@ -380,3 +380,10 @@ report_maker::add_summary_list(string *list, int size)
 	formatter->add_summary_list(list, size);
 }
 =

+void
+report_maker::add_table(string *system_data, struct table_size *size,
+		struct table_attributes *tb_attr)
+{
+	formatter->add_table(system_data, size, tb_attr);
+}
+
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index 6e5f4d1..e75c99a 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -201,6 +201,8 @@ public:
 	void add_title(struct tag_attr *att_title, const char *title);
 	void add_navigation();
 	void add_summary_list(string *list, int size);
+	void add_table(string *system_data, struct table_size *size,
+			struct table_attributes *tb_attr);
 =

 private:
 	void setup_report_formatter();
-- =

1.7.9.5


--===============0664281185559469141==--

