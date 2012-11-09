Content-Type: multipart/mixed; boundary="===============6580788904529010757=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 09 Nov 2012 18:56:15 +0800
Message-ID: <CAGLu0vOxoPD_1vXqbyh_CtbQTxyXi2uRTusASzBDAe=t9x=KAQ@mail.gmail.com>
In-Reply-To: 20121108140938.GA3090@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6580788904529010757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Sergey,

Sorry for late reply.

I just tried it in my ubuntu11.04 x86-64 box, but it doesn't work.
for libnl2 and libnl3 cases, both failed in configure and with the same
error like : No Package 'libnl-1' found.

So I didn't try it in other box anymore.


2012/11/8 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> Hello,
> can you please test this patch?
>
>
> ----
>
> Rework libnl detection.
>
> PKG_CHECK_MODULES macro appends FOO_CFLAGS and FOO_LIBS flags
>
> Example:
> LIBNL_CFLAGS =3D -I/usr/include/libnl3
> LIBNL_LIBS =3D -lnl-genl-3 -lnl-3
>
> while AC_SEARCH_LIBS only prepends -llibrary to LIBS, so AC_SEARCH_LIBS
> is not helpful here.
>
>
> Use pkg-config PC file names to search for minimum package versions:
> libnl 3.+ -- libnl-3.0.pc
> libnl 2.+ -- libnl-2.0.pc
> libnl 1.+ -- libnl-1.0.pc
>
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>  configure.ac | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index b8c183f..b9c3c2e 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,13 +54,10 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
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
> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0],
> [has_libnl_ver=3D3], [
> +       PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0 libnl-genl-2.0 >=
=3D
> 2.0], [has_libnl_ver=3D2], [
> +               PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1],
> [])])])
>  if (test "$has_libnl_ver" -eq 0); then
>         AC_MSG_ERROR(libnl is required but not found)
>  fi
>
>

--===============6580788904529010757==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SGksIFNlcmdleSw8ZGl2Pjxicj48L2Rpdj48ZGl2PlNvcnJ5IGZvciBsYXRlIHJlcGx5LjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBqdXN0IHRyaWVkIGl0IGluIG15IHVidW50dTExLjA0IHg4
Ni02NCBib3gsIGJ1dCBpdCBkb2VzbiYjMzk7dCB3b3JrLjwvZGl2PjxkaXY+Zm9yIGxpYm5sMiBh
bmQgbGlibmwzIGNhc2VzLCBib3RoIGZhaWxlZCBpbiBjb25maWd1cmUgYW5kIHdpdGggdGhlIHNh
bWUgZXJyb3IgbGlrZSA6IE5vIFBhY2thZ2UgJiMzOTtsaWJubC0xJiMzOTsgZm91bmQuPC9kaXY+
CjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gSSBkaWRuJiMzOTt0IHRyeSBpdCBpbiBvdGhlciBib3gg
YW55bW9yZS6gPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjIwMTIvMTEvOCBTZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJs
dHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj48
YnI+CjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkhlbGxvLDxi
cj4KY2FuIHlvdSBwbGVhc2UgdGVzdCB0aGlzIHBhdGNoPzxicj4KPGJyPgo8YnI+Ci0tLS08YnI+
Cjxicj4KUmV3b3JrIGxpYm5sIGRldGVjdGlvbi48YnI+Cjxicj4KUEtHX0NIRUNLX01PRFVMRVMg
bWFjcm8gYXBwZW5kcyBGT09fQ0ZMQUdTIGFuZCBGT09fTElCUyBmbGFnczxicj4KPGJyPgpFeGFt
cGxlOjxicj4KTElCTkxfQ0ZMQUdTID0gLUkvdXNyL2luY2x1ZGUvbGlibmwzPGJyPgpMSUJOTF9M
SUJTID0gLWxubC1nZW5sLTMgLWxubC0zPGJyPgo8YnI+CndoaWxlIEFDX1NFQVJDSF9MSUJTIG9u
bHkgcHJlcGVuZHMgLWxsaWJyYXJ5IHRvIExJQlMsIHNvIEFDX1NFQVJDSF9MSUJTPGJyPgppcyBu
b3QgaGVscGZ1bCBoZXJlLjxicj4KPGJyPgo8YnI+ClVzZSBwa2ctY29uZmlnIFBDIGZpbGUgbmFt
ZXMgdG8gc2VhcmNoIGZvciBtaW5pbXVtIHBhY2thZ2UgdmVyc2lvbnM6PGJyPgpsaWJubCAzLisg
LS0gbGlibmwtMy4wLnBjPGJyPgpsaWJubCAyLisgLS0gbGlibmwtMi4wLnBjPGJyPgpsaWJubCAx
LisgLS0gbGlibmwtMS4wLnBjPGJyPgo8ZGl2IGNsYXNzPSJpbSI+PGJyPgo8YnI+ClNpZ25lZC1v
ZmYtYnk6IFNlcmdleSBTZW5vemhhdHNreSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5v
emhhdHNreUBnbWFpbC5jb20iPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozxi
cj4KPGJyPgotLS08YnI+Cjxicj4KPC9kaXY+oDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMi
IHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+IHwgMTEgKysrKy0tLS0tLS08YnI+CqAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKTxicj4KPGJyPgpk
aWZmIC0tZ2l0IGEvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJfYmxhbmsi
PmNvbmZpZ3VyZS5hYzwvYT4gYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9
Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KaW5kZXggYjhjMTgzZi4uYjljM2MyZSAxMDA2
NDQ8YnI+Ci0tLSBhLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2JsYW5r
Ij5jb25maWd1cmUuYWM8L2E+PGJyPgorKysgYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFj
IiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KQEAgLTU0LDEzICs1NCwxMCBA
QCBQS0dfQ0hFQ0tfTU9EVUxFUyhbUENJVVRJTFNdLCBbbGlicGNpXSxbaGFzX2xpYnBjaT0xXSxb
PGJyPgo8ZGl2IGNsYXNzPSJpbSI+PGJyPgo8YnI+CqBoYXNfbGlibmxfdmVyPTA8YnI+Ci1QS0df
Q0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMy4wIGxpYm5sLWdlbmwtMy4wXSwgWzxicj4K
PC9kaXY+LSCgIKAgoCBoYXNfbGlibmxfdmVyPTNdLCBbPGJyPgotIKAgoCCgIEFDX1NFQVJDSF9M
SUJTKFtubF9zb2NrZXRfYWxsb2NdLCBbbmwtMyBubC1nZW5sLTNdLCBbPGJyPgotIKAgoCCgIKAg
oCCgIKAgaGFzX2xpYm5sX3Zlcj0zXSwgWzxicj4KPGRpdiBjbGFzcz0iaW0iPi0goCCgIKAgoCCg
IKAgoCBBQ19TRUFSQ0hfTElCUyhbbmxfc29ja2V0X2FsbG9jXSwgW25sXSwgWzxicj4KPC9kaXY+
LSCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0yXSwgWzxicj4KLSCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTFdLCBbaGFz
X2xpYm5sX3Zlcj0xXSwgW10pXSldKV0pPGJyPgorPGJyPgorUEtHX0NIRUNLX01PRFVMRVMoW0xJ
Qk5MXSwgW2xpYm5sLTMuMCAmZ3Q7PSAzLjAgbGlibmwtZ2VubC0zLjAgJmd0Oz0gMy4wXSwgW2hh
c19saWJubF92ZXI9M10sIFs8YnI+CisgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwg
W2xpYm5sLTIuMCAmZ3Q7PSAyLjAgbGlibmwtZ2VubC0yLjAgJmd0Oz0gMi4wXSwgW2hhc19saWJu
bF92ZXI9Ml0sIFs8YnI+CisgoCCgIKAgoCCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxd
LCBbbGlibmwtMV0sIFtoYXNfbGlibmxfdmVyPTFdLCBbXSldKV0pPGJyPgo8ZGl2IGNsYXNzPSJp
bSBIT0VuWmIiPqBpZiAodGVzdCAmcXVvdDskaGFzX2xpYm5sX3ZlciZxdW90OyAtZXEgMCk7IHRo
ZW48YnI+CjwvZGl2PjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPqAgoCCgIKAg
QUNfTVNHX0VSUk9SKGxpYm5sIGlzIHJlcXVpcmVkIGJ1dCBub3QgZm91bmQpPGJyPgqgZmk8YnI+
Cjxicj4KPC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============6580788904529010757==--

