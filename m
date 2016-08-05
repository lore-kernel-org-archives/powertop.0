Content-Type: multipart/mixed; boundary="===============2186029512457163823=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v1 1/3] main.cpp: remove __DATE__ from --version
Date: Fri, 05 Aug 2016 12:27:19 -0700
Message-ID: <1470425241-215266-2-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1470425241-215266-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2186029512457163823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

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


--===============2186029512457163823==--

