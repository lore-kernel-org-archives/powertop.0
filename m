Content-Type: multipart/mixed; boundary="===============5099588845271244939=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 0/3 v1] Rewrite README, and contribution guide
Date: Mon, 04 May 2020 09:50:11 -0700
Message-ID: <20200504165014.6409-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5099588845271244939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

This series rewrites the README using markdown syntax and adds a
contribution guide.

Series was submitted as a GitHub pull request as well:
  * https://github.com/fenrus75/powertop/pull/43

Thanks to my colleague, Doug Martin, for reviewing these changes.

CONTRIBUTE.md changes up development workflows in (hopefully) a good
way. In my opinion, these are the key take-aways from that document:
  * Use GitHub workflows for sharing/collaborating (e.g. PRs, Issues)
  * Use the Linux kernel coding style

The README and CONTRIBUTE documents will continue to evolve, but this
should get us going in the right direction.

PS: PowerTOP's project description on GitHub ("please post patches to
the mailing list instead of using github pull requests") will be changed
after this series is merged-- if it is.


Joe Konno (3):
  README.md: rename, add md syntax, and major tweaks
  README.md: Fix a misspelled name
  Add CONTRIBUTE.md

 CONTRIBUTE.md | 188 ++++++++++++++++++++++++++++++++++++++++++++++
 README        | 157 --------------------------------------
 README.md     | 204 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 392 insertions(+), 157 deletions(-)
 create mode 100644 CONTRIBUTE.md
 delete mode 100644 README
 create mode 100644 README.md

-- =

2.26.2

--===============5099588845271244939==--

