Content-Type: multipart/mixed; boundary="===============3403647059457900500=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 01/14] configure: require the least automake
 version 1.11.1
Date: Sat, 25 Oct 2014 18:33:48 +0100
Message-ID: <1414258441-30099-2-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3403647059457900500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Reported-by: Andreas Mohr <andi(a)lisas.de>
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 4991d97..c3f5666 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,11 @@
 =

 AC_PREREQ([2.68])
 AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org], [], [https://01.or=
g/powertop])
-AM_INIT_AUTOMAKE([-Wall foreign])
+AM_INIT_AUTOMAKE([
+	-Wall
+	1.11.1
+	foreign
+])
 AC_LANG([C++])
 AC_CONFIG_FILES([
 	Makefile
-- =

2.1.2


--===============3403647059457900500==--

