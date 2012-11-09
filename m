Content-Type: multipart/mixed; boundary="===============8318591381059738933=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 19:43:16 +0800
Message-ID: <CAGLu0vNzi+Gbum7R+MWZvmXVFd3Pu8tN5Vr33U8WGYKiTBTDZg@mail.gmail.com>
In-Reply-To: 20121109113026.GB3239@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8318591381059738933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> but there are no evidence of,
nl-gen will only impact compile rather than configure, right?

Those above build time error will happen in upstream version if you only
install libnl3 but libnl-genl-3 for libnl3 case.

But anyway, it shouldn't impact 'configure' action.


2012/11/9 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (11/09/12 19:17), Austin Zhang wrote:
> >    libnl3:
> >    libnl-3.0                      libnl - Convenience library for netli=
nk
> >    sockets
> >    libnl2:
> >    libnl-2.0                      libnl - Convenience library for netli=
nk
> >    sockets
> >
>
> so, libnl-3.0.pc and libnl-2.0.pc are there, but there are no evidence of,
> for example,
> libnl-genl
>
> pkg-config output on Arch
>
> libnl-3.0                   libnl - Convenience library for netlink socke=
ts
> libnl-cli-3.0               libnl-cli - Command Line Interface library for
> netlink sockets
> libnl-nf-3.0                libnl-nf - Netfilter Netlink Library
> libnl-route-3.0             libnl-route - Netlink Routing Family Library
> libnl-genl-3.0              libnl-genl - Generic Netlink Library
>
>
> in case if we remove libnl-genl from PKG_CHECK_MODULES, we'll break the
> build, because LIBNL_LIBS
> should be '-lnl-genl-3 -lnl-3', not just '-lnl-3'.
>
> [..]
> src/tuning/iw.c:89: undefined reference to `genl_connect'
> src/tuning/iw.c:95: undefined reference to `genl_ctrl_alloc_cache'
> src/tuning/iw.c:101: undefined reference to `genl_ctrl_search_by_name'
> and so on...
>
>
> looks like we need to workaround ubuntu.
>
>
>         -ss
>

--===============8318591381059738933==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

Jmd0O6A8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6
MTRweCI+YnV0IHRoZXJlIGFyZSBubyBldmlkZW5jZSBvZiw8L3NwYW4+PGRpdj48Zm9udCBmYWNl
PSJhcmlhbCwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNHB4Ij5ubC1nZW4g
d2lsbCBvbmx5IGltcGFjdCBjb21waWxlIHJhdGhlciB0aGFuIGNvbmZpZ3VyZSwgcmlnaHQ/PC9z
cGFuPjwvZm9udD48L2Rpdj4KPGRpdj48Zm9udCBmYWNlPSJhcmlhbCwgc2Fucy1zZXJpZiI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxNHB4Ij48YnI+PC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2Pjxm
b250IGZhY2U9ImFyaWFsLCBzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0cHgi
PlRob3NlIGFib3ZlIGJ1aWxkIHRpbWUgZXJyb3Igd2lsbCBoYXBwZW4gaW4gdXBzdHJlYW0gdmVy
c2lvbiBpZiB5b3Ugb25seSBpbnN0YWxsIGxpYm5sMyBidXQgbGlibmwtZ2VubC0zIGZvciBsaWJu
bDMgY2FzZS48L3NwYW4+PC9mb250PjwvZGl2Pgo8ZGl2Pjxmb250IGZhY2U9ImFyaWFsLCBzYW5z
LXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0cHgiPjxicj48L3NwYW4+PC9mb250Pjwv
ZGl2PjxkaXY+PGZvbnQgZmFjZT0iYXJpYWwsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTRweCI+QnV0IGFueXdheSwgaXQgc2hvdWxkbiYjMzk7dCBpbXBhY3QgJiMzOTtjb25m
aWd1cmUmIzM5OyBhY3Rpb24uoDwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjxkaXYgY2xhc3M9ImdtYWls
X2V4dHJhIj48YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4yMDEyLzExLzkgU2VyZ2V5
IFNlbm96aGF0c2t5IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5z
ZW5vemhhdHNreUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5zZXJnZXkuc2Vub3poYXRza3lA
Z21haWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPgo8ZGl2IGNsYXNzPSJpbSI+T24gKDExLzA5LzEyIDE5OjE3KSwgQXVz
dGluIFpoYW5nIHdyb3RlOjxicj4KJmd0OyCgIKBsaWJubDM6PGJyPgomZ3Q7IKAgoGxpYm5sLTMu
MCCgIKAgoCCgIKAgoCCgIKAgoCCgIKBsaWJubCAtIENvbnZlbmllbmNlIGxpYnJhcnkgZm9yIG5l
dGxpbms8YnI+CiZndDsgoCCgc29ja2V0czxicj4KJmd0OyCgIKBsaWJubDI6PGJyPgomZ3Q7IKAg
oGxpYm5sLTIuMCCgIKAgoCCgIKAgoCCgIKAgoCCgIKBsaWJubCAtIENvbnZlbmllbmNlIGxpYnJh
cnkgZm9yIG5ldGxpbms8YnI+CiZndDsgoCCgc29ja2V0czxicj4KJmd0Ozxicj4KPGJyPgo8L2Rp
dj5zbywgbGlibmwtMy4wLnBjIGFuZCBsaWJubC0yLjAucGMgYXJlIHRoZXJlLCBidXQgdGhlcmUg
YXJlIG5vIGV2aWRlbmNlIG9mLCBmb3IgZXhhbXBsZSw8YnI+CmxpYm5sLWdlbmw8YnI+Cjxicj4K
cGtnLWNvbmZpZyBvdXRwdXQgb24gQXJjaDxicj4KPGRpdiBjbGFzcz0iaW0iPjxicj4KbGlibmwt
My4wIKAgoCCgIKAgoCCgIKAgoCCgIGxpYm5sIC0gQ29udmVuaWVuY2UgbGlicmFyeSBmb3IgbmV0
bGluayBzb2NrZXRzPGJyPgo8L2Rpdj5saWJubC1jbGktMy4wIKAgoCCgIKAgoCCgIKAgbGlibmwt
Y2xpIC0gQ29tbWFuZCBMaW5lIEludGVyZmFjZSBsaWJyYXJ5IGZvciBuZXRsaW5rIHNvY2tldHM8
YnI+CmxpYm5sLW5mLTMuMCCgIKAgoCCgIKAgoCCgIKBsaWJubC1uZiAtIE5ldGZpbHRlciBOZXRs
aW5rIExpYnJhcnk8YnI+CmxpYm5sLXJvdXRlLTMuMCCgIKAgoCCgIKAgoCBsaWJubC1yb3V0ZSAt
IE5ldGxpbmsgUm91dGluZyBGYW1pbHkgTGlicmFyeTxicj4KbGlibmwtZ2VubC0zLjAgoCCgIKAg
oCCgIKAgoGxpYm5sLWdlbmwgLSBHZW5lcmljIE5ldGxpbmsgTGlicmFyeTxicj4KPGJyPgo8YnI+
CmluIGNhc2UgaWYgd2UgcmVtb3ZlIGxpYm5sLWdlbmwgZnJvbSBQS0dfQ0hFQ0tfTU9EVUxFUywg
d2UmIzM5O2xsIGJyZWFrIHRoZSBidWlsZCwgYmVjYXVzZSBMSUJOTF9MSUJTPGJyPgpzaG91bGQg
YmUgJiMzOTstbG5sLWdlbmwtMyAtbG5sLTMmIzM5Oywgbm90IGp1c3QgJiMzOTstbG5sLTMmIzM5
Oy48YnI+Cjxicj4KWy4uXTxicj4Kc3JjL3R1bmluZy9pdy5jOjg5OiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBnZW5sX2Nvbm5lY3QmIzM5Ozxicj4Kc3JjL3R1bmluZy9pdy5jOjk1OiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBnZW5sX2N0cmxfYWxsb2NfY2FjaGUmIzM5Ozxicj4Kc3JjL3R1bmlu
Zy9pdy5jOjEwMTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZ2VubF9jdHJsX3NlYXJjaF9ieV9u
YW1lJiMzOTs8YnI+CmFuZCBzbyBvbi4uLjxicj4KPGJyPgo8YnI+Cmxvb2tzIGxpa2Ugd2UgbmVl
ZCB0byB3b3JrYXJvdW5kIHVidW50dS48YnI+CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNv
bG9yPSIjODg4ODg4Ij48YnI+Cjxicj4KoCCgIKAgoCAtc3M8YnI+CjwvZm9udD48L3NwYW4+PC9i
bG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============8318591381059738933==--

