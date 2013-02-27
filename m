Content-Type: multipart/mixed; boundary="===============2978464956582417205=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] Version info in lib.h file: v2.1 instead of v2.2 for
 release 2.2
Date: Wed, 27 Feb 2013 12:25:33 +0100
Message-ID: <1361964333.9870.34.camel@mattotaupa>
In-Reply-To: CABa1t5xkZRFG4W6FOiQTXMbaWwciXCqzo8fVoqknMiUjD48VVA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2978464956582417205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Ganapati,


Am Mittwoch, den 27.02.2013, 16:22 +0530 schrieb Ganapati Bhat:

> I was just going through the code of the release 2.2 of powertop

from where did you download it?

> and in the lib.h file in src/ directory POWERTOP_VERSION is defined as
> v2.1 and not v2.2. Why is it so? Has it been modified in some
> subsequent patches?

you can check yourself checking out the latest source from Git [1].

There you see in `src/lib.h`

        #define POWERTOP_VERSION "v"PACKAGE_VERSION
        #define POWERTOP_SHORT_VERSION PACKAGE_VERSION

Searching for these strings they are only found in that file.

        $ git grep -i PACKAGE_VERSION
        src/lib.h:#define POWERTOP_VERSION "v"PACKAGE_VERSION
        src/lib.h:#define POWERTOP_SHORT_VERSION PACKAGE_VERSION

So I guess PACKAGE_VERSION is provided by Autotools which reads

        commit 78956bdcd91c1e1c49e0462b64dda9c11a8ae53d
        Author: Chris E Ferron <chris.e.ferron(a)linux.intel.com>
        Date:   Thu Nov 15 08:27:14 2012 -0800
        =

            up version for v2.2 release
        =

        diff --git a/configure.ac b/configure.ac
        index 02952b3..3a7a83c 100644
        --- a/configure.ac
        +++ b/configure.ac
        @@ -2,7 +2,7 @@
         # Process this file with autoconf to produce a configure script.
         =

         AC_PREREQ([2.68])
        -AC_INIT([powertop], [2.1], [powertop(a)lists.01.org])
        +AC_INIT([powertop], [2.2], [powertop(a)lists.01.org])
         AM_INIT_AUTOMAKE([-Wall foreign ])
         AC_LANG([C++])
         AC_CONFIG_FILES([Makefile src/Makefile traceevent/Makefile po/Make=
file.in doc/Makefile])

So I am not sure what went wrong in the release tarball.


Thanks,

Paul


[1] https://github.com/fenrus75/powertop

--===============2978464956582417205==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxFdDdTMEFDZ2tRUFgxYUsyd09IVmc0NEFDZmVZeXptZFM3
NlBOMjZXMXFvcU45am1ZNwpPTTBBbjFKMS94YUw5WUNDSVhoU1lEVXNNNWhoK1p0RQo9SlZjWAot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============2978464956582417205==--

