Content-Type: multipart/mixed; boundary="===============6438424695997395863=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] [PATCH 3/4] Fix spelling of command line argument --quite
 to --quiet. Add a manpage entry for --quiet, which was missing.
Date: Thu, 23 Aug 2012 23:29:49 +0200
Message-ID: <20120823215427.C0D7BDFFDC@linda.rhrk.uni-kl.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6438424695997395863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
---
 doc/powertop.8 |    3 +++
 src/main.cpp   |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/doc/powertop.8 b/doc/powertop.8
index 8020d4e..8a70076 100644
--- a/doc/powertop.8
+++ b/doc/powertop.8
@@ -46,6 +46,9 @@ sent to others to help diagnose power issues.
 \fB\-\-iteration[\fR=3D\fIiterations\fR]
 number of times to run each test.
 .TP
+\fB\-\-quiet
+ supress stderr output.
+.TP
 \fB\-\-time[\fR=3D\fIseconds\fR]
 generate a report for a specified number of seconds.
 .TP
diff --git a/src/main.cpp b/src/main.cpp
index 8714daf..c310cb2 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -77,7 +77,7 @@ static const struct option long_options[] =3D
 	{"time", optional_argument, NULL, 't'},
 	{"iteration", optional_argument, NULL, 'i'},
 	{"workload", optional_argument, NULL, 'w'},
-	{"quite", optional_argument, NULL, 'q'},
+	{"quiet", optional_argument, NULL, 'q'},
 	{NULL, 0, NULL, 0}
 };
 =

@@ -112,7 +112,7 @@ static void print_usage()
 	printf("--time%s \t %s\n",_("[=3Dseconds]"), _("generate a report for 'x'=
 seconds"));
 	printf("--iteration%s\n", _("[=3Diterations] number of times to run each =
test"));
 	printf("--workload%s \t %s\n", _("[=3Dworkload]"), _("file to execute for=
 workload"));
-	printf("--quite \t %s\n", _("supress stderr output"));
+	printf("--quiet \t\t %s\n", _("supress stderr output"));
 	printf("--help \t\t\t %s\n",_("print this help menu"));
 	printf("\n");
 	printf("%s\n\n",_("For more help please refer to the README"));
-- =

1.7.7


--===============6438424695997395863==--

