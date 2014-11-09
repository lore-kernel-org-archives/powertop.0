Content-Type: multipart/mixed; boundary="===============7304839672192569781=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 00/14] pull: various changes,
 mostly build system related
Date: Sun, 09 Nov 2014 13:14:17 +0000
Message-ID: <1415538871-11411-1-git-send-email-sami.kerola@lastminute.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7304839672192569781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

This change set is related to previous submission, that is discussed in
thread below:

https://lists.01.org/pipermail/powertop/2014-November/001664.html

My assumption is that these changes may not be completely in acceptable
to be part of upstream just before release.  See the link for details.

Sami Kerola (14):
  configure: require new enough automake version
  configure: use autoconf-archive ax_pthread.m4
  add missing space to --version print out
  csstoh.sh: check every single return value
  configure: use AC_USE_SYSTEM_EXTENSIONS to determine features
  powertop.m4: GCC_FORTIFY_SOURCE_CC copy idea of macro from Archlinux
    pacman
  configure: use autoconf-archive ax_cxx_compile_stdcxx_11.m4
  main: fix incompatible operand type
  move variables to protected scope
  make --quiet option to suppress various info messages
  squeeze all extra bits from size of binary and html report
  add timestamp to html report
  fix typo in message
  add missing include

 .gitignore                           |  39 +++-
 PowerTop.png                         | Bin 6975 -> 5542 bytes
 configure.ac                         |  21 ++-
 m4/ax_cxx_compile_stdcxx_11.m4       | 142 +++++++++++++++
 m4/ax_pthread.m4                     | 332 +++++++++++++++++++++++++++++++=
++++
 m4/gcc_fortify_source_cc.m4          |  29 +++
 src/Makefile.am                      |   1 -
 src/cpu/rapl/rapl_interface.cpp      |   7 +-
 src/cpu/rapl/rapl_interface.h        |   9 +-
 src/csstoh.sh                        |  40 +++--
 src/lib.h                            |   1 +
 src/main.cpp                         |   8 +-
 src/report/report-formatter-base.cpp |   2 -
 src/report/report-formatter-csv.cpp  |   2 -
 src/report/report-formatter-html.cpp | 248 +++++++++++++-------------
 src/report/report.cpp                |   5 +-
 16 files changed, 719 insertions(+), 167 deletions(-)
 create mode 100644 m4/ax_cxx_compile_stdcxx_11.m4
 create mode 100644 m4/ax_pthread.m4
 create mode 100644 m4/gcc_fortify_source_cc.m4

-- =

2.1.3


--===============7304839672192569781==--

