Content-Type: multipart/mixed; boundary="===============8335017927399130635=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 16:01:08 +0300
Message-ID: <20121109130108.GE3239@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vNr9-qoNrUjudMUnyiJ0iegO5dvhxtsfjD6SnSJ2Y1wzA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8335017927399130635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/09/12 20:18), Austin Zhang wrote:
>    >=C2=A0successful configure itself is useless, build is the one that m=
atters.
>    Yes, I agree this, I just mean "not install genl is not the excuse of =
fail
>    to configure in _above_ cases".=C2=A0

sorry, not sure. =

missing dependency is a very good reason to fail configure. in fact, config=
ure is performed
to validate system if it fits minimum build requirements. and in our case m=
issing libnl
and libnl-genl are a show stoppers.

but yes, we have a problem with that ubuntu package mess that we have to ad=
dress.


>    After double check, in libnl-3 of ubuntu 11.10 (sorry, I wrote it as 1=
1.04
>    in above email) includes these content of lib-genl, so in 11.10, no
>    libnl-genl, which only is in 12.04, where the nl version is: 3.2.3.
>    and for libnl2, also no genl.
>

is this correct?

ubuntu	libnl-3.*.so	libnl-genl-3.*.so	libnl-2.*.so	libnl-genl-2.*.so
11.10	+		-			+		-
12.04	+		+			+		+


is 11.10 still supported? if support for that version is discontinued then =
I'm not sure
we really must care.


	-ss

 =

>    2012/11/9 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> =

>      On (11/09/12 19:43), Austin Zhang wrote:
>      > =C2=A0 =C2=A0>=EF=BF=BDbut there are no evidence of,
>      > =C2=A0 =C2=A0nl-gen will only impact compile rather than configure=
, right?
>      > =C2=A0 =C2=A0Those above build time error will happen in upstream =
version if you
>      only
>      > =C2=A0 =C2=A0install libnl3 but libnl-genl-3 for libnl3 case.
>      > =C2=A0 =C2=A0But anyway, it shouldn't impact 'configure' action.=
=EF=BF=BD
>      >
> =

>      disagree, successful configure itself is useless, build is the one t=
hat
>      matters.
>      if one does not have all requirements for build, failed configure is=
 ok.
> =

>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
> =

>      > =C2=A0 =C2=A02012/11/9 Sergey Senozhatsky <[1][2]sergey.senozhatsk=
y(a)gmail.com>
>      >
>      > =C2=A0 =C2=A0 =C2=A0On (11/09/12 19:17), Austin Zhang wrote:
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlibnl3:
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlibnl-3.0 =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BDlibnl - Convenience library
>      for
>      > =C2=A0 =C2=A0 =C2=A0netlink
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDsockets
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlibnl2:
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlibnl-2.0 =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BDlibnl - Convenience library
>      for
>      > =C2=A0 =C2=A0 =C2=A0netlink
>      > =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDsockets
>      > =C2=A0 =C2=A0 =C2=A0>
>      >
>      > =C2=A0 =C2=A0 =C2=A0so, libnl-3.0.pc and libnl-2.0.pc are there, b=
ut there are no
>      evidence
>      > =C2=A0 =C2=A0 =C2=A0of, for example,
>      > =C2=A0 =C2=A0 =C2=A0libnl-genl
>      >
>      > =C2=A0 =C2=A0 =C2=A0pkg-config output on Arch
>      > =C2=A0 =C2=A0 =C2=A0libnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl - Convenience l=
ibrary for
>      netlink
>      > =C2=A0 =C2=A0 =C2=A0sockets
>      > =C2=A0 =C2=A0 =C2=A0libnl-cli-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl-cli - Command Line Interface
>      library
>      > =C2=A0 =C2=A0 =C2=A0for netlink sockets
>      > =C2=A0 =C2=A0 =C2=A0libnl-nf-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl-nf - Netfilter Netlink =
Library
>      > =C2=A0 =C2=A0 =C2=A0libnl-route-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD libnl-route - Netlink Routing Family
>      Library
>      > =C2=A0 =C2=A0 =C2=A0libnl-genl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl-genl - Generic Netlink Library
>      >
>      > =C2=A0 =C2=A0 =C2=A0in case if we remove libnl-genl from PKG_CHECK=
_MODULES, we'll
>      break the
>      > =C2=A0 =C2=A0 =C2=A0build, because LIBNL_LIBS
>      > =C2=A0 =C2=A0 =C2=A0should be '-lnl-genl-3 -lnl-3', not just '-lnl=
-3'.
>      >
>      > =C2=A0 =C2=A0 =C2=A0[..]
>      > =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:89: undefined reference to `ge=
nl_connect'
>      > =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:95: undefined reference to
>      `genl_ctrl_alloc_cache'
>      > =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:101: undefined reference to
>      `genl_ctrl_search_by_name'
>      > =C2=A0 =C2=A0 =C2=A0and so on...
>      >
>      > =C2=A0 =C2=A0 =C2=A0looks like we need to workaround ubuntu.
>      >
>      > =C2=A0 =C2=A0 =C2=A0=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD -ss
>      >
>      > References
>      >
>      > =C2=A0 =C2=A0Visible links
>      > =C2=A0 =C2=A01. mailto:[3]sergey.senozhatsky(a)gmail.com
> =

> References
> =

>    Visible links
>    1. mailto:sergey.senozhatsky(a)gmail.com
>    2. mailto:sergey.senozhatsky(a)gmail.com
>    3. mailto:sergey.senozhatsky(a)gmail.com

--===============8335017927399130635==--

