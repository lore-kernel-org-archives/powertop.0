Content-Type: multipart/mixed; boundary="===============4975894427682506514=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [CLI fixes 4/5] -V (version) does not take an argument,
 whether optional or not.
Date: Thu, 23 Aug 2012 23:32:33 +0200
Message-ID: <20120824150836.4FFDAE00D1@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4975894427682506514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/main.cpp b/src/main.cpp
index c310cb2..80d7597 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -343,7 +343,7 @@ int main(int argc, char **argv)
 	textdomain (PACKAGE);
 =

 	while (1) { /* parse commandline options */
-		c =3D getopt_long (argc, argv, "ch:C:i:t:uV:w:q", long_options, &option_=
index);
+		c =3D getopt_long (argc, argv, "ch:C:i:t:uVw:q", long_options, &option_i=
ndex);
 		/* Detect the end of the options. */
 		if (c =3D=3D -1)
 			break;
-- =

1.7.7


--===============4975894427682506514==--

