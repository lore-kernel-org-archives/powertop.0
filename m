Content-Type: multipart/mixed; boundary="===============9113760777653591485=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 01/14] configure: require new enough automake
 version
Date: Sun, 09 Nov 2014 13:14:18 +0000
Message-ID: <1415538871-11411-2-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9113760777653591485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

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
index 4991d97..b7a7104 100644
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
+	1.12.2
+	foreign
+])
 AC_LANG([C++])
 AC_CONFIG_FILES([
 	Makefile
-- =

2.1.3


--===============9113760777653591485==--

