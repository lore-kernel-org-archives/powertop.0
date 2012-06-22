Content-Type: multipart/mixed; boundary="===============3327371925960971828=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] Use printf, not sprintf,
 to print messages to stdout.
Date: Fri, 22 Jun 2012 10:49:30 +0200
Message-ID: <1340354970.2997.14.camel@sara>
In-Reply-To: CAOpc7mFZkCD1EngEtaMPv+T-Rg6m0ph-DP87GDajq8hhKe1=bg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3327371925960971828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 08:45 +0200, Holger Schurig wrote:
> You guys should run powertop via clang's static analyzer :-)

Ok, I did.

It found a few bugs, but not these. On the other hand, the compiler
warned about these.

The warnings from g++ for this particular problem are:

main.cpp: In function =E2=80=98void out_of_memory()=E2=80=99:
main.cpp:234:72: warning: deprecated conversion from string constant to =E2=
=80=98char*=E2=80=99 =

[-Wwrite-strings]
main.cpp: In function =E2=80=98int main(int, char**)=E2=80=99:
main.cpp:465:39: warning: deprecated conversion from string constant to =E2=
=80=98char*=E2=80=99 =


>From clang++ I get:

main.cpp:234:10: warning: conversion from string literal to 'char *' is dep=
recated [-Wdeprecated-writable-strings]
        sprintf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Abortin=
g"));
                ^
main.cpp:465:10: warning: conversion from string literal to 'char *' is dep=
recated [-Wdeprecated-writable-strings]
        sprintf("%s\n", _("Leaving PowerTOP"));
                ^

>From clang-analyze I get nothing.

The most interesting part is actually that the compilers reported this
as a warning and not an error.

/MF


--===============3327371925960971828==--

