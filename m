Content-Type: multipart/mixed; boundary="===============1652384935151203875=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Correct script for tuning wifi power_save with
 iw
Date: Fri, 14 Dec 2012 13:42:22 +0300
Message-ID: <20121214104222.GA2983@swordfish.minsk.epam.com>
In-Reply-To: 1355460779-23060-1-git-send-email-dkg@fifthhorseman.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1652384935151203875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/13/12 23:52), Daniel Kahn Gillmor wrote:
> The logic for the script to run to fix the power_save state of a
> wireless device was inverted.
> =


good catch. thanks.

	-ss

> Signed-off-by: Daniel Kahn Gillmor <dkg(a)fifthhorseman.net>
> ---
>  src/tuning/wifi.cpp |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/src/tuning/wifi.cpp b/src/tuning/wifi.cpp
> index 38d9be6..77cdfcc 100644
> --- a/src/tuning/wifi.cpp
> +++ b/src/tuning/wifi.cpp
> @@ -47,8 +47,8 @@ wifi_tunable::wifi_tunable(const char *_iface) : tunabl=
e("", 1.5, _("Good"), _("
>  	strcpy(iface, _iface);
>  	sprintf(desc, _("Wireless Power Saving for interface %s"), iface);
>  =

> -	sprintf(toggle_good, "iw dev %s set power_save off", iface);
> -	sprintf(toggle_bad, "iw dev %s set power_save on", iface);
> +	sprintf(toggle_good, "iw dev %s set power_save on", iface);
> +	sprintf(toggle_bad, "iw dev %s set power_save off", iface);
>  }
>  =

>  int wifi_tunable::good_bad(void)
> -- =

> 1.7.10.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============1652384935151203875==--

