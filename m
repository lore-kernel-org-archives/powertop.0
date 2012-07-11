Content-Type: multipart/mixed; boundary="===============2144715453992646390=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 08:56:04 +0200
Message-ID: <1341989764.2654.2.camel@sara>
In-Reply-To: 4FFD1A7B.2000105@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2144715453992646390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-11 at 10:17 +0400, Igor Zhbanov wrote:
> Hello!
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

Why /bin/bash?

The script doesn't depend on any bashisms so /bin/sh should be enough,
right?

Why all the games with chmod?
$(SHELL) csstoh.sh powertop.css css.h
should also run the script correctly, shouldn't it?

/MF


--===============2144715453992646390==--

