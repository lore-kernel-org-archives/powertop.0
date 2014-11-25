Content-Type: multipart/mixed; boundary="===============0196011074415843467=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 01/15] configure: require new enough automake
 version
Date: Tue, 25 Nov 2014 21:16:14 +0000
Message-ID: <1416950188-16616-2-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0196011074415843467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andreas had build issues with older than 1.11 automake, and it seemed
like 1.11.1 would good required version until Alexandra pointed out that
1.12.2 is needed to be safe from CVE-2012-3386 vulnerability.

Reported-by: Andreas Mohr <andi(a)lisas.de>
Reported-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
Reference: http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2012-3386
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 configure.ac | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 3756671..7ab763f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,11 @@
 =

 AC_PREREQ([2.68])
 AC_INIT([powertop], [2.7], [powertop(a)lists.01.org], [], [https://01.org/=
powertop])
-AM_INIT_AUTOMAKE([-Wall foreign])
+AM_INIT_AUTOMAKE([
+	-Wall
+	1.12.2
+	foreign
+])
 AC_LANG([C++])
 AC_CONFIG_FILES([
 	Makefile
-- =

2.1.3


--===============0196011074415843467==--

