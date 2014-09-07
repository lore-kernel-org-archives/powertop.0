Content-Type: multipart/mixed; boundary="===============6407128417509391653=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 12/15] wrap lines in README.traceevent
Date: Sun, 07 Sep 2014 22:27:15 +0100
Message-ID: <1410125238-29600-13-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6407128417509391653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 README.traceevent | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/README.traceevent b/README.traceevent
index 38563ab..0747766 100644
--- a/README.traceevent
+++ b/README.traceevent
@@ -1,15 +1,20 @@
 traceevent: =

 =

-The traceevent library being built in PowerTOP is really a effort by Steve=
n Rostedt. =

-The long term intent is for Steven to push the trace event library to dist=
ributions, and consume it externally. Right now the PowerTOP project is kee=
ping in sync with his code posted in the Linux kernel git under tools/lib/t=
raceevent. =

-We will not take patches into the traceevent code directly, rather we will=
 be re-basing =

-against that code base. =

+The traceevent library being built in PowerTOP is really a effort by
+Steven Rostedt.  The long term intent is for Steven to push the trace
+event library to distributions, and consume it externally.  Right now the
+PowerTOP project is keeping in sync with his code posted in the Linux
+kernel git under tools/lib/traceevent.  We will not take patches into the
+traceevent code directly, rather we will be re-basing against that code
+base.
 =

 If you find a bug in the trace event code, you should to one of two things=
. =

 =

-1. Send a patch to the PowerTOP mailing list, which will get forwared to S=
teven if appropriate. =

-2. Send a patch to the PowerTOP mailing list, cc <Steven Rostedt> rostedt(=
a)goodmis.org
+1. Send a patch to the PowerTOP mailing list, which will get forwared to
+   Steven if appropriate.
 =

+2. Send a patch to the PowerTOP mailing list, and
+   CC: Steven Rostedt <rostedt(a)goodmis.org>
 =

-Please do use the PowerTOP mailing list to discuss topics about traceevent=
 as its used with PowerTOP.
-
+Please do use the PowerTOP mailing list to discuss topics about
+traceevent as its used with PowerTOP.
-- =

2.1.0


--===============6407128417509391653==--

