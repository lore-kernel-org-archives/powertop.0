Content-Type: multipart/mixed; boundary="===============5020320588653974716=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 0/3] Versions strings from git describe
Date: Tue, 09 Aug 2016 12:59:28 -0700
Message-ID: <1470772771-114174-1-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470425241-215266-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5020320588653974716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Hey gang,

Thanks to Magnus and eSyr for the review and feedback. I changed the commit
message in patch 2/3 to clarify use of the version script. No other changes
made to that patch or the others in the series.

See the v1 cover letter for the particulars of this series:
  * https://lists.01.org/pipermail/powertop/2016-August/001948.html

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


--===============5020320588653974716==--

