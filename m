Content-Type: multipart/mixed; boundary="===============1001114377073014501=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
Date: Sat, 02 Feb 2013 09:26:56 +0300
Message-ID: <20130202062656.GA2397@swordfish>
In-Reply-To: 1359751029-7114-1-git-send-email-thomas.waldecker@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1001114377073014501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/01/13 21:37), Thomas Waldecker wrote:
> Updated the shellscript with changes made by Igor posted in mailing list
> https://lists.01.org/pipermail/powertop/2012-July/000165.html
> ---

Cc Igor

All right, first, my bad, I should admit that I overlooked this patch. Sorr=
y Igor, and
thanks to Thomas.

Second, Thomas, were you aware of the V2 patch by the time you submitted Ig=
or's V1?



>From ethical point of view, I think only original author can change this l=
ine

 -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
 -
 +# Written by Igor Zhbanov <i.zhbanov at samsung.com>


	-ss


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
> -- =

> 1.8.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============1001114377073014501==--

