Content-Type: multipart/mixed; boundary="===============3306599813251941424=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 02/19] main.cpp: append __TIME__ to --version
 output
Date: Wed, 03 Aug 2016 17:59:12 -0700
Message-ID: <1470272369-218664-3-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470272369-218664-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3306599813251941424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

In case folks are doing lots of building and testing, it's nice to have
a time stamp on each generated binary.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 991dd9a68474..673adf3c5982 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -99,7 +99,7 @@ static const struct option long_options[] =3D
 =

 static void print_version()
 {
-	printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE__ "=
\n"));
+	printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE__ "=
 at " __TIME__ "\n"));
 }
 =

 static bool set_refresh_timeout()
-- =

1.8.3.1


--===============3306599813251941424==--

