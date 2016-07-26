Content-Type: multipart/mixed; boundary="===============1302548665019820711=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 0/4] gettext cleanup series
Date: Tue, 26 Jul 2016 12:35:31 -0700
Message-ID: <20160726193535.27247-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1302548665019820711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Hey gang,

I've been getting gettext warnings during the configuration stage for some
time. This fixes most of them. Review and feedback welcomed, as always.

In a nutshell, I ran gettextize (from v0.19.8), and touched a few configura=
tion
files as directed by the gettext documentation. As a result, there was some
gitignore housecleaning that needed attention.

No functional side-effects anticipated.

Joe Konno (4):
  gettext: bump to 0.19.8
  Makefile.am: ACLOCAL_AMFLAGS updated
  .gitignore: ignore a few more m4 macros
  LINGUAS: add en(a)quot and en(a)boldquot

 .gitignore        |  2 ++
 Makefile.am       |  4 ++-
 configure.ac      |  2 +-
 m4/ChangeLog      | 11 ++++++++
 po/ChangeLog      | 11 ++++++++
 po/LINGUAS        |  2 ++
 po/Makefile.in.in | 77 +++++++++++++++++++++++++++++++++++++++++----------=
----
 po/Makevars       | 37 ++++++++++++++++++++++++++
 8 files changed, 125 insertions(+), 21 deletions(-)
 create mode 100644 m4/ChangeLog
 create mode 100644 po/ChangeLog

-- =

2.9.0


--===============1302548665019820711==--

