Content-Type: multipart/mixed; boundary="===============1387383640365221455=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 07/19] scripts: add regenerate-potfiles-in script
Date: Wed, 03 Aug 2016 17:59:17 -0700
Message-ID: <1470272369-218664-8-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1387383640365221455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

This is a convenience script for maintainers or translators. POTFILES.in
is input into gettext for string translation.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 scripts/regenerate-potfiles-in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 scripts/regenerate-potfiles-in

diff --git a/scripts/regenerate-potfiles-in b/scripts/regenerate-potfiles-in
new file mode 100644
index 000000000000..a178fa0b4b77
--- /dev/null
+++ b/scripts/regenerate-potfiles-in
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+echo "INFO: checking for git ..."
+git --version > /dev/null 2>&1 || exit 1
+
+echo "INFO: priming ./POTFILES.in.new ..."
+touch POTFILES.in.new || exit 2
+echo "# List of source files which contain translatable strings." > POTFIL=
ES.in.new || exit 3
+echo "" >> POTFILES.in.new || exit 4
+
+echo "INFO: populating ./POTFILES.in.new ..."
+git grep -l -e "__(" -e "_(" | sort >> POTFILES.in.new || exit 5
+
+echo "INFO: contents of ./POTFILES.in.new ..."
+cat POTFILES.in.new
-- =

1.8.3.1


--===============1387383640365221455==--

