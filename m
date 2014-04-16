Content-Type: multipart/mixed; boundary="===============2365331841473198342=="
MIME-Version: 1.0
From: Rick "Zero_Chaos" Farina <zerochaos at gentoo.org>
Subject: [Powertop] [PATCH] Optionally disable NLS
Date: Wed, 16 Apr 2014 11:21:17 -0400
Message-ID: <534E9FED.4080608@gentoo.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2365331841473198342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

A report on Gentoo's bug tracker
(https://bugs.gentoo.org/show_bug.cgi?id=3D505366) notes that while the
configure script support --disable-nls, the nls code is not
conditionally disabled which causes build failures on uclibc.  This
patch from Ren=C3=A9 Rh=C3=A9aume fixes the affected code:

- --- powertop-2.5/src/lib.h
+++ powertop-2.5-nls/src/lib.h
@@ -33,7 +33,11 @@
 #include "config.h"
 #endif

+#ifdef ENABLE_NLS
 #define _(STRING)    gettext(STRING)
+#else
+#define _(STRING)    (STRING)
+#endif

 #define POWERTOP_VERSION "v"PACKAGE_VERSION
 #define POWERTOP_SHORT_VERSION PACKAGE_VERSION
- --- powertop-2.5/src/main.cpp
+++ powertop-2.5-nls/src/main.cpp
@@ -369,8 +369,10 @@ int main(int argc, char **argv)
 	set_new_handler(out_of_memory);

 	setlocale (LC_ALL, "");
+#ifdef ENABLE_NLS
 	bindtextdomain (PACKAGE, LOCALEDIR);
 	textdomain (PACKAGE);
+#endif

 	while (1) { /* parse commandline options */
 		c =3D getopt_long (argc, argv, "ch:C:i:t:uVw:q", long_options,
&option_index);
- --- powertop-2.5/src/report/report-maker.h
+++ powertop-2.5-nls/src/report/report-maker.h
@@ -75,8 +75,13 @@
 #include <string>

 /* Conditional gettext. We need original strings for CSV. */
+#ifdef ENABLE_NLS
 #define __(STRING) \
 	((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRING))
+#else
+#define __(STRING) (STRING)
+#endif
+

 #ifndef UNUSED
 #define UNUSED __attribute__((unused))


original patch: https://505366.bugs.gentoo.org/attachment.cgi?id=3D373272

Please accept this patch.

Thanks,
Zero
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTTp/tAAoJEKXdFCfdEflKqIMP/14P/29kiuSFkm7R3A1AdiHq
R9t7uS6b34dFQ+NX2loegFqwsyxcRvn3+19iG/u6Oa3uYIKRs1XnIuilZ6AQKQEW
79yDNm9bH/B/K+68hCXOWBnfO625GxTeaOt/vJDYJiUSJR7/VI4eu1+eeC87BS/p
+d9XxbsDyn+SKdCuPAk7/Vju9XISQdjGla7DwEZYDF331iKZCFEdPkX09RW5/Zss
iQGbHzsRZWyOpnHVeYwMKIdGUBfOB3dlnVMyecaXoBv/ybyxxw2cgLjZpav4m6D4
wLIgL6Fc7tRDmCO7aNuUVUznjx1XvxsZuh64wXc36E8XBO10xtMHlk03di0tn7RC
0eT6qwOkUpBsqFZKVRvfC25FrpgjI3b/XNnWctJvlJPvQRzTRe+OCERhnJlR+NND
T/PzGSlqGyCIpLhuXlJ0MUgwDW9BaUFjY84Fi0sruuFOleqN/UKPcJJO3IPwNvXH
98Yia9cve8rzaJJgvtwkAEnjiph4SlDlU3w/K8XBmrOTl7c2CZUGoesv5A7YH57y
rcWzRLS7H5XUqpdn+l3dqBdsWTOsP9n/76VXNaUh6BSvK56b1Ud10VvY5ayxtDs1
xCFYRbgTc34oAtk3P8xNwX08wqIyZu8UfT9HhYkUNrDxExnC5XRmgpfaHCXT101k
d5ix6cGYZiikCtzUlB1M
=3DH1V6
-----END PGP SIGNATURE-----

--===============2365331841473198342==--

