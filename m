Content-Type: multipart/mixed; boundary="===============6221712336602686051=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Optionally disable NLS
Date: Fri, 09 May 2014 10:29:15 +0300
Message-ID: <20140509072915.GA937@swordfish>
In-Reply-To: 61074.10.24.17.174.1399566842.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6221712336602686051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/08/14 09:34), Alexandra Yates wrote:
> > On (04/16/14 11:21), Rick "Zero_Chaos" Farina wrote:
> >> A report on Gentoo's bug tracker
> >> (https://bugs.gentoo.org/show_bug.cgi?id=3D505366) notes that while the
> >> configure script support --disable-nls, the nls code is not
> >> conditionally disabled which causes build failures on uclibc.  This
> >> patch from Ren=C3=A9 Rh=C3=A9aume fixes the affected code:
> >>
> >
> > looks good.
> >
> > 	-ss
> >
> >> - --- powertop-2.5/src/lib.h
> >> +++ powertop-2.5-nls/src/lib.h
> >> @@ -33,7 +33,11 @@
> >>  #include "config.h"
> >>  #endif
> >>
> >> +#ifdef ENABLE_NLS
> >>  #define _(STRING)    gettext(STRING)
> >> +#else
> >> +#define _(STRING)    (STRING)
> >> +#endif
> >>
> >>  #define POWERTOP_VERSION "v"PACKAGE_VERSION
> >>  #define POWERTOP_SHORT_VERSION PACKAGE_VERSION
> >> - --- powertop-2.5/src/main.cpp
> >> +++ powertop-2.5-nls/src/main.cpp
> >> @@ -369,8 +369,10 @@ int main(int argc, char **argv)
> >>  	set_new_handler(out_of_memory);
> >>
> >>  	setlocale (LC_ALL, "");
> >> +#ifdef ENABLE_NLS
> >>  	bindtextdomain (PACKAGE, LOCALEDIR);
> >>  	textdomain (PACKAGE);
> >> +#endif
> >>
> >>  	while (1) { /* parse commandline options */
> >>  		c =3D getopt_long (argc, argv, "ch:C:i:t:uVw:q", long_options,
> >> &option_index);
> >> - --- powertop-2.5/src/report/report-maker.h
> >> +++ powertop-2.5-nls/src/report/report-maker.h
> >> @@ -75,8 +75,13 @@
> >>  #include <string>
> >>
> >>  /* Conditional gettext. We need original strings for CSV. */
> >> +#ifdef ENABLE_NLS
> >>  #define __(STRING) \
> >>  	((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRING))
> >> +#else
> >> +#define __(STRING) (STRING)
> >> +#endif
> >> +
> >>
> >>  #ifndef UNUSED
> >>  #define UNUSED __attribute__((unused))
> >>
> >>
> >> original patch: https://505366.bugs.gentoo.org/attachment.cgi?id=3D373=
272
> >>
> >> Please accept this patch.
> >>
> >> Thanks,
> >> Zero
> I'm having issues adding this patch to the repo.  I get error:
> =

> Patch is empty.  Was it split wrong?
> =

> Sergey, did you have any problems applying this patch to your branch?
> =

> Rick, please check your patch and send it?
> =


I guess this is because of

--- powertop-2.5
+++ powertop-2.5-nls
	^^^^^^^^^^^^

the following one seems to work.

Rick, can you resend using `git send-email'?

---

 src/lib.h                 | 4 ++++
 src/main.cpp              | 2 ++
 src/report/report-maker.h | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/src/lib.h b/src/lib.h
index adcc4a2..78391a4 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -33,7 +33,11 @@
 #include "config.h"
 #endif
 =

+#ifdef ENABLE_NLS
 #define _(STRING)    gettext(STRING)
+#else
+#define _(STRING)    (STRING)
+#endif
 =

 #define POWERTOP_VERSION "v"PACKAGE_VERSION
 #define POWERTOP_SHORT_VERSION PACKAGE_VERSION
diff --git a/src/main.cpp b/src/main.cpp
index 4e34ee6..8bbc1ff 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -369,8 +369,10 @@ int main(int argc, char **argv)
 	set_new_handler(out_of_memory);
 =

 	setlocale (LC_ALL, "");
+#ifdef ENABLE_NLS
 	bindtextdomain (PACKAGE, LOCALEDIR);
 	textdomain (PACKAGE);
+#endif
 =

 	while (1) { /* parse commandline options */
 		c =3D getopt_long (argc, argv, "ch:C:i:t:uVw:q", long_options, &option_i=
ndex);
diff --git a/src/report/report-maker.h b/src/report/report-maker.h
index 75e0d06..a72aa47 100644
--- a/src/report/report-maker.h
+++ b/src/report/report-maker.h
@@ -75,8 +75,13 @@
 #include <string>
 =

 /* Conditional gettext. We need original strings for CSV. */
+#ifdef ENABLE_NLS
 #define __(STRING) \
 	((report.get_type() =3D=3D REPORT_CSV) ? (STRING) : gettext(STRING))
+#else
+#define __(STRING) (STRING)
+#endif
+
 =

 #ifndef UNUSED
 #define UNUSED __attribute__((unused))

--===============6221712336602686051==--

