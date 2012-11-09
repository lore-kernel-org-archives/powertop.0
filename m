Content-Type: multipart/mixed; boundary="===============7997326644212742038=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 14:30:26 +0300
Message-ID: <20121109113026.GB3239@swordfish.minsk.epam.com>
In-Reply-To: CAGLu0vOCzSjQ1nDg1PGTv3LEChGLcKqXOMx5eU-E_vaP8FvD_A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7997326644212742038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/09/12 19:17), Austin Zhang wrote:
>    libnl3:
>    libnl-3.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libnl - Convenience library for netlink
>    sockets
>    libnl2:
>    libnl-2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0libnl - Convenience library for netlink
>    sockets
> =


so, libnl-3.0.pc and libnl-2.0.pc are there, but there are no evidence of, =
for example,
libnl-genl

pkg-config output on Arch

libnl-3.0                   libnl - Convenience library for netlink sockets
libnl-cli-3.0               libnl-cli - Command Line Interface library for =
netlink sockets
libnl-nf-3.0                libnl-nf - Netfilter Netlink Library
libnl-route-3.0             libnl-route - Netlink Routing Family Library
libnl-genl-3.0              libnl-genl - Generic Netlink Library


in case if we remove libnl-genl from PKG_CHECK_MODULES, we'll break the bui=
ld, because LIBNL_LIBS
should be '-lnl-genl-3 -lnl-3', not just '-lnl-3'.

[..]
src/tuning/iw.c:89: undefined reference to `genl_connect'
src/tuning/iw.c:95: undefined reference to `genl_ctrl_alloc_cache'
src/tuning/iw.c:101: undefined reference to `genl_ctrl_search_by_name'
and so on...


looks like we need to workaround ubuntu.


	-ss

--===============7997326644212742038==--

