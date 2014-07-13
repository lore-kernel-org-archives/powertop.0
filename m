Content-Type: multipart/mixed; boundary="===============7779555645346338788=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] [PATCH UPDATED] powertop: update build instructions
Date: Sun, 13 Jul 2014 14:07:54 +0600
Message-ID: <1405238874-16384-1-git-send-email-meraj.enigma@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7779555645346338788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

update powertop build instuctions in README file.

Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
---
 README | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/README b/README
index cd38cc5..bc48d3d 100644
--- a/README
+++ b/README
@@ -2,9 +2,10 @@
 ------------------------------
 =

 To build and install PowerTOP type the following commands, =

+	./autogen.sh
 	./configure =

-	./make
-	./make install
+	make
+	sudo make install
 =

 Note: For Android (running Intel Architecture ) there is a Android.mk =

 that was provided by community members, and at this time is supported
-- =

1.9.1


--===============7779555645346338788==--

