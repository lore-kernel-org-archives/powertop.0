Content-Type: multipart/mixed; boundary="===============3060534164881251880=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 14:47:44 +0300
Message-ID: <20121109114744.GC3239@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vNzi+Gbum7R+MWZvmXVFd3Pu8tN5Vr33U8WGYKiTBTDZg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3060534164881251880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/09/12 19:43), Austin Zhang wrote:
>    >=EF=BF=BDbut there are no evidence of,
>    nl-gen will only impact compile rather than configure, right?
>    Those above build time error will happen in upstream version if you on=
ly
>    install libnl3 but libnl-genl-3 for libnl3 case.
>    But anyway, it shouldn't impact 'configure' action.=EF=BF=BD
>

disagree, successful configure itself is useless, build is the one that mat=
ters.
if one does not have all requirements for build, failed configure is ok.

	-ss

 =

>    2012/11/9 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> =

>      On (11/09/12 19:17), Austin Zhang wrote:
>      > =EF=BF=BD =EF=BF=BDlibnl3:
>      > =EF=BF=BD =EF=BF=BDlibnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDli=
bnl - Convenience library for
>      netlink
>      > =EF=BF=BD =EF=BF=BDsockets
>      > =EF=BF=BD =EF=BF=BDlibnl2:
>      > =EF=BF=BD =EF=BF=BDlibnl-2.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDli=
bnl - Convenience library for
>      netlink
>      > =EF=BF=BD =EF=BF=BDsockets
>      >
> =

>      so, libnl-3.0.pc and libnl-2.0.pc are there, but there are no eviden=
ce
>      of, for example,
>      libnl-genl
> =

>      pkg-config output on Arch
>      libnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl - Convenience library for netlink
>      sockets
>      libnl-cli-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD libnl-cli - Command Line Interface library
>      for netlink sockets
>      libnl-nf-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BDlibnl-nf - Netfilter Netlink Library
>      libnl-route-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD libnl-route - Netlink Routing Family Library
>      libnl-genl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BDlibnl-genl - Generic Netlink Library
> =

>      in case if we remove libnl-genl from PKG_CHECK_MODULES, we'll break =
the
>      build, because LIBNL_LIBS
>      should be '-lnl-genl-3 -lnl-3', not just '-lnl-3'.
> =

>      [..]
>      src/tuning/iw.c:89: undefined reference to `genl_connect'
>      src/tuning/iw.c:95: undefined reference to `genl_ctrl_alloc_cache'
>      src/tuning/iw.c:101: undefined reference to `genl_ctrl_search_by_nam=
e'
>      and so on...
> =

>      looks like we need to workaround ubuntu.
> =

>      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD -ss
> =

> References
> =

>    Visible links
>    1. mailto:sergey.senozhatsky(a)gmail.com

--===============3060534164881251880==--

