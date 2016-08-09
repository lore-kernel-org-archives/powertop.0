Content-Type: multipart/mixed; boundary="===============6030981624362469899=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 1/3] main.cpp: remove __DATE__ from --version
Date: Tue, 09 Aug 2016 12:59:29 -0700
Message-ID: <1470772771-114174-2-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470772771-114174-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6030981624362469899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

v2: no change from v1

Suggested-by: eSyr <evgsyr(a)gmail.com>
Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 991dd9a68474..e6e41b1ce84d 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -99,7 +99,7 @@ static const struct option long_options[] =3D
 =

 static void print_version()
 {
-	printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE__ "=
\n"));
+	printf(_("PowerTOP version " POWERTOP_VERSION "\n"));
 }
 =

 static bool set_refresh_timeout()
-- =

1.8.3.1


--===============6030981624362469899==--

