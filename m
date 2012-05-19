Content-Type: multipart/mixed; boundary="===============8648475626576847183=="
MIME-Version: 1.0
From: u know gascogne <atlrudeboi1 at gmail.com>
Subject: Re: [Powertop] compile error
Date: Fri, 18 May 2012 19:45:04 -0700
Message-ID: <CALRnzVXVymDy_zPvL+gS1t27oNYeeXxcWN-9eH4Adb+RVjzPGA@mail.gmail.com>
In-Reply-To: 28457856.EWR6mSpK1X@penguin
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8648475626576847183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

your version of libnl broke the build earlier for me i reverted back to
lib-nl and am still exitng at the same point all other dependances are
installed

On Fri, May 18, 2012 at 1:12 PM, Lekensteyn <lekensteyn(a)gmail.com> wrote:

> On Friday 18 May 2012 11:49:24 u know gascogne wrote:
> > I have pcitutils version 3.19 installed and have verified that libpci-a
> is
> > present i am on 3.4rc kernel on ubuntu 12.04
>
> You need to install libpci-dev. From my debian/control file:
>
> Build-Depends: debhelper (>=3D 8.0.0), libncursesw5-dev,
>  libncurses5-dev, libnl-3-dev, libnl-genl-3-dev, pkg-config, libpci-dev,
>  zlib1g-dev, autopoint
>
> If you are interested, my debian/rules file is not particularly
> interesting:
> #!/usr/bin/make -f
> %:
>        dh $@ --parallel
>
> Regards,
> Peter
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

--===============8648475626576847183==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU+eW91ciB2ZXJzaW9uIG9mIGxpYm5sIGJyb2tlIHRoZSBidWlsZCBlYXJsaWVy
IGZvciBtZSBpIHJldmVydGVkIGJhY2sgdG8gbGliLW5sIGFuZCBhbSBzdGlsbCBleGl0bmcgYXQg
dGhlIHNhbWUgcG9pbnQgYWxsIG90aGVyIGRlcGVuZGFuY2VzIGFyZSBpbnN0YWxsZWSgPC9zcGFu
PqA8YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBGcmksIE1heSAxOCwgMjAxMiBh
dCAxOjEyIFBNLCBMZWtlbnN0ZXluIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRv
Omxla2Vuc3RleW5AZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGVrZW5zdGV5bkBnbWFpbC5j
b208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPgoKPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBjbGFzcz0iaW0iPk9uIEZyaWRheSAxOCBNYXkgMjAxMiAx
MTo0OToyNCB1IGtub3cgZ2FzY29nbmUgd3JvdGU6PGJyPgomZ3Q7IEkgaGF2ZSBwY2l0dXRpbHMg
dmVyc2lvbiAzLjE5IGluc3RhbGxlZCBhbmQgaGF2ZSB2ZXJpZmllZCB0aGF0IGxpYnBjaS1hIGlz
PGJyPgomZ3Q7IHByZXNlbnQgaSBhbSBvbiAzLjRyYyBrZXJuZWwgb24gdWJ1bnR1IDEyLjA0PGJy
Pgo8YnI+CjwvZGl2PllvdSBuZWVkIHRvIGluc3RhbGwgbGlicGNpLWRldi4gRnJvbSBteSBkZWJp
YW4vY29udHJvbCBmaWxlOjxicj4KPGJyPgpCdWlsZC1EZXBlbmRzOiBkZWJoZWxwZXIgKCZndDs9
IDguMC4wKSwgbGlibmN1cnNlc3c1LWRldiw8YnI+CqBsaWJuY3Vyc2VzNS1kZXYsIGxpYm5sLTMt
ZGV2LCBsaWJubC1nZW5sLTMtZGV2LCBwa2ctY29uZmlnLCBsaWJwY2ktZGV2LDxicj4KoHpsaWIx
Zy1kZXYsIGF1dG9wb2ludDxicj4KPGJyPgpJZiB5b3UgYXJlIGludGVyZXN0ZWQsIG15IGRlYmlh
bi9ydWxlcyBmaWxlIGlzIG5vdCBwYXJ0aWN1bGFybHkgaW50ZXJlc3Rpbmc6PGJyPgojIS91c3Iv
YmluL21ha2UgLWY8YnI+CiU6PGJyPgogoCCgIKAgoGRoICRAIC0tcGFyYWxsZWw8YnI+Cjxicj4K
UmVnYXJkcyw8YnI+ClBldGVyPGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXzxicj4KUG93ZXJUb3AgbWFpbGluZyBsaXN0PGJyPgo8YSBocmVmPSJtYWls
dG86UG93ZXJUb3BAbGlzdHMuMDEub3JnIj5Qb3dlclRvcEBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8
YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Bvd2VydG9wIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9wb3dl
cnRvcDwvYT48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+Cg==

--===============8648475626576847183==--

