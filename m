Content-Type: multipart/mixed; boundary="===============1345607821102553795=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 03/14] add missing space to --version print out
Date: Sun, 09 Nov 2014 13:14:20 +0000
Message-ID: <1415538871-11411-4-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1345607821102553795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index cfdc993..817a14a 100644
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


--===============1345607821102553795==--

