Content-Type: multipart/mixed; boundary="===============1579481462455970412=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: Re: [Powertop] [Powertop ]compiling issue and running issue
Date: Thu, 01 Nov 2012 12:23:54 +0800
Message-ID: <CAGLu0vP2VV6jNbFz0OrRwZuqzU74WrVAPzJVmz7wPXVUbq9_KQ@mail.gmail.com>
In-Reply-To: 20121031210302.GA555@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1579481462455970412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Patrick, thanks for your reply.

Yes, I already installed that dev pkg.

austin(a)austin-Studio:~/powertop/powertop-tset$ dpkg -L libnl3-dev | grep
pkgconfig
/usr/lib/pkgconfig
/usr/lib/pkgconfig/libnl-3.0.pc
austin(a)austin-Studio:~/powertop/powertop-tset$ cat
/usr/lib/pkgconfig/libnl-3.0.pc
prefix=3D/usr
exec_prefix=3D${prefix}
libdir=3D${exec_prefix}/lib
includedir=3D${prefix}/include

Name: libnl
Description: Convenience library for netlink sockets
Version: 3.0
Libs: -L${libdir} -lnl -lnl-route -lnl-nf -lnl-genl -lnl-cli
Cflags: -I${includedir}
austin(a)austin-Studio:~/powertop/powertop-tset$

And I also tried to uninstall libnl3-dev, and re-install libnl2-dev, same
issue.

PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [  <=3D=3D=3D when w=
ith
libnl-3.0.pc, the logic should fall into the following has_libnl_ver=3D3, b=
ut
seemed not;
        has_libnl_ver=3D3], [
        AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [ <=3D=3D=3D I =
also
change the nl3 to nl, and remove nl-genl-3, but it cannot find
nl_socket_alloc, because this function is from bl2 and 3, so it seemed the
system doesn't try to find   this function from /usr/lib/libnl.so at all,
                has_libnl_ver=3D3], [
                AC_SEARCH_LIBS([nl_socket_alloc], [nl], [ <=3D=3D=3Dsame ca=
se
like above
                        has_libnl_ver=3D2], [
                        PKG_CHECK_MODULES([LIBNL], [libnl-1],
[has_libnl_ver=3D1], [])])])])  <=3D=3D=3D finally, fall into here, but bec=
ause I
don't have libnl v1, so fail to work.




2012/11/1 Patrick McCarty <patrick.mccarty(a)linux.intel.com>

> On Wed, Oct 31, 2012 at 10:11:13PM +0800, Austin Zhang wrote:
> > Hi,
> >
> > I am trying to compile powertop on my box: ubuntu 12.04, X86-64.
> >
> > (1)compiling issue
> >
> > Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2 =
(under
> /usr/lib)
> > and libnl-3 (under /lib).
> >
> > Then when =E2=80=98./configure=E2=80=99, I got:
> >
> > checking for LIBNL... no
> >
> > configure: error: Package requirements (libnl-1) were not met:
> >
> >  No package 'libnl-1' found
> >
> > so seemed the below logic in configure.ac doesn=E2=80=99t work
> >
> > =E2=80=A6=E2=80=A6
> >
> > has_libnl_ver=3D0
> >
> > PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> >
> >         has_libnl_ver=3D3], [
> >
> >         AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
> >
> >                 has_libnl_ver=3D3], [
> >
> >                 AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> >
> >                         has_libnl_ver=3D2], [
> >
> >                         PKG_CHECK_MODULES([LIBNL], [libnl-1],
> [has_libnl_ver=3D
> > 1], [])])])])
> >
> > =E2=80=A6=E2=80=A6
>
> Based on the file lists you sent in a followup post, it appears that
> Ubuntu uses a different naming convention for these libraries, so
> AC_SEARCH_LIBS will not find the function it needs in either libnl-3 or
> libnl-genl-3, since they don't exist.
>
> Is there a -devel package you can install that provides a pkgconfig
> file for libnl-3?
>
> -Patrick
>

--===============1579481462455970412==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

UGF0cmljaywgdGhhbmtzIGZvciB5b3VyIHJlcGx5LjxkaXY+PGJyPjwvZGl2PjxkaXY+WWVzLCBJ
IGFscmVhZHkgaW5zdGFsbGVkIHRoYXQgZGV2IHBrZy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjxkaXY+YXVzdGluQGF1c3Rpbi1TdHVkaW86fi9wb3dlcnRvcC9wb3dlcnRvcC10c2V0JCBkcGtn
IC1MIGxpYm5sMy1kZXYgfCBncmVwIHBrZ2NvbmZpZyCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoDwvZGl2Pgo8ZGl2Pi91c3IvbGliL3Br
Z2NvbmZpZ6A8L2Rpdj48ZGl2Pi91c3IvbGliL3BrZ2NvbmZpZy9saWJubC0zLjAucGM8L2Rpdj48
ZGl2PmF1c3RpbkBhdXN0aW4tU3R1ZGlvOn4vcG93ZXJ0b3AvcG93ZXJ0b3AtdHNldCQgY2F0IC91
c3IvbGliL3BrZ2NvbmZpZy9saWJubC0zLjAucGOgPC9kaXY+PGRpdj5wcmVmaXg9L3VzcjwvZGl2
PjxkaXY+ZXhlY19wcmVmaXg9JHtwcmVmaXh9PC9kaXY+PGRpdj4KbGliZGlyPSR7ZXhlY19wcmVm
aXh9L2xpYjwvZGl2PjxkaXY+aW5jbHVkZWRpcj0ke3ByZWZpeH0vaW5jbHVkZTwvZGl2PjxkaXY+
oDwvZGl2PjxkaXY+TmFtZTogbGlibmw8L2Rpdj48ZGl2PkRlc2NyaXB0aW9uOiBDb252ZW5pZW5j
ZSBsaWJyYXJ5IGZvciBuZXRsaW5rIHNvY2tldHM8L2Rpdj48ZGl2PlZlcnNpb246IDMuMDwvZGl2
PjxkaXY+TGliczogLUwke2xpYmRpcn0gLWxubCAtbG5sLXJvdXRlIC1sbmwtbmYgLWxubC1nZW5s
IC1sbmwtY2xpPC9kaXY+CjxkaXY+Q2ZsYWdzOiAtSSR7aW5jbHVkZWRpcn08L2Rpdj48ZGl2PmF1
c3RpbkBhdXN0aW4tU3R1ZGlvOn4vcG93ZXJ0b3AvcG93ZXJ0b3AtdHNldCSgPC9kaXY+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5BbmQgSSBhbHNvIHRyaWVkIHRvIHVuaW5zdGFsbCBsaWJubDMt
ZGV2LCBhbmQgcmUtaW5zdGFsbCBsaWJubDItZGV2LCBzYW1lIGlzc3VlLqA8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pgo8ZGl2PlBLR19DSEVDS19NT0RVTEVTKFtMSUJOTF0sIFtsaWJubC0zLjAg
bGlibmwtZ2VubC0zLjBdLCBbIKAmbHQ7PT09IHdoZW4gd2l0aCBsaWJubC0zLjAucGMsIHRoZSBs
b2dpYyBzaG91bGQgZmFsbCBpbnRvIHRoZSBmb2xsb3dpbmcgaGFzX2xpYm5sX3Zlcj0zLCBidXQg
c2VlbWVkIG5vdDs8L2Rpdj48ZGl2PqAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0zXSwgWzwvZGl2Pjxk
aXY+oCCgIKAgoCBBQ19TRUFSQ0hfTElCUyhbbmxfc29ja2V0X2FsbG9jXSwgW25sLTMgbmwtZ2Vu
bC0zXSwgWyAmbHQ7PT09IEkgYWxzbyBjaGFuZ2UgdGhlIG5sMyB0byBubCwgYW5kIHJlbW92ZSBu
bC1nZW5sLTMsIGJ1dCBpdCBjYW5ub3QgZmluZCBubF9zb2NrZXRfYWxsb2MsIGJlY2F1c2UgdGhp
cyBmdW5jdGlvbiBpcyBmcm9tIGJsMiBhbmQgMywgc28gaXQgc2VlbWVkIHRoZSBzeXN0ZW0gZG9l
c24mIzM5O3QgdHJ5IHRvIGZpbmQgoCB0aGlzIGZ1bmN0aW9uIGZyb20gL3Vzci9saWIvbGlibmwu
c28gYXQgYWxsLKA8L2Rpdj4KPGRpdj6gIKAgoCCgIKAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0zXSwg
WzwvZGl2PjxkaXY+oCCgIKAgoCCgIKAgoCCgIEFDX1NFQVJDSF9MSUJTKFtubF9zb2NrZXRfYWxs
b2NdLCBbbmxdLCBbICZsdDs9PT1zYW1lIGNhc2UgbGlrZSBhYm92ZTwvZGl2PjxkaXY+oCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgaGFzX2xpYm5sX3Zlcj0yXSwgWzwvZGl2PjxkaXY+oCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTFdLCBbaGFz
X2xpYm5sX3Zlcj0xXSwgW10pXSldKV0pIKAmbHQ7PT09IGZpbmFsbHksIGZhbGwgaW50byBoZXJl
LCBidXQgYmVjYXVzZSBJIGRvbiYjMzk7dCBoYXZlIGxpYm5sIHYxLCBzbyBmYWlsIHRvIHdvcmsu
PC9kaXY+CjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX2V4dHJhIj48YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4yMDEyLzExLzEgUGF0
cmljayBNY0NhcnR5IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnBhdHJpY2su
bWNjYXJ0eUBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5wYXRyaWNrLm1jY2FydHlA
bGludXguaW50ZWwuY29tPC9hPiZndDs8L3NwYW4+PGJyPgo8YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBz
b2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJpbSI+T24gV2VkLCBPY3QgMzEsIDIw
MTIgYXQgMTA6MTE6MTNQTSArMDgwMCwgQXVzdGluIFpoYW5nIHdyb3RlOjxicj4KJmd0OyBIaSyg
PGJyPgomZ3Q7PGJyPgomZ3Q7IEkgYW0gdHJ5aW5nIHRvIGNvbXBpbGUgcG93ZXJ0b3Agb24gbXkg
Ym94OiB1YnVudHUgMTIuMDQsIFg4Ni02NC48YnI+CiZndDs8YnI+CiZndDsgKDEpY29tcGlsaW5n
IGlzc3VlPGJyPgomZ3Q7PGJyPgomZ3Q7IEhlcmUsIG15IHN5c3RlbSBkaWRuknQgaW5zdGFsbCBs
aWJubC0xLCBidXQgSSBpbnN0YWxsZWQgbGlibmwyICh1bmRlciAvdXNyL2xpYik8YnI+CiZndDsg
YW5kIGxpYm5sLTMgKHVuZGVyIC9saWIpLjxicj4KJmd0Ozxicj4KJmd0OyBUaGVuIHdoZW4gkS4v
Y29uZmlndXJlkiwgSSBnb3Q6PGJyPgomZ3Q7PGJyPgomZ3Q7IGNoZWNraW5nIGZvciBMSUJOTC4u
LiBubzxicj4KJmd0Ozxicj4KJmd0OyBjb25maWd1cmU6IGVycm9yOiBQYWNrYWdlIHJlcXVpcmVt
ZW50cyAobGlibmwtMSkgd2VyZSBub3QgbWV0Ojxicj4KJmd0Ozxicj4KJmd0OyCgTm8gcGFja2Fn
ZSAmIzM5O2xpYm5sLTEmIzM5OyBmb3VuZDxicj4KJmd0Ozxicj4KJmd0OyBzbyBzZWVtZWQgdGhl
IGJlbG93IGxvZ2ljIGluIDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2Js
YW5rIj5jb25maWd1cmUuYWM8L2E+IGRvZXNuknQgd29yazxicj4KJmd0Ozxicj4KJmd0OyCFhTxi
cj4KJmd0Ozxicj4KJmd0OyBoYXNfbGlibmxfdmVyPTA8YnI+CiZndDs8YnI+CiZndDsgUEtHX0NI
RUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTMuMCBsaWJubC1nZW5sLTMuMF0sIFs8YnI+CiZn
dDs8YnI+CiZndDsgoKCgoKCgoCBoYXNfbGlibmxfdmVyPTNdLCBbPGJyPgomZ3Q7PGJyPgomZ3Q7
IKCgoKCgoKAgQUNfU0VBUkNIX0xJQlMoW25sX3NvY2tldF9hbGxvY10sIFtubC0zIG5sLWdlbmwt
M10sIFs8YnI+CiZndDs8YnI+CiZndDsgoKCgoKCgoKCgoKCgoKCgIGhhc19saWJubF92ZXI9M10s
IFs8YnI+CiZndDs8YnI+CiZndDsgoKCgoKCgoKCgoKCgoKCgIEFDX1NFQVJDSF9MSUJTKFtubF9z
b2NrZXRfYWxsb2NdLCBbbmxdLCBbPGJyPgomZ3Q7PGJyPgomZ3Q7IKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgIGhhc19saWJubF92ZXI9Ml0sIFs8YnI+CiZndDs8YnI+CiZndDsgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKAgUEtHX0NIRUNLX01PRFVMRVMoW0xJQk5MXSwgW2xpYm5sLTFdLCBbaGFzX2xp
Ym5sX3Zlcj08YnI+CiZndDsgMV0sIFtdKV0pXSldKTxicj4KJmd0Ozxicj4KJmd0OyCFhTxicj4K
PGJyPgo8L2Rpdj5CYXNlZCBvbiB0aGUgZmlsZSBsaXN0cyB5b3Ugc2VudCBpbiBhIGZvbGxvd3Vw
IHBvc3QsIGl0IGFwcGVhcnMgdGhhdDxicj4KVWJ1bnR1IHVzZXMgYSBkaWZmZXJlbnQgbmFtaW5n
IGNvbnZlbnRpb24gZm9yIHRoZXNlIGxpYnJhcmllcywgc288YnI+CkFDX1NFQVJDSF9MSUJTIHdp
bGwgbm90IGZpbmQgdGhlIGZ1bmN0aW9uIGl0IG5lZWRzIGluIGVpdGhlciBsaWJubC0zIG9yPGJy
PgpsaWJubC1nZW5sLTMsIHNpbmNlIHRoZXkgZG9uJiMzOTt0IGV4aXN0Ljxicj4KPGJyPgpJcyB0
aGVyZSBhIC1kZXZlbCBwYWNrYWdlIHlvdSBjYW4gaW5zdGFsbCB0aGF0IHByb3ZpZGVzIGEgcGtn
Y29uZmlnPGJyPgpmaWxlIGZvciBsaWJubC0zPzxicj4KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZv
bnQgY29sb3I9IiM4ODg4ODgiPjxicj4KLVBhdHJpY2s8YnI+CjwvZm9udD48L3NwYW4+PC9ibG9j
a3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============1579481462455970412==--

