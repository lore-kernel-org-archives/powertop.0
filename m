Content-Type: multipart/mixed; boundary="===============6356176951436357091=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Tue, 13 Nov 2012 17:47:36 +0800
Message-ID: <CAGLu0vOK9HGvtohORcvfm1F92863GShB2L+xkKyVE5koEhtmYg@mail.gmail.com>
In-Reply-To: 20121113092624.GA2621@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6356176951436357091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only
'libnl-2.0',
Because for v2, it just have separated libnl-genl library, but there were
no separated pkg named libnl-genl-2.0.

>+AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
With additional 'nl' checking, It doesn't help. Failed with same error
under both v3 and v2 cases for 12.04 (doesn't try others).
If fact, genl_connect is in nl-genl both for v2 and v3. Not sure if it is
some search path issue.


2012/11/13 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

> On (11/13/12 17:06), Austin Zhang wrote:
> >
> >    Unfortunately, it only works in one 11.10 case, and doesn't work for
> >    others. For libnl-3 case,
> >    ...
> >    checking for library containing genl_connect...no
> >    ...
> >
> ok, which means that genl_connect is withing libnl.
>
> I really would like to keep checks consistent, otherwise it's a bit uncle=
ar
> why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only 'libnl=
-2.0',
> besides, I've a feeling that will break build on some distros (in case if
> that is only Ubuntu specific, we'll end up w/o -nl-genl).
>
> Add -nl to AC_SEARCH_LIBS.
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>  configure.ac | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index b8c183f..0958d73 100644
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
> +#Austin Zhang reported failed configure on Ubuntu. It turned out that
> ubuntu does
> +#not provide genl pkg-config files, thus PKG_CHECK_MODULES fails to check
> for
> +#libnl-genl.
> +#NOTE: AC_SEARCH_LIBS append -lnl-genl to LIBS, not to LIBNL_LIBS.
> +#
> +AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
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

--===============6356176951436357091==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgi
PiZndDsgd2h5IHdlIGNoZWNrICYjMzk7bGlibmwtMy4wICZndDs9IDMuMCBsaWJubC1nZW5sLTMu
MCAmZ3Q7PSAzLjAmIzM5OyBhbmQgb25seSAmIzM5O2xpYm5sLTIuMCYjMzk7LDwvc3Bhbj48YnIg
c3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPgo8Zm9u
dCBmYWNlPSJhcmlhbCwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNHB4Ij5C
ZWNhdXNlIGZvciB2MiwgaXQganVzdCBoYXZloHNlcGFyYXRlZKBsaWJubC1nZW5sIGxpYnJhcnks
IGJ1dCB0aGVyZSB3ZXJlIG5voHNlcGFyYXRlZCBwa2cgbmFtZWSgbGlibmwtZ2VubC0yLjAuPC9z
cGFuPjwvZm9udD48YnIgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1z
aXplOjE0cHgiPgo8ZGl2Pjxmb250IGZhY2U9ImFyaWFsLCBzYW5zLXNlcmlmIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjE0cHgiPjxicj48L3NwYW4+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgZmFj
ZT0iYXJpYWwsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTRweCI+Jmd0Ozwv
c3Bhbj48L2ZvbnQ+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9u
dC1zaXplOjE0cHgiPitBQ19TRUFSQ0hfTElCUyhbZ2VubF9jb25uZWN0XTwvc3Bhbj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+LCBbbmwt
Z2VubCBubF0sIFtdLCBbaGFzX2xpYm5sX3Zlcj0wXSk8L3NwYW4+PC9kaXY+CjxkaXYgY2xhc3M9
IiIgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPldp
dGggYWRkaXRpb25hbCAmIzM5O25sJiMzOTsgY2hlY2tpbmcsIEl0IGRvZXNuJiMzOTt0IGhlbHAu
IEZhaWxlZCB3aXRoIHNhbWUgZXJyb3IgdW5kZXIgYm90aCB2MyBhbmQgdjIgY2FzZXMgZm9yIDEy
LjA0IChkb2VzbiYjMzk7dCB0cnkgb3RoZXJzKS6gPC9kaXY+PGRpdiBjbGFzcz0iIiBzdHlsZT0i
Zm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+CklmIGZhY3QsIGdl
bmxfY29ubmVjdCBpcyBpbiBubC1nZW5sIGJvdGggZm9yIHYyIGFuZCB2My4gTm90IHN1cmUgaWYg
aXQgaXMgc29tZSBzZWFyY2ggcGF0aCBpc3N1ZS6gPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0
cmEiPjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjIwMTIvMTEvMTMgU2VyZ2V5IFNl
bm96aGF0c2t5IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnNlcmdleS5zZW5v
emhhdHNreUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5zZXJnZXkuc2Vub3poYXRza3lAZ21h
aWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJpbSI+T24gKDExLzEzLzEyIDE3OjA2KSwgQXVzdGlu
IFpoYW5nIHdyb3RlOjxicj4KJmd0Ozxicj4KJmd0OyCgIKBVbmZvcnR1bmF0ZWx5LCBpdCBvbmx5
IHdvcmtzIGluIG9uZSAxMS4xMCBjYXNlLCBhbmQgZG9lc24mIzM5O3Qgd29yayBmb3I8YnI+CiZn
dDsgoCCgb3RoZXJzLiBGb3IgbGlibmwtMyBjYXNlLDxicj4KJmd0OyCgIKAuLi48YnI+CiZndDsg
oCCgY2hlY2tpbmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBnZW5sX2Nvbm5lY3QuLi5ubzxicj4K
Jmd0OyCgIKAuLi48YnI+CiZndDs8YnI+CjwvZGl2Pm9rLCB3aGljaCBtZWFucyB0aGF0IGdlbmxf
Y29ubmVjdCBpcyB3aXRoaW5nIGxpYm5sLjxicj4KPGJyPgpJIHJlYWxseSB3b3VsZCBsaWtlIHRv
IGtlZXAgY2hlY2tzIGNvbnNpc3RlbnQsIG90aGVyd2lzZSBpdCYjMzk7cyBhIGJpdCB1bmNsZWFy
PGJyPgp3aHkgd2UgY2hlY2sgJiMzOTtsaWJubC0zLjAgJmd0Oz0gMy4wIGxpYm5sLWdlbmwtMy4w
ICZndDs9IDMuMCYjMzk7IGFuZCBvbmx5ICYjMzk7bGlibmwtMi4wJiMzOTssPGJyPgpiZXNpZGVz
LCBJJiMzOTt2ZSBhIGZlZWxpbmcgdGhhdCB3aWxsIGJyZWFrIGJ1aWxkIG9uIHNvbWUgZGlzdHJv
cyAoaW4gY2FzZSBpZjxicj4KdGhhdCBpcyBvbmx5IFVidW50dSBzcGVjaWZpYywgd2UmIzM5O2xs
IGVuZCB1cCB3L28gLW5sLWdlbmwpLjxicj4KPGJyPgpBZGQgLW5sIHRvIEFDX1NFQVJDSF9MSUJT
Ljxicj4KPGRpdiBjbGFzcz0iaW0iPjxicj4KU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNlbm96aGF0
c2t5ICZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSI+c2Vy
Z2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+Ci0tLTxicj4KPGJyPgqg
PGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5h
YzwvYT4gfCAyMSArKysrKysrKysrKysrLS0tLS0tLS08YnI+CqAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSk8YnI+Cjxicj4KZGlmZiAtLWdpdCBhLzxhIGhy
ZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+
IGIvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3Vy
ZS5hYzwvYT48YnI+CjwvZGl2PmluZGV4IGI4YzE4M2YuLjA5NThkNzMgMTAwNjQ0PGJyPgo8ZGl2
IGNsYXNzPSJpbSI+LS0tIGEvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJf
YmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT48YnI+CisrKyBiLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1
cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+PGJyPgpAQCAtNTQsMTUgKzU0
LDIwIEBAIFBLR19DSEVDS19NT0RVTEVTKFtQQ0lVVElMU10sIFtsaWJwY2ldLFtoYXNfbGlicGNp
PTFdLFs8YnI+Cjxicj4KPGJyPgqgaGFzX2xpYm5sX3Zlcj0wPGJyPgotUEtHX0NIRUNLX01PRFVM
RVMoW0xJQk5MXSwgW2xpYm5sLTMuMCBsaWJubC1nZW5sLTMuMF0sIFs8YnI+Ci0goCCgIKAgaGFz
X2xpYm5sX3Zlcj0zXSwgWzxicj4KLSCgIKAgoCBBQ19TRUFSQ0hfTElCUyhbbmxfc29ja2V0X2Fs
bG9jXSwgW25sLTMgbmwtZ2VubC0zXSwgWzxicj4KLSCgIKAgoCCgIKAgoCCgIGhhc19saWJubF92
ZXI9M10sIFs8YnI+Ci0goCCgIKAgoCCgIKAgoCBBQ19TRUFSQ0hfTElCUyhbbmxfc29ja2V0X2Fs
bG9jXSwgW25sXSwgWzxicj4KLSCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0y
XSwgWzxicj4KLSCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5M
XSwgW2xpYm5sLTFdLCBbaGFzX2xpYm5sX3Zlcj0xXSwgW10pXSldKV0pPGJyPgorPGJyPgorUEtH
X0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMCAmZ3Q7PSAzLjBdLCBbaGFzX2xpYm5s
X3Zlcj0zXSwgWzxicj4KKyCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwt
Mi4wICZndDs9IDIuMF0sIFtoYXNfbGlibmxfdmVyPTJdLCBbPGJyPgorIKAgoCCgIKAgoCCgIKAg
UEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTEuMF0sIFtoYXNfbGlibmxfdmVyPTFd
LCBbaGFzX2xpYm5sX3Zlcj0wXSldKV0pPGJyPgorPGJyPgo8L2Rpdj4rI0F1c3RpbiBaaGFuZyBy
ZXBvcnRlZCBmYWlsZWQgY29uZmlndXJlIG9uIFVidW50dS4gSXQgdHVybmVkIG91dCB0aGF0IHVi
dW50dSBkb2VzPGJyPgo8ZGl2IGNsYXNzPSJpbSI+KyNub3QgcHJvdmlkZSBnZW5sIHBrZy1jb25m
aWcgZmlsZXMsIHRodXMgUEtHX0NIRUNLX01PRFVMRVMgZmFpbHMgdG8gY2hlY2sgZm9yPGJyPgor
I2xpYm5sLWdlbmwuPGJyPgorI05PVEU6IEFDX1NFQVJDSF9MSUJTIGFwcGVuZCAtbG5sLWdlbmwg
dG8gTElCUywgbm90IHRvIExJQk5MX0xJQlMuPGJyPgorIzxicj4KPC9kaXY+K0FDX1NFQVJDSF9M
SUJTKFtnZW5sX2Nvbm5lY3RdLCBbbmwtZ2VubCBubF0sIFtdLCBbaGFzX2xpYm5sX3Zlcj0wXSk8
YnI+CjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPis8YnI+CqBpZiAodGVzdCAm
cXVvdDskaGFzX2xpYm5sX3ZlciZxdW90OyAtZXEgMCk7IHRoZW48YnI+Ci0goCCgIKAgQUNfTVNH
X0VSUk9SKGxpYm5sIGlzIHJlcXVpcmVkIGJ1dCBub3QgZm91bmQpPGJyPgorIKAgoCCgIEFDX01T
R19FUlJPUihsaWJubCBhbmQgbGlibmwtZ2VubCBhcmUgcmVxdWlyZWQgYnV0IHdlcmUgbm90IGZv
dW5kKTxicj4KoGZpPGJyPgqgaWYgKHRlc3QgJnF1b3Q7JGhhc19saWJubF92ZXImcXVvdDsgLWd0
IDEpOyB0aGVuPGJyPgqgIKAgoCCgIEFDX0RFRklORShbSEFWRV9MSUJOTDIwXSwgWzFdLCBbRGVm
aW5lIGlmIHlvdSBoYXZlIGxpYm5sLTIuMCBvciBoaWdoZXJdKTxicj4KPGJyPgo8L2Rpdj48L2Rp
dj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============6356176951436357091==--

