Content-Type: multipart/mixed; boundary="===============1721155309541451631=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 01/31] report-formater-html: add logo
Date: Fri, 15 Nov 2013 16:28:48 -0800
Message-ID: <1384561758-21516-2-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1721155309541451631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adds html new logo implementation

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 PowerTop.png                         |  Bin 0 -> 6975 bytes
 src/report/report-formatter-html.cpp |   18 ++++++++++++++++++
 src/report/report-formatter-html.h   |    5 +++++
 3 files changed, 23 insertions(+)
 create mode 100644 PowerTop.png

diff --git a/PowerTop.png b/PowerTop.png
new file mode 100644
index 0000000000000000000000000000000000000000..d8474107f189549d45cf854db5c=
801ffd935dbb9
GIT binary patch
literal 6975
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
R&lUgx002ovPDHLkV1l?pOp*Wq

literal 0
HcmV?d00001

diff --git a/src/report/report-formatter-html.cpp b/src/report/report-forma=
tter-html.cpp
index 5851575..79a0c35 100644
--- a/src/report/report-formatter-html.cpp
+++ b/src/report/report-formatter-html.cpp
@@ -463,3 +463,21 @@ report_formatter_html::set_cpu_number(int nr)
 =

 	cpu_nr =3D nr;
 }
+
+void
+report_formatter_html::add_logo()
+{
+	add_exact("<img alt=3D\"PowerTop\" class=3D\"pwtop_logo\" src=3D\"./Power=
Top.png\">");
+}
+
+void
+report_formatter_html::add_header()
+{
+	add_exact("<header id=3D\"main_header\">\n");
+}
+
+void
+report_formatter_html::end_hheader()
+{
+	add_exact("</header>\n\n");
+}
diff --git a/src/report/report-formatter-html.h b/src/report/report-formatt=
er-html.h
index 4d00efe..1ade760 100644
--- a/src/report/report-formatter-html.h
+++ b/src/report/report-formatter-html.h
@@ -82,6 +82,11 @@ public:
 =

 	void set_cpu_number(int nr);
 =

+	/* Report Style */
+	void add_logo();
+	void add_header();
+	void end_hheader();
+
 private:
 	/* Document structure related functions */
 	void init_markup();
-- =

1.7.9.5


--===============1721155309541451631==--

