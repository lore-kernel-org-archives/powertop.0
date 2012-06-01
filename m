Content-Type: multipart/mixed; boundary="===============7563411411539287963=="
MIME-Version: 1.0
From: Colin King <colin.king at canonical.com>
Subject: [Powertop] [PATCH][RESEND] Add powertop manual page
Date: Fri, 01 Jun 2012 14:45:18 +0100
Message-ID: <1338558318-8133-1-git-send-email-colin.king@canonical.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7563411411539287963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Colin Ian King <colin.king(a)canonical.com>

Powertop should really have a manual page to explain the options
in a little more detail rather than the user having to get the
source and read the README file.

Signed-off-by: Colin Ian King <colin.king(a)canonical.com>
---
 Makefile.am     |    2 +-
 configure.ac    |    2 +-
 doc/Makefile.am |    1 +
 doc/powertop.8  |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 4 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 doc/Makefile.am
 create mode 100644 doc/powertop.8

diff --git a/Makefile.am b/Makefile.am
index 23a5128..f222fa3 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,6 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
 ACLOCAL_AMFLAGS =3D -I m4
 =

-SUBDIRS =3D pevent src po
+SUBDIRS =3D pevent src po doc
 =

 EXTRA_DIST =3D README TODO Android.mk COPYING autogen.sh =

diff --git a/configure.ac b/configure.ac
index 2c0f02a..4da4eea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -5,7 +5,7 @@ AC_PREREQ([2.68])
 AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
 AM_INIT_AUTOMAKE([-Wall -Werror foreign ])
 AC_LANG([C++])
-AC_CONFIG_FILES([Makefile src/Makefile pevent/Makefile po/Makefile.in])
+AC_CONFIG_FILES([Makefile src/Makefile pevent/Makefile po/Makefile.in doc/=
Makefile])
 AC_CONFIG_SRCDIR([src/main.cpp])
 AC_CONFIG_MACRO_DIR([m4])
 AC_CONFIG_HEADERS([config.h])
diff --git a/doc/Makefile.am b/doc/Makefile.am
new file mode 100644
index 0000000..c5f5d7e
--- /dev/null
+++ b/doc/Makefile.am
@@ -0,0 +1 @@
+man_MANS =3D powertop.8
diff --git a/doc/powertop.8 b/doc/powertop.8
new file mode 100644
index 0000000..56e4060
--- /dev/null
+++ b/doc/powertop.8
@@ -0,0 +1,59 @@
+.TH POWERTOP 8 "June 1, 2012" "Linux" "powertop manual"
+.SH NAME
+powertop \- a power consumption and power management diagnosis tool.
+.SH SYNOPSIS
+.B powertop
+.RB [
+.IR options
+.RB ]
+.SH DESCRIPTION
+.P
+\fBpowertop\fP is a program that helps to diagnose various issues with pow=
er consumption
+and power management. It also has an interactive mode allowing one to
+experiment with various power management settings. When invoking powertop
+without arguments powertop starts in interactive mode.
+.SH OPTIONS
+.TP
+\fB\-\-csv[\fR=3D\fIFILENAME\fR]
+generate a CSV report. If a filename is not specified then the
+default name "powertop.csv" is used. The CSV report can be
+used for reporting and data analysis.
+.TP
+\fB\-\-calibrate
+runs powertop in calibration mode. When running on battery, powertop
+can track power consumption as well as system activity. When there
+are enough measurements, powertop can start to report power estimates. One
+can get more accurate estimates by using this option to enable a
+calibration cycle. This will cycle through various display levesl and USB
+device activities and workloads.
+.TP
+\fB\-\-debug
+ run in "debug" mode.
+.TP
+\fB\-\-extech\fR=3D\fIdevnode\fR
+use the Extech Power Analyzer for measurements. This allows one to
+specify the serial device node of the serial to USB adaptor connecting to
+the Extech Power Analyzer, for example /dev/ttyUSB0.
+.TP
+\fB\-\-help
+ show the help message.
+.TP
+\fB\-\-html[\fR=3D\fIFILENAME\fR]
+generate an HTML report. If a filename is not specified then the
+default name "powertop.html" is used. The HTML report can be
+sent to others to help diagnose power issues.
+.TP
+\fB\-\-iteration[\fR=3D\fIiterations\fR]
+number of times to run each test.
+.TP
+\fB\-\-time[\fR=3D\fIseconds\fR]
+generate a report for a specified number of seconds.
+.TP
+\fB\-\-version
+print version information and exit.
+.SH BUGS
+Send bug reports to <powertop(a)lists.01.org>
+.SH SEE ALSO
+The program is more fully described at https://01.org/powertop
+.SH AUTHOR
+powertop was written by Arjan van de Ven <arjan(a)linux.intel.com>, and is=
 currently maintained by Chris E Ferron <chris.e.ferron(a)linux.intel.com>.
-- =

1.7.9.5


--===============7563411411539287963==--

