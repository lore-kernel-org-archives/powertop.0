Content-Type: multipart/mixed; boundary="===============8585663022975233674=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 0/8] A series of patches towards limiting memory
 corruption and foot print
Date: Tue, 14 Oct 2014 11:09:11 -0700
Message-ID: <1413310159-30577-1-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 4628F0C61321354285DF2950999754456DF926B0@ORSMSX114.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8585663022975233674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Changes since v1:
  * Rebased atop "41c54e8 allow none-ncurses messaging..."
  * Removed double-free in original patch 3/8

This is a follow-on to Daniel Kalowsky's series submitted a few months
ago, before the v2.6 release of PowerTOP. It was initially merged but
then reverted just before the v2.6 release due to issues identified by
the PowerTOP community, such as segfaults on exit.

While I was not able to reproduce the segfaults, with Valgrind's
memcheck I did identify a double-free event within the original patch
series. The double-free was introduced in patch 3/8, but the double-free
was not seen until patch 8/8, when the errant function was actually
called. Fixed by removing the "delete my window" code block within
clear_tunables(), as close_display() would do the work (again). After
fix, Valgrind memcheck no longer reports a double-free event.

Dan Kalowsky (8):
  Properly cleaning up the display tabs
  Removing a documented memory leak
  Remove another memory leak
  Mark pretty_print_init as initialized
  Limit sprintf to buffer size length.
  Stop buffer overflow
  Clean up potential buffer issues
  Adding a clean_shutdown function

 src/display.cpp               | 11 +++++++++++
 src/display.h                 |  1 +
 src/lib.cpp                   | 10 ++++++----
 src/main.cpp                  | 15 ++++++++++++---
 src/parameters/parameters.h   |  1 +
 src/parameters/persistent.cpp | 15 +++++++++++++++
 src/process/do_process.cpp    | 28 ++++++++++++++--------------
 src/tuning/tuning.cpp         |  7 +++++++
 8 files changed, 67 insertions(+), 21 deletions(-)

-- =

2.1.2


--===============8585663022975233674==--

