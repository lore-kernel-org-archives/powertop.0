Content-Type: multipart/mixed; boundary="===============5510601373481414562=="
MIME-Version: 1.0
From: Hans-Peter Deifel <hpdeifel at gmx.de>
Subject: [Powertop] [PATCH 1/2] Use symbolic instead of numeric constants for
 keys
Date: Sun, 19 May 2013 18:00:42 +0200
Message-ID: <1368979243-3175-2-git-send-email-hpdeifel@gmx.de>
In-Reply-To: 1368979243-3175-1-git-send-email-hpdeifel@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5510601373481414562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This improves the readability of the key handling code.

Since there is no symbolic constant for Escape, a comment with an
explanation is added.

Signed-off-by: Hans-Peter Deifel <hpdeifel(a)gmx.de>
---
 src/main.cpp | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 0883424..46466b0 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -136,10 +136,10 @@ static void do_sleep(int seconds)
 =

 		c =3D getch();
 		switch (c) {
-		case 353: =

+		case KEY_BTAB:
 			show_prev_tab();
 			break;
-		case 9:
+		case '\t':
 			show_next_tab(); =

 			break;
 		case KEY_RIGHT:
@@ -156,8 +156,8 @@ static void do_sleep(int seconds)
 		case KEY_UP:
 			cursor_up();
 			break;
-		case 32:
-		case 10:
+		case ' ':
+		case '\n':
 			cursor_enter();
 			break;
 		case 's':
@@ -169,7 +169,7 @@ static void do_sleep(int seconds)
 			return;
 		case KEY_EXIT:
 		case 'q':
-		case 27:
+		case 27:	// Escape
 			leave_powertop =3D 1;
 			return;
 		}
-- =

1.8.1.5


--===============5510601373481414562==--

