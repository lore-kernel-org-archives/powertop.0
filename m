Content-Type: multipart/mixed; boundary="===============4792431870746508027=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 13/14] fix typo in message
Date: Sun, 09 Nov 2014 13:14:30 +0000
Message-ID: <1415538871-11411-14-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4792431870746508027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 9028acc..d2b7b31 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -439,7 +439,7 @@ int main(int argc, char **argv)
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


--===============4792431870746508027==--

