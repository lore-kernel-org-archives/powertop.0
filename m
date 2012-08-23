Content-Type: multipart/mixed; boundary="===============2065132984478814641=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [CLI fixes 5/5] Fix spelling of default names to match
 manpage.
Date: Fri, 24 Aug 2012 00:11:39 +0200
Message-ID: <20120824150836.52495E00D3@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2065132984478814641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>

diff --git a/src/main.cpp b/src/main.cpp
index 80d7597..bdb87cc 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -371,7 +371,7 @@ int main(int argc, char **argv)
 			case 'h': /* html report */
 				wantreport =3D true;
 				reporttype =3D 1;
-				sprintf(filename, "%s", optarg ? optarg : "PowerTOP.html" );
+				sprintf(filename, "%s", optarg ? optarg : "powertop.html" );
 				break;
 =

 			case 't':
@@ -392,7 +392,7 @@ int main(int argc, char **argv)
 			case 'C': /* csv report*/
 				wantreport =3D true;
 				reporttype =3D 0;
-				sprintf(filename, "%s", optarg ? optarg : "PowerTOP.csv");
+				sprintf(filename, "%s", optarg ? optarg : "powertop.csv");
 				break;
 			case '?': /* Unknown option */
 				/* getopt_long already printed an error message. */
-- =

1.7.7


--===============2065132984478814641==--

