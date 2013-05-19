Content-Type: multipart/mixed; boundary="===============6148413746809930657=="
MIME-Version: 1.0
From: Hans-Peter Deifel <hpdeifel at gmx.de>
Subject: [Powertop] [PATCH 2/2] Document key bindings in man page
Date: Sun, 19 May 2013 18:00:43 +0200
Message-ID: <1368979243-3175-3-git-send-email-hpdeifel@gmx.de>
In-Reply-To: 1368979243-3175-1-git-send-email-hpdeifel@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6148413746809930657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Hans-Peter Deifel <hpdeifel(a)gmx.de>
---
 doc/powertop.8 | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/doc/powertop.8 b/doc/powertop.8
index 8a70076..e6ec199 100644
--- a/doc/powertop.8
+++ b/doc/powertop.8
@@ -54,6 +54,38 @@ generate a report for a specified number of seconds.
 .TP
 \fB\-\-version
 print version information and exit.
+.SH COMMANDS
+In interactive mode, the following key bindings are available:
+.TP
+\fBTab
+Show next tab
+.TP
+\fBBackTab
+Show previous tab
+.TP
+\fBRight Arrow
+Scroll to the right
+.TP
+\fBLeft Arrow
+Scroll to the left
+.TP
+\fBUp Arrow, PageUp
+Scroll up or select previous item
+.TP
+\fBDown Arrow, PageDown
+Scroll down or select next item
+.TP
+\fBSpace, Return
+Activate current item
+.TP
+\fBs
+Set refresh timeout
+.TP
+\fBr
+Refresh window
+.TP
+\fBq, Ctrl-C, Escape
+Exit powertop
 .SH BUGS
 Send bug reports to <powertop(a)lists.01.org>
 .SH SEE ALSO
-- =

1.8.1.5


--===============6148413746809930657==--

