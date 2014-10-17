Content-Type: multipart/mixed; boundary="===============7098597476715146048=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3 0/5] A series of patches towards limiting memory
 leaks
Date: Fri, 17 Oct 2014 15:58:01 -0700
Message-ID: <1413586686-28602-1-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 4628F0C61321354285DF2950999754456DF926B0@ORSMSX114.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7098597476715146048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Changes since v1:
  * Rebased atop "41c54e8 allow none-ncurses messaging..."
  * Removed double-free in original patch 3/8

Changes since v2:
  * Modified cover letter subject to bring focus to memory leaks
  * Removed buffer overflow protection patches, to be re-submitted
    separately

The three buffer overflow protection patches in the original series from
Dan were removed in this submission, leaving only the five (mostly)
memory leak patches.

The buffer overflow protection patches, which had been committed (and
reverted) before the v2.6 release was tagged, replaced some calls to
sprintf(), strcpy(), and friends with their 'n' functions.  That alone
is insufficient and potentially harmful. Buffer overflow protection
deserves consideration appropriate to the privilege level necessary to
run PowerTOP.

The remaining five patches from the original series from Dan deal
(mostly) with memory leaks.

Sergey and Arjan, thanks for your v2 reviews and discussion!

Dan Kalowsky (5):
  Properly cleaning up the display tabs
  Removing a documented memory leak
  Remove another memory leak
  Mark pretty_print_init as initialized
  Adding a clean_shutdown function

 src/display.cpp               | 11 +++++++++++
 src/display.h                 |  1 +
 src/lib.cpp                   |  2 ++
 src/main.cpp                  | 15 ++++++++++++---
 src/parameters/parameters.h   |  1 +
 src/parameters/persistent.cpp | 15 +++++++++++++++
 src/tuning/tuning.cpp         |  7 +++++++
 7 files changed, 49 insertions(+), 3 deletions(-)

-- =

2.1.2


--===============7098597476715146048==--

