Content-Type: multipart/mixed; boundary="===============2305675558173226071=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 06/19] Makevars: align more closely to generated
 .template
Date: Wed, 03 Aug 2016 17:59:16 -0700
Message-ID: <1470272369-218664-7-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2305675558173226071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 po/Makevars | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/po/Makevars b/po/Makevars
index bbb9ebe4b935..fbf0a76eee7f 100644
--- a/po/Makevars
+++ b/po/Makevars
@@ -18,7 +18,7 @@ XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --keywo=
rd=3D__
 # or entity, or to disclaim their copyright.  The empty string stands for
 # the public domain; in this case the translators are expected to disclaim
 # their copyright.
-COPYRIGHT_HOLDER =3D Intel Corporation =

+COPYRIGHT_HOLDER =3D Intel Corporation
 =

 # This is the email address or URL to which the translators shall report
 # bugs in the untranslated strings:
@@ -39,3 +39,15 @@ MSGID_BUGS_ADDRESS =3D "powertop(a)lists.01.org"
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
-- =

1.8.3.1


--===============2305675558173226071==--

