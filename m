Content-Type: multipart/mixed; boundary="===============4397129799219676998=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [PATCH 2/4] Reorder arguments alphabetically Spelling fix
 levesl to levels
Date: Thu, 23 Aug 2012 23:24:34 +0200
Message-ID: <20120823215423.29821DFFDC@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4397129799219676998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
---
 doc/powertop.8 |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/doc/powertop.8 b/doc/powertop.8
index e8ec5fd..8020d4e 100644
--- a/doc/powertop.8
+++ b/doc/powertop.8
@@ -14,19 +14,19 @@ experiment with various power management settings. When=
 invoking powertop
 without arguments powertop starts in interactive mode.
 .SH OPTIONS
 .TP
-\fB\-\-csv[\fR=3D\fIFILENAME\fR]
-generate a CSV report. If a filename is not specified then the
-default name "powertop.csv" is used. The CSV report can be
-used for reporting and data analysis.
-.TP
 \fB\-\-calibrate
 runs powertop in calibration mode. When running on battery, powertop
 can track power consumption as well as system activity. When there
 are enough measurements, powertop can start to report power estimates. One
 can get more accurate estimates by using this option to enable a
-calibration cycle. This will cycle through various display levesl and USB
+calibration cycle. This will cycle through various display levels and USB
 device activities and workloads.
 .TP
+\fB\-\-csv[\fR=3D\fIFILENAME\fR]
+generate a CSV report. If a filename is not specified then the
+default name "powertop.csv" is used. The CSV report can be
+used for reporting and data analysis.
+.TP
 \fB\-\-debug
  run in "debug" mode.
 .TP
-- =

1.7.7


--===============4397129799219676998==--

