Content-Type: multipart/mixed; boundary="===============1349752331921177895=="
MIME-Version: 1.0
From: Swaminathan, Nivedita <nivedita.swaminathan at intel.com>
Subject: Re: [Powertop] [PATCH] Throw error message when system cmd
 returns	Non-zero value.
Date: Fri, 29 Apr 2016 16:21:09 +0000
Message-ID: <203C9A218350B94EAF34403F81F162AE198D45FB@ORSMSX116.amr.corp.intel.com>
In-Reply-To: 1461938712-1162-1-git-send-email-xiechj@mail2.sysu.edu.cn
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1349752331921177895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for sending your patch. Your patch has been added to the github r=
epository.

Regards,
Nivedita

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> xiechj(a)mail2.sysu.edu.cn
> Sent: Friday, April 29, 2016 7:05 AM
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] Throw error message when system cmd returns
> Non-zero value.
> =

> From: Madper Xie <madper.xie(a)canonical.com>
> =

> hciconfig returns 0 when succeed.
> Signed-off-by: Madper Xie <madper.xie(a)canonical.com>
> ---
>  src/tuning/bluetooth.cpp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/src/tuning/bluetooth.cpp b/src/tuning/bluetooth.cpp index
> dab46d7..2958849 100644
> --- a/src/tuning/bluetooth.cpp
> +++ b/src/tuning/bluetooth.cpp
> @@ -176,11 +176,11 @@ void bt_tunable::toggle(void)
>  	good =3D good_bad();
> =

>  	if (good =3D=3D TUNE_GOOD) {
> -		if(!system("/usr/sbin/hciconfig hci0 up &> /dev/null &"))
> +		if(system("/usr/sbin/hciconfig hci0 up &> /dev/null &"))
>  			printf("System is not available\n");
>  		return;
>  	}
> -	if(!system("/usr/sbin/hciconfig hci0 down &> /dev/null"))
> +	if(system("/usr/sbin/hciconfig hci0 down &> /dev/null"))
>  		printf("System is not available\n");
>  }
> =

> --
> 2.7.4
> =

> =

> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============1349752331921177895==--

