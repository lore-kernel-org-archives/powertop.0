Content-Type: multipart/mixed; boundary="===============2327422745627828042=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: [Powertop] [PATCH] ccstoh: Don't return success if something went
 wrong
Date: Thu, 12 Jul 2012 22:41:43 +0200
Message-ID: <1342125703-23323-1-git-send-email-sw@weilnetz.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2327422745627828042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

exit(0) is the same as returning EXIT_SUCCESS which is a bad
idea after a severe failure. It will for example result in
wrong behaviour of make (make won't stop after such failures).

Returning EXIT_FAILURE fixes this.

Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
---
 src/csstoh.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/csstoh.c b/src/csstoh.c
index e6b1dcf..28858f5 100644
--- a/src/csstoh.c
+++ b/src/csstoh.c
@@ -40,12 +40,12 @@ int main(int argc, char **argv)
 	in =3D fopen(argv[1], "rm");
 	if (!in) {
 		printf("Failed to open input file %s (%s) \n", argv[1], strerror(errno));
-		exit(0);
+		return EXIT_FAILURE;
 	}
 	out =3D fopen(argv[2], "wm");
 	if (!out) {
 		printf("Failed to open output file %s (%s) \n", argv[1], strerror(errno)=
);
-		exit(0);
+		return EXIT_FAILURE;
 	}
 =

 	fprintf(out, "#ifndef __INCLUDE_GUARD_CCS_H\n");
-- =

1.7.10


--===============2327422745627828042==--

