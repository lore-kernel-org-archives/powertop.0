Content-Type: multipart/mixed; boundary="===============8541618680796719182=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 7/8] Clean up potential buffer issues
Date: Tue, 14 Oct 2014 11:09:18 -0700
Message-ID: <1413310159-30577-8-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413310159-30577-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8541618680796719182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

While no issues have been seen in this section of code yet, it's likely
the same issues that show on the active display will also show on the
report process.

v2: rebased atop 41c54e8

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/process/do_process.cpp | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 2b5a327..ce34071 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -943,8 +943,8 @@ void report_process_update_display(void)
 		format_watts(all_power[i]->Witts(), power, 10);
 =

 		if (!show_power)
-			strcpy(power, "          ");
-		sprintf(name, "%s", all_power[i]->type());
+			strncpy(power, "          ", 16);
+		snprintf(name, 20, "%s", all_power[i]->type());
 =

 		if (strcmp(name, "Device") =3D=3D 0)
 			continue;
@@ -956,17 +956,17 @@ void report_process_update_display(void)
 		usage[0] =3D 0;
 		if (all_power[i]->usage_units()) {
 			if (all_power[i]->usage() < 1000)
-				sprintf(usage, "%5.1f%s", all_power[i]->usage(), all_power[i]->usage_u=
nits());
+				snprintf(usage, 20, "%5.1f%s", all_power[i]->usage(), all_power[i]->us=
age_units());
 			else
-				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->usag=
e_units());
+				snprintf(usage, 20, "%5i%s", (int)all_power[i]->usage(), all_power[i]-=
>usage_units());
 		}
-		sprintf(wakes, "%5.1f", all_power[i]->wake_ups / measurement_time);
+		snprintf(wakes, 20, "%5.1f", all_power[i]->wake_ups / measurement_time);
 		if (all_power[i]->wake_ups / measurement_time <=3D 0.3)
-			sprintf(wakes, "%5.2f", all_power[i]->wake_ups / measurement_time);
-		sprintf(gpus, "%5.1f", all_power[i]->gpu_ops / measurement_time);
-		sprintf(disks, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / measureme=
nt_time,
+			snprintf(wakes, 20, "%5.2f", all_power[i]->wake_ups / measurement_time);
+		snprintf(gpus, 20, "%5.1f", all_power[i]->gpu_ops / measurement_time);
+		snprintf(disks, 20, "%5.1f (%5.1f)", all_power[i]->hard_disk_hits / meas=
urement_time,
 				all_power[i]->disk_hits / measurement_time);
-		sprintf(xwakes, "%5.1f", all_power[i]->xwakes / measurement_time);
+		snprintf(xwakes, 20, "%5.1f", all_power[i]->xwakes / measurement_time);
 		if (!all_power[i]->show_events()) {
 			wakes[0] =3D 0;
 			gpus[0] =3D 0;
-- =

2.1.2


--===============8541618680796719182==--

