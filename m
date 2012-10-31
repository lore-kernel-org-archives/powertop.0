Content-Type: multipart/mixed; boundary="===============1303148675079615467=="
MIME-Version: 1.0
From: Austin Zhang <zhang.austin at gmail.com>
Subject: [Powertop] [Powertop ]compiling issue and running issue
Date: Wed, 31 Oct 2012 22:11:13 +0800
Message-ID: <CAGLu0vNFFArQ4oLhBaApRNgN=3zrmNm9G-qWgdiEoTjw4b6o=A@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1303148675079615467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to compile powertop on my box: ubuntu 12.04, X86-64.

(1)compiling issue

Here, my system didn=E2=80=99t install libnl-1, but I installed libnl2 (und=
er
/usr/lib) and libnl-3 (under /lib).

Then when =E2=80=98./configure=E2=80=99, I got:

checking for LIBNL... no

configure: error: Package requirements (libnl-1) were not met:

 No package 'libnl-1' found

so seemed the below logic in configure.ac doesn=E2=80=99t work

=E2=80=A6=E2=80=A6

has_libnl_ver=3D0

PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [

        has_libnl_ver=3D3], [

        AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [

                has_libnl_ver=3D3], [

                AC_SEARCH_LIBS([nl_socket_alloc], [nl], [

                        has_libnl_ver=3D2], [

                        PKG_CHECK_MODULES([LIBNL], [libnl-1],
[has_libnl_ver=3D1], [])])])])

=E2=80=A6=E2=80=A6

 Then I uninstalled libnl-3, only leave libnl2 there, but no change, the
has_libnl_ver still is 1;



So I did some hacks, to set has_libnl_ver=3D2 (so got HAVE_LIBNL20 defined),
and remark above logic, then after got Makefile, I manully add -lnl and
-lnl-genl into ./src/Makefile, then I got one powertop linked against my
libnl-2.



But obviously, it is not a good idea to do as this. So is anyone
encountering similar issue there if only have libnl2 or libnl-3, the
original configure.ac in fact doesn=E2=80=99t work?



(2)running issue

With above got powertop (linked against libnl2), after launched the
powertop, I cannot switch to other menus (Idle stats/Freq stats/Device
stats/Tunable), I can only stay at =E2=80=98overview=E2=80=99 menu, directi=
on arrows only
move the screen a little left/right.



Is that one known issue?



Thanks.

--===============1303148675079615467==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgY2xhc3M9IiI+SGksoDwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj5JIGFt
IHRyeWluZyB0byBjb21waWxlIHBvd2VydG9wIG9uIG15IGJveDoKdWJ1bnR1IDEyLjA0LCBYODYt
NjQuPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj4oMSljb21waWxp
bmcgaXNzdWU8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+PHNwYW4gbGFuZz0iRU4tVVMiPkhlcmUs
IG15IHN5c3RlbSBkaWRuknQgaW5zdGFsbCBsaWJubC0xLCBidXQKSSBpbnN0YWxsZWQgbGlibmwy
ICh1bmRlciAvdXNyL2xpYikgYW5kIGxpYm5sLTMgKHVuZGVyIC9saWIpLjwvc3Bhbj48L3A+Cgo8
cCBjbGFzcz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+VGhlbiB3aGVuIJEuL2NvbmZpZ3VyZZIsIEkg
Z290OiA8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+PHNwYW4gbGFuZz0iRU4tVVMiPmNoZWNraW5n
IGZvciBMSUJOTC4uLiBubzwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iIj48c3BhbiBsYW5nPSJFTi1V
UyI+Y29uZmlndXJlOiBlcnJvcjogUGFja2FnZSByZXF1aXJlbWVudHMKKGxpYm5sLTEpIHdlcmUg
bm90IG1ldDo8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+PHNwYW4gbGFuZz0iRU4tVVMiPqA8L3Nw
YW4+Tm8gcGFja2FnZSAmIzM5O2xpYm5sLTEmIzM5OyBmb3VuZDwvcD4KCjxwIGNsYXNzPSIiPjxz
cGFuIGxhbmc9IkVOLVVTIj5zbyBzZWVtZWQgdGhlIGJlbG93IGxvZ2ljIGluIDxhIGhyZWY9Imh0
dHA6Ly9jb25maWd1cmUuYWMiPmNvbmZpZ3VyZS5hYzwvYT4gZG9lc26SdAp3b3JrPC9zcGFuPjwv
cD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj6FhTwvc3Bhbj48L3A+Cgo8cCBjbGFz
cz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+aGFzX2xpYm5sX3Zlcj0wPC9zcGFuPjwvcD4KCjxwIGNs
YXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj5QS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGli
bmwtMy4wCmxpYm5sLWdlbmwtMy4wXSwgWzwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iIj48c3BhbiBs
YW5nPSJFTi1VUyI+oKCgoKCgoApoYXNfbGlibmxfdmVyPTNdLCBbPC9zcGFuPjwvcD4KCjxwIGNs
YXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj6goKCgoKCgCkFDX1NFQVJDSF9MSUJTKFtubF9zb2Nr
ZXRfYWxsb2NdLCBbbmwtMyBubC1nZW5sLTNdLCBbPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxz
cGFuIGxhbmc9IkVOLVVTIj6goKCgoKCgoKCgoKCgoKAgaGFzX2xpYm5sX3Zlcj0zXSwgWzwvc3Bh
bj48L3A+Cgo8cCBjbGFzcz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+oKCgoKCgoKCgoKCgoKCgCkFD
X1NFQVJDSF9MSUJTKFtubF9zb2NrZXRfYWxsb2NdLCBbbmxdLCBbPC9zcGFuPjwvcD4KCjxwIGNs
YXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj6goKCgoKCgoKCgoKCgoKCgoKCgoKCgoCBoYXNfbGli
bmxfdmVyPTJdLCBbPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj6g
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoCBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLApbbGlibmwt
MV0sIFtoYXNfbGlibmxfdmVyPTFdLCBbXSldKV0pXSk8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+
PHNwYW4gbGFuZz0iRU4tVVMiPoWFPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9
IkVOLVVTIj6gVGhlbqA8L3NwYW4+SSB1bmluc3RhbGxlZCBsaWJubC0zLCBvbmx5IGxlYXZlIGxp
Ym5sMgp0aGVyZSwgYnV0IG5vIGNoYW5nZSwgdGhlIGhhc19saWJubF92ZXIgc3RpbGwgaXMgMTs8
L3A+Cgo8cCBjbGFzcz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+oDwvc3Bhbj48L3A+Cgo8cCBjbGFz
cz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+U28gSSBkaWQgc29tZSBoYWNrcywgdG8gc2V0IGhhc19s
aWJubF92ZXI9MiAoc28gZ290IEhBVkVfTElCTkwyMCBkZWZpbmVkKSwKYW5kIHJlbWFyayBhYm92
ZSBsb2dpYywgdGhlbiBhZnRlciBnb3QgTWFrZWZpbGUsIEkgbWFudWxseSBhZGQgLWxubCBhbmQg
LWxubC1nZW5sCmludG8gLi9zcmMvTWFrZWZpbGUsIHRoZW4gSSBnb3Qgb25lIHBvd2VydG9wIGxp
bmtlZCBhZ2FpbnN0IG15IGxpYm5sLTIuPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxh
bmc9IkVOLVVTIj6gPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj5C
dXQgb2J2aW91c2x5LCBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gZG8KYXMgdGhpcy4gU28gaXMg
YW55b25lIGVuY291bnRlcmluZyBzaW1pbGFyIGlzc3VlIHRoZXJlIGlmIG9ubHkgaGF2ZSBsaWJu
bDIgb3IKbGlibmwtMywgdGhlIG9yaWdpbmFsIDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMi
PmNvbmZpZ3VyZS5hYzwvYT4gaW4gZmFjdCBkb2VzbpJ0IHdvcms/PC9zcGFuPjwvcD4KCjxwIGNs
YXNzPSIiPjxzcGFuIGxhbmc9IkVOLVVTIj6gPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxzcGFu
IGxhbmc9IkVOLVVTIj4oMilydW5uaW5nIGlzc3VlPC9zcGFuPjwvcD4KCjxwIGNsYXNzPSIiPjxz
cGFuIGxhbmc9IkVOLVVTIj5XaXRoIGFib3ZlIGdvdCBwb3dlcnRvcCAobGlua2VkIGFnYWluc3QK
bGlibmwyKSwgYWZ0ZXIgbGF1bmNoZWQgdGhlIHBvd2VydG9wLCBJIGNhbm5vdCBzd2l0Y2ggdG8g
b3RoZXIgbWVudXMgKElkbGUgc3RhdHMvRnJlcQpzdGF0cy9EZXZpY2Ugc3RhdHMvVHVuYWJsZSks
IEkgY2FuIG9ubHkgc3RheSBhdCCRb3ZlcnZpZXeSIG1lbnUsIGRpcmVjdGlvbgphcnJvd3Mgb25s
eSBtb3ZlIHRoZSBzY3JlZW4gYSBsaXR0bGUgbGVmdC9yaWdodC48L3NwYW4+PC9wPgoKPHAgY2xh
c3M9IiI+PHNwYW4gbGFuZz0iRU4tVVMiPqA8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+PHNwYW4g
bGFuZz0iRU4tVVMiPklzIHRoYXQgb25lIGtub3duIGlzc3VlPzwvc3Bhbj48L3A+Cgo8cCBjbGFz
cz0iIj48c3BhbiBsYW5nPSJFTi1VUyI+oDwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iIj48c3BhbiBs
YW5nPSJFTi1VUyI+VGhhbmtzLiA8L3NwYW4+PC9wPgoKPHAgY2xhc3M9IiI+PGJyPjwvcD4K

--===============1303148675079615467==--

