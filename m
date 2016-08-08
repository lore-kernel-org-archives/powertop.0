Content-Type: multipart/mixed; boundary="===============8135735130083792258=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v1 2/3] configure.ac: version strings from git
 describe
Date: Mon, 08 Aug 2016 08:49:00 -0700
Message-ID: <20160808084900.02bb7f9e@jbkonno-basil.jf.intel.com>
In-Reply-To: 20160806121418.GA13520@obsidian
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8135735130083792258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you both for the review and feedback. Some inlined comments below.

On Sat, 6 Aug 2016 15:14:18 +0300
=D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9 =D0=A1=D1=8B=D1=80=D0=BE=D0=BC=
=D1=8F=D1=82=D0=BD=D0=B8=D0=BA=D0=BE=D0=B2 <evgsyr(a)gmail.com> wrote:

> On Sat, Aug 6, 2016 at 4:53 AM, Magnus Fromreide <magfr(a)lysator.liu.se>=
 wrote:
> > On Fri, Aug 05, 2016 at 12:27:20PM -0700, Joe Konno wrote:  =

> >> From: Joe Konno <joe.konno(a)intel.com>
> >>
> >> There are two version strings we need during runtime: a long version
> >> (for reports and --version), and a short version for the ncurses UI. U=
se
> >> a utility script to generate those strings (version-long and
> >> version-short) which will be cat'ed by configure and bundled when 'make
> >> dist' is run.
> >>
> >> Signed-off-by: Joe Konno <joe.konno(a)intel.com>  =

> >
> > What happens if I build this from a distributed package, i.e.
> >
> > ./configure
> > make dist
> > ta xzf powertop-version.tar.gz
> > cd powertop-version
> > ./configure
> > make
> >
> > This would normally create a package with no git version info so the ve=
rsion
> > scripts couldn't work.
> >
> > This could obviously be regarded as an unsupported case but if so then I
> > think it should be said so explicitly.  =


My assumption is that autogen.sh is run from within a git repo, for any pro=
ject
using git for version control. I'll add that verbiage to the commit message=
 for
clarity, though. Thanks for the feedback!

> Version script is called from autogen, configure just uses already genera=
ted
> files (which are in dist tarball), so there is no problem (since it is
> expected that autogen is called within git repo). If one wants to support
> case of autogen-out-of-git-repo, he should add version script to dist and
> modify it like this:

My concern with the version script supporting the 'autogen out of git repo'
scenario-- using eSyr's sample code below as a reference point-- is loss of
connection to the git repository and the state of code when the version str=
ings
are assembled.

My preference is to only support generation of version strings within a git
repository. This is to maintain something like version integrity, mapping c=
ode
state to 'git describe' strings. Nivedita and I will only run 'make dist'
inside a git repo when we cut release tarballs for that reason.

If folks want to support the 'autogen out of git repo' scenario, please spe=
ak
up, since I don't plan to support it. I hope my justification is clear-- if=
 it
isn't, we can discuss this further. ^_^

> =

> ---8<---
> #!/bin/sh
> =

> : "${LONG_VERSION_PATH=3Dversion-long}"
> : "${SHORT_VERSION_PATH=3Dversion-short}"
> : "${DIST_SUFFIX=3D-dist}"
> =

> LONG=3D$(cat "${LONG_VERSION_PATH}" 2>/dev/null)
> SHORT=3D$(cat "${SHORT_VERSION_PATH}" 2>/dev/null)
> =

> git branch > /dev/null 2>&1
> if [ "$?" =3D "0" ]; then
> 	LONG=3D$(git describe --abbrev=3D7 --tags --always --dirty 2> /dev/null)
> 	SHORT=3D\"$(git describe --tags --abbrev=3D0 2> /dev/null)\"
> else
> 	[ -z "$LONG" -a -n "$SHORT" ] && LONG=3D"${SHORT}"
> 	[ -z "$SHORT" -a -n "$LONG" ] && SHORT=3D"${LONG}"
> =

> 	if [ -z "$SHORT" -a -z "$LONG" ]
> 	then
> 		SHORT=3D"${SHORT_VERSION-unknown}"
> 		LONG=3D"${LONG_VERSION-unknown}"
> 	fi
> =

> 	LONG=3D"${LONG%${DIST_SUFFIX}}${DIST_SUFFIX}"
> 	SHORT=3D"${SHORT%${DIST_SUFFIX}}${DIST_SUFFIX}"
> fi
> =

> echo $LONG  > "${LONG_VERSION_PATH}"
> echo $SHORT > "${SHORT_VERSION_PATH}"
> --->8---  =

> =

> Two main points here =E2=80=94 reading cached values at the start of the =
script and
> adding a dist prefix in order to signalize that this is out-of-repo
> configuration.
>=20

--===============8135735130083792258==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIuMC4yMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKWHFLbnpBQW9KRUkySVI5VXZTcXBtVGNnUUFNVldmRHF2
T0lDL2Ewa3VhaG5oRktKVwpBcjFTN2lFSmNzYlk0RS9zOTRiQXF6RS8wTzI0NTJUZG0ya0V6YkdL
YVNieGY5YnNSSEEvbDBsS2xJRk9uWWhQCnhyd2IrOGtNeGNIZmwwZmg5ZUU2Zy80UnN1RlVoa0Ru
SFZ1Vi9paVRlUjlrNzZaenZRS2IvblYrU3NKRzlEY0IKNFMxb01VRXhkQ0NObzY3c0VPa2ZISkd4
N1UzYmszalJXM2FrNTYxL01lOXhXTko5MHFNYmtOYTBtVWJyYlVDbgpnbUZUend3WFkxYlpzTE9n
MzJ4SUtEZ0xudStYRFlNRkkwUXNaUVJRd3MxcFp3eS9YMEtTTEdjcjVJcFErNXFWCnZzNU1xTi9r
d0YwMEV2OTdGZ2w4ZzdMSmZ5ajlSeENRcitUYnl4RCtDMi9hSUI2Z211ZW9jOEJuZjNUem1rbWQK
QXo1T2plckk4ZkFJSEVaL2xrMW9WMWY5MU9hTG9lbkZ0cHRrN1psZlFmNytRTHk0NGhRTnBQcWlX
SmZBOUYzRwp6Ny9SUGFBYXMxZTFpKzBObWVLS2IyR0hKc1REVnlxbjR2OTdmdHg1ZHJSSTZRTkhJ
cnV4Q0JIM01vWGZRcEcvCldnRmNRNXN1Q25RUWFiWHBHNkpWcHBnS3NnRllHZ25LM1ErYkc4ZkIz
OU9VQm1hMVNFVklreUVSUzlWZXZaMnoKRFhQL0trSnlFUW5VQmpZVnVZM2IzakxGVzl0WUxaVWxL
TlZIWFh5Z2w5dCszQlRudTl1UWhIWjluQk9HUURZegpPN3lHYUVtb2cxVHlUTk5HVUVRYnF3ZGVZ
VllSaEY0ODlHblRXZ1FuYTEydlR2Qy9DcWxFTXdwM3RrSHFMM2RGCktZMEsvNytlaTZGb2s4NmEx
LzhUCj1UczZsCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8135735130083792258==--

