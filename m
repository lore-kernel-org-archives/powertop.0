Content-Type: multipart/mixed; boundary="===============7242447195940516294=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 08/14] main: fix incompatible operand type
Date: Sat, 25 Oct 2014 18:33:55 +0100
Message-ID: <1414258441-30099-9-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1414258441-30099-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7242447195940516294==
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
index 6e56d8e..9471bcc 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -427,7 +427,7 @@ int main(int argc, char **argv)
 			time_out =3D (optarg ? atoi(optarg) : 20);
 			break;
 		case 'w':		/* measure workload */
-			sprintf(workload, "%s", optarg ? optarg : '\0');
+			sprintf(workload, "%s", optarg ? optarg : "");
 			break;
 		case 'V':
 			print_version();
-- =

2.1.2


--===============7242447195940516294==--

