Content-Type: multipart/mixed; boundary="===============7591194293816724838=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 10/15] improve manual groff syntax
Date: Sun, 07 Sep 2014 22:27:13 +0100
Message-ID: <1410125238-29600-11-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7591194293816724838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use header macro .TH expected way.  Use English spacing, that means two
spaces after a dot.  Use simple font macros, such as .B or .BR, where
possible rather than \fB inline selectors.  Highlight option arguments
consistently, also in description segments.  Convert interactive commands
to a table.  Use mail and web address macros when appropriate.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 doc/powertop.8 | 141 +++++++++++++++++++++++++++++------------------------=
----
 1 file changed, 71 insertions(+), 70 deletions(-)

diff --git a/doc/powertop.8 b/doc/powertop.8
index 3535a21..31e7e6d 100644
--- a/doc/powertop.8
+++ b/doc/powertop.8
@@ -1,94 +1,95 @@
-.TH POWERTOP 8 "June 1, 2012" "Linux" "powertop manual"
+.TH POWERTOP "8" "2014-08-02" "powertop manual" "System Administration"
 .SH NAME
 powertop \- a power consumption and power management diagnosis tool.
 .SH SYNOPSIS
 .B powertop
-.RB [
-.IR options
-.RB ]
+.RI [ options ]
 .SH DESCRIPTION
-.P
-\fBpowertop\fP is a program that helps to diagnose various issues with pow=
er consumption
-and power management. It also has an interactive mode allowing one to
-experiment with various power management settings. When invoking powertop
-without arguments powertop starts in interactive mode.
+.B powertop
+is a program that helps to diagnose various issues with power consumption
+and power management.  It also has an interactive mode allowing one to
+experiment with various power management settings.  When invoking
+powertop without arguments powertop starts in interactive mode.
 .SH OPTIONS
 .TP
-\fB\-\-calibrate
-runs powertop in calibration mode. When running on battery, powertop
-can track power consumption as well as system activity. When there
-are enough measurements, powertop can start to report power estimates. One
+.B \-\-calibrate
+Runs powertop in calibration mode.  When running on battery, powertop can
+track power consumption as well as system activity.  When there are
+enough measurements, powertop can start to report power estimates.  One
 can get more accurate estimates by using this option to enable a
-calibration cycle. This will cycle through various display levels and USB
-device activities and workloads.
+calibration cycle.  This will cycle through various display levels and
+USB device activities and workloads.
 .TP
-\fB\-\-csv[\fR=3D\fIFILENAME\fR]
-generate a CSV report. If a filename is not specified then the
-default name "powertop.csv" is used. The CSV report can be
-used for reporting and data analysis.
+\fB\-\-csv\fR[=3D\fIfilename\fR]
+Generate a CSV report.  If a
+.I filename
+is not specified then the default name
+.B powertop.csv
+is used.  The CSV report can be used for reporting and data analysis.
 .TP
-\fB\-\-debug
- run in "debug" mode.
+.B \-\-debug
+Run in "debug" mode.
 .TP
 \fB\-\-extech\fR=3D\fIdevnode\fR
-use the Extech Power Analyzer for measurements. This allows one to
+Use the Extech Power Analyzer for measurements.  This allows one to
 specify the serial device node of the serial to USB adaptor connecting to
-the Extech Power Analyzer, for example /dev/ttyUSB0.
+the Extech Power Analyzer, for example
+.IR /dev/ttyUSB0 .
 .TP
-\fB\-\-help
- show the help message.
+.B \-\-help
+Show the help message.
 .TP
-\fB\-\-html[\fR=3D\fIFILENAME\fR]
-generate an HTML report. If a filename is not specified then the
-default name "powertop.html" is used. The HTML report can be
-sent to others to help diagnose power issues.
+\fB\-\-html\fR[=3D\fIfilename\fR]
+Generate an HTML report.  If a
+.I filename
+is not specified then the default name
+.B powertop.html
+is used.  The HTML report can be sent to others to help diagnose power
+issues.
 .TP
-\fB\-\-iteration[\fR=3D\fIiterations\fR]
-number of times to run each test.
+\fB\-\-iteration\fR[=3D\fIiterations\fR]
+Number of times to run each test.
 .TP
-\fB\-\-quiet
- suppress stderr output.
+.B \-\-quiet
+Suppress stderr output.
 .TP
-\fB\-\-time[\fR=3D\fIseconds\fR]
-generate a report for a specified number of seconds.
+\fB\-\-time\fR[=3D\fIseconds\fR]
+Generate a report for a specified number of
+.IR seconds .
 .TP
-\fB\-\-version
-print version information and exit.
+.B \-\-version
+Print version information and exit.
 .SH COMMANDS
 In interactive mode, the following key bindings are available:
-.TP
-\fBTab
-Show next tab
-.TP
-\fBBackTab
-Show previous tab
-.TP
-\fBRight Arrow
-Scroll to the right
-.TP
-\fBLeft Arrow
-Scroll to the left
-.TP
-\fBUp Arrow, PageUp
-Scroll up or select previous item
-.TP
-\fBDown Arrow, PageDown
-Scroll down or select next item
-.TP
-\fBSpace, Return
-Activate current item
-.TP
-\fBs
-Set refresh timeout
-.TP
-\fBr
-Refresh window
-.TP
-\fBq, Ctrl-C, Escape
-Exit powertop
+.IP
+.TS
+tab(@);
+l l.
+\fBTab\fR(a)Show next tab
+\fBBackTab\fR(a)Show previous tab
+\fBRight Arrow\fR(a)Scroll to the right
+\fBLeft Arrow\fR(a)Scroll to the left
+\fBUp Arrow\fR, \fBPageUp\fR(a)Scroll up or select previous item
+\fBDown Arrow\fR, \fBPageDown\fR(a)Scroll down or select next item
+\fBSpace\fR, \fBReturn\fR(a)Activate current item
+\fBs\fR(a)Set refresh timeout
+\fBr\fR(a)Refresh window
+\fBq\fR, \fBCtrl-C\fR, \fBEscape\fR(a)Exit powertop
+.TE
 .SH BUGS
-Send bug reports to <powertop(a)lists.01.org>
+Send bug reports to
+.MT powertop(a)lists.01.org
+.ME
 .SH SEE ALSO
-The program is more fully described at https://01.org/powertop
+The program is more fully described at
+.UR https://01.org/powertop
+.UE
 .SH AUTHOR
-powertop was written by Arjan van de Ven <arjan(a)linux.intel.com>, and is=
 currently maintained by Chris E Ferron <chris.e.ferron(a)linux.intel.com>.
+powertop was written by
+.MT arjan@\:linux.\:intel.\:com
+Arjan van de Ven
+.ME ,
+and is currently maintained by
+.MT chris.\:e.\:ferron@\:linux.\:intel.\:com
+Chris E Ferron
+.ME .
-- =

2.1.0


--===============7591194293816724838==--

