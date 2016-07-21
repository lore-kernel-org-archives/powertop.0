Content-Type: multipart/mixed; boundary="===============7868582158652238484=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3] Makefile.am need reference to m4 directory
Date: Thu, 21 Jul 2016 14:32:38 -0700
Message-ID: <20160721213238.9951-1-joe.konno@linux.intel.com>
In-Reply-To: ea5e3f56-3143-4916-5956-880c05a45ee5@au.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7868582158652238484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Daniel Black <daniel.black(a)au1.ibm.com>

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

v3: (Joe) The irony. 'Real' submission fixing all nits from v2.
v2: (Joe) Re-submission due to a whitespace -ism, added Acked-by

Acked-by: Joe Konno <joe.konno(a)intel.com>
---
 Makefile.am | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile.am b/Makefile.am
index c8d0ae210e3f..128500e9b67c 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,4 +1,5 @@
 AUTOMAKE_OPTIONS =3D subdir-objects
+ACLOCAL_AMFLAGS =3D -I m4
 =

 SUBDIRS =3D \
 	traceevent \
-- =

2.9.0


--===============7868582158652238484==--

