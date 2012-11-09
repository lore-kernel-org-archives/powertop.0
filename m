Content-Type: multipart/mixed; boundary="===============2900730885457959279=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 18:25:59 +0300
Message-ID: <20121109152559.GF3239@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vOCbyZsB1HX7bQ33K+817nRd+ioKo9ObgU8xRCVdNfA7w@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2900730885457959279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/09/12 23:19), Austin Zhang wrote:
>    > is this correct?
>    I listed it here for your reference.

 thanks a lot!
 I'll take a look.

	-ss

>    12.04
>    # dpkg -L libnl1 | grep so
>    /usr/lib/i386-linux-gnu/libnl.so.1.1
>    /usr/lib/i386-linux-gnu/libnl.so.1
>    # dpkg -L libnl2 | grep so =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>    /usr/lib/libnl-cli.so.2.0.0
>    /usr/lib/libnl-genl.so.2.0.0
>    /usr/lib/libnl-nf.so.2.0.0
>    /usr/lib/libnl-route.so.2.0.0
>    /usr/lib/libnl.so.2.0.0
>    /usr/lib/libnl-cli.so.2
>    /usr/lib/libnl-genl.so.2
>    /usr/lib/libnl-nf.so.2
>    /usr/lib/libnl-route.so.2
>    /usr/lib/libnl.so.2
>    # dpkg -L libnl-3-200 | grep so =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0
>    /lib/libnl-3.so.200.3.0
>    /lib/libnl-3.so.200
>    # dpkg -L libnl-genl-3-200 | grep so
>    /lib/libnl-genl-3.so.200.3.0
>    /lib/libnl-genl-3.so.200
>    11.10
>    $ dpkg -L libnl1 | grep so
>    /usr/lib/libnl.so.1.1
>    /usr/lib/libnl.so.1
>    $ dpkg -L libnl2 | grep so =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
>    /usr/lib/libnl-cli.so.2.0.0
>    /usr/lib/libnl-route.so.2.0.0
>    /usr/lib/libnl-genl.so.2.0.0
>    /usr/lib/libnl-nf.so.2.0.0
>    /usr/lib/libnl.so.2.0.0
>    /usr/lib/libnl-route.so.2
>    /usr/lib/libnl-cli.so.2
>    /usr/lib/libnl-genl.so.2
>    /usr/lib/libnl.so.2
>    /usr/lib/libnl-nf.so.2
>    $ dpkg -L libnl3 | grep so =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
>    /usr/lib/libnl-cli.so.3.0.0
>    /usr/lib/libnl-genl.so.3.0.0
>    /usr/lib/libnl-nf.so.3.0.0
>    /usr/lib/libnl-route.so.3.0.0
>    /usr/lib/libnl.so.3.0.0
>    /usr/lib/libnl-cli.so.3
>    /usr/lib/libnl-genl.so.3
>    /usr/lib/libnl-nf.so.3
>    /usr/lib/libnl-route.so.3
>    /usr/lib/libnl.so.3
>    > is 11.10 still supported?
>    I thought it should, but it is up to you all maintainers:-)
>    =C2=A0
> =

>    2012/11/9 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> =

>      On (11/09/12 20:18), Austin Zhang wrote:
>      > =C2=A0 =C2=A0>=C2=A0successful configure itself is useless, build =
is the one that
>      matters.
>      > =C2=A0 =C2=A0Yes, I agree this, I just mean "not install genl is n=
ot the excuse
>      of fail
>      > =C2=A0 =C2=A0to configure in _above_ cases".=C2=A0
> =

>      sorry, not sure.
>      missing dependency is a very good reason to fail configure. in fact,
>      configure is performed
>      to validate system if it fits minimum build requirements. and in our
>      case missing libnl
>      and libnl-genl are a show stoppers.
> =

>      but yes, we have a problem with that ubuntu package mess that we hav=
e to
>      address.
> =

>      > =C2=A0 =C2=A0After double check, in libnl-3 of ubuntu 11.10 (sorry=
, I wrote it
>      as 11.04
>      > =C2=A0 =C2=A0in above email) includes these content of lib-genl, s=
o in 11.10, no
>      > =C2=A0 =C2=A0libnl-genl, which only is in 12.04, where the nl vers=
ion is: 3.2.3.
>      > =C2=A0 =C2=A0and for libnl2, also no genl.
>      >
> =

>      is this correct?
> =

>      ubuntu =C2=A0libnl-3.*.so =C2=A0 =C2=A0libnl-genl-3.*.so =C2=A0 =C2=
=A0 =C2=A0 libnl-2.*.so =C2=A0
>      =C2=A0libnl-genl-2.*.so
>      11.10 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -
>      12.04 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +
> =

>      is 11.10 still supported? if support for that version is discontinued
>      then I'm not sure
>      we really must care.
> =

>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
> =

>      > =C2=A0 =C2=A02012/11/9 Sergey Senozhatsky <[1][2]sergey.senozhatsk=
y(a)gmail.com>
>      >
>      > =C2=A0 =C2=A0 =C2=A0On (11/09/12 19:43), Austin Zhang wrote:
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0>=EF=BF=BDbut there are no evid=
ence of,
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0nl-gen will only impact compile=
 rather than configure,
>      right?
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0Those above build time error wi=
ll happen in upstream version
>      if you
>      > =C2=A0 =C2=A0 =C2=A0only
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0install libnl3 but libnl-genl-3=
 for libnl3 case.
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0But anyway, it shouldn't impact=
 'configure' action.=EF=BF=BD
>      > =C2=A0 =C2=A0 =C2=A0>
>      >
>      > =C2=A0 =C2=A0 =C2=A0disagree, successful configure itself is usele=
ss, build is the
>      one that
>      > =C2=A0 =C2=A0 =C2=A0matters.
>      > =C2=A0 =C2=A0 =C2=A0if one does not have all requirements for buil=
d, failed configure
>      is ok.
>      >
>      > =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
>      >
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A02012/11/9 Sergey Senozhatsky
>      <[1][2][3]sergey.senozhatsky(a)gmail.com>
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0On (11/09/12 19:17), Aus=
tin Zhang wrote:
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlib=
nl3:
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlib=
nl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl - Convenience
>      library
>      > =C2=A0 =C2=A0 =C2=A0for
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0netlink
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDsoc=
kets
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlib=
nl2:
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDlib=
nl-2.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl - Convenience
>      library
>      > =C2=A0 =C2=A0 =C2=A0for
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0netlink
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0> =EF=BF=BD =EF=BF=BDsoc=
kets
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0so, libnl-3.0.pc and lib=
nl-2.0.pc are there, but there are
>      no
>      > =C2=A0 =C2=A0 =C2=A0evidence
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0of, for example,
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-genl
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0pkg-config output on Arch
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-3.0 =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD libnl - Convenience library
>      for
>      > =C2=A0 =C2=A0 =C2=A0netlink
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0sockets
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-cli-3.0 =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl-cli - Com=
mand Line
>      Interface
>      > =C2=A0 =C2=A0 =C2=A0library
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0for netlink sockets
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-nf-3.0 =EF=BF=BD =
=EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl-=
nf - Netfilter Netlink
>      Library
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-route-3.0 =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl-route - Netlink=
 Routing
>      Family
>      > =C2=A0 =C2=A0 =C2=A0Library
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0libnl-genl-3.0 =EF=BF=BD=
 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl-genl - Ge=
neric Netlink
>      Library
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0in case if we remove lib=
nl-genl from PKG_CHECK_MODULES,
>      we'll
>      > =C2=A0 =C2=A0 =C2=A0break the
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0build, because LIBNL_LIBS
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0should be '-lnl-genl-3 -=
lnl-3', not just '-lnl-3'.
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0[..]
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:89: unde=
fined reference to `genl_connect'
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:95: unde=
fined reference to
>      > =C2=A0 =C2=A0 =C2=A0`genl_ctrl_alloc_cache'
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0src/tuning/iw.c:101: und=
efined reference to
>      > =C2=A0 =C2=A0 =C2=A0`genl_ctrl_search_by_name'
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0and so on...
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0looks like we need to wo=
rkaround ubuntu.
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0 =C2=A0=EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD -ss
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> References
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A0Visible links
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0 =C2=A01. mailto:[3][4]sergey.senozhat=
sky(a)gmail.com
>      >
>      > References
>      >
>      > =C2=A0 =C2=A0Visible links
>      > =C2=A0 =C2=A01. mailto:[5]sergey.senozhatsky(a)gmail.com
>      > =C2=A0 =C2=A02. mailto:[6]sergey.senozhatsky(a)gmail.com
>      > =C2=A0 =C2=A03. mailto:[7]sergey.senozhatsky(a)gmail.com
> =

> References
> =

>    Visible links
>    1. mailto:sergey.senozhatsky(a)gmail.com
>    2. mailto:sergey.senozhatsky(a)gmail.com
>    3. mailto:sergey.senozhatsky(a)gmail.com
>    4. mailto:sergey.senozhatsky(a)gmail.com
>    5. mailto:sergey.senozhatsky(a)gmail.com
>    6. mailto:sergey.senozhatsky(a)gmail.com
>    7. mailto:sergey.senozhatsky(a)gmail.com

--===============2900730885457959279==--

