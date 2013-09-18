Content-Type: multipart/mixed; boundary="===============9173181488105619380=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] embed self-contained javascript
Date: Wed, 18 Sep 2013 11:06:47 +0300
Message-ID: <20130918080647.GA2404@swordfish.minsk.epam.com>
In-Reply-To: 5238C619.6020404@debian.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9173181488105619380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/17/13 16:44), Jose Luis Rivas wrote:
> On 09/17/2013 03:11 PM, Sergey Senozhatsky wrote:
> =

> =

> =

> BTW, trying to apply this patch I saw the src/Makefile.am makes a call
> to `src/csstoh.sh` which does not exists in the codebase. So it throws
> errors applying this patch to Debian.

hm, src/csstoh.sh exists in the codebase. where did you get source
code from?

> ```
> make[3]: Entering directory `/tmp/buildd/powertop-2.4/src'
> /bin/bash ./csstoh.sh powertop.css css.h
> /bin/bash: ./csstoh.sh: No such file or directory
> make[3]: *** [css.h] Error 127
> make[3]: Leaving directory `/tmp/buildd/powertop-2.4/src'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/tmp/buildd/powertop-2.4'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/tmp/buildd/powertop-2.4'
> dh_auto_build: make -j1 returned exit code 2
> make: *** [build] Error 2
> dpkg-buildpackage: error: debian/rules build gave error exit status 2
> ```
> =

> I guess it comes because of the change in the CSS so it needs to
> update the `src/css.h`.

css.h is generated from css file

	$(SHELL) ./csstoh.sh powertop.css css.h

	-ss

--===============9173181488105619380==--

