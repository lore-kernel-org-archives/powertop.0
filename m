Content-Type: multipart/mixed; boundary="===============6558402899341148006=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 13/14] fix typo in message
Date: Sat, 25 Oct 2014 18:34:00 +0100
Message-ID: <1414258441-30099-14-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6558402899341148006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 94c2a6b..0c8aa80 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -421,7 +421,7 @@ int main(int argc, char **argv)
 			break;
 		case 'q':
 			if (freopen("/dev/null", "a", stderr))
-				fprintf(stderr, _("Quite mode failed!\n"));
+				fprintf(stderr, _("Quiet mode failed!\n"));
 			break;
 		case 't':
 			time_out =3D (optarg ? atoi(optarg) : 20);
-- =

2.1.2


--===============6558402899341148006==--

