Content-Type: multipart/mixed; boundary="===============3141477656173030721=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 21/29] report: Redesign Device Activity css & html
Date: Wed, 30 Oct 2013 14:21:12 -0700
Message-ID: <1383168080-18233-22-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1383168080-18233-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3141477656173030721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enables new design for Process Device Activity table part of "Device
info" section. These changes are for csv and html reports.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/devlist.cpp |   47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/src/devlist.cpp b/src/devlist.cpp
index 633a568..09d256b 100644
--- a/src/devlist.cpp
+++ b/src/devlist.cpp
@@ -45,6 +45,7 @@ using namespace std;
 #include "lib.h"
 #include "report/report.h"
 #include "report/report-maker.h"
+#include "report/report-data-html.h"
 =

 #include "process/process.h"
 #include "devices/device.h"
@@ -284,9 +285,9 @@ void report_show_open_devices(void)
 	vector<struct devuser *> *target;
 	unsigned int i;
 	char prev[128], proc[128];
+	int idx, cols, rows;
 =

 	prev[0] =3D 0;
-
 	if (phase =3D=3D 1)
 		target =3D &one;
 	else
@@ -295,27 +296,43 @@ void report_show_open_devices(void)
 	if (target->size() =3D=3D 0)
 		return;
 =

-	sort(target->begin(), target->end(), devlist_sort);
+	/* div attr css_class and css_id */
+	tag_attr div_attr;
+	init_div(&div_attr, "", "device");
+
+	/* Set Table attributes, rows, and cols */
+	table_attributes std_table_css;
+	cols =3D 2;
+	idx =3D cols;
+	rows=3D target->size() + 1;
+	init_std_table_attr(&std_table_css, rows, cols);
+
+	/* Set Title attributes */
+	tag_attr title_attr;
+	init_title_attr(&title_attr);
 =

-	report.add_header("Process device activity");
-	report.begin_table(TABLE_WIDE);
-	report.begin_row();
-	report.begin_cell(CELL_DEVACTIVITY_PROCESS);
-	report.add("Process");
-	report.begin_cell(CELL_DEVACTIVITY_DEVICE);
-	report.add("Device");
+	/* Set array of data in row Major order */
+	string process_data[cols * rows];
+
+	sort(target->begin(), target->end(), devlist_sort);
+	process_data[0]=3D"Process";
+	process_data[1]=3D"Device";
 =

 	for (i =3D 0; i < target->size(); i++) {
 		proc[0] =3D 0;
-
 		if (strcmp(prev, (*target)[i]->comm) !=3D 0)
 			sprintf(proc, "%s", (*target)[i]->comm);
 =

-		report.begin_row(ROW_DEVPOWER);
-		report.begin_cell();
-		report.add(proc);
-		report.begin_cell();
-		report.add((*target)[i]->device);
+		process_data[idx]=3Dstring(proc);
+		idx+=3D1;
+		process_data[idx]=3Dstring((*target)[i]->device);
+		idx+=3D1;
 		sprintf(prev, "%s", (*target)[i]->comm);
 	}
+
+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, "Process Device Activity");
+	report.add_table(process_data, &std_table_css);
+	report.end_div();
 }
-- =

1.7.9.5


--===============3141477656173030721==--

