Content-Type: multipart/mixed; boundary="===============0903771408977589386=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 08/15] main: fix incompatible operand type
Date: Tue, 25 Nov 2014 21:16:21 +0000
Message-ID: <1416950188-16616-9-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0903771408977589386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

main.cpp:430:35: error: incompatible operand types ('char *' and 'char')
                        sprintf(workload, "%s", optarg ? optarg : '\0');

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 6130732..6fdfd54 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -442,7 +442,7 @@ int main(int argc, char **argv)
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


--===============0903771408977589386==--

