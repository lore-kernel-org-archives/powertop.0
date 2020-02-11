Content-Type: multipart/mixed; boundary="===============3473134927224045220=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 0/3 v1] Clean up some stale autotools artifacts
Date: Tue, 11 Feb 2020 14:15:39 -0800
Message-ID: <20200211221542.46228-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3473134927224045220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Sending these patches as a batch, but they are each stand-alone tweaks.

A few years ago I added a script that attempted to compile in a 'git
describe' string into PowerTOP-- it has not performed to my expectations
in the intervening time, so let's just remove it.

Also included in this batch are some autotools cleanups. We have been
lugging around some m4 macros that, I assert, are no longer necessary.


Joe Konno (3):
  Revert "configure.ac: version strings from git describe"
  configure.ac: required version to 2.69
  configure.ac: ax_add_fortify_source

 .gitignore                     |   1 -
 Makefile.am                    |   2 -
 autogen.sh                     |   1 -
 configure.ac                   |   9 +-
 m4/ax_cxx_compile_stdcxx_11.m4 | 142 --------------
 m4/ax_pthread.m4               | 332 ---------------------------------
 m4/gcc_fortify_source_cc.m4    |  29 ---
 scripts/version                |  13 --
 src/display.cpp                |   2 +-
 9 files changed, 4 insertions(+), 527 deletions(-)
 delete mode 100644 m4/ax_cxx_compile_stdcxx_11.m4
 delete mode 100644 m4/ax_pthread.m4
 delete mode 100644 m4/gcc_fortify_source_cc.m4
 delete mode 100644 scripts/version

-- =

2.25.0

--===============3473134927224045220==--

