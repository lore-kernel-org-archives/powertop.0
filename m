Content-Type: multipart/mixed; boundary="===============5003304467153259770=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 23:19:54 +0800
Message-ID: <CAGLu0vOCbyZsB1HX7bQ33K+817nRd+ioKo9ObgU8xRCVdNfA7w@mail.gmail.com>
In-Reply-To: 20121109130108.GE3239@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5003304467153259770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> is this correct?
I listed it here for your reference.
12.04
# dpkg -L libnl1 | grep so
/usr/lib/i386-linux-gnu/libnl.so.1.1
/usr/lib/i386-linux-gnu/libnl.so.1
# dpkg -L libnl2 | grep so

/usr/lib/libnl-cli.so.2.0.0
/usr/lib/libnl-genl.so.2.0.0
/usr/lib/libnl-nf.so.2.0.0
/usr/lib/libnl-route.so.2.0.0
/usr/lib/libnl.so.2.0.0
/usr/lib/libnl-cli.so.2
/usr/lib/libnl-genl.so.2
/usr/lib/libnl-nf.so.2
/usr/lib/libnl-route.so.2
/usr/lib/libnl.so.2
# dpkg -L libnl-3-200 | grep so

/lib/libnl-3.so.200.3.0
/lib/libnl-3.so.200
# dpkg -L libnl-genl-3-200 | grep so
/lib/libnl-genl-3.so.200.3.0
/lib/libnl-genl-3.so.200


11.10
$ dpkg -L libnl1 | grep so
/usr/lib/libnl.so.1.1
/usr/lib/libnl.so.1
$ dpkg -L libnl2 | grep so

/usr/lib/libnl-cli.so.2.0.0
/usr/lib/libnl-route.so.2.0.0
/usr/lib/libnl-genl.so.2.0.0
/usr/lib/libnl-nf.so.2.0.0
/usr/lib/libnl.so.2.0.0
/usr/lib/libnl-route.so.2
/usr/lib/libnl-cli.so.2
/usr/lib/libnl-genl.so.2
/usr/lib/libnl.so.2
/usr/lib/libnl-nf.so.2
$ dpkg -L libnl3 | grep so

/usr/lib/libnl-cli.so.3.0.0
/usr/lib/libnl-genl.so.3.0.0
/usr/lib/libnl-nf.so.3.0.0
/usr/lib/libnl-route.so.3.0.0
/usr/lib/libnl.so.3.0.0
/usr/lib/libnl-cli.so.3
/usr/lib/libnl-genl.so.3
/usr/lib/libnl-nf.so.3
/usr/lib/libnl-route.so.3
/usr/lib/libnl.so.3


> is 11.10 still supported?
I thought it should, but it is up to you all maintainers:-)



2012/11/9 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (11/09/12 20:18), Austin Zhang wrote:
> >    > successful configure itself is useless, build is the one that
> matters.
> >    Yes, I agree this, I just mean "not install genl is not the excuse of
> fail
> >    to configure in _above_ cases".
>
> sorry, not sure.
> missing dependency is a very good reason to fail configure. in fact,
> configure is performed
> to validate system if it fits minimum build requirements. and in our case
> missing libnl
> and libnl-genl are a show stoppers.
>
> but yes, we have a problem with that ubuntu package mess that we have to
> address.
>
>
> >    After double check, in libnl-3 of ubuntu 11.10 (sorry, I wrote it as
> 11.04
> >    in above email) includes these content of lib-genl, so in 11.10, no
> >    libnl-genl, which only is in 12.04, where the nl version is: 3.2.3.
> >    and for libnl2, also no genl.
> >
>
> is this correct?
>
> ubuntu  libnl-3.*.so    libnl-genl-3.*.so       libnl-2.*.so
>  libnl-genl-2.*.so
> 11.10   +               -                       +               -
> 12.04   +               +                       +               +
>
>
> is 11.10 still supported? if support for that version is discontinued then
> I'm not sure
> we really must care.
>
>
>         -ss
>
>
> >    2012/11/9 Sergey Senozhatsky <[1]sergey.senozhatsky(a)gmail.com>
> >
> >      On (11/09/12 19:43), Austin Zhang wrote:
> >      >    >=EF=BF=BDbut there are no evidence of,
> >      >    nl-gen will only impact compile rather than configure, right?
> >      >    Those above build time error will happen in upstream version
> if you
> >      only
> >      >    install libnl3 but libnl-genl-3 for libnl3 case.
> >      >    But anyway, it shouldn't impact 'configure' action.=EF=BF=BD
> >      >
> >
> >      disagree, successful configure itself is useless, build is the one
> that
> >      matters.
> >      if one does not have all requirements for build, failed configure
> is ok.
> >
> >              -ss
> >
> >      >    2012/11/9 Sergey Senozhatsky <[1][2]
> sergey.senozhatsky(a)gmail.com>
> >      >
> >      >      On (11/09/12 19:17), Austin Zhang wrote:
> >      >      > =EF=BF=BD =EF=BF=BDlibnl3:
> >      >      > =EF=BF=BD =EF=BF=BDlibnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BDlibnl - Convenience
> library
> >      for
> >      >      netlink
> >      >      > =EF=BF=BD =EF=BF=BDsockets
> >      >      > =EF=BF=BD =EF=BF=BDlibnl2:
> >      >      > =EF=BF=BD =EF=BF=BDlibnl-2.0 =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =
=EF=BF=BDlibnl - Convenience
> library
> >      for
> >      >      netlink
> >      >      > =EF=BF=BD =EF=BF=BDsockets
> >      >      >
> >      >
> >      >      so, libnl-3.0.pc and libnl-2.0.pc are there, but there are =
no
> >      evidence
> >      >      of, for example,
> >      >      libnl-genl
> >      >
> >      >      pkg-config output on Arch
> >      >      libnl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD=
 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD libnl - Convenience library for
> >      netlink
> >      >      sockets
> >      >      libnl-cli-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BD libnl-cli - Command Line
> Interface
> >      library
> >      >      for netlink sockets
> >      >      libnl-nf-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=
=BD =EF=BF=BD =EF=BF=BD =EF=BF=BDlibnl-nf - Netfilter Netlink
> Library
> >      >      libnl-route-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD libnl-route - Netlink Routing
> Family
> >      Library
> >      >      libnl-genl-3.0 =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=
=BF=BD =EF=BF=BD =EF=BF=BDlibnl-genl - Generic Netlink
> Library
> >      >
> >      >      in case if we remove libnl-genl from PKG_CHECK_MODULES, we'=
ll
> >      break the
> >      >      build, because LIBNL_LIBS
> >      >      should be '-lnl-genl-3 -lnl-3', not just '-lnl-3'.
> >      >
> >      >      [..]
> >      >      src/tuning/iw.c:89: undefined reference to `genl_connect'
> >      >      src/tuning/iw.c:95: undefined reference to
> >      `genl_ctrl_alloc_cache'
> >      >      src/tuning/iw.c:101: undefined reference to
> >      `genl_ctrl_search_by_name'
> >      >      and so on...
> >      >
> >      >      looks like we need to workaround ubuntu.
> >      >
> >      >      =EF=BF=BD =EF=BF=BD =EF=BF=BD =EF=BF=BD -ss
> >      >
> >      > References
> >      >
> >      >    Visible links
> >      >    1. mailto:[3]sergey.senozhatsky(a)gmail.com
> >
> > References
> >
> >    Visible links
> >    1. mailto:sergey.senozhatsky(a)gmail.com
> >    2. mailto:sergey.senozhatsky(a)gmail.com
> >    3. mailto:sergey.senozhatsky(a)gmail.com
>

--===============5003304467153259770==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgi
PiZndDsgaXMgdGhpcyBjb3JyZWN0Pzwvc3Bhbj48YnIgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFs
LHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPjxkaXY+SSBsaXN0ZWQgaXQgaGVyZSBmb3IgeW91
ciByZWZlcmVuY2UuPC9kaXY+PGRpdj4xMi4wNDxicj48ZGl2PiMgZHBrZyAtTCBsaWJubDEgfCBn
cmVwIHNvPC9kaXY+CjxkaXY+L3Vzci9saWIvaTM4Ni1saW51eC1nbnUvbGlibmwuc28uMS4xPC9k
aXY+PGRpdj4vdXNyL2xpYi9pMzg2LWxpbnV4LWdudS9saWJubC5zby4xPC9kaXY+PGRpdj4jIGRw
a2cgLUwgbGlibmwyIHwgZ3JlcCBzbyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDwvZGl2Pgo8ZGl2Pi91c3IvbGliL2xpYm5sLWNsaS5zby4yLjAuMDwvZGl2Pjxk
aXY+L3Vzci9saWIvbGlibmwtZ2VubC5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwt
bmYuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9kaXY+
PGRpdj4vdXNyL2xpYi9saWJubC5zby4yLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtY2xp
LnNvLjI8L2Rpdj4KPGRpdj4vdXNyL2xpYi9saWJubC1nZW5sLnNvLjI8L2Rpdj48ZGl2Pi91c3Iv
bGliL2xpYm5sLW5mLnNvLjI8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNvLjI8L2Rp
dj48ZGl2Pi91c3IvbGliL2xpYm5sLnNvLjI8L2Rpdj48ZGl2PiMgZHBrZyAtTCBsaWJubC0zLTIw
MCB8IGdyZXAgc28gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2Pgo8
ZGl2Pi9saWIvbGlibmwtMy5zby4yMDAuMy4wPC9kaXY+PGRpdj4vbGliL2xpYm5sLTMuc28uMjAw
PC9kaXY+PGRpdj48ZGl2PiMgZHBrZyAtTCBsaWJubC1nZW5sLTMtMjAwIHwgZ3JlcCBzbzwvZGl2
PjxkaXY+L2xpYi9saWJubC1nZW5sLTMuc28uMjAwLjMuMDwvZGl2PjxkaXY+L2xpYi9saWJubC1n
ZW5sLTMuc28uMjAwPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+Cjxk
aXY+MTEuMTA8L2Rpdj48ZGl2PjxkaXY+JCBkcGtnIC1MIGxpYm5sMSB8IGdyZXAgc288L2Rpdj48
ZGl2Pi91c3IvbGliL2xpYm5sLnNvLjEuMTwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwuc28uMTwv
ZGl2PjxkaXY+JCBkcGtnIC1MIGxpYm5sMiB8IGdyZXAgc28gwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqA8L2Rpdj4KPGRpdj4vdXNyL2xpYi9saWJubC1jbGkuc28uMi4wLjA8L2Rpdj48ZGl2Pi91
c3IvbGliL2xpYm5sLXJvdXRlLnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1nZW5s
LnNvLjIuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC1uZi5zby4yLjAuMDwvZGl2PjxkaXY+
L3Vzci9saWIvbGlibmwuc28uMi4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJvdXRlLnNv
LjI8L2Rpdj4KPGRpdj4vdXNyL2xpYi9saWJubC1jbGkuc28uMjwvZGl2PjxkaXY+L3Vzci9saWIv
bGlibmwtZ2VubC5zby4yPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC5zby4yPC9kaXY+PGRpdj4v
dXNyL2xpYi9saWJubC1uZi5zby4yPC9kaXY+PGRpdj4kIGRwa2cgLUwgbGlibmwzIHwgZ3JlcCBz
byDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2Pgo8ZGl2Pi91c3IvbGliL2xpYm5sLWNs
aS5zby4zLjAuMDwvZGl2PjxkaXY+L3Vzci9saWIvbGlibmwtZ2VubC5zby4zLjAuMDwvZGl2Pjxk
aXY+L3Vzci9saWIvbGlibmwtbmYuc28uMy4wLjA8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLXJv
dXRlLnNvLjMuMC4wPC9kaXY+PGRpdj4vdXNyL2xpYi9saWJubC5zby4zLjAuMDwvZGl2PjxkaXY+
L3Vzci9saWIvbGlibmwtY2xpLnNvLjM8L2Rpdj4KPGRpdj4vdXNyL2xpYi9saWJubC1nZW5sLnNv
LjM8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLW5mLnNvLjM8L2Rpdj48ZGl2Pi91c3IvbGliL2xp
Ym5sLXJvdXRlLnNvLjM8L2Rpdj48ZGl2Pi91c3IvbGliL2xpYm5sLnNvLjM8L2Rpdj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48YnIgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9u
dC1zaXplOjE0cHgiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2Zv
bnQtc2l6ZToxNHB4Ij4mZ3Q7IGlzIDExLjEwIHN0aWxsIHN1cHBvcnRlZD88L3NwYW4+PGJyPgo8
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQt
c2l6ZToxNHB4Ij5JIHRob3VnaHQgaXQgc2hvdWxkLCBidXQgaXQgaXMgdXAgdG8geW91IGFsbCBt
YWludGFpbmVyczotKTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTph
cmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij7CoDwvc3Bhbj48L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9leHRyYSI+Cjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjIwMTIvMTEv
OSBTZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86
c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5zZW5v
emhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj48YnI+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgY2xhc3M9ImltIj5PbiAoMTEvMDkvMTIgMjA6
MTgpLCBBdXN0aW4gWmhhbmcgd3JvdGU6PGJyPgomZ3Q7IMKgIMKgJmd0O8Kgc3VjY2Vzc2Z1bCBj
b25maWd1cmUgaXRzZWxmIGlzIHVzZWxlc3MsIGJ1aWxkIGlzIHRoZSBvbmUgdGhhdCBtYXR0ZXJz
Ljxicj4KJmd0OyDCoCDCoFllcywgSSBhZ3JlZSB0aGlzLCBJIGp1c3QgbWVhbiAmcXVvdDtub3Qg
aW5zdGFsbCBnZW5sIGlzIG5vdCB0aGUgZXhjdXNlIG9mIGZhaWw8YnI+CiZndDsgwqAgwqB0byBj
b25maWd1cmUgaW4gX2Fib3ZlXyBjYXNlcyZxdW90Oy7CoDxicj4KPGJyPgo8L2Rpdj5zb3JyeSwg
bm90IHN1cmUuPGJyPgptaXNzaW5nIGRlcGVuZGVuY3kgaXMgYSB2ZXJ5IGdvb2QgcmVhc29uIHRv
IGZhaWwgY29uZmlndXJlLiBpbiBmYWN0LCBjb25maWd1cmUgaXMgcGVyZm9ybWVkPGJyPgp0byB2
YWxpZGF0ZSBzeXN0ZW0gaWYgaXQgZml0cyBtaW5pbXVtIGJ1aWxkIHJlcXVpcmVtZW50cy4gYW5k
IGluIG91ciBjYXNlIG1pc3NpbmcgbGlibmw8YnI+CmFuZCBsaWJubC1nZW5sIGFyZSBhIHNob3cg
c3RvcHBlcnMuPGJyPgo8YnI+CmJ1dCB5ZXMsIHdlIGhhdmUgYSBwcm9ibGVtIHdpdGggdGhhdCB1
YnVudHUgcGFja2FnZSBtZXNzIHRoYXQgd2UgaGF2ZSB0byBhZGRyZXNzLjxicj4KPGRpdiBjbGFz
cz0iaW0iPjxicj4KPGJyPgomZ3Q7IMKgIMKgQWZ0ZXIgZG91YmxlIGNoZWNrLCBpbiBsaWJubC0z
IG9mIHVidW50dSAxMS4xMCAoc29ycnksIEkgd3JvdGUgaXQgYXMgMTEuMDQ8YnI+CiZndDsgwqAg
wqBpbiBhYm92ZSBlbWFpbCkgaW5jbHVkZXMgdGhlc2UgY29udGVudCBvZiBsaWItZ2VubCwgc28g
aW4gMTEuMTAsIG5vPGJyPgomZ3Q7IMKgIMKgbGlibmwtZ2VubCwgd2hpY2ggb25seSBpcyBpbiAx
Mi4wNCwgd2hlcmUgdGhlIG5sIHZlcnNpb24gaXM6IDMuMi4zLjxicj4KJmd0OyDCoCDCoGFuZCBm
b3IgbGlibmwyLCBhbHNvIG5vIGdlbmwuPGJyPgomZ3Q7PGJyPgo8YnI+CjwvZGl2PmlzIHRoaXMg
Y29ycmVjdD88YnI+Cjxicj4KdWJ1bnR1IMKgbGlibmwtMy4qLnNvIMKgIMKgbGlibmwtZ2VubC0z
Liouc28gwqAgwqAgwqAgbGlibmwtMi4qLnNvIMKgIMKgbGlibmwtZ2VubC0yLiouc288YnI+CjEx
LjEwIMKgICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC08YnI+CjEyLjA0IMKgICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICs8YnI+Cjxicj4KPGJyPgppcyAxMS4xMCBzdGlsbCBzdXBwb3J0ZWQ/IGlm
IHN1cHBvcnQgZm9yIHRoYXQgdmVyc2lvbiBpcyBkaXNjb250aW51ZWQgdGhlbiBJJiMzOTttIG5v
dCBzdXJlPGJyPgp3ZSByZWFsbHkgbXVzdCBjYXJlLjxicj4KPGRpdiBjbGFzcz0iaW0iPjxicj4K
PGJyPgrCoCDCoCDCoCDCoCAtc3M8YnI+Cjxicj4KPGJyPgomZ3Q7IMKgIMKgMjAxMi8xMS85IFNl
cmdleSBTZW5vemhhdHNreSAmbHQ7WzFdPGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNr
eUBnbWFpbC5jb20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozxicj4KJmd0
Ozxicj4KJmd0OyDCoCDCoCDCoE9uICgxMS8wOS8xMiAxOTo0MyksIEF1c3RpbiBaaGFuZyB3cm90
ZTo8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgJmd0O++/vWJ1dCB0aGVyZSBhcmUgbm8gZXZp
ZGVuY2Ugb2YsPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoG5sLWdlbiB3aWxsIG9ubHkgaW1w
YWN0IGNvbXBpbGUgcmF0aGVyIHRoYW4gY29uZmlndXJlLCByaWdodD88YnI+CiZndDsgwqAgwqAg
wqAmZ3Q7IMKgIMKgVGhvc2UgYWJvdmUgYnVpbGQgdGltZSBlcnJvciB3aWxsIGhhcHBlbiBpbiB1
cHN0cmVhbSB2ZXJzaW9uIGlmIHlvdTxicj4KJmd0OyDCoCDCoCDCoG9ubHk8YnI+CiZndDsgwqAg
wqAgwqAmZ3Q7IMKgIMKgaW5zdGFsbCBsaWJubDMgYnV0IGxpYm5sLWdlbmwtMyBmb3IgbGlibmwz
IGNhc2UuPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoEJ1dCBhbnl3YXksIGl0IHNob3VsZG4m
IzM5O3QgaW1wYWN0ICYjMzk7Y29uZmlndXJlJiMzOTsgYWN0aW9uLu+/vTxicj4KJmd0OyDCoCDC
oCDCoCZndDs8YnI+CiZndDs8YnI+CiZndDsgwqAgwqAgwqBkaXNhZ3JlZSwgc3VjY2Vzc2Z1bCBj
b25maWd1cmUgaXRzZWxmIGlzIHVzZWxlc3MsIGJ1aWxkIGlzIHRoZSBvbmUgdGhhdDxicj4KJmd0
OyDCoCDCoCDCoG1hdHRlcnMuPGJyPgomZ3Q7IMKgIMKgIMKgaWYgb25lIGRvZXMgbm90IGhhdmUg
YWxsIHJlcXVpcmVtZW50cyBmb3IgYnVpbGQsIGZhaWxlZCBjb25maWd1cmUgaXMgb2suPGJyPgom
Z3Q7PGJyPgomZ3Q7IMKgIMKgIMKgwqAgwqAgwqAgwqAgLXNzPGJyPgomZ3Q7PGJyPgo8L2Rpdj4m
Z3Q7IMKgIMKgIMKgJmd0OyDCoCDCoDIwMTIvMTEvOSBTZXJnZXkgU2Vub3poYXRza3kgJmx0O1sx
XVsyXTxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIj5zZXJnZXku
c2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZndDs8YnI+CjxkaXY+PGRpdiBjbGFzcz0iaDUiPiZn
dDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoCDCoE9uICgxMS8wOS8x
MiAxOToxNyksIEF1c3RpbiBaaGFuZyB3cm90ZTo8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKg
IMKgJmd0OyDvv70g77+9bGlibmwzOjxicj4KJmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqAmZ3Q7
IO+/vSDvv71saWJubC0zLjAg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9
IO+/vWxpYm5sIC0gQ29udmVuaWVuY2UgbGlicmFyeTxicj4KJmd0OyDCoCDCoCDCoGZvcjxicj4K
Jmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqBuZXRsaW5rPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDC
oCDCoCDCoCZndDsg77+9IO+/vXNvY2tldHM8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
Jmd0OyDvv70g77+9bGlibmwyOjxicj4KJmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqAmZ3Q7IO+/
vSDvv71saWJubC0yLjAg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/
vWxpYm5sIC0gQ29udmVuaWVuY2UgbGlicmFyeTxicj4KJmd0OyDCoCDCoCDCoGZvcjxicj4KJmd0
OyDCoCDCoCDCoCZndDsgwqAgwqAgwqBuZXRsaW5rPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDC
oCDCoCZndDsg77+9IO+/vXNvY2tldHM8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgJmd0
Ozxicj4KJmd0OyDCoCDCoCDCoCZndDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgc28s
IGxpYm5sLTMuMC5wYyBhbmQgbGlibmwtMi4wLnBjIGFyZSB0aGVyZSwgYnV0IHRoZXJlIGFyZSBu
bzxicj4KJmd0OyDCoCDCoCDCoGV2aWRlbmNlPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoCDC
oG9mLCBmb3IgZXhhbXBsZSw8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgbGlibmwtZ2Vu
bDxicj4KJmd0OyDCoCDCoCDCoCZndDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgcGtn
LWNvbmZpZyBvdXRwdXQgb24gQXJjaDxicj4KJmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqBsaWJu
bC0zLjAg77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70gbGlibmwgLSBDb252ZW5p
ZW5jZSBsaWJyYXJ5IGZvcjxicj4KJmd0OyDCoCDCoCDCoG5ldGxpbms8YnI+CiZndDsgwqAgwqAg
wqAmZ3Q7IMKgIMKgIMKgc29ja2V0czxicj4KJmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqBsaWJu
bC1jbGktMy4wIO+/vSDvv70g77+9IO+/vSDvv70g77+9IO+/vSBsaWJubC1jbGkgLSBDb21tYW5k
IExpbmUgSW50ZXJmYWNlPGJyPgomZ3Q7IMKgIMKgIMKgbGlicmFyeTxicj4KJmd0OyDCoCDCoCDC
oCZndDsgwqAgwqAgwqBmb3IgbmV0bGluayBzb2NrZXRzPGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDC
oCDCoCDCoGxpYm5sLW5mLTMuMCDvv70g77+9IO+/vSDvv70g77+9IO+/vSDvv70g77+9bGlibmwt
bmYgLSBOZXRmaWx0ZXIgTmV0bGluayBMaWJyYXJ5PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDC
oCDCoGxpYm5sLXJvdXRlLTMuMCDvv70g77+9IO+/vSDvv70g77+9IO+/vSBsaWJubC1yb3V0ZSAt
IE5ldGxpbmsgUm91dGluZyBGYW1pbHk8YnI+CiZndDsgwqAgwqAgwqBMaWJyYXJ5PGJyPgomZ3Q7
IMKgIMKgIMKgJmd0OyDCoCDCoCDCoGxpYm5sLWdlbmwtMy4wIO+/vSDvv70g77+9IO+/vSDvv70g
77+9IO+/vWxpYm5sLWdlbmwgLSBHZW5lcmljIE5ldGxpbmsgTGlicmFyeTxicj4KJmd0OyDCoCDC
oCDCoCZndDs8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgaW4gY2FzZSBpZiB3ZSByZW1v
dmUgbGlibmwtZ2VubCBmcm9tIFBLR19DSEVDS19NT0RVTEVTLCB3ZSYjMzk7bGw8YnI+CiZndDsg
wqAgwqAgwqBicmVhayB0aGU8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgYnVpbGQsIGJl
Y2F1c2UgTElCTkxfTElCUzxicj4KJmd0OyDCoCDCoCDCoCZndDsgwqAgwqAgwqBzaG91bGQgYmUg
JiMzOTstbG5sLWdlbmwtMyAtbG5sLTMmIzM5Oywgbm90IGp1c3QgJiMzOTstbG5sLTMmIzM5Oy48
YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoCDCoFsuLl08
YnI+CiZndDsgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgc3JjL3R1bmluZy9pdy5jOjg5OiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBnZW5sX2Nvbm5lY3QmIzM5Ozxicj4KJmd0OyDCoCDCoCDCoCZndDsg
wqAgwqAgwqBzcmMvdHVuaW5nL2l3LmM6OTU6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG88YnI+CiZn
dDsgwqAgwqAgwqBgZ2VubF9jdHJsX2FsbG9jX2NhY2hlJiMzOTs8YnI+CiZndDsgwqAgwqAgwqAm
Z3Q7IMKgIMKgIMKgc3JjL3R1bmluZy9pdy5jOjEwMTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bzxi
cj4KJmd0OyDCoCDCoCDCoGBnZW5sX2N0cmxfc2VhcmNoX2J5X25hbWUmIzM5Ozxicj4KJmd0OyDC
oCDCoCDCoCZndDsgwqAgwqAgwqBhbmQgc28gb24uLi48YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJy
PgomZ3Q7IMKgIMKgIMKgJmd0OyDCoCDCoCDCoGxvb2tzIGxpa2Ugd2UgbmVlZCB0byB3b3JrYXJv
dW5kIHVidW50dS48YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7IMKgIMKgIMKgJmd0OyDC
oCDCoCDCoO+/vSDvv70g77+9IO+/vSAtc3M8YnI+CiZndDsgwqAgwqAgwqAmZ3Q7PGJyPgomZ3Q7
IMKgIMKgIMKgJmd0OyBSZWZlcmVuY2VzPGJyPgomZ3Q7IMKgIMKgIMKgJmd0Ozxicj4KJmd0OyDC
oCDCoCDCoCZndDsgwqAgwqBWaXNpYmxlIGxpbmtzPGJyPgo8L2Rpdj48L2Rpdj4mZ3Q7IMKgIMKg
IMKgJmd0OyDCoCDCoDEuIG1haWx0bzpbM108YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0
c2t5QGdtYWlsLmNvbSI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT48YnI+CjxkaXYg
Y2xhc3M9ImltIj4mZ3Q7PGJyPgomZ3Q7IFJlZmVyZW5jZXM8YnI+CiZndDs8YnI+CiZndDsgwqAg
wqBWaXNpYmxlIGxpbmtzPGJyPgomZ3Q7IMKgIMKgMS4gbWFpbHRvOjxhIGhyZWY9Im1haWx0bzpz
ZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29t
PC9hPjxicj4KPC9kaXY+Jmd0OyDCoCDCoDIuIG1haWx0bzo8YSBocmVmPSJtYWlsdG86c2VyZ2V5
LnNlbm96aGF0c2t5QGdtYWlsLmNvbSI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT48
YnI+CiZndDsgwqAgwqAzLiBtYWlsdG86PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNr
eUBnbWFpbC5jb20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+PGJyPgo8L2Jsb2Nr
cXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============5003304467153259770==--

