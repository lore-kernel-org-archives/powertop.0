Content-Type: multipart/mixed; boundary="===============3641804625782610998=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Command line set tunables option
Date: Thu, 04 Jul 2013 12:23:37 +0300
Message-ID: <20130704092337.GA2269@swordfish>
In-Reply-To: CAAKyH8xsWuPUPtpLeHimD0r7=iH2NOv6RBU1eOnKV5O05kGpig@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3641804625782610998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/04/13 13:13), Mark Boorer wrote:
>    I've written a small patch for powertop to add a command line option t=
hat
>    will set all of the tunables to GOOD, then exit.
> =

>    I often find myself opening powertop, switching to the tunables tab and
>    clicking enter on each of the settings when I run my laptop. I do this
>    because I'm too lazy to go through and set everything up manually ;)
>    Not sure if this is the desired workflow for people to use this
>    application, but if you are interested is it possible for the patch to=
 be
>    merged in?

Cc Arjan.

Hello,
I like the idea. Thank you.

A couple of things in your patch:

1. I don't want tunable to be exposed to main.
2. set_tunables() could be done a bit easier.
3. I don't wan't yet another exit point from main. we already have
   exit point, which is 'leave_powertop =3D=3D 1'.
4. alternative exit point, by the way, requires yet another init point.
   we already have one, let's keep using it.


I took your patch and did some adjustments. I also changes option name
to --auto-tune.


However, I'm not user if we can merge it into 2.4.
Arjan, could you please share release schedule plans?

Thanks.

	-ss

--------8<-----------8<---------


Original idea by Mark Boorer <markboo99 at gmail.com>

Introduce --auto-tune mode.
Auto tune toggles all existing tunables to GOOD state and finishes
powertop execution.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/main.cpp          | 23 ++++++++++++++++-------
 src/tuning/tuning.cpp |  8 ++++++++
 src/tuning/tuning.h   |  4 +---
 3 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 0883424..1810c78 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -71,6 +71,7 @@ static const struct option long_options[] =3D
 	{"version", no_argument, NULL, 'V'},
 	{"help",no_argument, NULL, 'u'}, /* u for usage */
 	{"calibrate",no_argument, NULL, 'c'},
+	{"auto-tune",no_argument, NULL, 'a'},
 	{"html", optional_argument, NULL, 'h'},
 	{"csv", optional_argument, NULL, 'C'},
 	{"extech", optional_argument, NULL, 'e'},
@@ -106,6 +107,7 @@ static void print_usage()
 	printf("--debug \t\t %s\n",_("run in \"debug\" mode"));
 	printf("--version \t\t %s\n",_("print version information"));
 	printf("--calibrate \t\t %s\n",_("runs powertop in calibration mode"));
+	printf("--auto-tune \t\t %s\n",_("Sets all tunable options to their GOOD =
setting"));
 	printf("--extech%s \t %s\n",_("[=3Ddevnode]"),_("uses an Extech Power Ana=
lyzer for measurements"));
 	printf("--html%s \t %s\n",_("[=3DFILENAME]"),_("generate a html report"));
 	printf("--csv%s \t %s\n",_("[=3DFILENAME]"),_("generate a csv report"));
@@ -339,7 +341,7 @@ int main(int argc, char **argv)
 	int c;
 	char filename[4096];
 	char workload[4096] =3D {0,};
-	int  iterations =3D 1;
+	int  iterations =3D 1, auto_tune =3D 0;
 =

 	set_new_handler(out_of_memory);
 =

@@ -367,7 +369,10 @@ int main(int argc, char **argv)
 				print_usage();
 				exit(0);
 				break;
-
+			case 'a':
+				auto_tune =3D 1;
+				leave_powertop =3D 1;
+				break;
 			case 'c':
 				powertop_init();
 				calibrate();
@@ -423,13 +428,17 @@ int main(int argc, char **argv)
 		end_pci_access();
 		exit(0);
 	}
-
-	/* first one is short to not let the user wait too long */
 	init_display();
-	one_measurement(1, NULL);
 	initialize_tuning();
-	tuning_update_display();
-	show_tab(0);
+	/* first one is short to not let the user wait too long */
+	one_measurement(1, NULL);
+
+	if (!auto_tune) {
+		tuning_update_display();
+		show_tab(0);
+	} else {
+		auto_toggle_tuning();
+	}
 =

 	while (!leave_powertop) {
 		show_cur_tab();
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 08d8251..ff3d715 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -273,3 +273,11 @@ void clear_tuning()
 	}
 	all_untunables.clear();
 }
+
+void auto_toggle_tuning()
+{
+	for (unsigned int i =3D 0; i < all_tunables.size(); i++) {
+		if (all_tunables[i]->good_bad() =3D=3D TUNE_BAD)
+			all_tunables[i]->toggle();
+	}
+}
diff --git a/src/tuning/tuning.h b/src/tuning/tuning.h
index 7c4921f..f70001b 100644
--- a/src/tuning/tuning.h
+++ b/src/tuning/tuning.h
@@ -29,7 +29,5 @@ extern void initialize_tuning(void);
 extern void tuning_update_display(void);
 extern void report_show_tunables(void);
 extern void clear_tuning(void);
-
-
-
+extern void auto_toggle_tuning(void);
 #endif

--===============3641804625782610998==--

