Content-Type: multipart/mixed; boundary="===============8167466898571144760=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [Warning fixes 0/6] Fix or disable some warings
Date: Fri, 24 Aug 2012 19:29:09 +0200
Message-ID: <20120824173217.DB586E00C7@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8167466898571144760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mostly warning fixes. If you don't like some of them feel free to ignore,
otherwise either provide feedback or apply.

Oh, and no more trailing whitespace in two more directories

Joerg Mayer (6):
  if 0/endif out unused function dbg_printf_pevent_info
  Build with -Wno-unused-result for now, it seems at least some of
    these     cases are intentional (see ml discussion)
  Remove trailing whitespace
  Fix warning:     warning: this decimal constant is unsigned only in
    ISO C90 [enabled by default]     by explicitely declaring the value
    as UL
  Fix warning:     warning: this decimal constant is unsigned only in
    ISO C90 [enabled by default]     by explicitely declaring the value
    as UL
  Remove trailing whitespace in the cpu/ and process/ subdirs.

 src/Makefile.am            |    9 +++++----
 src/cpu/abstract_cpu.cpp   |    4 ++--
 src/cpu/cpu.cpp            |   12 ++++++------
 src/cpu/intel_cpus.h       |    2 +-
 src/cpu/intel_gpu.cpp      |    8 ++++----
 src/process/do_process.cpp |   16 +++++++++-------
 src/process/timer.cpp      |    2 +-
 7 files changed, 28 insertions(+), 25 deletions(-)

-- =

1.7.7


--===============8167466898571144760==--

