Content-Type: multipart/mixed; boundary="===============1087957750970493665=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 00/10] Housecleaning and Gettext cleanup
Date: Wed, 03 Aug 2016 17:59:10 -0700
Message-ID: <1470272369-218664-1-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 20160726193535.27247-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1087957750970493665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Hey gang,

v2 of this series tackles gettext refreshing once again. This time, though,=
 I
included some additional housecleaning items. I would have submitted those
separately if they did not influence the other bits in this series.

In a nutshell, I ran gettextize (from v0.18.2), and touched a few configura=
tion
files as directed by the gettext documentation (along with .gitignore).

The "biggest" change is the (re-)generation of POTFILES.in. This lead to
regeneration of powertop.pot (the basis upon which translation work is done=
),
which prompted a re-generation of all pre-existing translation artifacts. I=
 had
originally generated a single patch for all the .po files, but I decided to
break it up in case folks have per-message size constraints set by their ma=
il
provider's MTA. I will likely squash all *.po patches into one commit at pu=
sh
time.

The other housecleaning items I tackled here:
  * AC_REVISION to "2.9-pre"
  * --version now embeds "__DATE__ at __TIME__" in output
  * Added a maintainer script for (re-)generating POTFILES.in

No functional side-effects anticipated.

Joe Konno (10):
  configure.ac: bump version to 2.9-pre
  main.cpp: append __TIME__ to --version output
  Makefile.am: add --install to ACLOCAL_AMFLAGS
  gettext: run gettextize-0.18.2
  .gitignore: ignnore m4/pkg.m4
  Makevars: align more closely to generated .template
  scripts: add regenerate-potfiles-in script
  POTFILES.in: refresh files with strings
  powertop.pot: xgettext refresh, attribution fix
  po: regenerate with new POT and strings

 .gitignore                     |    1 +
 Makefile.am                    |    4 +-
 configure.ac                   |    4 +-
 m4/ChangeLog                   |   11 +
 po/ChangeLog                   |   11 +
 po/Makefile.in.in              |   19 +-
 po/Makevars                    |   14 +-
 po/POTFILES.in                 |   47 +-
 po/ca.po                       |  989 ++++++++++++++++++++----------------=
--
 po/cs_CZ.po                    | 1005 ++++++++++++++++++++----------------=
--
 po/de_DE.po                    | 1011 ++++++++++++++++++++----------------=
--
 po/en_GB.po                    |  915 +++++++++++++++++++----------------
 po/en_US.po                    |  987 ++++++++++++++++++++----------------=
--
 po/es_ES.po                    | 1040 +++++++++++++++++++++---------------=
----
 po/hu_HU.po                    | 1003 ++++++++++++++++++++----------------=
--
 po/id_ID.po                    | 1001 ++++++++++++++++++++----------------=
--
 po/nl_NL.po                    |  931 ++++++++++++++++++-----------------
 po/powertop.pot                |  839 +++++++++++++++++---------------
 po/zh_TW.po                    | 1001 ++++++++++++++++++++----------------=
--
 scripts/regenerate-potfiles-in |   15 +
 src/main.cpp                   |    2 +-
 21 files changed, 5879 insertions(+), 4971 deletions(-)
 create mode 100644 m4/ChangeLog
 create mode 100644 po/ChangeLog
 create mode 100644 scripts/regenerate-potfiles-in

-- =

1.8.3.1


--===============1087957750970493665==--

