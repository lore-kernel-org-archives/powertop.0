Content-Type: multipart/mixed; boundary="===============2869479228169681492=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH v3] conditionally disable pci if not supported
Date: Fri, 13 Jul 2012 10:32:21 +0530
Message-ID: <CA+Z25wWbcrkXZYKbeA3Txs7kwh8cX5OfcomHZpWekTQifWV3Kw@mail.gmail.com>
In-Reply-To: 1340644453-9135-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2869479228169681492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Can someone consider this patch for merge?

On 25 June 2012 22:44, Rajagopal Venkat <rajagopal.venkat(a)linaro.org> wro=
te:

> disable pci if not supported by host platform. When
> libpci is not found, define a macro which will be
> used for conditional compilation.
>
> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> ---
>  configure.ac |    5 +++--
>  src/lib.cpp  |   20 ++++++++++++++++++--
>  src/lib.h    |    5 +++++
>  3 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 4da4eea..3cbc7b0 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -48,8 +48,9 @@ AC_CHECK_FUNCS([fdatasync getpagesize gettimeofday
> memmove memset mkdir munmap p
>  AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], AC_MSG_ERROR([ncurses is
> required but was not found]), [])
>
>  PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
> -       AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is
> required but was not found]), [])
> -])
> +       AC_SEARCH_LIBS([pci_get_dev], [pci], [],
> AC_DEFINE([HAVE_NO_PCI],[1],[Define if pci is not supported]), [])
> +])
> +
>  PKG_CHECK_MODULES([LIBZ], [zlib],[],[
>         AC_SEARCH_LIBS([deflate], [z], [], AC_MSG_ERROR([zlib is required
> but was not found]), [])
>  ])
> diff --git a/src/lib.cpp b/src/lib.cpp
> index 0f87e48..77e49a2 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -35,11 +35,13 @@
>  #include <math.h>
>  #include <stdlib.h>
>
> +#include "lib.h"
> +
> +#ifndef HAVE_NO_PCI
>  extern "C" {
>  #include <pci/pci.h>
>  }
> -
> -#include "lib.h"
> +#endif
>
>  #include <stdio.h>
>  #include <stdint.h>
> @@ -266,6 +268,7 @@ void format_watts(double W, char *buffer, unsigned int
> len)
>  }
>
>
> +#ifndef HAVE_NO_PCI
>  static struct pci_access *pci_access;
>
>  char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int
> len)
> @@ -290,6 +293,19 @@ void end_pci_access(void)
>                 pci_free_name_list(pci_access);
>  }
>
> +#else
> +
> +char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int
> len)
> +{
> +       return NULL;
> +}
> +
> +void end_pci_access(void)
> +{
> +}
> +
> +#endif /* HAVE_NO_PCI */
> +
>  int utf_ok =3D -1;
>
>
> diff --git a/src/lib.h b/src/lib.h
> index 588c023..7093b7f 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -30,6 +30,11 @@
>  #endif
>  #include <stdint.h>
>
> +/* Include only for Automake builds */
> +#ifdef HAVE_CONFIG_H
> +#include "config.h"
> +#endif
> +
>  #ifndef DISABLE_I18N
>  #define _(STRING)    gettext(STRING)
>  #else
> --
> 1.7.9.5
>
>

--===============2869479228169681492==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

Q2FuIHNvbWVvbmUgY29uc2lkZXIgdGhpcyBwYXRjaCBmb3IgbWVyZ2U/PGJyPjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+T24gMjUgSnVuZSAyMDEyIDIyOjQ0LCBSYWphZ29wYWwgVmVua2F0
IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnJhamFnb3BhbC52ZW5rYXRAbGlu
YXJvLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnJhamFnb3BhbC52ZW5rYXRAbGluYXJvLm9yZzwvYT4m
Z3Q7PC9zcGFuPiB3cm90ZTo8YnI+Cgo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij5kaXNhYmxlIHBjaSBpZiBub3Qgc3VwcG9ydGVkIGJ5IGhvc3QgcGxhdGZvcm0u
IFdoZW48YnI+CmxpYnBjaSBpcyBub3QgZm91bmQsIGRlZmluZSBhIG1hY3JvIHdoaWNoIHdpbGwg
YmU8YnI+CnVzZWQgZm9yIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLjxicj4KPGJyPgpTaWduZWQt
b2ZmLWJ5OiBSYWphZ29wYWwgVmVua2F0ICZsdDs8YSBocmVmPSJtYWlsdG86cmFqYWdvcGFsLnZl
bmthdEBsaW5hcm8ub3JnIiB0YXJnZXQ9Il9ibGFuayI+cmFqYWdvcGFsLnZlbmthdEBsaW5hcm8u
b3JnPC9hPiZndDs8YnI+Ci0tLTxicj4KoDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRh
cmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+IHwgoCCgNSArKystLTxicj4KoHNyYy9saWIu
Y3BwIKB8IKAgMjAgKysrKysrKysrKysrKysrKysrLS08YnI+CqBzcmMvbGliLmggoCCgfCCgIKA1
ICsrKysrPGJyPgqgMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKTxicj4KPGJyPgpkaWZmIC0tZ2l0IGEvPGEgaHJlZj0iaHR0cDovL2NvbmZpZ3VyZS5hYyIg
dGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzwvYT4gYi88YSBocmVmPSJodHRwOi8vY29uZmln
dXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KaW5kZXggNGRhNGVl
YS4uM2NiYzdiMCAxMDA2NDQ8YnI+Ci0tLSBhLzxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMi
IHRhcmdldD0iX2JsYW5rIj5jb25maWd1cmUuYWM8L2E+PGJyPgorKysgYi88YSBocmVmPSJodHRw
Oi8vY29uZmlndXJlLmFjIiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjPC9hPjxicj4KQEAg
LTQ4LDggKzQ4LDkgQEAgQUNfQ0hFQ0tfRlVOQ1MoW2ZkYXRhc3luYyBnZXRwYWdlc2l6ZSBnZXR0
aW1lb2ZkYXkgbWVtbW92ZSBtZW1zZXQgbWtkaXIgbXVubWFwIHA8YnI+CqBBQ19TRUFSQ0hfTElC
UyhbZGVsd2luXSwgW25jdXJzZXN3IG5jdXJzZXNdLCBbXSwgQUNfTVNHX0VSUk9SKFtuY3Vyc2Vz
IGlzIHJlcXVpcmVkIGJ1dCB3YXMgbm90IGZvdW5kXSksIFtdKTxicj4KPGJyPgqgUEtHX0NIRUNL
X01PRFVMRVMoW1BDSVVUSUxTXSwgW2xpYnBjaV0sW10sWzxicj4KLSCgIKAgoCBBQ19TRUFSQ0hf
TElCUyhbcGNpX2dldF9kZXZdLCBbcGNpXSwgW10sIEFDX01TR19FUlJPUihbbGlicGNpIGlzIHJl
cXVpcmVkIGJ1dCB3YXMgbm90IGZvdW5kXSksIFtdKTxicj4KLV0pPGJyPgorIKAgoCCgIEFDX1NF
QVJDSF9MSUJTKFtwY2lfZ2V0X2Rldl0sIFtwY2ldLCBbXSwgQUNfREVGSU5FKFtIQVZFX05PX1BD
SV0sWzFdLFtEZWZpbmUgaWYgcGNpIGlzIG5vdCBzdXBwb3J0ZWRdKSwgW10pPGJyPgorXSk8YnI+
Cis8YnI+CqBQS0dfQ0hFQ0tfTU9EVUxFUyhbTElCWl0sIFt6bGliXSxbXSxbPGJyPgqgIKAgoCCg
IEFDX1NFQVJDSF9MSUJTKFtkZWZsYXRlXSwgW3pdLCBbXSwgQUNfTVNHX0VSUk9SKFt6bGliIGlz
IHJlcXVpcmVkIGJ1dCB3YXMgbm90IGZvdW5kXSksIFtdKTxicj4KoF0pPGJyPgpkaWZmIC0tZ2l0
IGEvc3JjL2xpYi5jcHAgYi9zcmMvbGliLmNwcDxicj4KaW5kZXggMGY4N2U0OC4uNzdlNDlhMiAx
MDA2NDQ8YnI+Ci0tLSBhL3NyYy9saWIuY3BwPGJyPgorKysgYi9zcmMvbGliLmNwcDxicj4KQEAg
LTM1LDExICszNSwxMyBAQDxicj4KoCNpbmNsdWRlICZsdDttYXRoLmgmZ3Q7PGJyPgqgI2luY2x1
ZGUgJmx0O3N0ZGxpYi5oJmd0Ozxicj4KPGJyPgorI2luY2x1ZGUgJnF1b3Q7bGliLmgmcXVvdDs8
YnI+Cis8YnI+CisjaWZuZGVmIEhBVkVfTk9fUENJPGJyPgqgZXh0ZXJuICZxdW90O0MmcXVvdDsg
ezxicj4KoCNpbmNsdWRlICZsdDtwY2kvcGNpLmgmZ3Q7PGJyPgqgfTxicj4KLTxicj4KLSNpbmNs
dWRlICZxdW90O2xpYi5oJnF1b3Q7PGJyPgorI2VuZGlmPGJyPgo8YnI+CqAjaW5jbHVkZSAmbHQ7
c3RkaW8uaCZndDs8YnI+CqAjaW5jbHVkZSAmbHQ7c3RkaW50LmgmZ3Q7PGJyPgpAQCAtMjY2LDYg
KzI2OCw3IEBAIHZvaWQgZm9ybWF0X3dhdHRzKGRvdWJsZSBXLCBjaGFyICpidWZmZXIsIHVuc2ln
bmVkIGludCBsZW4pPGJyPgqgfTxicj4KPGJyPgo8YnI+CisjaWZuZGVmIEhBVkVfTk9fUENJPGJy
Pgqgc3RhdGljIHN0cnVjdCBwY2lfYWNjZXNzICpwY2lfYWNjZXNzOzxicj4KPGJyPgqgY2hhciAq
cGNpX2lkX3RvX25hbWUodWludDE2X3QgdmVuZG9yLCB1aW50MTZfdCBkZXZpY2UsIGNoYXIgKmJ1
ZmZlciwgaW50IGxlbik8YnI+CkBAIC0yOTAsNiArMjkzLDE5IEBAIHZvaWQgZW5kX3BjaV9hY2Nl
c3Modm9pZCk8YnI+CqAgoCCgIKAgoCCgIKAgoCBwY2lfZnJlZV9uYW1lX2xpc3QocGNpX2FjY2Vz
cyk7PGJyPgqgfTxicj4KPGJyPgorI2Vsc2U8YnI+Cis8YnI+CitjaGFyICpwY2lfaWRfdG9fbmFt
ZSh1aW50MTZfdCB2ZW5kb3IsIHVpbnQxNl90IGRldmljZSwgY2hhciAqYnVmZmVyLCBpbnQgbGVu
KTxicj4KK3s8YnI+CisgoCCgIKAgcmV0dXJuIE5VTEw7PGJyPgorfTxicj4KKzxicj4KK3ZvaWQg
ZW5kX3BjaV9hY2Nlc3Modm9pZCk8YnI+Cit7PGJyPgorfTxicj4KKzxicj4KKyNlbmRpZiAvKiBI
QVZFX05PX1BDSSAqLzxicj4KKzxicj4KoGludCB1dGZfb2sgPSAtMTs8YnI+Cjxicj4KPGJyPgpk
aWZmIC0tZ2l0IGEvc3JjL2xpYi5oIGIvc3JjL2xpYi5oPGJyPgppbmRleCA1ODhjMDIzLi43MDkz
YjdmIDEwMDY0NDxicj4KLS0tIGEvc3JjL2xpYi5oPGJyPgorKysgYi9zcmMvbGliLmg8YnI+CkBA
IC0zMCw2ICszMCwxMSBAQDxicj4KoCNlbmRpZjxicj4KoCNpbmNsdWRlICZsdDtzdGRpbnQuaCZn
dDs8YnI+Cjxicj4KKy8qIEluY2x1ZGUgb25seSBmb3IgQXV0b21ha2UgYnVpbGRzICovPGJyPgor
I2lmZGVmIEhBVkVfQ09ORklHX0g8YnI+CisjaW5jbHVkZSAmcXVvdDtjb25maWcuaCZxdW90Ozxi
cj4KKyNlbmRpZjxicj4KKzxicj4KoCNpZm5kZWYgRElTQUJMRV9JMThOPGJyPgqgI2RlZmluZSBf
KFNUUklORykgoCCgZ2V0dGV4dChTVFJJTkcpPGJyPgqgI2Vsc2U8YnI+CjxzcGFuPjxmb250IGNv
bG9yPSIjODg4ODg4Ij4tLTxicj4KMS43LjkuNTxicj4KPGJyPgo8L2ZvbnQ+PC9zcGFuPjwvYmxv
Y2txdW90ZT48L2Rpdj48YnI+Cg==

--===============2869479228169681492==--

