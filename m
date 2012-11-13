Content-Type: multipart/mixed; boundary="===============0753113147868513565=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Tue, 13 Nov 2012 17:06:43 +0800
Message-ID: <CAGLu0vP=Q9mepudrBj7d5W_9Pf3n_sVSF77TC-WT_4cdSEEBHQ@mail.gmail.com>
In-Reply-To: 20121112090918.GC3851@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0753113147868513565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Unfortunately, it only works in one 11.10 case, and doesn't work for
others. For libnl-3 case,
...
checking for library containing genl_connect...no
...

I checked the libnl-genl-3.so was install under /lib/i386-linux-gnu/
(12.10) or /lib/libnl-genl-3.0 (12.04) and I am sure it included
genl_connect, but now seemed AC_SEARCH_LIBS cannot find it at all.

But with some changes on above 1108 patch like:
from
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0],
[has_libnl_ver=3D3], [
+       PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0 libnl-genl-2.0 >=3D
2.0], [has_libnl_ver=3D2], [
+               PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1],
[])])])

to
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0],
[has_libnl_ver=3D3], [
+       PKG_CHECK_MODULES([LIBNL], [libnl-2.0], [has_libnl_ver=3D2], [
+               PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1],
[])])])

Don't check  libnl-genl-2.0 >=3D 2.0 ( as patch in 1108) and don't use
AC_SEARCH_LIBS
(as patch in above last one) at all.
Now, it works in 11.10/12.04/12.10 for all libnl-3/libnl2/libnl.


2012/11/12 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> Hello,
> may I ask you ti test the following one?
>
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>  configure.ac | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index b8c183f..cee5bf3 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,15 +54,20 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
1],[
>
>
>  has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> -       has_libnl_ver=3D3], [
> -       AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
> -               has_libnl_ver=3D3], [
> -               AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> -                       has_libnl_ver=3D2], [
> -                       PKG_CHECK_MODULES([LIBNL], [libnl-1],
> [has_libnl_ver=3D1], [])])])])
> +
> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0], [has_libnl_ver=3D3], [
> +       PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=
=3D2], [
> +               PKG_CHECK_MODULES([LIBNL], [libnl-1.0], [has_libnl_ver=3D=
1],
> [has_libnl_ver=3D0])])])
> +
> +#Austin Zhang reported failed configure on Ubuntu. It tourned out that
> ubuntu does
> +#not provide genl pkg-config files, thus PKG_CHECK_MODULES fails to check
> for
> +#libnl-genl.
> +#NOTE: AC_SEARCH_LIBS append -lnl-genl to LIBS, not to LIBNL_LIBS.
> +#
> +AC_SEARCH_LIBS([genl_connect], [nl-genl], [], [has_libnl_ver=3D0])
> +
>  if (test "$has_libnl_ver" -eq 0); then
> -       AC_MSG_ERROR(libnl is required but not found)
> +       AC_MSG_ERROR(libnl and libnl-genl are required but were not found)
>  fi
>  if (test "$has_libnl_ver" -gt 1); then
>         AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or
> higher])
>
>

--===============0753113147868513565==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

VW5mb3J0dW5hdGVseSwgaXQgb25seSB3b3JrcyBpbiBvbmUgMTEuMTAgY2FzZSwgYW5kIGRvZXNu
JiMzOTt0IHdvcmsgZm9yIG90aGVycy4gRm9yIGxpYm5sLTMgY2FzZSw8YnI+Li4uPGJyPmNoZWNr
aW5nIGZvciBsaWJyYXJ5IGNvbnRhaW5pbmcgZ2VubF9jb25uZWN0Li4ubm88YnI+Li4uPGJyPjxi
cj5JIGNoZWNrZWQgdGhlIGxpYm5sLWdlbmwtMy5zbyB3YXMgaW5zdGFsbCB1bmRlciAvbGliL2kz
ODYtbGludXgtZ251LyAoMTIuMTApIG9yIC9saWIvbGlibmwtZ2VubC0zLjAgKDEyLjA0KSBhbmQg
SSBhbSBzdXJlIGl0IGluY2x1ZGVkIGdlbmxfY29ubmVjdCwgYnV0IG5vdyBzZWVtZWQgQUNfU0VB
UkNIX0xJQlMgY2Fubm90IGZpbmQgaXQgYXQgYWxsLqA8ZGl2Pgo8YnI+PC9kaXY+PGRpdj5CdXQg
d2l0aCBzb21lIGNoYW5nZXMgb24gYWJvdmUgMTEwOCBwYXRjaCBsaWtlOjwvZGl2PjxkaXY+ZnJv
bTwvZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6
ZToxNHB4Ij4rUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMCAmZ3Q7PSAzLjAg
bGlibmwtZ2VubC0zLjAgJmd0Oz0gMy4wXSwgW2hhc19saWJubF92ZXI9M10sIFs8L3NwYW4+PGJy
IHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij4KPHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPisg
oCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTIuMCAmZ3Q7PSAyLjAgbGli
bmwtZ2VubC0yLjAgJmd0Oz0gMi4wXSwgW2hhc19saWJubF92ZXI9Ml0sIFs8L3NwYW4+PGJyIHN0
eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij4KPHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPisgoCCg
IKAgoCCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMV0sIFtoYXNfbGli
bmxfdmVyPTFdLCBbXSldKV0pPC9zcGFuPjxkaXYgY2xhc3M9IiIgc3R5bGU9ImZvbnQtZmFtaWx5
OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPjwvZGl2PjxkaXY+Cjxicj48L2Rpdj48
ZGl2PnRvoDwvZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2Zv
bnQtc2l6ZToxNHB4Ij4rUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMCAmZ3Q7
PSAzLjAgbGlibmwtZ2VubC0zLjAgJmd0Oz0gMy4wXSwgW2hhc19saWJubF92ZXI9M10sIFs8L3Nw
YW4+PGJyIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4
Ij4KPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0
cHgiPisgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTIuMF0sIFtoYXNf
bGlibmxfdmVyPTJdLCBbPC9zcGFuPjxiciBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1z
ZXJpZjtmb250LXNpemU6MTRweCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMt
c2VyaWY7Zm9udC1zaXplOjE0cHgiPisgoCCgIKAgoCCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhb
TElCTkxdLCBbbGlibmwtMV0sIFtoYXNfbGlibmxfdmVyPTFdLCBbXSldKV0pPC9zcGFuPjxkaXYg
Y2xhc3M9IiIgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0
cHgiPgo8L2Rpdj48ZGl2PqA8L2Rpdj48ZGl2PkRvbiYjMzk7dCBjaGVja6A8c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+oDwvc3Bhbj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+bGli
bmwtZ2VubC0yLjAgJmd0Oz0gMi4wICggYXMgcGF0Y2ggaW4gMTEwOCkgYW5kIGRvbiYjMzk7dKA8
L3NwYW4+dXNloEFDX1NFQVJDSF9MSUJTIChhcyBwYXRjaCBpbiBhYm92ZSBsYXN0IG9uZSkgYXQg
YWxsLjwvZGl2Pgo8ZGl2Pk5vdywgaXQgd29ya3MgaW4gMTEuMTAvMTIuMDQvMTIuMTAgZm9yIGFs
bCBsaWJubC0zL2xpYm5sMi9saWJubC48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJy
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxMi8xMS8xMiBTZXJnZXkgU2Vub3poYXRz
a3kgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208
L2E+Jmd0Ozwvc3Bhbj48YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPkhlbGxvLDxicj4KbWF5IEkgYXNrIHlvdSB0aSB0ZXN0IHRoZSBmb2xsb3dpbmcgb25l
Pzxicj4KPGRpdiBjbGFzcz0iaW0iPjxicj4KPGJyPgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2Vu
b3poYXRza3kgJmx0OzxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29t
Ij5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPC9hPiZndDs8YnI+Cjxicj4KLS0tPGJyPgo8
YnI+CjwvZGl2PqA8YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+
Y29uZmlndXJlLmFjPC9hPiB8IDIxICsrKysrKysrKysrKystLS0tLS0tLTxicj4KoDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKTxicj4KPGJyPgpkaWZmIC0t
Z2l0IGEvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZp
Z3VyZS5hYzwvYT4gYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFu
ayI+Y29uZmlndXJlLmFjPC9hPjxicj4KaW5kZXggYjhjMTgzZi4uY2VlNWJmMyAxMDA2NDQ8YnI+
Ci0tLSBhLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25m
aWd1cmUuYWM8L2E+PGJyPgorKysgYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJn
ZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KQEAgLTU0LDE1ICs1NCwyMCBAQCBQS0df
Q0hFQ0tfTU9EVUxFUyhbUENJVVRJTFNdLCBbbGlicGNpXSxbaGFzX2xpYnBjaT0xXSxbPGJyPgo8
ZGl2IGNsYXNzPSJpbSI+PGJyPgo8YnI+CqBoYXNfbGlibmxfdmVyPTA8YnI+Ci1QS0dfQ0hFQ0tf
TU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMy4wIGxpYm5sLWdlbmwtMy4wXSwgWzxicj4KLSCgIKAg
oCBoYXNfbGlibmxfdmVyPTNdLCBbPGJyPgotIKAgoCCgIEFDX1NFQVJDSF9MSUJTKFtubF9zb2Nr
ZXRfYWxsb2NdLCBbbmwtMyBubC1nZW5sLTNdLCBbPGJyPgotIKAgoCCgIKAgoCCgIKAgaGFzX2xp
Ym5sX3Zlcj0zXSwgWzxicj4KLSCgIKAgoCCgIKAgoCCgIEFDX1NFQVJDSF9MSUJTKFtubF9zb2Nr
ZXRfYWxsb2NdLCBbbmxdLCBbPGJyPgotIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCBoYXNfbGlibmxf
dmVyPTJdLCBbPGJyPgotIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhb
TElCTkxdLCBbbGlibmwtMV0sIFtoYXNfbGlibmxfdmVyPTFdLCBbXSldKV0pXSk8YnI+Cis8YnI+
CjwvZGl2PitQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMy4wICZndDs9IDMuMF0s
IFtoYXNfbGlibmxfdmVyPTNdLCBbPGJyPgorIKAgoCCgIFBLR19DSEVDS19NT0RVTEVTKFtMSUJO
TF0sIFtsaWJubC0yLjAgJmd0Oz0gMi4wXSwgW2hhc19saWJubF92ZXI9Ml0sIFs8YnI+CjxkaXYg
Y2xhc3M9ImltIj4rIKAgoCCgIKAgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xp
Ym5sLTEuMF0sIFtoYXNfbGlibmxfdmVyPTFdLCBbaGFzX2xpYm5sX3Zlcj0wXSldKV0pPGJyPgo8
L2Rpdj4rPGJyPgorI0F1c3RpbiBaaGFuZyByZXBvcnRlZCBmYWlsZWQgY29uZmlndXJlIG9uIFVi
dW50dS4gSXQgdG91cm5lZCBvdXQgdGhhdCB1YnVudHUgZG9lczxicj4KKyNub3QgcHJvdmlkZSBn
ZW5sIHBrZy1jb25maWcgZmlsZXMsIHRodXMgUEtHX0NIRUNLX01PRFVMRVMgZmFpbHMgdG8gY2hl
Y2sgZm9yPGJyPgorI2xpYm5sLWdlbmwuPGJyPgorI05PVEU6IEFDX1NFQVJDSF9MSUJTIGFwcGVu
ZCAtbG5sLWdlbmwgdG8gTElCUywgbm90IHRvIExJQk5MX0xJQlMuPGJyPgorIzxicj4KK0FDX1NF
QVJDSF9MSUJTKFtnZW5sX2Nvbm5lY3RdLCBbbmwtZ2VubF0sIFtdLCBbaGFzX2xpYm5sX3Zlcj0w
XSk8YnI+CjxkaXYgY2xhc3M9ImltIEhPRW5aYiI+Kzxicj4KoGlmICh0ZXN0ICZxdW90OyRoYXNf
bGlibmxfdmVyJnF1b3Q7IC1lcSAwKTsgdGhlbjxicj4KPC9kaXY+PGRpdiBjbGFzcz0iSE9Fblpi
Ij48ZGl2IGNsYXNzPSJoNSI+LSCgIKAgoCBBQ19NU0dfRVJST1IobGlibmwgaXMgcmVxdWlyZWQg
YnV0IG5vdCBmb3VuZCk8YnI+CisgoCCgIKAgQUNfTVNHX0VSUk9SKGxpYm5sIGFuZCBsaWJubC1n
ZW5sIGFyZSByZXF1aXJlZCBidXQgd2VyZSBub3QgZm91bmQpPGJyPgqgZmk8YnI+CqBpZiAodGVz
dCAmcXVvdDskaGFzX2xpYm5sX3ZlciZxdW90OyAtZ3QgMSk7IHRoZW48YnI+CqAgoCCgIKAgQUNf
REVGSU5FKFtIQVZFX0xJQk5MMjBdLCBbMV0sIFtEZWZpbmUgaWYgeW91IGhhdmUgbGlibmwtMi4w
IG9yIGhpZ2hlcl0pPGJyPgo8YnI+CjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj48YnI+
PC9kaXY+Cg==

--===============0753113147868513565==--

