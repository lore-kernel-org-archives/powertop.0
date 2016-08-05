Content-Type: multipart/mixed; boundary="===============5584699608045351105=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 0/3] Version strings from git describe
Date: Fri, 05 Aug 2016 12:27:18 -0700
Message-ID: <1470425241-215266-1-git-send-email-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5584699608045351105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Hey gang,

This is a series using 'git describe' to construct version strings. But, th=
ere
are caveats.

With autotools, there doesn't seem to be a reliable way to capture code sta=
te
in incremental builds (git repo or no), "dirty" code (git repo or no), code
modified in a snapshot (git repo or no), or from a released tarball. The
autotools versioning workflow assumes you unpack/checkout the code, run
configure once, and build once, with no changes made. Assuming that workflo=
w,
this series provides "dynamic"* version information.

That said: once generated, the PACKAGE_VERSION strings in config.h are
effectively static-- irrespective of code changes or commits-- until all
autotools artifacts are removed and autogen.sh run again.

Thanks to eSyr for the note on reproducible builds in a prior review,
specifically the point about time stamps built into the binary. Credit give=
n in
the first patch. ^_^

Joe Konno (3):
  main.cpp: remove __DATE__ from --version
  configure.ac: version strings from git describe
  search/replace POWERTOP_VERSION and SHORT_VERSION

 .gitignore            |  1 +
 Makefile.am           |  2 ++
 autogen.sh            |  1 +
 configure.ac          |  5 ++++-
 scripts/version       | 13 +++++++++++++
 src/display.cpp       |  2 +-
 src/lib.h             |  3 ---
 src/main.cpp          |  4 ++--
 src/perf/perf.cpp     |  2 +-
 src/report/report.cpp |  2 +-
 10 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 scripts/version

-- =

1.8.3.1


--===============5584699608045351105==--

