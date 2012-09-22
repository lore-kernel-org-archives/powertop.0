Content-Type: multipart/mixed; boundary="===============1064507998144148760=="
MIME-Version: 1.0
From: Colin King <colin.king at canonical.com>
Subject: [Powertop] [PATCH 1/4] main: Fix typo in print_usage
Date: Sat, 22 Sep 2012 19:33:06 +0100
Message-ID: <1348338789-16252-2-git-send-email-colin.king@canonical.com>
In-Reply-To: 1348338789-16252-1-git-send-email-colin.king@canonical.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1064507998144148760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Colin Ian King <colin.king(a)canonical.com>

supress =3D=3D> suppress

Signed-off-by: Colin Ian King <colin.king(a)canonical.com>
---
 src/main.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.cpp b/src/main.cpp
index 1815075..02e9f63 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -112,7 +112,7 @@ static void print_usage()
 	printf("--time%s \t %s\n",_("[=3Dseconds]"), _("generate a report for 'x'=
 seconds"));
 	printf("--iteration%s\n", _("[=3Diterations] number of times to run each =
test"));
 	printf("--workload%s \t %s\n", _("[=3Dworkload]"), _("file to execute for=
 workload"));
-	printf("--quiet \t\t %s\n", _("supress stderr output"));
+	printf("--quiet \t\t %s\n", _("suppress stderr output"));
 	printf("--help \t\t\t %s\n",_("print this help menu"));
 	printf("\n");
 	printf("%s\n\n",_("For more help please refer to the README"));
-- =

1.7.10.4


--===============1064507998144148760==--

