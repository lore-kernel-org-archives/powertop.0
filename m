Content-Type: multipart/mixed; boundary="===============1723004585714039964=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 04/19] gettext: run gettextize-0.18.2
Date: Wed, 03 Aug 2016 17:59:14 -0700
Message-ID: <1470272369-218664-5-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1723004585714039964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Ran gettextize from gettext-0.18.2 to clean up some annoying
configuration warnings.

Also, allow m4 and po changelogs to be created, especially to help folks
concerned with the particulars of string translation.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 Makefile.am       |  2 ++
 configure.ac      |  2 +-
 m4/ChangeLog      | 11 +++++++++++
 po/ChangeLog      | 11 +++++++++++
 po/Makefile.in.in | 19 ++++++++++++++-----
 5 files changed, 39 insertions(+), 6 deletions(-)
 create mode 100644 m4/ChangeLog
 create mode 100644 po/ChangeLog

diff --git a/Makefile.am b/Makefile.am
index 819441e982c8..b519d110a118 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -8,6 +8,8 @@ SUBDIRS =3D \
 	doc
 =

 EXTRA_DIST =3D \
+	config.rpath \
+	m4/ChangeLog  \
 	README \
 	TODO \
 	Android.mk \
diff --git a/configure.ac b/configure.ac
index 4681c9e3ad28..646b402101bb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -24,7 +24,7 @@ GETTEXT_PACKAGE=3Dpowertop
 AC_SUBST([GETTEXT_PACKAGE])
 AM_SILENT_RULES([yes])
 AM_GNU_GETTEXT([external])
-AM_GNU_GETTEXT_VERSION([0.18])
+AM_GNU_GETTEXT_VERSION([0.18.2])
 =

 m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
 # Checks for programs.
diff --git a/m4/ChangeLog b/m4/ChangeLog
new file mode 100644
index 000000000000..f415dc03d1be
--- /dev/null
+++ b/m4/ChangeLog
@@ -0,0 +1,11 @@
+2016-08-03  gettextize  <bug-gnu-gettext(a)gnu.org>
+
+	* gettext.m4: New file, from gettext-0.18.2.
+	* iconv.m4: New file, from gettext-0.18.2.
+	* lib-ld.m4: New file, from gettext-0.18.2.
+	* lib-link.m4: New file, from gettext-0.18.2.
+	* lib-prefix.m4: New file, from gettext-0.18.2.
+	* nls.m4: New file, from gettext-0.18.2.
+	* po.m4: New file, from gettext-0.18.2.
+	* progtest.m4: New file, from gettext-0.18.2.
+
diff --git a/po/ChangeLog b/po/ChangeLog
new file mode 100644
index 000000000000..11de90cb3926
--- /dev/null
+++ b/po/ChangeLog
@@ -0,0 +1,11 @@
+2016-08-03  gettextize  <bug-gnu-gettext(a)gnu.org>
+
+	* Makefile.in.in: Upgrade to gettext-0.18.2.
+	* boldquot.sed: New file, from gettext-0.18.2.
+	* en(a)boldquot.header: New file, from gettext-0.18.2.
+	* en(a)quot.header: New file, from gettext-0.18.2.
+	* insert-header.sin: New file, from gettext-0.18.2.
+	* quot.sed: New file, from gettext-0.18.2.
+	* remove-potcdate.sin: New file, from gettext-0.18.2.
+	* Rules-quot: New file, from gettext-0.18.2.
+
diff --git a/po/Makefile.in.in b/po/Makefile.in.in
index 83d8838ac017..fce63a6e95e3 100644
--- a/po/Makefile.in.in
+++ b/po/Makefile.in.in
@@ -8,7 +8,7 @@
 # Please note that the actual code of GNU gettext is covered by the GNU
 # General Public License and is *not* in the public domain.
 #
-# Origin: gettext-0.18
+# Origin: gettext-0.18.2
 GETTEXT_MACRO_VERSION =3D 0.18
 =

 PACKAGE =3D @PACKAGE@
@@ -96,14 +96,14 @@ CATALOGS =3D @CATALOGS@
 	mv t-$@ $@
 =

 =

-all: check-macro-version all-(a)USE_NLS@
+all: all-(a)USE_NLS@
 =

 all-yes: stamp-po
 all-no:
 =

 # Ensure that the gettext macros and this Makefile.in.in are in sync.
-check-macro-version:
-	@test "$(GETTEXT_MACRO_VERSION)" =3D "@GETTEXT_MACRO_VERSION@" \
+CHECK_MACRO_VERSION =3D \
+	test "$(GETTEXT_MACRO_VERSION)" =3D "@GETTEXT_MACRO_VERSION@" \
 	  || { echo "*** error: gettext infrastructure mismatch: using a Makefile=
.in.in from gettext version $(GETTEXT_MACRO_VERSION) but the autoconf macro=
s are from gettext version @GETTEXT_MACRO_VERSION@" 1>&2; \
 	       exit 1; \
 	     }
@@ -123,6 +123,7 @@ check-macro-version:
 # $(POFILES) has been designed to not touch files that don't need to be
 # changed.
 stamp-po: $(srcdir)/$(DOMAIN).pot
+	@$(CHECK_MACRO_VERSION)
 	test ! -f $(srcdir)/$(DOMAIN).pot || \
 	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
 	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
@@ -137,8 +138,16 @@ stamp-po: $(srcdir)/$(DOMAIN).pot
 =

 # This target rebuilds $(DOMAIN).pot; it is an expensive operation.
 # Note that $(DOMAIN).pot is not touched if it doesn't need to be changed.
+# The determination of whether the package xyz is a GNU one is based on the
+# heuristic whether some file in the top level directory mentions "GNU xyz=
".
+# If GNU 'find' is available, we avoid grepping through monster files.
 $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
-	if LC_ALL=3DC grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null | grep -v =
'libtool:' >/dev/null; then \
+	if { if (LC_ALL=3DC find --version) 2>/dev/null | grep GNU >/dev/null; th=
en \
+	       LC_ALL=3DC find -L $(top_srcdir) -maxdepth 1 -type f -size -100000=
00c -exec grep 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
+	     else \
+	       LC_ALL=3DC grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	     fi; \
+	   } | grep -v 'libtool:' >/dev/null; then \
 	  package_gnu=3D'GNU '; \
 	else \
 	  package_gnu=3D''; \
-- =

1.8.3.1


--===============1723004585714039964==--

