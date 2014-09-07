Content-Type: multipart/mixed; boundary="===============8699197111712218726=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 14/15] add --auto-tune and --workload to manual
 page
Date: Sun, 07 Sep 2014 22:27:17 +0100
Message-ID: <1410125238-29600-15-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8699197111712218726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Options in manual page are now in same order as in usage output, and they
include short options when aplicable.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 doc/powertop.8 | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/doc/powertop.8 b/doc/powertop.8
index 31e7e6d..60e3c73 100644
--- a/doc/powertop.8
+++ b/doc/powertop.8
@@ -12,7 +12,10 @@ experiment with various power management settings.  When=
 invoking
 powertop without arguments powertop starts in interactive mode.
 .SH OPTIONS
 .TP
-.B \-\-calibrate
+.B \-\-auto\-tune
+Set all tunable options to their good setting without interaction.
+.TP
+.BR \-c ", " \-\-calibrate
 Runs powertop in calibration mode.  When running on battery, powertop can
 track power consumption as well as system activity.  When there are
 enough measurements, powertop can start to report power estimates.  One
@@ -20,7 +23,7 @@ can get more accurate estimates by using this option to e=
nable a
 calibration cycle.  This will cycle through various display levels and
 USB device activities and workloads.
 .TP
-\fB\-\-csv\fR[=3D\fIfilename\fR]
+\fB\-C\fR, \fB\-\-csv\fR[=3D\fIfilename\fR]
 Generate a CSV report.  If a
 .I filename
 is not specified then the default name
@@ -28,7 +31,7 @@ is not specified then the default name
 is used.  The CSV report can be used for reporting and data analysis.
 .TP
 .B \-\-debug
-Run in "debug" mode.
+Run in debug mode.
 .TP
 \fB\-\-extech\fR=3D\fIdevnode\fR
 Use the Extech Power Analyzer for measurements.  This allows one to
@@ -36,10 +39,7 @@ specify the serial device node of the serial to USB adap=
tor connecting to
 the Extech Power Analyzer, for example
 .IR /dev/ttyUSB0 .
 .TP
-.B \-\-help
-Show the help message.
-.TP
-\fB\-\-html\fR[=3D\fIfilename\fR]
+\fB\-r\fR, \fB\-\-html\fR[=3D\fIfilename\fR]
 Generate an HTML report.  If a
 .I filename
 is not specified then the default name
@@ -47,18 +47,26 @@ is not specified then the default name
 is used.  The HTML report can be sent to others to help diagnose power
 issues.
 .TP
-\fB\-\-iteration\fR[=3D\fIiterations\fR]
+\fB\-i\fR, \fB\-\-iteration\fR[=3D\fIiterations\fR]
 Number of times to run each test.
 .TP
-.B \-\-quiet
+.BR \-q ", " \-\-quiet
 Suppress stderr output.
 .TP
-\fB\-\-time\fR[=3D\fIseconds\fR]
+\fB\-t\fR, \fB\-\-time\fR[=3D\fIseconds\fR]
 Generate a report for a specified number of
 .IR seconds .
 .TP
-.B \-\-version
+\fB\-w\fR, \fB\-\-workload\fR[=3D\fIworkload\fR]
+Execute
+.I workload
+file as a part of calibration before making a report.
+.TP
+.BR \-V ", " \-\-version
 Print version information and exit.
+.TP
+.BR \-h ", " \-\-help
+Show the help message and exit.
 .SH COMMANDS
 In interactive mode, the following key bindings are available:
 .IP
-- =

2.1.0


--===============8699197111712218726==--

