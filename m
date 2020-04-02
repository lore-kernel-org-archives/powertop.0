Content-Type: multipart/mixed; boundary="===============2324730756860465075=="
MIME-Version: 1.0
From: Anthony Wong <yp at anthonywong.net>
Subject: [Powertop] Re: [PATCH 1/3 v1] Revert "configure.ac: version strings
 from git describe"
Date: Thu, 02 Apr 2020 13:55:07 +0800
Message-ID: <CAC=0FnGCS7A6uwSeV6SLgb60Qfpv85AKBhH2F1RJb6NMyiX7cw@mail.gmail.com>
In-Reply-To: 20200211221542.46228-2-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2324730756860465075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch has not been fully applied to the github project, the
src/display.cpp part has been left out, making the program now fail to
compile.
Please see https://github.com/fenrus75/powertop/commit/152a39949691d34e1c6d=
67272f3b63cbbe61bf81

-- =

Anthony

On Wed, 12 Feb 2020 at 06:16, Joe Konno <joe.konno(a)linux.intel.com> wrote:
>
> From: Joe Konno <joe.konno(a)intel.com>
>
> This doesn't work as well as I thought it would. So, let's remove it. As
> a result of the revert, remove a reference to a now-dead preprocessor
> define (PACKAGE_SHORT_VERSION).
>
> This reverts commit 2daaaf54d07340610af759cc7f4c41742abb3277.
>
> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> ---
>  .gitignore      |  1 -
>  Makefile.am     |  2 --
>  autogen.sh      |  1 -
>  configure.ac    |  5 +----
>  scripts/version | 13 -------------
>  src/display.cpp |  2 +-
>  6 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 scripts/version
>
> diff --git a/.gitignore b/.gitignore
> index 8358ca4c6c0f..c1fc2be37afe 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -89,5 +89,4 @@ Makefile.in
>  /src/powertop
>  /stamp-h1
>  /stamp-po
> -/version*
>  tags
> diff --git a/Makefile.am b/Makefile.am
> index ffb5e91b2834..22429e0ce562 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -15,6 +15,4 @@ EXTRA_DIST =3D \
>         TODO \
>         Android.mk \
>         COPYING \
> -       version-long \
> -       version-short \
>         autogen.sh
> diff --git a/autogen.sh b/autogen.sh
> index 444f9998f806..e210037d70e0 100755
> --- a/autogen.sh
> +++ b/autogen.sh
> @@ -1,4 +1,3 @@
>  #!/bin/sh
>
> -sh scripts/version
>  autoreconf --install --verbose
> diff --git a/configure.ac b/configure.ac
> index ca7f1d5cefea..b3a6b2ca2639 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -2,8 +2,7 @@
>  # Process this file with autoconf to produce a configure script.
>
>  AC_PREREQ([2.68])
> -AC_INIT([powertop], m4_esyscmd_s([cat version-long]),
> -       [powertop(a)lists.01.org], [], [https://01.org/powertop])
> +AC_INIT([powertop], [2.12-pre], [powertop(a)lists.01.org], [], [https://=
01.org/powertop])
>  AM_INIT_AUTOMAKE([
>         -Wall
>         1.12.2
> @@ -152,8 +151,6 @@ AC_SEARCH_LIBS([inet_aton], [resolv], [], [
>         AC_MSG_ERROR([libresolv is required but was not found])
>  ], [])
>
> -AC_DEFINE([PACKAGE_SHORT_VERSION], m4_esyscmd_s([cat version-short]),
> -       [Short package version])
>
>  AS_IF([`pkg-config --exists bash-completion`], [
>         bashcompletiondir=3D`pkg-config --variable=3Dcompletionsdir --def=
ine-variable=3Dprefix=3D${prefix} bash-completion`
> diff --git a/scripts/version b/scripts/version
> deleted file mode 100644
> index 348b13d9f785..000000000000
> --- a/scripts/version
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#!/bin/sh
> -
> -git branch > /dev/null 2>&1
> -if [ "$?" =3D "0" ]; then
> -       LONG=3D$(git describe --abbrev=3D7 --tags --always --dirty 2> /de=
v/null)
> -       SHORT=3D\"$(git describe --tags --abbrev=3D0 2> /dev/null)\"
> -else
> -       LONG=3D"RUN-VERSION-SCRIPT-IN-GIT-REPOSITORY-ONLY"
> -       SHORT=3D\"$LONG\"
> -fi
> -
> -echo $LONG  > version-long
> -echo $SHORT > version-short
> diff --git a/src/display.cpp b/src/display.cpp
> index 7b3a7a2f2073..71311446728d 100644
> --- a/src/display.cpp
> +++ b/src/display.cpp
> @@ -117,7 +117,7 @@ void show_tab(unsigned int tab)
>
>         wattrset(tab_bar, A_REVERSE);
>         mvwprintw(tab_bar, 0,0, "%120s", "");
> -       mvwprintw(tab_bar, 0,0, "PowerTOP %s", PACKAGE_SHORT_VERSION);
> +       mvwprintw(tab_bar, 0,0, "PowerTOP %s", PACKAGE_VERSION);
>
>         bottom_line =3D newwin(1, 0, LINES-1, 0);
>         wattrset(bottom_line, A_REVERSE);
> --
> 2.25.0
> _______________________________________________
> PowerTop mailing list -- powertop(a)lists.01.org
> To unsubscribe send an email to powertop-leave(a)lists.01.org
--===============2324730756860465075==--

