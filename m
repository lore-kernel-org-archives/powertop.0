Content-Type: multipart/mixed; boundary="===============2633697389967739385=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [CLI fixes 0/5] Fixes to make command line handling and
 manpage consistent
Date: Fri, 24 Aug 2012 16:57:46 +0200
Message-ID: <20120824150836.4A9FDE00C7@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2633697389967739385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Split the big patch from last time into one per functional change
as requested.

If there's more to improve, please let me know (or apply those parts that
you like and I'll improve the rest).

My previous attempts to send this went into moderation as my attempt to
automate the sending of the patches were not 100% clean. They haven't been
rejected but neither have they appeared on the list, so sorry if there
appear duplicates later on.

Joerg Mayer (5):
  Remove trailing whitespace
  Reorder arguments alphabetically     Spelling fix levesl to levels
  Fix spelling of command line argument --quite to --quiet.     Add a
    manpage entry for --quiet, which was missing.
  -V (version) does not take an argument, whether optional or not.
  Fix spelling of default names to match manpage.

 doc/powertop.8  |   15 +++++++++------
 src/display.cpp |    2 +-
 src/display.h   |    2 +-
 src/lib.cpp     |    2 +-
 src/main.cpp    |   22 +++++++++++-----------
 src/report.cpp  |    6 +++---
 6 files changed, 26 insertions(+), 23 deletions(-)

-- =

1.7.7


--===============2633697389967739385==--

