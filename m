Content-Type: multipart/mixed; boundary="===============2912621571573467500=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 1/4] gettext: bump to 0.19.8
Date: Tue, 26 Jul 2016 12:35:32 -0700
Message-ID: <20160726193535.27247-2-joe.konno@linux.intel.com>
In-Reply-To: 20160726193535.27247-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2912621571573467500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Ran 'gettextize' from gettext v0.19.8. There were no m4 or po ChangeLog
files before, but I went ahead and allowed their creation.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 Makefile.am       |  2 ++
 configure.ac      |  2 +-
 m4/ChangeLog      | 11 ++++++++
 po/ChangeLog      | 11 ++++++++
 po/Makefile.in.in | 77 +++++++++++++++++++++++++++++++++++++++++----------=
----
 po/Makevars       | 37 ++++++++++++++++++++++++++
 6 files changed, 120 insertions(+), 20 deletions(-)
 create mode 100644 m4/ChangeLog
 create mode 100644 po/ChangeLog

diff --git a/Makefile.am b/Makefile.am
index 128500e9b67c..8e4e09d6145d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -8,6 +8,8 @@ SUBDIRS =3D \
 	doc
 =

 EXTRA_DIST =3D \
+	m4/ChangeLog \
+	config.rpath \
 	README \
 	TODO \
 	Android.mk \
diff --git a/configure.ac b/configure.ac
index 088d0de2aa19..75facf7a2c8e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -24,7 +24,7 @@ GETTEXT_PACKAGE=3Dpowertop
 AC_SUBST([GETTEXT_PACKAGE])
 AM_SILENT_RULES([yes])
 AM_GNU_GETTEXT([external])
-AM_GNU_GETTEXT_VERSION([0.18])
+AM_GNU_GETTEXT_VERSION([0.19.8])
 =

 m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
 # Checks for programs.
diff --git a/m4/ChangeLog b/m4/ChangeLog
new file mode 100644
index 000000000000..1dba52bfb721
--- /dev/null
+++ b/m4/ChangeLog
@@ -0,0 +1,11 @@
+2016-07-26  gettextize  <bug-gnu-gettext(a)gnu.org>
+
+	* gettext.m4: New file, from gettext-0.19.8.1.
+	* iconv.m4: New file, from gettext-0.19.8.1.
+	* lib-ld.m4: New file, from gettext-0.19.8.1.
+	* lib-link.m4: New file, from gettext-0.19.8.1.
+	* lib-prefix.m4: New file, from gettext-0.19.8.1.
+	* nls.m4: New file, from gettext-0.19.8.1.
+	* po.m4: New file, from gettext-0.19.8.1.
+	* progtest.m4: New file, from gettext-0.19.8.1.
+
diff --git a/po/ChangeLog b/po/ChangeLog
new file mode 100644
index 000000000000..961bc3647ed0
--- /dev/null
+++ b/po/ChangeLog
@@ -0,0 +1,11 @@
+2016-07-26  gettextize  <bug-gnu-gettext(a)gnu.org>
+
+	* Makefile.in.in: Upgrade to gettext-0.19.8.1.
+	* boldquot.sed: New file, from gettext-0.19.8.1.
+	* en(a)boldquot.header: New file, from gettext-0.19.8.1.
+	* en(a)quot.header: New file, from gettext-0.19.8.1.
+	* insert-header.sin: New file, from gettext-0.19.8.1.
+	* quot.sed: New file, from gettext-0.19.8.1.
+	* remove-potcdate.sin: New file, from gettext-0.19.8.1.
+	* Rules-quot: New file, from gettext-0.19.8.1.
+
diff --git a/po/Makefile.in.in b/po/Makefile.in.in
index 83d8838ac017..38c293d2ed2f 100644
--- a/po/Makefile.in.in
+++ b/po/Makefile.in.in
@@ -1,20 +1,19 @@
 # Makefile for PO directory in any package using GNU gettext.
 # Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper=
(a)gnu.ai.mit.edu>
 #
-# This file can be copied and used freely without restrictions.  It can
-# be used in projects which are not available under the GNU General Public
-# License but which still want to provide support for the GNU gettext
-# functionality.
-# Please note that the actual code of GNU gettext is covered by the GNU
-# General Public License and is *not* in the public domain.
+# Copying and distribution of this file, with or without modification,
+# are permitted in any medium without royalty provided the copyright
+# notice and this notice are preserved.  This file is offered as-is,
+# without any warranty.
 #
-# Origin: gettext-0.18
-GETTEXT_MACRO_VERSION =3D 0.18
+# Origin: gettext-0.19.8
+GETTEXT_MACRO_VERSION =3D 0.19
 =

 PACKAGE =3D @PACKAGE@
 VERSION =3D @VERSION@
 PACKAGE_BUGREPORT =3D @PACKAGE_BUGREPORT@
 =

+SED =3D @SED@
 SHELL =3D /bin/sh
 @SET_MAKE@
 =

@@ -44,6 +43,11 @@ install_sh =3D $(SHELL) @install_sh@
 MKDIR_P =3D @MKDIR_P@
 mkdir_p =3D @mkdir_p@
 =

+# When building gettext-tools, we prefer to use the built programs
+# rather than installed programs.  However, we can't do that when we
+# are cross compiling.
+CROSS_COMPILING =3D @CROSS_COMPILING@
+
 GMSGFMT_ =3D @GMSGFMT@
 GMSGFMT_no =3D @GMSGFMT@
 GMSGFMT_yes =3D @GMSGFMT_015@
@@ -76,6 +80,16 @@ POTFILES =3D \
 =

 CATALOGS =3D @CATALOGS@
 =

+POFILESDEPS_ =3D $(srcdir)/$(DOMAIN).pot
+POFILESDEPS_yes =3D $(POFILESDEPS_)
+POFILESDEPS_no =3D
+POFILESDEPS =3D $(POFILESDEPS_$(PO_DEPENDS_ON_POT))
+
+DISTFILESDEPS_ =3D update-po
+DISTFILESDEPS_yes =3D $(DISTFILESDEPS_)
+DISTFILESDEPS_no =3D
+DISTFILESDEPS =3D $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
+
 # Makevars gets inserted here. (Don't remove this line!)
 =

 .SUFFIXES:
@@ -96,14 +110,14 @@ CATALOGS =3D @CATALOGS@
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
@@ -123,6 +137,7 @@ check-macro-version:
 # $(POFILES) has been designed to not touch files that don't need to be
 # changed.
 stamp-po: $(srcdir)/$(DOMAIN).pot
+	@$(CHECK_MACRO_VERSION)
 	test ! -f $(srcdir)/$(DOMAIN).pot || \
 	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
 	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
@@ -137,11 +152,29 @@ stamp-po: $(srcdir)/$(DOMAIN).pot
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
-	  package_gnu=3D'GNU '; \
+	package_gnu=3D"$(PACKAGE_GNU)"; \
+	test -n "$$package_gnu" || { \
+	  if { if (LC_ALL=3DC find --version) 2>/dev/null | grep GNU >/dev/null; =
then \
+		 LC_ALL=3DC find -L $(top_srcdir) -maxdepth 1 -type f \
+			       -size -10000000c -exec grep 'GNU @PACKAGE@' \
+			       /dev/null '{}' ';' 2>/dev/null; \
+	       else \
+		 LC_ALL=3DC grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	       fi; \
+	     } | grep -v 'libtool:' >/dev/null; then \
+	     package_gnu=3Dyes; \
+	   else \
+	     package_gnu=3Dno; \
+	   fi; \
+	}; \
+	if test "$$package_gnu" =3D "yes"; then \
+	  package_prefix=3D'GNU '; \
 	else \
-	  package_gnu=3D''; \
+	  package_prefix=3D''; \
 	fi; \
 	if test -n '$(MSGID_BUGS_ADDRESS)' || test '$(PACKAGE_BUGREPORT)' =3D '@'=
PACKAGE_BUGREPORT'@'; then \
 	  msgid_bugs_address=3D'$(MSGID_BUGS_ADDRESS)'; \
@@ -161,12 +194,17 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.=
in remove-potcdate.sed
 	      --add-comments=3DTRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_O=
PTIONS@ \
 	      --files-from=3D$(srcdir)/POTFILES.in \
 	      --copyright-holder=3D'$(COPYRIGHT_HOLDER)' \
-	      --package-name=3D"$${package_gnu}@PACKAGE@" \
+	      --package-name=3D"$${package_prefix}@PACKAGE@" \
 	      --package-version=3D'@VERSION@' \
 	      --msgid-bugs-address=3D"$$msgid_bugs_address" \
 	    ;; \
 	esac
 	test ! -f $(DOMAIN).po || { \
+	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
+	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
+	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po; \
+	    rm -f $(DOMAIN).1po; \
+	  fi; \
 	  if test -f $(srcdir)/$(DOMAIN).pot; then \
 	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po =
&& \
 	    sed -f remove-potcdate.sed < $(DOMAIN).po > $(DOMAIN).2po && \
@@ -189,13 +227,14 @@ $(srcdir)/$(DOMAIN).pot:
 =

 # This target rebuilds a PO file if $(DOMAIN).pot has changed.
 # Note that a PO file is not touched if it doesn't need to be changed.
-$(POFILES): $(srcdir)/$(DOMAIN).pot
+$(POFILES): $(POFILESDEPS)
 	@lang=3D`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
 	if test -f "$(srcdir)/$${lang}.po"; then \
+	  test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot; \
 	  test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdir) && "; \
 	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=3D$${lang}=
 $${lang}.po $(DOMAIN).pot"; \
 	  cd $(srcdir) \
-	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-9]*=
,,'` in \
+	    && { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in=
 \
 	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
 	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN)=
.pot;; \
 	           *) \
@@ -352,7 +391,7 @@ maintainer-clean: distclean
 =

 distdir =3D $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
 dist distdir:
-	$(MAKE) update-po
+	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
 	@$(MAKE) dist2
 # This is a separate target because 'update-po' must be executed before.
 dist2: stamp-po $(DISTFILES)
@@ -396,7 +435,7 @@ update-po: Makefile
 =

 .nop.po-update:
 	@lang=3D`echo $@ | sed -e 's/\.po-update$$//'`; \
-	if test "$(PACKAGE)" =3D "gettext-tools"; then PATH=3D`pwd`/../src:$$PATH=
; fi; \
+	if test "$(PACKAGE)" =3D "gettext-tools" && test "$(CROSS_COMPILING)" !=
=3D "yes"; then PATH=3D`pwd`/../src:$$PATH; fi; \
 	tmpdir=3D`pwd`; \
 	echo "$$lang:"; \
 	test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdir) && "; \
diff --git a/po/Makevars b/po/Makevars
index bbb9ebe4b935..6db1da01eee9 100644
--- a/po/Makevars
+++ b/po/Makevars
@@ -20,6 +20,13 @@ XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --keyw=
ord=3D__
 # their copyright.
 COPYRIGHT_HOLDER =3D Intel Corporation =

 =

+# This tells whether or not to prepend "GNU " prefix to the package
+# name that gets inserted into the header of the $(DOMAIN).pot file.
+# Possible values are "yes", "no", or empty.  If it is empty, try to
+# detect it automatically by scanning the files in $(top_srcdir) for
+# "GNU packagename" string.
+PACKAGE_GNU =3D
+
 # This is the email address or URL to which the translators shall report
 # bugs in the untranslated strings:
 # - Strings which are not entire sentences, see the maintainer guidelines
@@ -39,3 +46,33 @@ MSGID_BUGS_ADDRESS =3D "powertop(a)lists.01.org"
 # This is the list of locale categories, beyond LC_MESSAGES, for which the
 # message catalogs shall be used.  It is usually empty.
 EXTRA_LOCALE_CATEGORIES =3D
+
+# This tells whether the $(DOMAIN).pot file contains messages with an 'msg=
ctxt'
+# context.  Possible values are "yes" and "no".  Set this to yes if the
+# package uses functions taking also a message context, like pgettext(), or
+# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
+USE_MSGCTXT =3D no
+
+# These options get passed to msgmerge.
+# Useful options are in particular:
+#   --previous            to keep previous msgids of translated messages,
+#   --quiet               to reduce the verbosity.
+MSGMERGE_OPTIONS =3D
+
+# These options get passed to msginit.
+# If you want to disable line wrapping when writing PO files, add
+# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
+# MSGINIT_OPTIONS.
+MSGINIT_OPTIONS =3D
+
+# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
+# has changed.  Possible values are "yes" and "no".  Set this to no if
+# the POT file is checked in the repository and the version control
+# program ignores timestamps.
+PO_DEPENDS_ON_POT =3D yes
+
+# This tells whether or not to forcibly update $(DOMAIN).pot and
+# regenerate PO files on "make dist".  Possible values are "yes" and
+# "no".  Set this to no if the POT file and PO files are maintained
+# externally.
+DIST_DEPENDS_ON_UPDATE_PO =3D yes
-- =

2.9.0


--===============2912621571573467500==--

