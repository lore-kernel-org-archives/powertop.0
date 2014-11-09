Content-Type: multipart/mixed; boundary="===============3330790372319966704=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 08/14] main: fix incompatible operand type
Date: Sun, 09 Nov 2014 13:14:25 +0000
Message-ID: <1415538871-11411-9-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3330790372319966704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

main.cpp:430:35: error: incompatible operand types ('char *' and 'char')
                        sprintf(workload, "%s", optarg ? optarg : '\0');

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 817a14a..23725d1 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -445,7 +445,7 @@ int main(int argc, char **argv)
 			time_out =3D (optarg ? atoi(optarg) : 20);
 			break;
 		case 'w':		/* measure workload */
-			sprintf(workload, "%s", optarg ? optarg : '\0');
+			sprintf(workload, "%s", optarg ? optarg : "");
 			break;
 		case 'V':
 			print_version();
-- =

2.1.3


--===============3330790372319966704==--

