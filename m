Content-Type: multipart/mixed; boundary="===============5012551036985268833=="
MIME-Version: 1.0
From: =?utf-8?q?Jaroslav_=C5=A0karvada_=3Cjskarvad_at_redhat=2Ecom=3E?=
Subject: [Powertop] [PATCH] Fixed -C and -r to take optional argument
Date: Wed, 28 Nov 2018 18:31:48 +0100
Message-ID: <20181128173148.21132-1-jskarvad@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5012551036985268833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I.e. it fixes the following:
powertop -C -t 1
...
Taking 1 measurement(s) for a duration of 20 second(s) each.
PowerTOP outputing using base filename -t

But:
powertop --html -t 1
...
Taking 1 measurement(s) for a duration of 1 second(s) each.
PowerTOP outputing using base filename powertop.html

Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 7467f0f..d1c18cc 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -441,7 +441,7 @@ int main(int argc, char **argv)
 #endif
 	ui_notify_user =3D ui_notify_user_ncurses;
 	while (1) { /* parse commandline options */
-		c =3D getopt_long(argc, argv, "cC:r:i:qt:w:Vh", long_options, &option_in=
dex);
+		c =3D getopt_long(argc, argv, "cC::r::i:qt:w:Vh", long_options, &option_=
index);
 		/* Detect the end of the options. */
 		if (c =3D=3D -1)
 			break;
-- =

2.14.5


--===============5012551036985268833==--

