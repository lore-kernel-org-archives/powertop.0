Content-Type: multipart/mixed; boundary="===============2611907174814706607=="
MIME-Version: 1.0
From: Daniel Black <daniel.black at au1.ibm.com>
Subject: [Powertop] [PATCH] Makefile.am need reference to m4 directory
Date: Mon, 23 May 2016 12:56:06 +1000
Message-ID: <ea5e3f56-3143-4916-5956-880c05a45ee5@au.ibm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2611907174814706607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Running autoreconf (autconf-2.69/automake-1.15/libtoolize-2.4.6)
without the m4 directory specified in the Makefile.am file generates
the following warning:

 ./autogen.sh
autoreconf: Entering directory `.'
autoreconf: running: autopoint
autoreconf: running: aclocal
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: running: /usr/bin/autoconf
autoreconf: running: /usr/bin/autoheader
autoreconf: running: automake --add-missing --copy --no-force
configure.ac:26: warning: The 'AM_PROG_MKDIR_P' macro is deprecated, and
its use is discouraged.
configure.ac:26: You should use the Autoconf-provided 'AC_PROG_MKDIR_P'
macro instead,
configure.ac:26: and use '$(MKDIR_P)' instead of '$(mkdir_p)'in your
Makefile.am files.
autoreconf: Leaving directory `.'
---
 Makefile.am | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile.am b/Makefile.am
index c8d0ae2..a9cf9db 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,4 +1,5 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
+ACLOCAL_AMFLAGS=3D-I m4

 SUBDIRS =3D \
        traceevent \
--
2.7.4


--===============2611907174814706607==--

