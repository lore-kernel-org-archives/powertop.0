Content-Type: multipart/mixed; boundary="===============1352709146379834336=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
Date: Mon, 04 Feb 2013 11:59:02 -0800
Message-ID: <20130204115902.70694592@bluebird.jf.intel.com>
In-Reply-To: 1359751029-7114-1-git-send-email-thomas.waldecker@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1352709146379834336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri,  1 Feb 2013 21:37:09 +0100
Thomas Waldecker <thomas.waldecker(a)gmail.com> wrote:

> Updated the shellscript with changes made by Igor posted in mailing list
> https://lists.01.org/pipermail/powertop/2012-July/000165.html

The patch no longer applies, because I took Sergey's patch removing
csstoh.  You'll have to redo it.

I don't have a problem with taking this patch if you say it works for
you, with or without Igor's ack, as long as it's harmless to native
compiling.  I'm never going to test cross compiling though.

My suggestion to you is to just CC Igor on your revised patch - if he
wants to nack it and resubmit his own he can, otherwise I'll take
yours after some reasonable period of time.

> ---
>  .gitignore      |  1 -
>  src/Makefile.am |  3 +--
>  src/csstoh.sh   | 21 ++++++++++-----------
>  3 files changed, 11 insertions(+), 14 deletions(-)
> =

> diff --git a/.gitignore b/.gitignore
> index 96ffdba..35d41c2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -39,7 +39,6 @@ po/*.gmo
>  po/stamp-po
>  src/powertop
>  src/css.h
> -src/csstoh
>  src/Makefile.in
>  src/.deps/
>  src/Makefile
> diff --git a/src/Makefile.am b/src/Makefile.am
> index a53d942..398b8a7 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -46,6 +46,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS)=
 $(LIBNL_LIBS) $(LIBZ_LIBS)
>  BUILT_SOURCES =3D css.h
>  CLEANFILES =3D css.h
>  css.h: powertop.css
> -	chmod +x ./csstoh.sh
> -	./csstoh.sh "$(srcdir)"/powertop.css css.h
> +	$(SHELL) ./csstoh.sh powertop.css css.h
>  =

> diff --git a/src/csstoh.sh b/src/csstoh.sh
> index 5918d12..9d4100b 100755
> --- a/src/csstoh.sh
> +++ b/src/csstoh.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  #
>  # This program file is free software; you can redistribute it and/or mod=
ify it
>  # under the terms of the GNU General Public License as published by the
> @@ -16,8 +16,7 @@
>  # Boston, MA 02110-1301 USA
>  # or just google for it.
>  #
> -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
> -
> +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
>  =

>  if [ $# -lt 2 ]; then
>  	echo "Usage: csstoh.sh cssfile header.h"
> @@ -29,17 +28,17 @@ if [ ! -r $1 ]; then
>  	exit 1
>  fi
>  =

> -if ! echo -n>$2; then
> +if ! echo -n >$2; then
>  	echo "Can't open file $2 for writing."
>  	exit 1
>  fi
>  =

> -echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
> -echo "#define __INCLUDE_GUARD_CCS_H">>  $2
> -echo>>  $2
> -echo "const char css[] =3D ">>  $2
> +echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
> +echo "#define __INCLUDE_GUARD_CCS_H" >> $2
> +echo >> $2
> +echo "const char css[] =3D " >> $2
>  =

> -sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
> +sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
>  =

> -echo ";">>  $2
> -echo "#endif">>  $2
> +echo ";" >> $2
> +echo "#endif" >> $2


--===============1352709146379834336==--

