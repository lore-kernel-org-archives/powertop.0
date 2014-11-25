Content-Type: multipart/mixed; boundary="===============1298118767411564045=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 03/15] add missing space to --version print out
Date: Tue, 25 Nov 2014 21:16:16 +0000
Message-ID: <1416950188-16616-4-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1298118767411564045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 642ac24..6130732 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -97,7 +97,7 @@ static const struct option long_options[] =3D
 =

 static void print_version()
 {
-	printf(_("PowerTOP version" POWERTOP_VERSION ", compiled on " __DATE__ "\=
n"));
+	printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE__ "=
\n"));
 }
 =

 static bool set_refresh_timeout()
-- =

2.1.3


--===============1298118767411564045==--

