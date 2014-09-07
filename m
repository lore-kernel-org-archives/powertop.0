Content-Type: multipart/mixed; boundary="===============5644939999744660120=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 03/15] add src/cpu/rapl/.deps to .gitignore
Date: Sun, 07 Sep 2014 22:27:06 +0100
Message-ID: <1410125238-29600-4-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5644939999744660120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 35d41c2..d00973f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,6 +44,7 @@ src/.deps/
 src/Makefile
 src/calibrate/.deps/
 src/cpu/.deps/
+src/cpu/rapl/.deps
 src/devices/.deps/
 src/measurement/.deps/
 src/parameters/.deps/
-- =

2.1.0


--===============5644939999744660120==--

