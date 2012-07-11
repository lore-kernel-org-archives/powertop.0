Content-Type: multipart/mixed; boundary="===============1157030172969043369=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 13:46:21 +0200
Message-ID: <1342007181.4108.38.camel@mattotaupa>
In-Reply-To: 4FFD3D99.5030400@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1157030172969043369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 11.07.2012, 12:47 +0400 schrieb Igor Zhbanov:
> Here is the formatted version of the patch:

Thanks, unfortunately something is incomplete.

>  From 06ee265b637bd75e2147631f49454c2c82be827e Mon Sep 17 00:00:00 2001
> From: Igor Zhbanov<i.zhbanov(a)samsung.com>
> Date: Wed, 11 Jul 2012 12:44:39 +0400
> Subject: [PATCH] csstoh shell-script for cross-compiling PowerTOP
> =

> I have tried to build PowerTOP for ARM with a cross-compiler. But PowerTOP
> uses internal csstoh utility that converts powertop.css to powertoh.h
> for inclusion in *.cpp source files.
> =

> When you use the cross-compiler (without making complicated rules
> in the Makefile) this utility will be compiled for ARM platform too.
> And you cannot run it on x86 build host.
> =

> To solve this issue (and because of simplicity of the utility)
> I have rewritten it in a shell script.
> ---
>   .gitignore      |    1 -
>   src/Makefile.am |    7 ++-----
>   2 files changed, 2 insertions(+), 6 deletions(-)

Git does not know about your new file `csstoh.sh` yet.

    $ git add src/csstoh.sh # explicitly needed, because the file is not ye=
t tracked
    $ git commit --amend -a
    $ git format-patch -1

> diff --git a/.gitignore b/.gitignore
> index 5534072..35f0df6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -39,7 +39,6 @@ po/*.gmo
>   po/stamp-po
>   src/powertop
>   src/css.h
> -src/csstoh
>   src/Makefile.in
>   src/.deps/
>   src/Makefile
> diff --git a/src/Makefile.am b/src/Makefile.am
> index c77b2aa..15e5feb 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -1,9 +1,6 @@
>   AUTOMAKE_OPTIONS =3D subdir-objects
>   ACLOCAL_AMFLAGS =3D -I ../m4
> =

> -noinst_PROGRAMS =3D csstoh
> -csstoh_SOURCES =3D csstoh.c
> -
>   sbin_PROGRAMS =3D powertop
>   nodist_powertop_SOURCES =3D css.h
> =

> @@ -44,6 +41,6 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS)=
 $(LIBNL_LIBS) $(LIBZ_LIBS)
> =

>   BUILT_SOURCES =3D css.h
>   CLEANFILES =3D css.h
> -css.h: csstoh powertop.css
> -	./csstoh powertop.css css.h
> +css.h: powertop.css
> +	$(SHELL) ./csstoh.sh powertop.css css.h
> =

> -- =

> 1.7.5.4


Thanks,

Paul


PS: In the license header the copyright year is missing if I am not
mistaken.
PPS: Is that also the right license header? Probably you just copied it
from some existing file. So it should be fine.

--===============1157030172969043369==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWsvOVo0MEFDZ2tRUFgxYUsyd09IVmhKbmdDZEVKQ1dGMFdw
dS9IYm96NkxUd0l6N3lxaApWMWNBblJLRTZtVVkvUzlqTzNISHFFcnRJTXhlMG1ZcAo9QkRWdAot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============1157030172969043369==--

