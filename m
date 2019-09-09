Content-Type: multipart/mixed; boundary="===============7820978369075870509=="
MIME-Version: 1.0
From: Auke Kok <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] Make the wakeup toggle text clearer.
Date: Mon, 09 Sep 2019 12:07:16 -0700
Message-ID: <d3baeea8-8e8d-7e6f-0bbb-c9debb7087cc@intel.com>
In-Reply-To: 20190909143828.126826-1-zakraise@eng.utah.edu
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7820978369075870509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Ahh yes, +1, this has totally irked me and this is a good solution.

Auke


On 9/9/19 7:38 AM, Zane Zakraisek wrote:
> The text is currenly "Enable" or "Disable", which makes it seem like
> toggling is needed to get it in that state.
> =

> Instead the text should be "Enabled" or "Disabled" which reflects the
> current state.
> =

> Signed-off-by: Zane Zakraisek <zakraise(a)eng.utah.edu>
> ---
>  src/wakeup/wakeup.cpp          | 4 ++--
>  src/wakeup/wakeup_ethernet.cpp | 2 +-
>  src/wakeup/wakeup_usb.cpp      | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/src/wakeup/wakeup.cpp b/src/wakeup/wakeup.cpp
> index 7ed074b..9d83a9a 100644
> --- a/src/wakeup/wakeup.cpp
> +++ b/src/wakeup/wakeup.cpp
> @@ -45,8 +45,8 @@ wakeup::wakeup(void)
>  {
>  	score =3D 0;
>          desc[0] =3D 0;
> -        pt_strcpy(wakeup_enable, _("Enable"));
> -        pt_strcpy(wakeup_disable, _("Disable"));
> +        pt_strcpy(wakeup_enable, _("Enabled"));
> +        pt_strcpy(wakeup_disable, _("Disabled"));
>  	pt_strcpy(wakeup_idle, _("Unknown"));
>  }
>  =

> diff --git a/src/wakeup/wakeup_ethernet.cpp b/src/wakeup/wakeup_ethernet.=
cpp
> index 4df7be3..6ce1725 100644
> --- a/src/wakeup/wakeup_ethernet.cpp
> +++ b/src/wakeup/wakeup_ethernet.cpp
> @@ -44,7 +44,7 @@
>  #include "../lib.h"
>  #include "wakeup_ethernet.h"
>  =

> -ethernet_wakeup::ethernet_wakeup(const char *path, const char *iface) : =
wakeup("", 0.5, _("Enable"), _("Disable"))
> +ethernet_wakeup::ethernet_wakeup(const char *path, const char *iface) : =
wakeup("", 0.5, _("Enabled"), _("Disabled"))
>  {
>  	memset(interf, 0, sizeof(interf));
>  	pt_strcpy(interf, iface);
> diff --git a/src/wakeup/wakeup_usb.cpp b/src/wakeup/wakeup_usb.cpp
> index 30dc3e6..e0e4567 100644
> --- a/src/wakeup/wakeup_usb.cpp
> +++ b/src/wakeup/wakeup_usb.cpp
> @@ -44,7 +44,7 @@
>  #include "../lib.h"
>  #include "wakeup_usb.h"
>  =

> -usb_wakeup::usb_wakeup(const char *path, const char *iface) : wakeup("",=
 0.5, _("Enable"), _("Disable"))
> +usb_wakeup::usb_wakeup(const char *path, const char *iface) : wakeup("",=
 0.5, _("Enabled"), _("Disabled"))
>  {
>  	memset(interf, 0, sizeof(interf));
>  	pt_strcpy(interf, iface);
> =



--===============7820978369075870509==--

