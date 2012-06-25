Content-Type: multipart/mixed; boundary="===============0464246164596957811=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] conditionally disable pci support on ARM
 platforms
Date: Mon, 25 Jun 2012 10:54:38 +0530
Message-ID: <CA+Z25wVLkMN7soPHqbNBUEDmosZs7r9R=rW=HKrLE8=Z3pVg9Q@mail.gmail.com>
In-Reply-To: 4FE4CF06.9050903@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0464246164596957811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23 June 2012 01:31, Arjan van de Ven <arjan(a)linux.intel.com> wrote:

> On 6/22/2012 11:42 AM, Rajagopal Venkat wrote:
> > +case "$host" in
> > +arm*)
> > +     AC_DEFINE([HAVE_NO_PCI],[1],[Define if host platform is ARM])
> > +     ;;
> > +*)
> > +     PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
> > +             AC_SEARCH_LIBS([pci_get_dev], [pci], [],
> AC_MSG_ERROR([libpci is required but was not found]), [])
> > +     ])
> > +     ;;
> > +esac
> > +
>
> I don't like this part.
>
> if libpci is option, it is optional.
>
> Agree. libpci should be optional.

At present build script is enforcing to install libpci which may not be
necessarily true for all platforms. Solution can be something like,

PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
        AC_SEARCH_LIBS([pci_get_dev], [pci], [],
[AC_DEFINE([HAVE_NO_PCI],[1],[Define if pci is not supported])], [])
        ])


> being arm or not is completely irrelevant in this regard.
> (and there will undoubtedly ARM systems at some point that will have PCI
> in them)
>
>
>

--===============0464246164596957811==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gMjMgSnVuZSAyMDEyIDAxOjMxLCBB
cmphbiB2YW4gZGUgVmVuIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmFyamFu
QGxpbnV4LmludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFyamFuQGxpbnV4LmludGVsLmNvbTwv
YT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGlu
Zy1sZWZ0OjFleCI+CjxkaXYgY2xhc3M9ImltIj5PbiA2LzIyLzIwMTIgMTE6NDIgQU0sIFJhamFn
b3BhbCBWZW5rYXQgd3JvdGU6PGJyPgomZ3Q7ICtjYXNlICZxdW90OyRob3N0JnF1b3Q7IGluPGJy
PgomZ3Q7ICthcm0qKTxicj4KJmd0OyArIKAgoCBBQ19ERUZJTkUoW0hBVkVfTk9fUENJXSxbMV0s
W0RlZmluZSBpZiBob3N0IHBsYXRmb3JtIGlzIEFSTV0pPGJyPgomZ3Q7ICsgoCCgIDs7PGJyPgom
Z3Q7ICsqKTxicj4KJmd0OyArIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbUENJVVRJTFNdLCBbbGli
cGNpXSxbXSxbPGJyPgomZ3Q7ICsgoCCgIKAgoCCgIKAgQUNfU0VBUkNIX0xJQlMoW3BjaV9nZXRf
ZGV2XSwgW3BjaV0sIFtdLCBBQ19NU0dfRVJST1IoW2xpYnBjaSBpcyByZXF1aXJlZCBidXQgd2Fz
IG5vdCBmb3VuZF0pLCBbXSk8YnI+CiZndDsgKyCgIKAgXSk8YnI+CiZndDsgKyCgIKAgOzs8YnI+
CiZndDsgK2VzYWM8YnI+CiZndDsgKzxicj4KPGJyPgo8L2Rpdj5JIGRvbiYjMzk7dCBsaWtlIHRo
aXMgcGFydC48YnI+Cjxicj4KaWYgbGlicGNpIGlzIG9wdGlvbiwgaXQgaXMgb3B0aW9uYWwuPGJy
Pgo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+QWdyZWUuIGxpYnBjaSBzaG91bGQgYmUgb3B0aW9uYWwu
IDxicj48YnI+QXQgcHJlc2VudCBidWlsZCBzY3JpcHQgaXMgZW5mb3JjaW5nIHRvIGluc3RhbGwg
bGlicGNpIHdoaWNoIG1heSBub3QgYmUgbmVjZXNzYXJpbHkgdHJ1ZSBmb3IgYWxsIHBsYXRmb3Jt
cy4gU29sdXRpb24gY2FuIGJlIHNvbWV0aGluZyBsaWtlLDxicj6gPGJyPlBLR19DSEVDS19NT0RV
TEVTKFtQQ0lVVElMU10sIFtsaWJwY2ldLFtdLFs8YnI+CqCgoKCgoKAgQUNfU0VBUkNIX0xJQlMo
W3BjaV9nZXRfZGV2XSwgW3BjaV0sIFtdLCBbQUNfREVGSU5FKFtIQVZFX05PX1BDSV0sWzFdLFtE
ZWZpbmUgaWYgcGNpIGlzIG5vdCBzdXBwb3J0ZWRdKV0sIFtdKTxicj6goKCgoKCgIF0pPGJyPqA8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPgoKYmVpbmcgYXJtIG9yIG5vdCBpcyBjb21wbGV0ZWx5IGlycmVsZXZh
bnQgaW4gdGhpcyByZWdhcmQuPGJyPgooYW5kIHRoZXJlIHdpbGwgdW5kb3VidGVkbHkgQVJNIHN5
c3RlbXMgYXQgc29tZSBwb2ludCB0aGF0IHdpbGwgaGF2ZSBQQ0k8YnI+CmluIHRoZW0pPGJyPgo8
YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj4K

--===============0464246164596957811==--

