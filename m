Content-Type: multipart/mixed; boundary="===============0309270809405130028=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 20:18:11 +0800
Message-ID: <CAGLu0vNr9-qoNrUjudMUnyiJ0iegO5dvhxtsfjD6SnSJ2Y1wzA@mail.gmail.com>
In-Reply-To: 20121109114744.GC3239@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0309270809405130028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> successful configure itself is useless, build is the one that matters.
Yes, I agree this, I just mean "not install genl is not the excuse of fail
to configure in _above_ cases".

After double check, in libnl-3 of ubuntu 11.10 (sorry, I wrote it as 11.04
in above email) includes these content of lib-genl, so in 11.10, no
libnl-genl, which only is in 12.04, where the nl version is: 3.2.3.

and for libnl2, also no genl.


2012/11/9 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (11/09/12 19:43), Austin Zhang wrote:
> >    >=EF=BF=BDbut there are no evidence of,
> >    nl-gen will only impact compile rather than configure, right?
> >    Those above build time error will happen in upstream version if you
> only
> >    install libnl3 but libnl-genl-3 for libnl3 case.
> >    But anyway, it shouldn't impact 'configure' action.=EF=BF=BD
> >
>
> disagree, successful configure itself is useless, build is the one that
> matters.
> if one does not have all requirements for build, failed configure is ok.
>
>         -ss
>
>
> >    2012/11/9 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> >
> >      On (11/09/12 19:17), Austin Zhang wrote:
> >      > =EF=BF=BD =EF=BF=BDlibnl3:
> >      > =EF=BF=BD =EF=BF=BDlibnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BDlibnl - Convenience library for
> >      netlink
> >      > =EF=BF=BD =EF=BF=BDsockets
> >      > =EF=BF=BD =EF=BF=BDlibnl2:
> >      > =EF=BF=BD =EF=BF=BDlibnl-2.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BDlibnl - Convenience library for
> >      netlink
> >      > =EF=BF=BD =EF=BF=BDsockets
> >      >
> >
> >      so, libnl-3.0.pc and libnl-2.0.pc are there, but there are no
> evidence
> >      of, for example,
> >      libnl-genl
> >
> >      pkg-config output on Arch
> >      libnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl - Convenience library for netlink
> >      sockets
> >      libnl-cli-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BD libnl-cli - Command Line Interface
> library
> >      for netlink sockets
> >      libnl-nf-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BDlibnl-nf - Netfilter Netlink Library
> >      libnl-route-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD libnl-route - Netlink Routing Family
> Library
> >      libnl-genl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BD =EF=BF=BDlibnl-genl - Generic Netlink Library
> >
> >      in case if we remove libnl-genl from PKG_CHECK_MODULES, we'll break
> the
> >      build, because LIBNL_LIBS
> >      should be '-lnl-genl-3 -lnl-3', not just '-lnl-3'.
> >
> >      [..]
> >      src/tuning/iw.c:89: undefined reference to `genl_connect'
> >      src/tuning/iw.c:95: undefined reference to `genl_ctrl_alloc_cache'
> >      src/tuning/iw.c:101: undefined reference to
> `genl_ctrl_search_by_name'
> >      and so on...
> >
> >      looks like we need to workaround ubuntu.
> >
> >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD -ss
> >
> > References
> >
> >    Visible links
> >    1. mailto:sergey.senozhatsky(a)gmail.com
>

--===============0309270809405130028==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

Jmd0O8KgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHgiPnN1Y2Nlc3NmdWwgY29uZmlndXJlIGl0c2VsZiBpcyB1c2VsZXNzLCBidWlsZCBpcyB0
aGUgb25lIHRoYXQgbWF0dGVycy48L3NwYW4+PGRpdj5ZZXMsIEkgYWdyZWUgdGhpcywgSSBqdXN0
IG1lYW4gJnF1b3Q7bm90IGluc3RhbGwgZ2VubCBpcyBub3QgdGhlIGV4Y3VzZSBvZiBmYWlsIHRv
IGNvbmZpZ3VyZSBpbiBfYWJvdmVfIGNhc2VzJnF1b3Q7LsKgPC9kaXY+CjxkaXY+PGJyPjwvZGl2
PjxkaXY+QWZ0ZXIgZG91YmxlIGNoZWNrLCBpbiBsaWJubC0zIG9mIHVidW50dSAxMS4xMCAoc29y
cnksIEkgd3JvdGUgaXQgYXMgMTEuMDQgaW4gYWJvdmUgZW1haWwpIGluY2x1ZGVzIHRoZXNlIGNv
bnRlbnQgb2YgbGliLWdlbmwsIHNvIGluIDExLjEwLCBubyBsaWJubC1nZW5sLCB3aGljaCBvbmx5
IGlzIGluIDEyLjA0LCB3aGVyZSB0aGUgbmwgdmVyc2lvbiBpczogMy4yLjMuPC9kaXY+CjxkaXY+
PGJyPjwvZGl2PjxkaXY+YW5kIGZvciBsaWJubDIsIGFsc28gbm8gZ2VubC48L2Rpdj48ZGl2IGNs
YXNzPSJnbWFpbF9leHRyYSI+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxMi8x
MS85IFNlcmdleSBTZW5vemhhdHNreSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0
bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2VyZ2V5LnNl
bm96aGF0c2t5QGdtYWlsLmNvbTwvYT4mZ3Q7PC9zcGFuPjxicj4KPGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+T24gKDExLzA5LzEyIDE5OjQzKSwgQXVzdGluIFpo
YW5nIHdyb3RlOjxicj4KJmd0OyDCoCDCoCZndDvvv71idXQgdGhlcmUgYXJlIG5vIGV2aWRlbmNl
IG9mLDxicj4KPGRpdiBjbGFzcz0iaW0iPiZndDsgwqAgwqBubC1nZW4gd2lsbCBvbmx5IGltcGFj
dCBjb21waWxlIHJhdGhlciB0aGFuIGNvbmZpZ3VyZSwgcmlnaHQ/PGJyPgomZ3Q7IMKgIMKgVGhv
c2UgYWJvdmUgYnVpbGQgdGltZSBlcnJvciB3aWxsIGhhcHBlbiBpbiB1cHN0cmVhbSB2ZXJzaW9u
IGlmIHlvdSBvbmx5PGJyPgomZ3Q7IMKgIMKgaW5zdGFsbCBsaWJubDMgYnV0IGxpYm5sLWdlbmwt
MyBmb3IgbGlibmwzIGNhc2UuPGJyPgo8L2Rpdj4mZ3Q7IMKgIMKgQnV0IGFueXdheSwgaXQgc2hv
dWxkbiYjMzk7dCBpbXBhY3QgJiMzOTtjb25maWd1cmUmIzM5OyBhY3Rpb24u77+9PGJyPgomZ3Q7
PGJyPgo8YnI+CmRpc2FncmVlLCBzdWNjZXNzZnVsIGNvbmZpZ3VyZSBpdHNlbGYgaXMgdXNlbGVz
cywgYnVpbGQgaXMgdGhlIG9uZSB0aGF0IG1hdHRlcnMuPGJyPgppZiBvbmUgZG9lcyBub3QgaGF2
ZSBhbGwgcmVxdWlyZW1lbnRzIGZvciBidWlsZCwgZmFpbGVkIGNvbmZpZ3VyZSBpcyBvay48YnI+
Cjxicj4KwqAgwqAgwqAgwqAgLXNzPGJyPgo8YnI+Cjxicj4KJmd0OyDCoCDCoDIwMTIvMTEvOSBT
ZXJnZXkgU2Vub3poYXRza3kgJmx0O1sxXTxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRz
a3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZndDs8YnI+Cjxk
aXY+PGRpdiBjbGFzcz0iaDUiPiZndDs8YnI+CiZndDsgwqAgwqAgwqBPbiAoMTEvMDkvMTIgMTk6
MTcpLCBBdXN0aW4gWmhhbmcgd3JvdGU6PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9bGli
bmwzOjxicj4KJmd0OyDCoCDCoCDCoCZndDsg77+9IO+/vWxpYm5sLTMuMCDvv70g77+9IO+/vSDv
v70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9bGlibmwgLSBDb252ZW5pZW5jZSBsaWJyYXJ5
IGZvcjxicj4KJmd0OyDCoCDCoCDCoG5ldGxpbms8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IO+/vSDv
v71zb2NrZXRzPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDvv70g77+9bGlibmwyOjxicj4KJmd0OyDC
oCDCoCDCoCZndDsg77+9IO+/vWxpYm5sLTIuMCDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9bGlibmwgLSBDb252ZW5pZW5jZSBsaWJyYXJ5IGZvcjxicj4KJmd0OyDC
oCDCoCDCoG5ldGxpbms8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IO+/vSDvv71zb2NrZXRzPGJyPgom
Z3Q7IMKgIMKgIMKgJmd0Ozxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoCDCoHNvLCBsaWJubC0zLjAu
cGMgYW5kIGxpYm5sLTIuMC5wYyBhcmUgdGhlcmUsIGJ1dCB0aGVyZSBhcmUgbm8gZXZpZGVuY2U8
YnI+CiZndDsgwqAgwqAgwqBvZiwgZm9yIGV4YW1wbGUsPGJyPgomZ3Q7IMKgIMKgIMKgbGlibmwt
Z2VubDxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoCDCoHBrZy1jb25maWcgb3V0cHV0IG9uIEFyY2g8
YnI+CiZndDsgwqAgwqAgwqBsaWJubC0zLjAg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/
vSDvv70gbGlibmwgLSBDb252ZW5pZW5jZSBsaWJyYXJ5IGZvciBuZXRsaW5rPGJyPgomZ3Q7IMKg
IMKgIMKgc29ja2V0czxicj4KJmd0OyDCoCDCoCDCoGxpYm5sLWNsaS0zLjAg77+9IO+/vSDvv70g
77+9IO+/vSDvv70g77+9IGxpYm5sLWNsaSAtIENvbW1hbmQgTGluZSBJbnRlcmZhY2UgbGlicmFy
eTxicj4KJmd0OyDCoCDCoCDCoGZvciBuZXRsaW5rIHNvY2tldHM8YnI+CiZndDsgwqAgwqAgwqBs
aWJubC1uZi0zLjAg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vWxpYm5sLW5mIC0gTmV0
ZmlsdGVyIE5ldGxpbmsgTGlicmFyeTxicj4KJmd0OyDCoCDCoCDCoGxpYm5sLXJvdXRlLTMuMCDv
v70g77+9IO+/vSDvv70g77+9IO+/vSBsaWJubC1yb3V0ZSAtIE5ldGxpbmsgUm91dGluZyBGYW1p
bHkgTGlicmFyeTxicj4KJmd0OyDCoCDCoCDCoGxpYm5sLWdlbmwtMy4wIO+/vSDvv70g77+9IO+/
vSDvv70g77+9IO+/vWxpYm5sLWdlbmwgLSBHZW5lcmljIE5ldGxpbmsgTGlicmFyeTxicj4KJmd0
Ozxicj4KJmd0OyDCoCDCoCDCoGluIGNhc2UgaWYgd2UgcmVtb3ZlIGxpYm5sLWdlbmwgZnJvbSBQ
S0dfQ0hFQ0tfTU9EVUxFUywgd2UmIzM5O2xsIGJyZWFrIHRoZTxicj4KJmd0OyDCoCDCoCDCoGJ1
aWxkLCBiZWNhdXNlIExJQk5MX0xJQlM8YnI+CiZndDsgwqAgwqAgwqBzaG91bGQgYmUgJiMzOTst
bG5sLWdlbmwtMyAtbG5sLTMmIzM5Oywgbm90IGp1c3QgJiMzOTstbG5sLTMmIzM5Oy48YnI+CiZn
dDs8YnI+CiZndDsgwqAgwqAgwqBbLi5dPGJyPgomZ3Q7IMKgIMKgIMKgc3JjL3R1bmluZy9pdy5j
Ojg5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnZW5sX2Nvbm5lY3QmIzM5Ozxicj4KJmd0OyDC
oCDCoCDCoHNyYy90dW5pbmcvaXcuYzo5NTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZ2VubF9j
dHJsX2FsbG9jX2NhY2hlJiMzOTs8YnI+CiZndDsgwqAgwqAgwqBzcmMvdHVuaW5nL2l3LmM6MTAx
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnZW5sX2N0cmxfc2VhcmNoX2J5X25hbWUmIzM5Ozxi
cj4KJmd0OyDCoCDCoCDCoGFuZCBzbyBvbi4uLjxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoCDCoGxv
b2tzIGxpa2Ugd2UgbmVlZCB0byB3b3JrYXJvdW5kIHVidW50dS48YnI+CiZndDs8YnI+CiZndDsg
wqAgwqAgwqDvv70g77+9IO+/vSDvv70gLXNzPGJyPgomZ3Q7PGJyPgo8L2Rpdj48L2Rpdj4mZ3Q7
IFJlZmVyZW5jZXM8YnI+CiZndDs8YnI+CiZndDsgwqAgwqBWaXNpYmxlIGxpbmtzPGJyPgomZ3Q7
IMKgIMKgMS4gbWFpbHRvOjxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwu
Y29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPjxicj4KPC9ibG9ja3F1b3RlPjwv
ZGl2Pjxicj48L2Rpdj4K

--===============0309270809405130028==--

