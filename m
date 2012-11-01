Content-Type: multipart/mixed; boundary="===============4547664407923995440=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Fri, 02 Nov 2012 01:14:48 +0800
Message-ID: <CAGLu0vOPsEKJEmOpr54H2PAgKBRZ27YHdsKA=1XCJjosye_=yg@mail.gmail.com>
In-Reply-To: CAGLu0vP2VV6jNbFz0OrRwZuqzU74WrVAPzJVmz7wPXVUbq9_KQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4547664407923995440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

simple patch to fix this issue (also as attachment):

commit 2150b9b784489f7a5b0b8d51a1de675504e6e1bd
Author: Austin Zhang <zhang.austin(a)gmail.com>
Date:   Fri Nov 2 01:04:49 2012 +0800

    Change library search condition for libnl2/3

    So that we can compile in system with libnl2 or/and libnl3.

    Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>

diff --git a/configure.ac b/configure.ac
index b8c183f..ccc0ec5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,11 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D1]=
,[


 has_libnl_ver=3D0
-PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
+PKG_CHECK_MODULES([LIBNL], [libnl-3.0], [
        has_libnl_ver=3D3], [
        AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
                has_libnl_ver=3D3], [
-               AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
+               PKG_CHECK_MODULES([LIBNL], [libnl-2.0], [
                        has_libnl_ver=3D2], [
                        PKG_CHECK_MODULES([LIBNL], [libnl-1],
[has_libnl_ver=3D1], [])])])])
 if (test "$has_libnl_ver" -eq 0); then



2012/11/1 Austin Zhang <zhang.austin(a)gmail.com>

> Patrick, thanks for your reply.
>
> Yes, I already installed that dev pkg.
>
> austin(a)austin-Studio:~/powertop/powertop-tset$ dpkg -L libnl3-dev | grep
> pkgconfig
> /usr/lib/pkgconfig
> /usr/lib/pkgconfig/libnl-3.0.pc
> austin(a)austin-Studio:~/powertop/powertop-tset$ cat
> /usr/lib/pkgconfig/libnl-3.0.pc
> prefix=3D/usr
> exec_prefix=3D${prefix}
> libdir=3D${exec_prefix}/lib
> includedir=3D${prefix}/include
>
> Name: libnl
> Description: Convenience library for netlink sockets
> Version: 3.0
> Libs: -L${libdir} -lnl -lnl-route -lnl-nf -lnl-genl -lnl-cli
> Cflags: -I${includedir}
> austin(a)austin-Studio:~/powertop/powertop-tset$
>
> And I also tried to uninstall libnl3-dev, and re-install libnl2-dev, same
> issue.
>
> PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [  <=3D=3D=3D when=
 with
> libnl-3.0.pc, the logic should fall into the following has_libnl_ver=3D3,=
 but
> seemed not;
>         has_libnl_ver=3D3], [
>         AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [ <=3D=3D=3D =
I also
> change the nl3 to nl, and remove nl-genl-3, but it cannot find
> nl_socket_alloc, because this function is from bl2 and 3, so it seemed the
> system doesn't try to find   this function from /usr/lib/libnl.so at all,
>                 has_libnl_ver=3D3], [
>                 AC_SEARCH_LIBS([nl_socket_alloc], [nl], [ <=3D=3D=3Dsame =
case
> like above
>                         has_libnl_ver=3D2], [
>                         PKG_CHECK_MODULES([LIBNL], [libnl-1],
> [has_libnl_ver=3D1], [])])])])  <=3D=3D=3D finally, fall into here, but b=
ecause I
> don't have libnl v1, so fail to work.
>
>
>
>
> 2012/11/1 Patrick McCarty <patrick.mccarty(a)linux.intel.com>
>
>> On Wed, Oct 31, 2012 at 10:11:13PM +0800, Austin Zhang wrote:
>> > Hi,
>> >
>> > I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
>> >
>> > (1)compiling issue
>> >
>> > Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2=
 (under
>> /usr/lib)
>> > and libnl-3 (under /lib).
>> >
>> > Then when =E2=80=98./configure=E2=80=99, I got:
>> >
>> > checking for LIBNL... no
>> >
>> > configure: error: Package requirements (libnl-1) were not met:
>> >
>> >  No package 'libnl-1' found
>> >
>> > so seemed the below logic in configure.ac doesn=E2=80=99t work
>> >
>> > =E2=80=A6=E2=80=A6
>> >
>> > has_libnl_ver=3D0
>> >
>> > PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
>> >
>> >         has_libnl_ver=3D3], [
>> >
>> >         AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
>> >
>> >                 has_libnl_ver=3D3], [
>> >
>> >                 AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
>> >
>> >                         has_libnl_ver=3D2], [
>> >
>> >                         PKG_CHECK_MODULES([LIBNL], [libnl-1],
>> [has_libnl_ver=3D
>> > 1], [])])])])
>> >
>> > =E2=80=A6=E2=80=A6
>>
>> Based on the file lists you sent in a followup post, it appears that
>> Ubuntu uses a different naming convention for these libraries, so
>> AC_SEARCH_LIBS will not find the function it needs in either libnl-3 or
>> libnl-genl-3, since they don't exist.
>>
>> Is there a -devel package you can install that provides a pkgconfig
>> file for libnl-3?
>>
>> -Patrick
>>
>
>

--===============4547664407923995440==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

c2ltcGxlIHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlIChhbHNvIGFzIGF0dGFjaG1lbnQpOjxkaXY+
PGJyPjxkaXY+PGRpdj5jb21taXQgMjE1MGI5Yjc4NDQ4OWY3YTViMGI4ZDUxYTFkZTY3NTUwNGU2
ZTFiZDwvZGl2PjxkaXY+QXV0aG9yOiBBdXN0aW4gWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzp6
aGFuZy5hdXN0aW5AZ21haWwuY29tIj56aGFuZy5hdXN0aW5AZ21haWwuY29tPC9hPiZndDs8L2Rp
dj4KPGRpdj5EYXRlOiCgIEZyaSBOb3YgMiAwMTowNDo0OSAyMDEyICswODAwPC9kaXY+PGRpdj6g
PC9kaXY+PGRpdj6gIKAgQ2hhbmdlIGxpYnJhcnkgc2VhcmNoIGNvbmRpdGlvbiBmb3IgbGlibmwy
LzM8L2Rpdj48ZGl2PqAgoKA8L2Rpdj48ZGl2PqAgoCBTbyB0aGF0IHdlIGNhbiBjb21waWxlIGlu
IHN5c3RlbSB3aXRoIGxpYm5sMiBvci9hbmQgbGlibmwzLjwvZGl2PjxkaXY+oCCgoDwvZGl2Pgo8
ZGl2PqAgoCBTaWduZWQtb2ZmLWJ5OiBBdXN0aW4gWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzp6
aGFuZy5hdXN0aW5AZ21haWwuY29tIj56aGFuZy5hdXN0aW5AZ21haWwuY29tPC9hPiZndDs8L2Rp
dj48ZGl2PqA8L2Rpdj48ZGl2PmRpZmYgLS1naXQgYS88YSBocmVmPSJodHRwOi8vY29uZmlndXJl
LmFjIj5jb25maWd1cmUuYWM8L2E+IGIvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyI+Y29u
ZmlndXJlLmFjPC9hPjwvZGl2Pgo8ZGl2PmluZGV4IGI4YzE4M2YuLmNjYzBlYzUgMTAwNjQ0PC9k
aXY+PGRpdj4tLS0gYS88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIj5jb25maWd1cmUuYWM8
L2E+PC9kaXY+PGRpdj4rKysgYi88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIj5jb25maWd1
cmUuYWM8L2E+PC9kaXY+PGRpdj5AQCAtNTQsMTEgKzU0LDExIEBAIFBLR19DSEVDS19NT0RVTEVT
KFtQQ0lVVElMU10sIFtsaWJwY2ldLFtoYXNfbGlicGNpPTFdLFs8L2Rpdj4KPGRpdj6goDwvZGl2
PjxkaXY+oDwvZGl2PjxkaXY+oGhhc19saWJubF92ZXI9MDwvZGl2PjxkaXY+LVBLR19DSEVDS19N
T0RVTEVTKFtMSUJOTF0sIFtsaWJubC0zLjAgbGlibmwtZ2VubC0zLjBdLCBbPC9kaXY+PGRpdj4r
UEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMF0sIFs8L2Rpdj48ZGl2PqAgoCCg
IKAgaGFzX2xpYm5sX3Zlcj0zXSwgWzwvZGl2PjxkaXY+oCCgIKAgoCBBQ19TRUFSQ0hfTElCUyhb
bmxfc29ja2V0X2FsbG9jXSwgW25sLTMgbmwtZ2VubC0zXSwgWzwvZGl2Pgo8ZGl2PqAgoCCgIKAg
oCCgIKAgoCBoYXNfbGlibmxfdmVyPTNdLCBbPC9kaXY+PGRpdj4tIKAgoCCgIKAgoCCgIKAgQUNf
U0VBUkNIX0xJQlMoW25sX3NvY2tldF9hbGxvY10sIFtubF0sIFs8L2Rpdj48ZGl2PisgoCCgIKAg
oCCgIKAgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMi4wXSwgWzwvZGl2Pjxk
aXY+oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0yXSwgWzwvZGl2Pgo8ZGl2
PqAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIFBLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJu
bC0xXSwgW2hhc19saWJubF92ZXI9MV0sIFtdKV0pXSldKTwvZGl2PjxkaXY+oGlmICh0ZXN0ICZx
dW90OyRoYXNfbGlibmxfdmVyJnF1b3Q7IC1lcSAwKTsgdGhlbjwvZGl2PjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPgo8ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+MjAxMi8xMS8xIEF1c3RpbiBaaGFuZyA8c3BhbiBkaXI9Imx0ciI+Jmx0
OzxhIGhyZWY9Im1haWx0bzp6aGFuZy5hdXN0aW5AZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
emhhbmcuYXVzdGluQGdtYWlsLmNvbTwvYT4mZ3Q7PC9zcGFuPjxicj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHgg
I2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4KUGF0cmljaywgdGhhbmtzIGZvciB5b3VyIHJl
cGx5LjxkaXY+PGJyPjwvZGl2PjxkaXY+WWVzLCBJIGFscmVhZHkgaW5zdGFsbGVkIHRoYXQgZGV2
IHBrZy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+YXVzdGluQGF1c3Rpbi1TdHVkaW86
fi9wb3dlcnRvcC9wb3dlcnRvcC10c2V0JCBkcGtnIC1MIGxpYm5sMy1kZXYgfCBncmVwIHBrZ2Nv
bmZpZyCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoDwvZGl2PgoKPGRpdj4vdXNyL2xpYi9wa2djb25maWegPC9kaXY+PGRpdj4vdXNyL2xp
Yi9wa2djb25maWcvbGlibmwtMy4wLnBjPC9kaXY+PGRpdj5hdXN0aW5AYXVzdGluLVN0dWRpbzp+
L3Bvd2VydG9wL3Bvd2VydG9wLXRzZXQkIGNhdCAvdXNyL2xpYi9wa2djb25maWcvbGlibmwtMy4w
LnBjoDwvZGl2PjxkaXY+cHJlZml4PS91c3I8L2Rpdj48ZGl2PmV4ZWNfcHJlZml4PSR7cHJlZml4
fTwvZGl2Pgo8ZGl2PgpsaWJkaXI9JHtleGVjX3ByZWZpeH0vbGliPC9kaXY+PGRpdj5pbmNsdWRl
ZGlyPSR7cHJlZml4fS9pbmNsdWRlPC9kaXY+PGRpdj6gPC9kaXY+PGRpdj5OYW1lOiBsaWJubDwv
ZGl2PjxkaXY+RGVzY3JpcHRpb246IENvbnZlbmllbmNlIGxpYnJhcnkgZm9yIG5ldGxpbmsgc29j
a2V0czwvZGl2PjxkaXY+VmVyc2lvbjogMy4wPC9kaXY+PGRpdj5MaWJzOiAtTCR7bGliZGlyfSAt
bG5sIC1sbmwtcm91dGUgLWxubC1uZiAtbG5sLWdlbmwgLWxubC1jbGk8L2Rpdj4KCjxkaXY+Q2Zs
YWdzOiAtSSR7aW5jbHVkZWRpcn08L2Rpdj48ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4vcG93
ZXJ0b3AvcG93ZXJ0b3AtdHNldCSgPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbmQg
SSBhbHNvIHRyaWVkIHRvIHVuaW5zdGFsbCBsaWJubDMtZGV2LCBhbmQgcmUtaW5zdGFsbCBsaWJu
bDItZGV2LCBzYW1lIGlzc3VlLqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj4KPGRpdj4KPGRpdj5QS0df
Q0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMy4wIGxpYm5sLWdlbmwtMy4wXSwgWyCgJmx0
Oz09PSB3aGVuIHdpdGggbGlibmwtMy4wLnBjLCB0aGUgbG9naWMgc2hvdWxkIGZhbGwgaW50byB0
aGUgZm9sbG93aW5nIGhhc19saWJubF92ZXI9MywgYnV0IHNlZW1lZCBub3Q7PC9kaXY+PGRpdj6g
IKAgoCCgIGhhc19saWJubF92ZXI9M10sIFs8L2Rpdj48ZGl2PqAgoCCgIKAgQUNfU0VBUkNIX0xJ
QlMoW25sX3NvY2tldF9hbGxvY10sIFtubC0zIG5sLWdlbmwtM10sIFsgJmx0Oz09PSBJIGFsc28g
Y2hhbmdlIHRoZSBubDMgdG8gbmwsIGFuZCByZW1vdmUgbmwtZ2VubC0zLCBidXQgaXQgY2Fubm90
IGZpbmQgbmxfc29ja2V0X2FsbG9jLCBiZWNhdXNlIHRoaXMgZnVuY3Rpb24gaXMgZnJvbSBibDIg
YW5kIDMsIHNvIGl0IHNlZW1lZCB0aGUgc3lzdGVtIGRvZXNuJiMzOTt0IHRyeSB0byBmaW5kIKAg
dGhpcyBmdW5jdGlvbiBmcm9tIC91c3IvbGliL2xpYm5sLnNvIGF0IGFsbCygPC9kaXY+Cgo8ZGl2
PqAgoCCgIKAgoCCgIKAgoCBoYXNfbGlibmxfdmVyPTNdLCBbPC9kaXY+PGRpdj6gIKAgoCCgIKAg
oCCgIKAgQUNfU0VBUkNIX0xJQlMoW25sX3NvY2tldF9hbGxvY10sIFtubF0sIFsgJmx0Oz09PXNh
bWUgY2FzZSBsaWtlIGFib3ZlPC9kaXY+PGRpdj6gIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCBoYXNf
bGlibmxfdmVyPTJdLCBbPC9kaXY+PGRpdj6gIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCBQS0dfQ0hF
Q0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMV0sIFtoYXNfbGlibmxfdmVyPTFdLCBbXSldKV0p
XSkgoCZsdDs9PT0gZmluYWxseSwgZmFsbCBpbnRvIGhlcmUsIGJ1dCBiZWNhdXNlIEkgZG9uJiMz
OTt0IGhhdmUgbGlibmwgdjEsIHNvIGZhaWwgdG8gd29yay48L2Rpdj4KCjwvZGl2PjxkaXYgY2xh
c3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3Rl
Ij4yMDEyLzExLzEgUGF0cmljayBNY0NhcnR5IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0i
bWFpbHRvOnBhdHJpY2subWNjYXJ0eUBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5w
YXRyaWNrLm1jY2FydHlAbGludXguaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPgoKPGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj5PbiBXZWQsIE9jdCAz
MSwgMjAxMiBhdCAxMDoxMToxM1BNICswODAwLCBBdXN0aW4gWmhhbmcgd3JvdGU6PGJyPgomZ3Q7
IEhpLKA8YnI+CiZndDs8YnI+CiZndDsgSSBhbSB0cnlpbmcgdG8gY29tcGlsZSBwb3dlcnRvcCBv
biBteSBib3g6IHVidW50dSAxMi4wNCwgWDg2LTY0Ljxicj4KJmd0Ozxicj4KJmd0OyAoMSljb21w
aWxpbmcgaXNzdWU8YnI+CiZndDs8YnI+CiZndDsgSGVyZSwgbXkgc3lzdGVtIGRpZG6SdCBpbnN0
YWxsIGxpYm5sLTEsIGJ1dCBJIGluc3RhbGxlZCBsaWJubDIgKHVuZGVyIC91c3IvbGliKTxicj4K
Jmd0OyBhbmQgbGlibmwtMyAodW5kZXIgL2xpYikuPGJyPgomZ3Q7PGJyPgomZ3Q7IFRoZW4gd2hl
biCRLi9jb25maWd1cmWSLCBJIGdvdDo8YnI+CiZndDs8YnI+CiZndDsgY2hlY2tpbmcgZm9yIExJ
Qk5MLi4uIG5vPGJyPgomZ3Q7PGJyPgomZ3Q7IGNvbmZpZ3VyZTogZXJyb3I6IFBhY2thZ2UgcmVx
dWlyZW1lbnRzIChsaWJubC0xKSB3ZXJlIG5vdCBtZXQ6PGJyPgomZ3Q7PGJyPgomZ3Q7IKBObyBw
YWNrYWdlICYjMzk7bGlibmwtMSYjMzk7IGZvdW5kPGJyPgomZ3Q7PGJyPgomZ3Q7IHNvIHNlZW1l
ZCB0aGUgYmVsb3cgbG9naWMgaW4gPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0
PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT4gZG9lc26SdCB3b3JrPGJyPgomZ3Q7PGJyPgomZ3Q7
IIWFPGJyPgomZ3Q7PGJyPgomZ3Q7IGhhc19saWJubF92ZXI9MDxicj4KJmd0Ozxicj4KJmd0OyBQ
S0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMy4wIGxpYm5sLWdlbmwtMy4wXSwgWzxi
cj4KJmd0Ozxicj4KJmd0OyCgoKCgoKCgIGhhc19saWJubF92ZXI9M10sIFs8YnI+CiZndDs8YnI+
CiZndDsgoKCgoKCgoCBBQ19TRUFSQ0hfTElCUyhbbmxfc29ja2V0X2FsbG9jXSwgW25sLTMgbmwt
Z2VubC0zXSwgWzxicj4KJmd0Ozxicj4KJmd0OyCgoKCgoKCgoKCgoKCgoKAgaGFzX2xpYm5sX3Zl
cj0zXSwgWzxicj4KJmd0Ozxicj4KJmd0OyCgoKCgoKCgoKCgoKCgoKAgQUNfU0VBUkNIX0xJQlMo
W25sX3NvY2tldF9hbGxvY10sIFtubF0sIFs8YnI+CiZndDs8YnI+CiZndDsgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKAgaGFzX2xpYm5sX3Zlcj0yXSwgWzxicj4KJmd0Ozxicj4KJmd0OyCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMV0sIFto
YXNfbGlibmxfdmVyPTxicj4KJmd0OyAxXSwgW10pXSldKV0pPGJyPgomZ3Q7PGJyPgomZ3Q7IIWF
PGJyPgo8YnI+CjwvZGl2PkJhc2VkIG9uIHRoZSBmaWxlIGxpc3RzIHlvdSBzZW50IGluIGEgZm9s
bG93dXAgcG9zdCwgaXQgYXBwZWFycyB0aGF0PGJyPgpVYnVudHUgdXNlcyBhIGRpZmZlcmVudCBu
YW1pbmcgY29udmVudGlvbiBmb3IgdGhlc2UgbGlicmFyaWVzLCBzbzxicj4KQUNfU0VBUkNIX0xJ
QlMgd2lsbCBub3QgZmluZCB0aGUgZnVuY3Rpb24gaXQgbmVlZHMgaW4gZWl0aGVyIGxpYm5sLTMg
b3I8YnI+CmxpYm5sLWdlbmwtMywgc2luY2UgdGhleSBkb24mIzM5O3QgZXhpc3QuPGJyPgo8YnI+
CklzIHRoZXJlIGEgLWRldmVsIHBhY2thZ2UgeW91IGNhbiBpbnN0YWxsIHRoYXQgcHJvdmlkZXMg
YSBwa2djb25maWc8YnI+CmZpbGUgZm9yIGxpYm5sLTM/PGJyPgo8c3Bhbj48Zm9udCBjb2xvcj0i
Izg4ODg4OCI+PGJyPgotUGF0cmljazxicj4KPC9mb250Pjwvc3Bhbj48L2Jsb2NrcXVvdGU+PC9k
aXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pgo=

--===============4547664407923995440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-Change-library-search-condition-for-libnl2-3.patch"

RnJvbSBkZjdjMzI5ZjFhOTQ2N2FkOThhYTlhZDdkMWE0NTA4NWViZmUxYWU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBdXN0aW4gWmhhbmcgPHpoYW5nLmF1c3RpbkBnbWFpbC5jb20+
CkRhdGU6IEZyaSwgMiBOb3YgMjAxMiAwMTowNDo0OSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIENo
YW5nZSBsaWJyYXJ5IHNlYXJjaCBjb25kaXRpb24gZm9yIGxpYm5sMi8zCgpTbyB0aGF0IHdlIGNh
biBjb21waWxlIGluIHN5c3RlbSB3aXRoIGxpYm5sMiBvci9hbmQgbGlibmwzLgoKU2lnbmVkLW9m
Zi1ieTogQXVzdGluIFpoYW5nIDx6aGFuZy5hdXN0aW5AZ21haWwuY29tPgotLS0KIGNvbmZpZ3Vy
ZS5hYyB8ICAgIDQgKystLQogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCmluZGV4
IGI4YzE4M2YuLmNjYzBlYzUgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3VyZS5hYworKysgYi9jb25maWd1
cmUuYWMKQEAgLTU0LDExICs1NCwxMSBAQCBQS0dfQ0hFQ0tfTU9EVUxFUyhbUENJVVRJTFNdLCBb
bGlicGNpXSxbaGFzX2xpYnBjaT0xXSxbCiAgCiAKIGhhc19saWJubF92ZXI9MAotUEtHX0NIRUNL
X01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMCBsaWJubC1nZW5sLTMuMF0sIFsKK1BLR19DSEVD
S19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0zLjBdLCBbCiAJaGFzX2xpYm5sX3Zlcj0zXSwgWwog
CUFDX1NFQVJDSF9MSUJTKFtubF9zb2NrZXRfYWxsb2NdLCBbbmwtMyBubC1nZW5sLTNdLCBbCiAJ
CWhhc19saWJubF92ZXI9M10sIFsKLQkJQUNfU0VBUkNIX0xJQlMoW25sX3NvY2tldF9hbGxvY10s
IFtubF0sIFsKKwkJUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTIuMF0sIFsKIAkJ
CWhhc19saWJubF92ZXI9Ml0sIFsKIAkJCVBLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJu
bC0xXSwgW2hhc19saWJubF92ZXI9MV0sIFtdKV0pXSldKQogaWYgKHRlc3QgIiRoYXNfbGlibmxf
dmVyIiAtZXEgMCk7IHRoZW4KLS0gCjEuNy41LjQKCg==

--===============4547664407923995440==--

