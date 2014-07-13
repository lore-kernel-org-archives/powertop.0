Content-Type: multipart/mixed; boundary="===============1570406894211222893=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] [PATCH] powertop: update build instructions
Date: Sun, 13 Jul 2014 12:06:02 +0600
Message-ID: <1405231562-24175-1-git-send-email-meraj.enigma@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1570406894211222893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

update powertop build instuctions in README file.

Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
---
 README | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/README b/README
index cd38cc5..efe95c3 100644
--- a/README
+++ b/README
@@ -2,9 +2,10 @@
 ------------------------------
 =

 To build and install PowerTOP type the following commands, =

-	./configure =

-	./make
-	./make install
+       autoreconf -sfi
+       ./configure
+       make
+       sudo make install
 =

 Note: For Android (running Intel Architecture ) there is a Android.mk =

 that was provided by community members, and at this time is supported
-- =

1.9.1


--===============1570406894211222893==--

