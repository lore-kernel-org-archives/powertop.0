Content-Type: multipart/mixed; boundary="===============8001696587800094184=="
MIME-Version: 1.0
From: Thomas Waldecker <thomas.waldecker at gmail.com>
Subject: [Powertop]  [PATCH] csstoh shell-script for cross-compiling
Date: Sat, 02 Feb 2013 10:03:35 +0100
Message-ID: <CAHgBLorwRL4gVnv7gZv3fFRbZH_Dcvtf8pRgkdoX_9EBekbuUA@mail.gmail.com>
In-Reply-To: CAHgBLopk4zBfdgb3QX2eK6gPO8F-iBUy59ui2iMnrcBttTDaAg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8001696587800094184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Forgot to include mailing list.


---------- Forwarded message ----------
From: Thomas Waldecker <thomas.waldecker(a)gmail.com>
Date: 2013/2/2
Subject: Re: [Powertop] [PATCH] csstoh shell-script for cross-compiling
To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>


Hi Sergey,

no I were not aware of the V2 patch. V1 just worked for me.

Magnus made me aware of the V2 of the patch:
https://lists.01.org/pipermail/powertop/2013-January/000725.html

For some reason my patch didn't go as a respose to his email.

Thomas

2013/2/2 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>:
> On (02/01/13 21:37), Thomas Waldecker wrote:
>> Updated the shellscript with changes made by Igor posted in mailing list
>> https://lists.01.org/pipermail/powertop/2012-July/000165.html
>> ---
>
> Cc Igor
>
> All right, first, my bad, I should admit that I overlooked this patch. So=
rry Igor, and
> thanks to Thomas.
>
> Second, Thomas, were you aware of the V2 patch by the time you submitted =
Igor's V1?
>
>
>
> From ethical point of view, I think only original author can change this =
line
>
>  -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
>  -
>  +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
>
>
>         -ss
>
>
>>  .gitignore      |  1 -
>>  src/Makefile.am |  3 +--
>>  src/csstoh.sh   | 21 ++++++++++-----------
>>  3 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index 96ffdba..35d41c2 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -39,7 +39,6 @@ po/*.gmo
>>  po/stamp-po
>>  src/powertop
>>  src/css.h
>> -src/csstoh
>>  src/Makefile.in
>>  src/.deps/
>>  src/Makefile
>> diff --git a/src/Makefile.am b/src/Makefile.am
>> index a53d942..398b8a7 100644
>> --- a/src/Makefile.am
>> +++ b/src/Makefile.am
>> @@ -46,6 +46,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS=
) $(LIBNL_LIBS) $(LIBZ_LIBS)
>>  BUILT_SOURCES =3D css.h
>>  CLEANFILES =3D css.h
>>  css.h: powertop.css
>> -     chmod +x ./csstoh.sh
>> -     ./csstoh.sh "$(srcdir)"/powertop.css css.h
>> +     $(SHELL) ./csstoh.sh powertop.css css.h
>>
>> diff --git a/src/csstoh.sh b/src/csstoh.sh
>> index 5918d12..9d4100b 100755
>> --- a/src/csstoh.sh
>> +++ b/src/csstoh.sh
>> @@ -1,4 +1,4 @@
>> -#!/bin/bash
>> +#!/bin/sh
>>  #
>>  # This program file is free software; you can redistribute it and/or mo=
dify it
>>  # under the terms of the GNU General Public License as published by the
>> @@ -16,8 +16,7 @@
>>  # Boston, MA 02110-1301 USA
>>  # or just google for it.
>>  #
>> -# Written by Igor Zhbanov<i.zhbanov at samsung.com>
>> -
>> +# Written by Igor Zhbanov <i.zhbanov at samsung.com>
>>
>>  if [ $# -lt 2 ]; then
>>       echo "Usage: csstoh.sh cssfile header.h"
>> @@ -29,17 +28,17 @@ if [ ! -r $1 ]; then
>>       exit 1
>>  fi
>>
>> -if ! echo -n>$2; then
>> +if ! echo -n >$2; then
>>       echo "Can't open file $2 for writing."
>>       exit 1
>>  fi
>>
>> -echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
>> -echo "#define __INCLUDE_GUARD_CCS_H">>  $2
>> -echo>>  $2
>> -echo "const char css[] =3D ">>  $2
>> +echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
>> +echo "#define __INCLUDE_GUARD_CCS_H" >> $2
>> +echo >> $2
>> +echo "const char css[] =3D " >> $2
>>
>> -sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
>> +sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
>>
>> -echo ";">>  $2
>> -echo "#endif">>  $2
>> +echo ";" >> $2
>> +echo "#endif" >> $2
>> --
>> 1.8.1
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>

--===============8001696587800094184==--

