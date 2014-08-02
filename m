Content-Type: multipart/mixed; boundary="===============3917763069031964175=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 07/12] move options structure to function scope
Date: Sat, 02 Aug 2014 12:54:12 +0100
Message-ID: <1406980457-19077-8-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3917763069031964175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 99a985f..910fe5c 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -69,23 +69,6 @@ int debug_learning =3D 0;
 unsigned time_out =3D 20;
 int leave_powertop =3D 0;
 =

-static const struct option long_options[] =3D
-{
-	/* These options set a flag. */
-	{"debug", no_argument, &debug_learning, 'd'},
-	{"version", no_argument, NULL, 'V'},
-	{"help",no_argument, NULL, 'u'}, /* u for usage */
-	{"calibrate",no_argument, NULL, 'c'},
-	{"auto-tune",no_argument, NULL, 'a'},
-	{"html", optional_argument, NULL, 'h'},
-	{"csv", optional_argument, NULL, 'C'},
-	{"extech", optional_argument, NULL, 'e'},
-	{"time", optional_argument, NULL, 't'},
-	{"iteration", optional_argument, NULL, 'i'},
-	{"workload", optional_argument, NULL, 'w'},
-	{"quiet", no_argument, NULL, 'q'},
-	{NULL, 0, NULL, 0}
-};
 =

 static void print_version()
 {
@@ -370,6 +353,24 @@ int main(int argc, char **argv)
 	char workload[4096] =3D {0,};
 	int  iterations =3D 1, auto_tune =3D 0;
 =

+	static const struct option long_options[] =3D
+	{
+		/* These options set a flag. */
+		{"debug", no_argument, &debug_learning, 'd'},
+		{"version", no_argument, NULL, 'V'},
+		{"help",no_argument, NULL, 'u'}, /* u for usage */
+		{"calibrate",no_argument, NULL, 'c'},
+		{"auto-tune",no_argument, NULL, 'a'},
+		{"html", optional_argument, NULL, 'h'},
+		{"csv", optional_argument, NULL, 'C'},
+		{"extech", optional_argument, NULL, 'e'},
+		{"time", optional_argument, NULL, 't'},
+		{"iteration", optional_argument, NULL, 'i'},
+		{"workload", optional_argument, NULL, 'w'},
+		{"quiet", no_argument, NULL, 'q'},
+		{NULL, 0, NULL, 0}
+	};
+
 	set_new_handler(out_of_memory);
 =

 	setlocale (LC_ALL, "");
-- =

2.0.3


--===============3917763069031964175==--

