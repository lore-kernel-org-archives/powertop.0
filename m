Content-Type: multipart/mixed; boundary="===============4015873098098262966=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH v1 2/3] configure.ac: version strings from git
 describe
Date: Sat, 06 Aug 2016 03:53:36 +0200
Message-ID: <20160806015336.GA11403@noemi>
In-Reply-To: 1470425241-215266-3-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4015873098098262966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2016 at 12:27:20PM -0700, Joe Konno wrote:
> From: Joe Konno <joe.konno(a)intel.com>
> =

> There are two version strings we need during runtime: a long version
> (for reports and --version), and a short version for the ncurses UI. Use
> a utility script to generate those strings (version-long and
> version-short) which will be cat'ed by configure and bundled when 'make
> dist' is run.
> =

> Signed-off-by: Joe Konno <joe.konno(a)intel.com>

What happens if I build this from a distributed package, i.e.

./configure
make dist
ta xzf powertop-version.tar.gz
cd powertop-version
./configure
make

This would normally create a package with no git version info so the version
scripts couldn't work.

This could obviously be regarded as an unsupported case but if so then I th=
ink
it should be said so explicitly.

/MF

> ---
>  .gitignore      |  1 +
>  Makefile.am     |  2 ++
>  autogen.sh      |  1 +
>  configure.ac    |  5 ++++-
>  scripts/version | 13 +++++++++++++
>  5 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/version
> =

> diff --git a/.gitignore b/.gitignore
> index 7eb138a094ce..ef817dc076bd 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -87,4 +87,5 @@ Makefile.in
>  /src/powertop
>  /stamp-h1
>  /stamp-po
> +/version*
>  tags
> diff --git a/Makefile.am b/Makefile.am
> index b519d110a118..3aabb22eca6e 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -14,4 +14,6 @@ EXTRA_DIST =3D \
>  	TODO \
>  	Android.mk \
>  	COPYING \
> +	version-long \
> +	version-short \
>  	autogen.sh
> diff --git a/autogen.sh b/autogen.sh
> index e210037d70e0..444f9998f806 100755
> --- a/autogen.sh
> +++ b/autogen.sh
> @@ -1,3 +1,4 @@
>  #!/bin/sh	=

>  =

> +sh scripts/version
>  autoreconf --install --verbose
> diff --git a/configure.ac b/configure.ac
> index 646b402101bb..ccfbf7ee0bb8 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -2,7 +2,8 @@
>  # Process this file with autoconf to produce a configure script.
>  =

>  AC_PREREQ([2.68])
> -AC_INIT([powertop], [2.9-pre], [powertop(a)lists.01.org], [], [https://0=
1.org/powertop])
> +AC_INIT([powertop], m4_esyscmd_s([cat version-long]),
> +	[powertop(a)lists.01.org], [], [https://01.org/powertop])
>  AM_INIT_AUTOMAKE([
>  	-Wall
>  	1.12.2
> @@ -149,5 +150,7 @@ AC_SEARCH_LIBS([inet_aton], [resolv], [], [
>  	AC_MSG_ERROR([libresolv is required but was not found])
>  ], [])
>  =

> +AC_DEFINE([PACKAGE_SHORT_VERSION], m4_esyscmd_s([cat version-short]),
> +	[Short package version])
>  =

>  AC_OUTPUT
> diff --git a/scripts/version b/scripts/version
> new file mode 100644
> index 000000000000..348b13d9f785
> --- /dev/null
> +++ b/scripts/version
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +git branch > /dev/null 2>&1
> +if [ "$?" =3D "0" ]; then
> +	LONG=3D$(git describe --abbrev=3D7 --tags --always --dirty 2> /dev/null)
> +	SHORT=3D\"$(git describe --tags --abbrev=3D0 2> /dev/null)\"
> +else
> +	LONG=3D"RUN-VERSION-SCRIPT-IN-GIT-REPOSITORY-ONLY"
> +	SHORT=3D\"$LONG\"
> +fi
> +
> +echo $LONG  > version-long
> +echo $SHORT > version-short
> -- =

> 1.8.3.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============4015873098098262966==--

