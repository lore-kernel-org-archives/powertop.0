Content-Type: multipart/mixed; boundary="===============2146609242430178519=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 26/31] report: design batery discharge/system
 baseline
Date: Mon, 18 Nov 2013 12:27:17 -0800
Message-ID: <1384806442-20294-27-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2146609242430178519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Redesigns the header section on Device Power Report to include the
battery discharge report and system baseline power, while preserving the
translation macros.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/devices/device.cpp |   24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/src/devices/device.cpp b/src/devices/device.cpp
index a916bf6..da595a8 100644
--- a/src/devices/device.cpp
+++ b/src/devices/device.cpp
@@ -219,6 +219,7 @@ void show_report_devices(void)
 {
 	unsigned int i;
 	int show_power, cols, rows, idx;
+	double pw;
 =

 	show_power =3D global_power_valid();
 	sort(all_devices.begin(), all_devices.end(), power_device_sort);
@@ -241,6 +242,28 @@ void show_report_devices(void)
         tag_attr title_attr;
         init_title_attr(&title_attr);
 =

+	/* Add section */
+	report.add_div(&div_attr);
+
+	/* Device Summary */
+	int summary_size=3D2;
+        string summary[summary_size];
+	pw =3D global_joules_consumed();
+	char buf[32];
+	if (pw > 0.0001) {
+		summary[0]=3D __("The battery reports a discharge rate of: ");
+		summary[1]=3Dstring(fmt_prefix(pw, buf));
+		summary[1].append(" W");
+		report.add_summary_list(summary, summary_size);
+	}
+
+	if (show_power) {
+		summary[0]=3D__("The system baseline power is estimated at: ");
+		summary[1]=3Dstring(fmt_prefix(get_parameter_value("base power"), buf));
+		summary[1].append(" W");
+		report.add_summary_list(summary, summary_size);
+	}
+
         /* Set array of data in row Major order */
 	string device_data[cols * rows];
 	device_data[0]=3D __("Usage");
@@ -283,7 +306,6 @@ void show_report_devices(void)
 		}
 	}
 	/* Report Output */
-	report.add_div(&div_attr);
 	report.add_title(&title_attr, __("Device Power Report"));
 	report.add_table(device_data, &std_table_css);
 }
-- =

1.7.9.5


--===============2146609242430178519==--

