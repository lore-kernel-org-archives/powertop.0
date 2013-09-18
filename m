Content-Type: multipart/mixed; boundary="===============8611140322468390099=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] embed self-contained javascript
Date: Wed, 18 Sep 2013 12:01:05 +0300
Message-ID: <20130918090105.GA2340@swordfish.minsk.epam.com>
In-Reply-To: 52396278.5070709@debian.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8611140322468390099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/18/13 03:51), Jose Luis Rivas wrote:
> On 09/18/2013 03:36 AM, Sergey Senozhatsky wrote:
> > On (09/17/13 16:44), Jose Luis Rivas wrote:
> >> On 09/17/2013 03:11 PM, Sergey Senozhatsky wrote:
> >>
> >>
> >>
> >> BTW, trying to apply this patch I saw the src/Makefile.am makes a call
> >> to `src/csstoh.sh` which does not exists in the codebase. So it throws
> >> errors applying this patch to Debian.
> > =

> > hm, src/csstoh.sh exists in the codebase. where did you get source
> > code from?
> > =

> >> ```
> >> make[3]: Entering directory `/tmp/buildd/powertop-2.4/src'
> >> /bin/bash ./csstoh.sh powertop.css css.h
> >> /bin/bash: ./csstoh.sh: No such file or directory
> >> make[3]: *** [css.h] Error 127
> >> make[3]: Leaving directory `/tmp/buildd/powertop-2.4/src'
> >> make[2]: *** [all-recursive] Error 1
> >> make[2]: Leaving directory `/tmp/buildd/powertop-2.4'
> >> make[1]: *** [all] Error 2
> >> make[1]: Leaving directory `/tmp/buildd/powertop-2.4'
> >> dh_auto_build: make -j1 returned exit code 2
> >> make: *** [build] Error 2
> >> dpkg-buildpackage: error: debian/rules build gave error exit status 2
> >> ```
> >>
> >> I guess it comes because of the change in the CSS so it needs to
> >> update the `src/css.h`.
> > =

> > css.h is generated from css file
> > =

> > 	$(SHELL) ./csstoh.sh powertop.css css.h
> > =

> > 	-ss
> > =

> =

> This is what we use in conjuction with uscan to get the sources (from
> debian/watch[0]):
> ```
> version=3D3
> https://01.org/powertop/downloads
> https://01.org/powertop/sites/default/files/downloads/powertop-([\d\.]*).=
tar.gz
> ```
> =

> I downloaded the tar.gz from the source site and made an ls into src,
> this is the result:

Cc Arjan and Kristen


yes, indeed... powertop-2.4.tar.gz package does not compile.

make[2]: Leaving directory `/media/dev/__test/powertop-2.4/traceevent'
Making all in src
make[2]: Entering directory `/media/dev/__test/powertop-2.4/src'
/bin/sh ./csstoh.sh powertop.css css.h
/bin/sh: ./csstoh.sh: No such file or directory
make[2]: *** [css.h] Error 127
make[2]: Leaving directory `/media/dev/__test/powertop-2.4/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/media/dev/__test/powertop-2.4'
make: *** [all] Error 2


Jose, I can suggest (as a temp fix) to pull from git. Sorry for
inconvenience.





Arjan, Kristen,

besides missing csstoh script, current powertop-2.4.tar.gz package
contains files and dirs we don't really need (e.g. host specific m4
files). it would be better to generate it from `clean' git clone:

 $ git clone git(a)github.com [...] powertop.git .
 $ rm -fr .git*



./autogen and ./configure will do the rest of the job.


could you please take care of powertop-2.4.tar.gz?

	-ss

> 8<---
>  ghostbar =EE=82=B0 =E2=8B=AF =EE=82=B1 powertop =EE=82=B0 wget
> https://01.org/powertop/sites/default/files/downloads/powertop-2.4.tar.gz
> --2013-09-18 03:48:50--
> https://01.org/powertop/sites/default/files/downloads/powertop-2.4.tar.gz
> Resolving 01.org (01.org)... 198.145.11.105, 2001:19d0:3:5::105
> Connecting to 01.org (01.org)|198.145.11.105|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 632390 (618K) [application/x-gzip]
> Saving to: =E2=80=98powertop-2.4.tar.gz=E2=80=99
> =

> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D>]
> 632,390      174KB/s   in 3.6s
> =

> 2013-09-18 03:48:55 (174 KB/s) - =E2=80=98powertop-2.4.tar.gz=E2=80=99 sa=
ved [632390/632390]
> =

>  ghostbar =EE=82=B0 =E2=8B=AF =EE=82=B1 powertop =EE=82=B0 tar -zxf power=
top-2.4.tar.gz
>  ghostbar =EE=82=B0 =E2=8B=AF =EE=82=B1 powertop =EE=82=B0 ls powertop-2.=
4/src
> calibrate  css.h    devlist.cpp  display.cpp  lib.cpp  main.cpp
> Makefile.in  parameters  powertop.css  report
> cpu        devices  devlist.h    display.h    lib.h    Makefile.am
> measurement  perf        process       tuning
>  ghostbar =EE=82=B0 =E2=8B=AF =EE=82=B1 powertop =EE=82=B0 ls powertop-2.=
4/src | grep csstoh
>  ghostbar =EE=82=B0 =E2=8B=AF =EE=82=B1 powertop =EE=82=B0
> =

> --->8
> =

> Kind regards.
> =

> [0] https://github.com/ghostbar/powertop.deb/blob/master/debian/watch
> =

> -- =

> The Debian Project - http://debian.org/
> Jose Luis Rivas - http://joseluisrivas.net/#ghostbar
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============8611140322468390099==--

