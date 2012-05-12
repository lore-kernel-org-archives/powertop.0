Content-Type: multipart/mixed; boundary="===============4910651418501110837=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] Fix trying to use libnl-2.0 when only
 libnl-3.0 is installed
Date: Sat, 12 May 2012 13:46:14 -0700
Message-ID: <CABsxX9KTNi9sXTtBGgMo5=HYwwtcEqM=Gc1sFTRwzEMWuNwQvA@mail.gmail.com>
In-Reply-To: 1336837816-9884-1-git-send-email-vcgomes@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4910651418501110837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 12, 2012 at 8:50 AM, Vinicius Costa Gomes <vcgomes(a)gmail.com>=
wrote:

> From: Vinicius Costa Gomes <vinicius.gomes(a)openbossa.org>
>
> When using libnl-3.0 we need to link with libnl-genl also, if not, we
> get a lot of undefined symbols.
> ---
>  configure.ac |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure.ac b/configure.ac
> index 2d56684..3579b6e 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -56,7 +56,7 @@ PKG_CHECK_MODULES([LIBZ], [zlib],[],[
>
>  has_libnl_ver=3D0
>  PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
> -       AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
> +       AC_SEARCH_LIBS([nl_socket_alloc], [libnl-2.0], [has_libnl_ver=3D2=
], [


are you sure you want the linker to check for -llibnl-2.0? that means it's
going to try to find a "liblibnl-2.0.so" (note the double "lib" here).

Auke

--===============4910651418501110837==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gU2F0LCBNYXkgMTIsIDIwMTIgYXQg
ODo1MCBBTSwgVmluaWNpdXMgQ29zdGEgR29tZXMgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVm
PSJtYWlsdG86dmNnb21lc0BnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj52Y2dvbWVzQGdtYWls
LmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+CkZyb206IFZpbmljaXVzIENvc3RhIEdvbWVzICZsdDs8YSBocmVm
PSJtYWlsdG86dmluaWNpdXMuZ29tZXNAb3BlbmJvc3NhLm9yZyI+dmluaWNpdXMuZ29tZXNAb3Bl
bmJvc3NhLm9yZzwvYT4mZ3Q7PGJyPgo8YnI+CldoZW4gdXNpbmcgbGlibmwtMy4wIHdlIG5lZWQg
dG8gbGluayB3aXRoIGxpYm5sLWdlbmwgYWxzbywgaWYgbm90LCB3ZTxicj4KZ2V0IGEgbG90IG9m
IHVuZGVmaW5lZCBzeW1ib2xzLjxicj4KLS0tPGJyPgqgPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3Vy
ZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT4gfCCgIKAyICstPGJyPgqgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pPGJyPgo8YnI+CmRpZmYg
LS1naXQgYS88YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+Y29u
ZmlndXJlLmFjPC9hPiBiLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2Js
YW5rIj5jb25maWd1cmUuYWM8L2E+PGJyPgppbmRleCAyZDU2Njg0Li4zNTc5YjZlIDEwMDY0NDxi
cj4KLS0tIGEvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIgdGFyZ2V0PSJfYmxhbmsiPmNv
bmZpZ3VyZS5hYzwvYT48YnI+CisrKyBiLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRh
cmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+PGJyPgpAQCAtNTYsNyArNTYsNyBAQCBQS0df
Q0hFQ0tfTU9EVUxFUyhbTElCWl0sIFt6bGliXSxbXSxbPGJyPgo8YnI+CqBoYXNfbGlibmxfdmVy
PTA8YnI+CqBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCTkxdLCBbbGlibmwtMV0sIFtoYXNfbGlibmxf
dmVyPTFdLCBbPGJyPgotIKAgoCCgIEFDX1NFQVJDSF9MSUJTKFtubF9zb2NrZXRfYWxsb2NdLCBb
bmxdLCBbaGFzX2xpYm5sX3Zlcj0yXSwgWzxicj4KKyCgIKAgoCBBQ19TRUFSQ0hfTElCUyhbbmxf
c29ja2V0X2FsbG9jXSwgW2xpYm5sLTIuMF0sIFtoYXNfbGlibmxfdmVyPTJdLCBbPC9ibG9ja3F1
b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+YXJlIHlvdSBzdXJlIHlvdSB3YW50IHRoZSBsaW5rZXIg
dG8gY2hlY2sgZm9yIC1sbGlibmwtMi4wPyB0aGF0IG1lYW5zIGl0JiMzOTtzIGdvaW5nIHRvIHRy
eSB0byBmaW5kIGEgJnF1b3Q7PGEgaHJlZj0iaHR0cDovL2xpYmxpYm5sLTIuMC5zbyI+bGlibGli
bmwtMi4wLnNvPC9hPiZxdW90OyAobm90ZSB0aGUgZG91YmxlICZxdW90O2xpYiZxdW90OyBoZXJl
KS48L2Rpdj4KPGRpdj48YnI+PC9kaXY+PGRpdj5BdWtlPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9k
aXY+PGJyPgo=

--===============4910651418501110837==--

