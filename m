Content-Type: multipart/mixed; boundary="===============6984021582237890144=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 12:47:21 +0400
Message-ID: <4FFD3D99.5030400@samsung.com>
In-Reply-To: 1341993257.4108.9.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6984021582237890144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is the formatted version of the patch:

 From 06ee265b637bd75e2147631f49454c2c82be827e Mon Sep 17 00:00:00 2001
From: Igor Zhbanov<i.zhbanov(a)samsung.com>
Date: Wed, 11 Jul 2012 12:44:39 +0400
Subject: [PATCH] csstoh shell-script for cross-compiling PowerTOP

I have tried to build PowerTOP for ARM with a cross-compiler. But PowerTOP
uses internal csstoh utility that converts powertop.css to powertoh.h
for inclusion in *.cpp source files.

When you use the cross-compiler (without making complicated rules
in the Makefile) this utility will be compiled for ARM platform too.
And you cannot run it on x86 build host.

To solve this issue (and because of simplicity of the utility)
I have rewritten it in a shell script.
---
  .gitignore      |    1 -
  src/Makefile.am |    7 ++-----
  2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 5534072..35f0df6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,7 +39,6 @@ po/*.gmo
  po/stamp-po
  src/powertop
  src/css.h
-src/csstoh
  src/Makefile.in
  src/.deps/
  src/Makefile
diff --git a/src/Makefile.am b/src/Makefile.am
index c77b2aa..15e5feb 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,9 +1,6 @@
  AUTOMAKE_OPTIONS =3D subdir-objects
  ACLOCAL_AMFLAGS =3D -I ../m4

-noinst_PROGRAMS =3D csstoh
-csstoh_SOURCES =3D csstoh.c
-
  sbin_PROGRAMS =3D powertop
  nodist_powertop_SOURCES =3D css.h

@@ -44,6 +41,6 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)

  BUILT_SOURCES =3D css.h
  CLEANFILES =3D css.h
-css.h: csstoh powertop.css
-	./csstoh powertop.css css.h
+css.h: powertop.css
+	$(SHELL) ./csstoh.sh powertop.css css.h

-- =

1.7.5.4

Paul Menzel wrote:

> Dear Igor, dear Sergey,
>
>
> Am Mittwoch, den 11.07.2012, 10:36 +0300 schrieb Sergey Senozhatsky:
>> On (07/11/12 11:15), Igor Zhbanov wrote:
>>> Here is the new version:
>>>
>>> --8<--Cut-here---------------------------------------------------------=
-------
>> Igor, could you please inline patch as "git diff -u -p" output, not as a=
ttachment.
>          $ git commit -a
>          $ git format-patch -1
>
> is the preferred way as far as I know. Please see my other message, I
> sent in reply to =C2=BB[Powertop] Device list sort function bug=C2=AB.
>
>
> Thanks,
>
> Paul


-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6984021582237890144==--

