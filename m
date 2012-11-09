Content-Type: multipart/mixed; boundary="===============2712443995140109897=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 19:17:00 +0800
Message-ID: <CAGLu0vOCzSjQ1nDg1PGTv3LEChGLcKqXOMx5eU-E_vaP8FvD_A@mail.gmail.com>
In-Reply-To: 20121109110129.GA3239@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2712443995140109897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

libnl3:
libnl-3.0                      libnl - Convenience library for netlink
sockets

libnl2:
libnl-2.0                      libnl - Convenience library for netlink
sockets



2012/11/9 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (11/09/12 18:56), Austin Zhang wrote:
> >    Hi, Sergey,
> >    Sorry for late reply.
> >    I just tried it in my ubuntu11.04 x86-64 box, but it doesn't work.
> >    for libnl2 and libnl3 cases, both failed in configure and with the
> same
> >    error like : No Package 'libnl-1' found.
> >    So I didn't try it in other box anymore.=EF=BF=BD
> >
>
> Hello,
>
> hm... can you please run
>
>         pkg-config --list-all | grep -i nl
>
> and send me output. thanks.
>
>
>         -ss
>

--===============2712443995140109897==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

bGlibmwzOjxicj5saWJubC0zLjAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaWJu
bCAtIENvbnZlbmllbmNlIGxpYnJhcnkgZm9yIG5ldGxpbmsgc29ja2V0czxicj48ZGl2Pjxicj48
L2Rpdj48ZGl2PmxpYm5sMjo8L2Rpdj48ZGl2PmxpYm5sLTIuMCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGxpYm5sIC0gQ29udmVuaWVuY2UgbGlicmFyeSBmb3IgbmV0bGluayBzb2Nr
ZXRzPGJyPjwvZGl2PjxkaXY+Cjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJy
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxMi8xMS85IFNlcmdleSBTZW5vemhhdHNr
eSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwv
YT4mZ3Q7PC9zcGFuPjxicj4KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+PGRpdiBjbGFzcz0iaW0iPk9uICgxMS8wOS8xMiAxODo1NiksIEF1c3RpbiBaaGFuZyB3
cm90ZTo8YnI+CiZndDsgwqAgwqBIaSwgU2VyZ2V5LDxicj4KJmd0OyDCoCDCoFNvcnJ5IGZvciBs
YXRlIHJlcGx5Ljxicj4KJmd0OyDCoCDCoEkganVzdCB0cmllZCBpdCBpbiBteSB1YnVudHUxMS4w
NCB4ODYtNjQgYm94LCBidXQgaXQgZG9lc24mIzM5O3Qgd29yay48YnI+CiZndDsgwqAgwqBmb3Ig
bGlibmwyIGFuZCBsaWJubDMgY2FzZXMsIGJvdGggZmFpbGVkIGluIGNvbmZpZ3VyZSBhbmQgd2l0
aCB0aGUgc2FtZTxicj4KJmd0OyDCoCDCoGVycm9yIGxpa2UgOiBObyBQYWNrYWdlICYjMzk7bGli
bmwtMSYjMzk7IGZvdW5kLjxicj4KPC9kaXY+Jmd0OyDCoCDCoFNvIEkgZGlkbiYjMzk7dCB0cnkg
aXQgaW4gb3RoZXIgYm94IGFueW1vcmUu77+9PGJyPgomZ3Q7PGJyPgo8YnI+CkhlbGxvLDxicj4K
PGJyPgpobS4uLiBjYW4geW91IHBsZWFzZSBydW48YnI+Cjxicj4KwqAgwqAgwqAgwqAgcGtnLWNv
bmZpZyAtLWxpc3QtYWxsIHwgZ3JlcCAtaSBubDxicj4KPGJyPgphbmQgc2VuZCBtZSBvdXRwdXQu
IHRoYW5rcy48YnI+CjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4Ij48
YnI+Cjxicj4KwqAgwqAgwqAgwqAgLXNzPGJyPgo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48
L2Rpdj48YnI+PC9kaXY+Cg==

--===============2712443995140109897==--

