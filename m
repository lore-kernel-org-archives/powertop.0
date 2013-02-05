Content-Type: multipart/mixed; boundary="===============5567089871800444621=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
Date: Tue, 05 Feb 2013 13:50:34 +0400
Message-ID: <5110D5EA.8040107@samsung.com>
In-Reply-To: 1360053409-29101-1-git-send-email-thomas.waldecker@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5567089871800444621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thomas Waldecker wrote:
> Updated the shellscript with changes made by Igor posted in mailing list
> https://lists.01.org/pipermail/powertop/2012-July/000165.html
>
> Signed-off-by: Thomas Waldecker <thomas.waldecker(a)gmail.com>
> ---
>   src/Makefile.am |  3 +--
>   src/csstoh.sh   | 21 ++++++++++-----------
>   2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index a53d942..398b8a7 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -46,6 +46,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS)=
 $(LIBNL_LIBS) $(LIBZ_LIBS)
>   BUILT_SOURCES =3D css.h
>   CLEANFILES =3D css.h
>   css.h: powertop.css
> -	chmod +x ./csstoh.sh
> -	./csstoh.sh "$(srcdir)"/powertop.css css.h
> +	$(SHELL) ./csstoh.sh powertop.css css.h
>   =

> diff --git a/src/csstoh.sh b/src/csstoh.sh
> index 5918d12..9d4100b 100755
> --- a/src/csstoh.sh
> +++ b/src/csstoh.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>   #
>   # This program file is free software; you can redistribute it and/or mo=
dify it
>   # under the terms of the GNU General Public License as published by the
> @@ -16,8 +16,7 @@
>   # Boston, MA 02110-1301 USA
>   # or just google for it.
>   #
> -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
> -
> +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
>   =

>   if [ $# -lt 2 ]; then
>   	echo "Usage: csstoh.sh cssfile header.h"
> @@ -29,17 +28,17 @@ if [ ! -r $1 ]; then
>   	exit 1
>   fi
>   =

> -if ! echo -n>$2; then
> +if ! echo -n >$2; then
>   	echo "Can't open file $2 for writing."
>   	exit 1
>   fi
>   =

> -echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
> -echo "#define __INCLUDE_GUARD_CCS_H">>  $2
> -echo>>  $2
> -echo "const char css[] =3D ">>  $2
> +echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
> +echo "#define __INCLUDE_GUARD_CCS_H" >> $2
> +echo >> $2
> +echo "const char css[] =3D " >> $2
>   =

> -sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
> +sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
>   =

> -echo ";">>  $2
> -echo "#endif">>  $2
> +echo ";" >> $2
> +echo "#endif" >> $2
The space characters issue was because of bad mail-client.
The spaces were always there. :-)
Last patch was sent by git, so it was transmitted exactly.

Also it the last version of the patch /bin/bash was changed to /bin/sh
for better portability. So the (this) last version is better. :-)
I use it for cross-compilation. My own version is the same except
of my e-mail. I have "@" instead of "at" in it. The "at" word was created
by bad mail client. But this is not important. :-)

-- =

Best regards,
Igor Zhbanov,
Sub-Project Leader,
phone: +7 (495) 797 25 00 ext 3981
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5567089871800444621==--

