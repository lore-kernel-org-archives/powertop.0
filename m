Content-Type: multipart/mixed; boundary="===============1227188593354024531=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 03/14] add missing space to --version print out
Date: Sat, 25 Oct 2014 18:33:50 +0100
Message-ID: <1414258441-30099-4-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1227188593354024531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index d3963ed..6e56d8e 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -96,7 +96,7 @@ static const struct option long_options[] =3D
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

2.1.2


--===============1227188593354024531==--

