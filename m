Content-Type: multipart/mixed; boundary="===============6827676262164464402=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] Fix out of tree builds [Was: PowerTOP v2.6.1 released]
Date: Thu, 05 Jun 2014 01:39:32 +0200
Message-ID: <20140604233932.GH39023@rhrk.uni-kl.de>
In-Reply-To: 62350.10.24.5.211.1401916818.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6827676262164464402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hallo  Alexandra,

On Wed, Jun 04, 2014 at 02:20:18PM -0700, Alexandra Yates wrote:
> Unfortunately the patches you sent don't fix the issue.  Here is how to
> reproduced the issue:
> 1- Applied your patches.
> 2- Generated an new dist/tarball,
> 3- Untared on different location
> 4- Executed: ./autogen; ./configure; make; make clean; make
> =

> The error still points that /bin/bash: ./csstoh.sh: No such file or direc=
tory

> make[2]: Entering directory `/home/magd/Downloads/powertop-2.6.1/src'
> /bin/bash ./csstoh.sh ./powertop.css css.h
> /bin/bash: ./csstoh.sh: No such file or directory

Luckily you included your workflow - it contains a bug. As you can see the
system has not picked up the new path (the text ./csstoh.sh no longer exists
in the source). Correct order would be:
1- apply patches
2- ./autogen && ./configure
3- make distcheck
4- cp powertop-2.6.1.tar.gz <wherever>

Ciao
   J=C3=B6rg
-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============6827676262164464402==--

