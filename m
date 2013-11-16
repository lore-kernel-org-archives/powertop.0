Content-Type: multipart/mixed; boundary="===============6576561443935602206=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v2 27/31] report: conditional runs ncurses & cpu
 html report
Date: Fri, 15 Nov 2013 16:29:14 -0800
Message-ID: <1384561758-21516-28-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384561758-21516-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6576561443935602206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adds a conditional to fix n-curses from breaking when calling
one_measurment from main. Now will execute report_display_cpu_cstates
and report_display_cpu_pstates only when a csv or an HTML report are
generated.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/main.cpp |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 4e34ee6..c57aa57 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -216,10 +216,11 @@ void one_measurement(int seconds, char *workload)
 	report_summary();
 	w_display_cpu_cstates();
 	w_display_cpu_pstates();
-	report_display_cpu_cstates();
-	report_display_cpu_pstates();
+	if (reporttype !=3D REPORT_OFF) {
+		report_display_cpu_cstates();
+		report_display_cpu_pstates();
+	}
 	report_process_update_display();
-
 	tuning_update_display();
 =

 	end_process_data();
-- =

1.7.9.5


--===============6576561443935602206==--

