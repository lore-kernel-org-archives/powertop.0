Content-Type: multipart/mixed; boundary="===============6102162431741228126=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] Fix out of tree builds [Was: PowerTOP v2.6.1 released]
Date: Wed, 04 Jun 2014 14:20:18 -0700
Message-ID: <62350.10.24.5.211.1401916818.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6102162431741228126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

Unfortunately the patches you sent don't fix the issue.  Here is how to
reproduced the issue:
1- Applied your patches.
2- Generated an new dist/tarball,
3- Untared on different location
4- Executed: ./autogen; ./configure; make; make clean; make

The error still points that /bin/bash: ./csstoh.sh: No such file or directo=
ry

=3D=3D=3D=3D=3D Complete output =3D=3D=3D=3D=3D=3D

make  all-recursive
make[1]: Entering directory `/home/magd/Downloads/powertop-2.6.1'
Making all in traceevent
make[2]: Entering directory `/home/magd/Downloads/powertop-2.6.1/traceevent'
  CC     event-parse.lo
  CC     parse-filter.lo
  CC     parse-utils.lo
  CC     trace-seq.lo
  CCLD   libtraceevnet.la
make[2]: Leaving directory `/home/magd/Downloads/powertop-2.6.1/traceevent'
Making all in src
make[2]: Entering directory `/home/magd/Downloads/powertop-2.6.1/src'
/bin/bash ./csstoh.sh ./powertop.css css.h
/bin/bash: ./csstoh.sh: No such file or directory
make[2]: *** [css.h] Error 127
make[2]: Leaving directory `/home/magd/Downloads/powertop-2.6.1/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/magd/Downloads/powertop-2.6.1'
make: *** [all] Error 2


> On Wed, May 28, 2014 at 09:28:12AM -0700, Alexandra Yates wrote:
>> > On Tue, May 27, 2014 at 10:24:44AM -0700, Alexandra Yates wrote:
>> >> > Also it is not possible to compile it after running:
>> >> > $ make clean
>> >> >
>> >> > It seems csstoh.sh script is missing
>> >
>> > I've had this patch in my tree for at least some months...
>>
>> Can you send the patch to the mailing list?
>
> I verified that I did attach it. For people who prefer inline patches
> find a regenerated version below. Btw, to find out about problems with
> the source: Please run "make distcheck" before doing a release - which
> will currently fail due to the included object files.
>
> Ciao
>    J=C3=83=C2=B6rg
>
> From 22a76b66041f27017de302ae5650ec973471a01a Mon Sep 17 00:00:00 2001
> From: Joerg Mayer <jmpt(a)loplof.de>
> Date: Sun, 1 Jun 2014 09:36:17 +0200
> Subject: [PATCH] Fix out of tree builds
>
> Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
> ---
>  src/Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 0fe3c04..605f285 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -50,5 +50,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS)
> $(LIBNL_LIBS) $(LIBZ_LIBS)
>  BUILT_SOURCES =3D css.h
>  CLEANFILES =3D css.h
>  css.h: powertop.css
> -	$(SHELL) ./csstoh.sh powertop.css css.h
> +	$(SHELL) ${srcdir}/csstoh.sh ${srcdir}/powertop.css css.h
>
> --
> 1.8.4.5
>
> --
> Joerg Mayer                                           <jmayer(a)loplof.de>
> We are stuck with technology when what we really want is just stuff that
> works. Some say that should read Microsoft instead of technology.
>


Thank you,
Alexandra.

--===============6102162431741228126==--

