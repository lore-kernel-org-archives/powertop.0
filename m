Content-Type: multipart/mixed; boundary="===============0067772797243332468=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] [PATCH] Relaxed autoconf version restriction for
 scratchbox build
Date: Sat, 21 Jul 2012 23:16:41 +0200
Message-ID: <1342905401.4237.2.camel@mattotaupa>
In-Reply-To: 50099506.4010601@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0067772797243332468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Chris,


Am Freitag, den 20.07.2012, 10:27 -0700 schrieb Chris Ferron:
> On 07/19/2012 11:52 PM, Igor Zhbanov wrote:
> > Relaxed autoconf version restriction for scratchbox build.
> > PowerTOP successfully builds with 2.67 version of Autotools.
> > ---
> >   configure.ac |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/configure.ac b/configure.ac
> > index 4b3d027..e1e670a 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -1,7 +1,7 @@
> >   #                                               -*- Autoconf -*-
> >   # Process this file with autoconf to produce a configure script.
> >   =

> > -AC_PREREQ([2.68])
> > +AC_PREREQ([2.67])
> >   AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
> >   AM_INIT_AUTOMAKE([-Wall foreign ])
> >   AC_LANG([C++])
> What is the problem? Why do you need to do this? What is the benefit to =

> the PowerTOP project?

Hm, the commit message says it all if you know what Scratchbox [1] is.

I guess Scratchbox only includes Autoconf 2.67 so PowerTOP does not
build out of the box with Scratchbox.


Thanks,

Paul


[1] http://www.elinux.org/Toolchains#Scratchbox

--===============0067772797243332468==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxBTEhEa0FDZ2tRUFgxYUsyd09IVmlCV0FDZmNmWHl5UFF1
VjF0UEZCT0x2UjhtaVdtOAo2MGtBbjMrL09VWGhMUHNuSEdmR2pqNHEyWmlJdERwUgo9N2FNcQot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0067772797243332468==--

