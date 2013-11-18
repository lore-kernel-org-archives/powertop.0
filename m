Content-Type: multipart/mixed; boundary="===============5014559978026106729=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 20/31] report: redesign Device Power Report csv
 & html
Date: Mon, 18 Nov 2013 12:27:11 -0800
Message-ID: <1384806442-20294-21-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5014559978026106729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Redesign Device Power Report table part of "Device Info" section, while
preserving translation macros.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/devices/device.cpp |   72 +++++++++++++++++++++++---------------------=
----
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index 00ec5e6..4120b9c 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -49,6 +49,7 @@ using namespace std;
 #include "../lib.h"
 #include "../report/report.h"
 #include "../report/report-maker.h"
+#include "../report/report-data-html.h"
 #include "../measurement/measurement.h"
 #include "../devlist.h"
 #include <unistd.h>
@@ -217,43 +218,35 @@ void report_devices(void)
 void show_report_devices(void)
 {
 	unsigned int i;
-	int show_power;
-	double pw;
+	int show_power, cols, rows, idx;
 =

 	show_power =3D global_power_valid();
 	sort(all_devices.begin(), all_devices.end(), power_device_sort);
 =

-	report.begin_section(SECTION_DEVPOWER);
-	report.add_header("Device Power Report");
+	/* div attr css_class and css_id */
+        tag_attr div_attr;
+        init_div(&div_attr, "", "device");
 =

-	pw =3D global_joules_consumed();
-	if (pw > 0.0001) {
-		char buf[32];
+        /* Set Table attributes, rows, and cols */
+        table_attributes std_table_css;
+	cols=3D2;
+        if (show_power)
+                cols=3D3;
 =

-		report.begin_paragraph();
-		report.addf("The battery reports a discharge rate of %sW",
-			    fmt_prefix(pw, buf));
-	}
+	idx =3D cols;
+ 	rows=3D all_devices.size() + 1;
+        init_std_table_attr(&std_table_css, rows, cols);
 =

-	if (show_power) {
-		char buf[32];
+        /* Set Title attributes */
+        tag_attr title_attr;
+        init_title_attr(&title_attr);
 =

-		report.begin_paragraph();
-		report.addf("System baseline power is estimated at %sW",
-			    fmt_prefix(get_parameter_value("base power"), buf));
-	}
-
-	report.begin_table(TABLE_WIDE);
-	report.begin_row();
-	if (show_power) {
-		report.begin_cell(CELL_DEVPOWER_HEADER);
-		report.add("Power est.");
-	}
-
-	report.begin_cell(CELL_DEVPOWER_HEADER);
-	report.add("Usage");
-	report.begin_cell(CELL_DEVPOWER_DEV_NAME);
-	report.add("Device name");
+        /* Set array of data in row Major order */
+	string device_data[cols * rows];
+	device_data[0]=3D __("Usage");
+	device_data[1]=3D __("Device Name");
+	if (show_power)
+		device_data[2]=3D __("PW Estimate");
 =

 	for (i =3D 0; i < all_devices.size(); i++) {
 		double P;
@@ -278,17 +271,22 @@ void show_report_devices(void)
 		if (!show_power || !all_devices[i]->power_valid())
 			strcpy(power, "           ");
 =

-		report.begin_row(ROW_DEVPOWER);
+		device_data[idx]=3D string(util);
+		idx+=3D1;
+
+		device_data[idx]=3D string(all_devices[i]->human_name());
+		idx+=3D1;
+
 		if (show_power) {
-			report.begin_cell(CELL_DEVPOWER_POWER);
-			report.add(power);
+			device_data[idx]=3D string(power);
+			idx+=3D1;
 		}
-
-		report.begin_cell(CELL_DEVPOWER_UTIL);
-		report.add(util);
-		report.begin_cell();
-		report.add(all_devices[i]->human_name());
 	}
+	/* Report Output */
+	report.add_div(&div_attr);
+	report.add_title(&title_attr, __("Device Power Report"));
+	report.add_table(device_data, &std_table_css);
+	report.end_div();
 }
 =

 =

-- =

1.7.9.5


--===============5014559978026106729==--

