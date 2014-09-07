Content-Type: multipart/mixed; boundary="===============2203887345809705792=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 08/15] add short options to usage,
 and reorder options in code
Date: Sun, 07 Sep 2014 22:27:11 +0100
Message-ID: <1410125238-29600-9-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1410125238-29600-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2203887345809705792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Earlier user experience was pretty unintuitive.  For example -h is often
help, and it generated following error message.

powertop: option requires an argument -- 'h'

This change re-assigned short option -h from --html to --help, and made
-r to be assigned with --html.  All other short vs long option pairs
remain untouched.

The option data in struct option, print_usage(), getopt_long() optstring,
and getopt_long switch() case, are reorderd be in same order in all four
places.  All options are in long-option alphabetical order, with
exception of --version and --help that are the last in the lists.

Some options where meant to be used as long-only options.  These are made
unreachable by making the option character to be out side of range what
user can type.

Finally if an unknown option is found exit the value is changed from zero
to one to indicate an error.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 162 ++++++++++++++++++++++++++++++-------------------------=
----
 1 file changed, 82 insertions(+), 80 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 99a985f..e4d5d31 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -69,22 +69,28 @@ int debug_learning =3D 0;
 unsigned time_out =3D 20;
 int leave_powertop =3D 0;
 =

+enum {
+	OPT_AUTO_TUNE =3D CHAR_MAX + 1,
+	OPT_EXTECH,
+	OPT_DEBUG
+};
+
 static const struct option long_options[] =3D
 {
 	/* These options set a flag. */
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
+	{"auto-tune",	no_argument,		NULL,		 OPT_AUTO_TUNE},
+	{"calibrate",	no_argument,		NULL,		 'c'},
+	{"csv",		optional_argument,	NULL,		 'C'},
+	{"debug",	no_argument,		&debug_learning, OPT_DEBUG},
+	{"extech",	optional_argument,	NULL,		 OPT_EXTECH},
+	{"html",	optional_argument,	NULL,		 'r'},
+	{"iteration",	optional_argument,	NULL,		 'i'},
+	{"quiet",	no_argument,		NULL,		 'q'},
+	{"time",	optional_argument,	NULL,		 't'},
+	{"workload",	optional_argument,	NULL,		 'w'},
+	{"version",	no_argument,		NULL,		 'V'},
+	{"help",	no_argument,		NULL,		 'h'},
+	{NULL,		0,			NULL,		 0}
 };
 =

 static void print_version()
@@ -108,21 +114,21 @@ static bool set_refresh_timeout()
 =

 static void print_usage()
 {
-	printf("%s\n\n",_("Usage: powertop [OPTIONS]"));
-	printf("--debug \t\t %s\n",_("run in \"debug\" mode"));
-	printf("--version \t\t %s\n",_("print version information"));
-	printf("--calibrate \t\t %s\n",_("runs powertop in calibration mode"));
-	printf("--auto-tune \t\t %s\n",_("Sets all tunable options to their GOOD =
setting"));
-	printf("--extech%s \t %s\n",_("[=3Ddevnode]"),_("uses an Extech Power Ana=
lyzer for measurements"));
-	printf("--html%s \t %s\n",_("[=3DFILENAME]"),_("generate a html report"));
-	printf("--csv%s \t %s\n",_("[=3DFILENAME]"),_("generate a csv report"));
-	printf("--time%s \t %s\n",_("[=3Dseconds]"), _("generate a report for 'x'=
 seconds"));
-	printf("--iteration%s\n", _("[=3Diterations] number of times to run each =
test"));
-	printf("--workload%s \t %s\n", _("[=3Dworkload]"), _("file to execute for=
 workload"));
-	printf("--quiet \t\t %s\n", _("suppress stderr output"));
-	printf("--help \t\t\t %s\n",_("print this help menu"));
+	printf("%s\n\n", _("Usage: powertop [OPTIONS]"));
+	printf("     --auto-tune\t %s\n", _("sets all tunable options to their GO=
OD setting"));
+	printf(" -c, --calibrate\t %s\n", _("runs powertop in calibration mode"));
+	printf(" -C, --csv%s\t %s\n", _("[=3Dfilename]"), _("generate a csv repor=
t"));
+	printf("     --debug\t\t %s\n", _("run in \"debug\" mode"));
+	printf("     --extech%s\t %s\n", _("[=3Ddevnode]"), _("uses an Extech Pow=
er Analyzer for measurements"));
+	printf(" -r, --html%s\t %s\n", _("[=3Dfilename]"), _("generate a html rep=
ort"));
+	printf(" -i, --iteration%s\n", _("[=3Diterations] number of times to run =
each test"));
+	printf(" -q, --quiet\t\t %s\n", _("suppress stderr output"));
+	printf(" -t, --time%s\t %s\n", _("[=3Dseconds]"), _("generate a report fo=
r 'x' seconds"));
+	printf(" -w, --workload%s %s\n", _("[=3Dworkload]"), _("file to execute f=
or workload"));
+	printf(" -V, --version\t\t %s\n", _("print version information"));
+	printf(" -h, --help\t\t %s\n", _("print this help menu"));
 	printf("\n");
-	printf("%s\n\n",_("For more help please refer to the README"));
+	printf("%s\n\n", _("For more help please refer to the 'man 8 powertop'"));
 }
 =

 static void do_sleep(int seconds)
@@ -380,63 +386,59 @@ int main(int argc, char **argv)
 #endif
 =

 	while (1) { /* parse commandline options */
-		c =3D getopt_long (argc, argv, "ch:C:i:t:uVw:q", long_options, &option_i=
ndex);
+		c =3D getopt_long(argc, argv, "cC:r:i:qt:w:Vh", long_options, &option_in=
dex);
 		/* Detect the end of the options. */
 		if (c =3D=3D -1)
 			break;
-
 		switch (c) {
-			case 'V':
-				print_version();
-				exit(0);
-				break;
-
-			case 'e': /* Extech power analyzer support */
-				checkroot();
-				extech_power_meter(optarg ? optarg : "/dev/ttyUSB0");
-				break;
-			case 'u':
-				print_usage();
-				exit(0);
-				break;
-			case 'a':
-				auto_tune =3D 1;
-				leave_powertop =3D 1;
-				break;
-			case 'c':
-				powertop_init();
-				calibrate();
-				break;
-
-			case 'h': /* html report */
-				reporttype =3D REPORT_HTML;
-				sprintf(filename, "%s", optarg ? optarg : "powertop.html" );
-				break;
-
-			case 't':
-				time_out =3D (optarg ? atoi(optarg) : 20);
-				break;
-
-			case 'i':
-				iterations =3D (optarg ? atoi(optarg) : 1);
-				break;
-
-			case 'w': /* measure workload */
-				sprintf(workload, "%s", optarg ? optarg :'\0' );
-				break;
-			case 'q':
-				if(freopen("/dev/null", "a", stderr))
-					fprintf(stderr, _("Quite mode failed!\n"));
-				break;
-
-			case 'C': /* csv report*/
-				reporttype =3D REPORT_CSV;
-				sprintf(filename, "%s", optarg ? optarg : "powertop.csv");
-				break;
-			case '?': /* Unknown option */
-				/* getopt_long already printed an error message. */
-				exit(0);
-				break;
+		case OPT_AUTO_TUNE:
+			auto_tune =3D 1;
+			leave_powertop =3D 1;
+			break;
+		case 'c':
+			powertop_init();
+			calibrate();
+			break;
+		case 'C':		/* csv report */
+			reporttype =3D REPORT_CSV;
+			sprintf(filename, "%s", optarg ? optarg : "powertop.csv");
+			break;
+		case OPT_DEBUG:
+			/* implemented using getopt_long(3) flag */
+			break;
+		case OPT_EXTECH:	/* Extech power analyzer support */
+			checkroot();
+			extech_power_meter(optarg ? optarg : "/dev/ttyUSB0");
+			break;
+		case 'r':		/* html report */
+			reporttype =3D REPORT_HTML;
+			sprintf(filename, "%s", optarg ? optarg : "powertop.html");
+			break;
+		case 'i':
+			iterations =3D (optarg ? atoi(optarg) : 1);
+			break;
+		case 'q':
+			if (freopen("/dev/null", "a", stderr))
+				fprintf(stderr, _("Quite mode failed!\n"));
+			break;
+		case 't':
+			time_out =3D (optarg ? atoi(optarg) : 20);
+			break;
+		case 'w':		/* measure workload */
+			sprintf(workload, "%s", optarg ? optarg : '\0');
+			break;
+		case 'V':
+			print_version();
+			exit(0);
+			break;
+		case 'h':
+			print_usage();
+			exit(0);
+			break;
+		case '?':		/* Unknown option */
+			/* getopt_long already printed an error message. */
+			exit(1);
+			break;
 		}
 	}
 =

-- =

2.1.0


--===============2203887345809705792==--

