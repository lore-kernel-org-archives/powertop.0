Content-Type: multipart/mixed; boundary="===============5605101979388536535=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Tue, 13 Nov 2012 17:49:27 +0800
Message-ID: <CAGLu0vP4tgFmFySAZKs_LC370Y8B4qr3MfHGU3BwsSckQZGViw@mail.gmail.com>
In-Reply-To: CAGLu0vOK9HGvtohORcvfm1F92863GShB2L+xkKyVE5koEhtmYg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5605101979388536535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

a little correction:
-Failed with same error under both v3 and v2 cases for 12.04 (doesn't try
others).
+Failed with same error under v3 cases for 12.04 (doesn't try others).


2012/11/13 Austin Zhang <zhang.austin(a)gmail.com>

> > why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only
> 'libnl-2.0',
> Because for v2, it just have separated libnl-genl library, but there were
> no separated pkg named libnl-genl-2.0.
>
>
> >+AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
> With additional 'nl' checking, It doesn't help. Failed with same error
> under both v3 and v2 cases for 12.04 (doesn't try others).
> If fact, genl_connect is in nl-genl both for v2 and v3. Not sure if it is
> some search path issue.
>
>
> 2012/11/13 Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
>> On (11/13/12 17:06), Austin Zhang wrote:
>> >
>> >    Unfortunately, it only works in one 11.10 case, and doesn't work for
>> >    others. For libnl-3 case,
>> >    ...
>> >    checking for library containing genl_connect...no
>> >    ...
>> >
>> ok, which means that genl_connect is withing libnl.
>>
>> I really would like to keep checks consistent, otherwise it's a bit
>> unclear
>> why we check 'libnl-3.0 >=3D 3.0 libnl-genl-3.0 >=3D 3.0' and only
>> 'libnl-2.0',
>> besides, I've a feeling that will break build on some distros (in case if
>> that is only Ubuntu specific, we'll end up w/o -nl-genl).
>>
>> Add -nl to AC_SEARCH_LIBS.
>>
>> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>>
>> ---
>>
>>  configure.ac | 21 +++++++++++++--------
>>  1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index b8c183f..0958d73 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -54,15 +54,20 @@ PKG_CHECK_MODULES([PCIUTILS],
>> [libpci],[has_libpci=3D1],[
>>
>>
>>  has_libnl_ver=3D0
>> -PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
>> -       has_libnl_ver=3D3], [
>> -       AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
>> -               has_libnl_ver=3D3], [
>> -               AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
>> -                       has_libnl_ver=3D2], [
>> -                       PKG_CHECK_MODULES([LIBNL], [libnl-1],
>> [has_libnl_ver=3D1], [])])])])
>> +
>> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0 >=3D 3.0], [has_libnl_ver=3D3], [
>> +       PKG_CHECK_MODULES([LIBNL], [libnl-2.0 >=3D 2.0], [has_libnl_ver=
=3D2],
>> [
>> +               PKG_CHECK_MODULES([LIBNL], [libnl-1.0],
>> [has_libnl_ver=3D1], [has_libnl_ver=3D0])])])
>> +
>> +#Austin Zhang reported failed configure on Ubuntu. It turned out that
>> ubuntu does
>> +#not provide genl pkg-config files, thus PKG_CHECK_MODULES fails to
>> check for
>> +#libnl-genl.
>> +#NOTE: AC_SEARCH_LIBS append -lnl-genl to LIBS, not to LIBNL_LIBS.
>> +#
>> +AC_SEARCH_LIBS([genl_connect], [nl-genl nl], [], [has_libnl_ver=3D0])
>> +
>>  if (test "$has_libnl_ver" -eq 0); then
>> -       AC_MSG_ERROR(libnl is required but not found)
>> +       AC_MSG_ERROR(libnl and libnl-genl are required but were not foun=
d)
>>  fi
>>  if (test "$has_libnl_ver" -gt 1); then
>>         AC_DEFINE([HAVE_LIBNL20], [1], [Define if you have libnl-2.0 or
>> higher])
>>
>>
>

--===============5605101979388536535==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

YSBsaXR0bGUgY29ycmVjdGlvbjo8ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxz
YW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4Ij4tRmFpbGVkIHdpdGggc2FtZSBlcnJvciB1bmRlciBi
b3RoIHYzIGFuZCB2MiBjYXNlcyBmb3IgMTIuMDQgKGRvZXNuJiMzOTt0IHRyeSBvdGhlcnMpLqA8
L3NwYW4+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMt
c2VyaWY7Zm9udC1zaXplOjE0cHgiPitGYWlsZWQgd2l0aCBzYW1lIGVycm9yIHVuZGVyIHYzIGNh
c2VzIGZvciAxMi4wNCAoZG9lc24mIzM5O3QgdHJ5IG90aGVycykuoDwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRweCI+PGJyPgo8L3Nw
YW4+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48YnI+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjIwMTIvMTEvMTMgQXVzdGluIFpoYW5nIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEg
aHJlZj0ibWFpbHRvOnpoYW5nLmF1c3RpbkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj56aGFu
Zy5hdXN0aW5AZ21haWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2Nj
IHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPgo8ZGl2IGNsYXNzPSJpbSI+PHNwYW4gc3R5bGU9ImZv
bnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPiZndDsgd2h5IHdlIGNo
ZWNrICYjMzk7bGlibmwtMy4wICZndDs9IDMuMCBsaWJubC1nZW5sLTMuMCAmZ3Q7PSAzLjAmIzM5
OyBhbmQgb25seSAmIzM5O2xpYm5sLTIuMCYjMzk7LDwvc3Bhbj48YnIgc3R5bGU9ImZvbnQtZmFt
aWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPgoKPC9kaXY+PGZvbnQgZmFjZT0i
YXJpYWwsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTRweCI+QmVjYXVzZSBm
b3IgdjIsIGl0IGp1c3QgaGF2ZaBzZXBhcmF0ZWSgbGlibmwtZ2VubCBsaWJyYXJ5LCBidXQgdGhl
cmUgd2VyZSBub6BzZXBhcmF0ZWQgcGtnIG5hbWVkoGxpYm5sLWdlbmwtMi4wLjwvc3Bhbj48L2Zv
bnQ+PGRpdiBjbGFzcz0iaW0iPjxiciBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJp
Zjtmb250LXNpemU6MTRweCI+Cgo8ZGl2Pjxmb250IGZhY2U9ImFyaWFsLCBzYW5zLXNlcmlmIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0cHgiPjxicj48L3NwYW4+PC9mb250PjwvZGl2PjxkaXY+
PGZvbnQgZmFjZT0iYXJpYWwsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTRw
eCI+Jmd0Ozwvc3Bhbj48L2ZvbnQ+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMt
c2VyaWY7Zm9udC1zaXplOjE0cHgiPitBQ19TRUFSQ0hfTElCUyhbZ2VubF9jb25uZWN0XTwvc3Bh
bj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTRw
eCI+LCBbbmwtZ2VubCBubF0sIFtdLCBbaGFzX2xpYm5sX3Zlcj0wXSk8L3NwYW4+PC9kaXY+Cgo8
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZTox
NHB4Ij5XaXRoIGFkZGl0aW9uYWwgJiMzOTtubCYjMzk7IGNoZWNraW5nLCBJdCBkb2VzbiYjMzk7
dCBoZWxwLiBGYWlsZWQgd2l0aCBzYW1lIGVycm9yIHVuZGVyIGJvdGggdjMgYW5kIHYyIGNhc2Vz
IGZvciAxMi4wNCAoZG9lc24mIzM5O3QgdHJ5IG90aGVycykuoDwvZGl2PjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPgoKSWYgZmFjdCwgZ2Vu
bF9jb25uZWN0IGlzIGluIG5sLWdlbmwgYm90aCBmb3IgdjIgYW5kIHYzLiBOb3Qgc3VyZSBpZiBp
dCBpcyBzb21lIHNlYXJjaCBwYXRoIGlzc3VlLqA8L2Rpdj48ZGl2IGNsYXNzPSJIT0VuWmIiPjxk
aXYgY2xhc3M9Img1Ij48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+MjAxMi8xMS8xMyBTZXJnZXkgU2Vub3poYXRza3kgPHNwYW4gZGlyPSJs
dHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj48
YnI+Cgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2Pk9u
ICgxMS8xMy8xMiAxNzowNiksIEF1c3RpbiBaaGFuZyB3cm90ZTo8YnI+CiZndDs8YnI+CiZndDsg
oCCgVW5mb3J0dW5hdGVseSwgaXQgb25seSB3b3JrcyBpbiBvbmUgMTEuMTAgY2FzZSwgYW5kIGRv
ZXNuJiMzOTt0IHdvcmsgZm9yPGJyPgomZ3Q7IKAgoG90aGVycy4gRm9yIGxpYm5sLTMgY2FzZSw8
YnI+CiZndDsgoCCgLi4uPGJyPgomZ3Q7IKAgoGNoZWNraW5nIGZvciBsaWJyYXJ5IGNvbnRhaW5p
bmcgZ2VubF9jb25uZWN0Li4ubm88YnI+CiZndDsgoCCgLi4uPGJyPgomZ3Q7PGJyPgo8L2Rpdj5v
aywgd2hpY2ggbWVhbnMgdGhhdCBnZW5sX2Nvbm5lY3QgaXMgd2l0aGluZyBsaWJubC48YnI+Cjxi
cj4KSSByZWFsbHkgd291bGQgbGlrZSB0byBrZWVwIGNoZWNrcyBjb25zaXN0ZW50LCBvdGhlcndp
c2UgaXQmIzM5O3MgYSBiaXQgdW5jbGVhcjxicj4Kd2h5IHdlIGNoZWNrICYjMzk7bGlibmwtMy4w
ICZndDs9IDMuMCBsaWJubC1nZW5sLTMuMCAmZ3Q7PSAzLjAmIzM5OyBhbmQgb25seSAmIzM5O2xp
Ym5sLTIuMCYjMzk7LDxicj4KYmVzaWRlcywgSSYjMzk7dmUgYSBmZWVsaW5nIHRoYXQgd2lsbCBi
cmVhayBidWlsZCBvbiBzb21lIGRpc3Ryb3MgKGluIGNhc2UgaWY8YnI+CnRoYXQgaXMgb25seSBV
YnVudHUgc3BlY2lmaWMsIHdlJiMzOTtsbCBlbmQgdXAgdy9vIC1ubC1nZW5sKS48YnI+Cjxicj4K
QWRkIC1ubCB0byBBQ19TRUFSQ0hfTElCUy48YnI+CjxkaXY+PGJyPgpTaWduZWQtb2ZmLWJ5OiBT
ZXJnZXkgU2Vub3poYXRza3kgJmx0OzxhIGhyZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbTwv
YT4mZ3Q7PGJyPgo8YnI+Ci0tLTxicj4KPGJyPgqgPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5h
YyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT4gfCAyMSArKysrKysrKysrKysrLS0t
LS0tLS08YnI+CqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSk8YnI+Cjxicj4KZGlmZiAtLWdpdCBhLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRh
cmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+IGIvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3Vy
ZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT48YnI+CjwvZGl2PmluZGV4IGI4
YzE4M2YuLjA5NThkNzMgMTAwNjQ0PGJyPgo8ZGl2Pi0tLSBhLzxhIGhyZWY9Imh0dHA6Ly9jb25m
aWd1cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+PGJyPgorKysgYi88YSBo
cmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9h
Pjxicj4KQEAgLTU0LDE1ICs1NCwyMCBAQCBQS0dfQ0hFQ0tfTU9EVUxFUyhbUENJVVRJTFNdLCBb
bGlicGNpXSxbaGFzX2xpYnBjaT0xXSxbPGJyPgo8YnI+Cjxicj4KoGhhc19saWJubF92ZXI9MDxi
cj4KLVBLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0zLjAgbGlibmwtZ2VubC0zLjBd
LCBbPGJyPgotIKAgoCCgIGhhc19saWJubF92ZXI9M10sIFs8YnI+Ci0goCCgIKAgQUNfU0VBUkNI
X0xJQlMoW25sX3NvY2tldF9hbGxvY10sIFtubC0zIG5sLWdlbmwtM10sIFs8YnI+Ci0goCCgIKAg
oCCgIKAgoCBoYXNfbGlibmxfdmVyPTNdLCBbPGJyPgotIKAgoCCgIKAgoCCgIKAgQUNfU0VBUkNI
X0xJQlMoW25sX3NvY2tldF9hbGxvY10sIFtubF0sIFs8YnI+Ci0goCCgIKAgoCCgIKAgoCCgIKAg
oCCgIGhhc19saWJubF92ZXI9Ml0sIFs8YnI+Ci0goCCgIKAgoCCgIKAgoCCgIKAgoCCgIFBLR19D
SEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0xXSwgW2hhc19saWJubF92ZXI9MV0sIFtdKV0p
XSldKTxicj4KKzxicj4KK1BLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0zLjAgJmd0
Oz0gMy4wXSwgW2hhc19saWJubF92ZXI9M10sIFs8YnI+CisgoCCgIKAgUEtHX0NIRUNLX01PRFVM
RVMoW0xJQk5MXSwgW2xpYm5sLTIuMCAmZ3Q7PSAyLjBdLCBbaGFzX2xpYm5sX3Zlcj0yXSwgWzxi
cj4KKyCgIKAgoCCgIKAgoCCgIFBLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0xLjBd
LCBbaGFzX2xpYm5sX3Zlcj0xXSwgW2hhc19saWJubF92ZXI9MF0pXSldKTxicj4KKzxicj4KPC9k
aXY+KyNBdXN0aW4gWmhhbmcgcmVwb3J0ZWQgZmFpbGVkIGNvbmZpZ3VyZSBvbiBVYnVudHUuIEl0
IHR1cm5lZCBvdXQgdGhhdCB1YnVudHUgZG9lczxicj4KPGRpdj4rI25vdCBwcm92aWRlIGdlbmwg
cGtnLWNvbmZpZyBmaWxlcywgdGh1cyBQS0dfQ0hFQ0tfTU9EVUxFUyBmYWlscyB0byBjaGVjayBm
b3I8YnI+CisjbGlibmwtZ2VubC48YnI+CisjTk9URTogQUNfU0VBUkNIX0xJQlMgYXBwZW5kIC1s
bmwtZ2VubCB0byBMSUJTLCBub3QgdG8gTElCTkxfTElCUy48YnI+CisjPGJyPgo8L2Rpdj4rQUNf
U0VBUkNIX0xJQlMoW2dlbmxfY29ubmVjdF0sIFtubC1nZW5sIG5sXSwgW10sIFtoYXNfbGlibmxf
dmVyPTBdKTxicj4KPGRpdj48ZGl2Pis8YnI+CqBpZiAodGVzdCAmcXVvdDskaGFzX2xpYm5sX3Zl
ciZxdW90OyAtZXEgMCk7IHRoZW48YnI+Ci0goCCgIKAgQUNfTVNHX0VSUk9SKGxpYm5sIGlzIHJl
cXVpcmVkIGJ1dCBub3QgZm91bmQpPGJyPgorIKAgoCCgIEFDX01TR19FUlJPUihsaWJubCBhbmQg
bGlibmwtZ2VubCBhcmUgcmVxdWlyZWQgYnV0IHdlcmUgbm90IGZvdW5kKTxicj4KoGZpPGJyPgqg
aWYgKHRlc3QgJnF1b3Q7JGhhc19saWJubF92ZXImcXVvdDsgLWd0IDEpOyB0aGVuPGJyPgqgIKAg
oCCgIEFDX0RFRklORShbSEFWRV9MSUJOTDIwXSwgWzFdLCBbRGVmaW5lIGlmIHlvdSBoYXZlIGxp
Ym5sLTIuMCBvciBoaWdoZXJdKTxicj4KPGJyPgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9k
aXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============5605101979388536535==--

