Content-Type: multipart/mixed; boundary="===============1941452513234491286=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 13/15] fix typo in message
Date: Tue, 25 Nov 2014 21:16:26 +0000
Message-ID: <1416950188-16616-14-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1941452513234491286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index b6679f2..dc69fca 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -436,7 +436,7 @@ int main(int argc, char **argv)
 			break;
 		case 'q':
 			if (freopen("/dev/null", "a", stderr))
-				fprintf(stderr, _("Quite mode failed!\n"));
+				fprintf(stderr, _("Quiet mode failed!\n"));
 			break;
 		case 't':
 			time_out =3D (optarg ? atoi(optarg) : 20);
-- =

2.1.3


--===============1941452513234491286==--

