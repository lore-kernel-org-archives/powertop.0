Content-Type: multipart/mixed; boundary="===============2335151271760738000=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
Date: Sat, 02 Feb 2013 18:01:40 +0300
Message-ID: <20130202150140.GA2676@swordfish>
In-Reply-To: CAHgBLorwRL4gVnv7gZv3fFRbZH_Dcvtf8pRgkdoX_9EBekbuUA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2335151271760738000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/02/13 10:03), Thomas Waldecker wrote:
> Forgot to include mailing list.
> =

> Hi Sergey,
> =

> no I were not aware of the V2 patch. V1 just worked for me.
> =

> Magnus made me aware of the V2 of the patch:
> https://lists.01.org/pipermail/powertop/2013-January/000725.html
>

Hello,

wow! that's something... somehow I did not receive this message. I can see =
it in my
gmail web interface, on mailing list web page, but fetchmail (usually trust=
ed) refused
to fetch it and thus I missed it. thanks for pointing that out for me.

well, the whole situation is confusing. we've pushed Igor's patch on behalf=
 of Thomas and
now we are about to do similar thing (diff between two Igor's patches) agai=
n. =

I'm sorry Thomas, I appreciate your help, but I can't ACK your patch withou=
t Igor's
ACK/patch of his own/etc.

thanks,

	-ss

 =

> For some reason my patch didn't go as a respose to his email.
> =

> Thomas
> =

> 2013/2/2 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>:
> > On (02/01/13 21:37), Thomas Waldecker wrote:
> >> Updated the shellscript with changes made by Igor posted in mailing li=
st
> >> https://lists.01.org/pipermail/powertop/2012-July/000165.html
> >> ---
> >
> > Cc Igor
> >
> > All right, first, my bad, I should admit that I overlooked this patch. =
Sorry Igor, and
> > thanks to Thomas.
> >
> > Second, Thomas, were you aware of the V2 patch by the time you submitte=
d Igor's V1?
> >
> >
> >
> > From ethical point of view, I think only original author can change thi=
s line
> >
> >  -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
> >  -
> >  +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
> >
> >
> >         -ss
> >
> >
> >>  .gitignore      |  1 -
> >>  src/Makefile.am |  3 +--
> >>  src/csstoh.sh   | 21 ++++++++++-----------
> >>  3 files changed, 11 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/.gitignore b/.gitignore
> >> index 96ffdba..35d41c2 100644
> >> --- a/.gitignore
> >> +++ b/.gitignore
> >> @@ -39,7 +39,6 @@ po/*.gmo
> >>  po/stamp-po
> >>  src/powertop
> >>  src/css.h
> >> -src/csstoh
> >>  src/Makefile.in
> >>  src/.deps/
> >>  src/Makefile
> >> diff --git a/src/Makefile.am b/src/Makefile.am
> >> index a53d942..398b8a7 100644
> >> --- a/src/Makefile.am
> >> +++ b/src/Makefile.am
> >> @@ -46,6 +46,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LI=
BS) $(LIBNL_LIBS) $(LIBZ_LIBS)
> >>  BUILT_SOURCES =3D css.h
> >>  CLEANFILES =3D css.h
> >>  css.h: powertop.css
> >> -     chmod +x ./csstoh.sh
> >> -     ./csstoh.sh "$(srcdir)"/powertop.css css.h
> >> +     $(SHELL) ./csstoh.sh powertop.css css.h
> >>
> >> diff --git a/src/csstoh.sh b/src/csstoh.sh
> >> index 5918d12..9d4100b 100755
> >> --- a/src/csstoh.sh
> >> +++ b/src/csstoh.sh
> >> @@ -1,4 +1,4 @@
> >> -#!/bin/bash
> >> +#!/bin/sh
> >>  #
> >>  # This program file is free software; you can redistribute it and/or =
modify it
> >>  # under the terms of the GNU General Public License as published by t=
he
> >> @@ -16,8 +16,7 @@
> >>  # Boston, MA 02110-1301 USA
> >>  # or just google for it.
> >>  #
> >> -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
> >> -
> >> +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
> >>
> >>  if [ $# -lt 2 ]; then
> >>       echo "Usage: csstoh.sh cssfile header.h"
> >> @@ -29,17 +28,17 @@ if [ ! -r $1 ]; then
> >>       exit 1
> >>  fi
> >>
> >> -if ! echo -n>$2; then
> >> +if ! echo -n >$2; then
> >>       echo "Can't open file $2 for writing."
> >>       exit 1
> >>  fi
> >>
> >> -echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
> >> -echo "#define __INCLUDE_GUARD_CCS_H">>  $2
> >> -echo>>  $2
> >> -echo "const char css[] =3D ">>  $2
> >> +echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
> >> +echo "#define __INCLUDE_GUARD_CCS_H" >> $2
> >> +echo >> $2
> >> +echo "const char css[] =3D " >> $2
> >>
> >> -sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
> >> +sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
> >>
> >> -echo ";">>  $2
> >> -echo "#endif">>  $2
> >> +echo ";" >> $2
> >> +echo "#endif" >> $2
> >> --
> >> 1.8.1
> >>
> >> _______________________________________________
> >> PowerTop mailing list
> >> PowerTop(a)lists.01.org
> >> https://lists.01.org/mailman/listinfo/powertop
> >>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============2335151271760738000==--

