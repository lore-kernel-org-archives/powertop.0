Content-Type: multipart/mixed; boundary="===============7198898032440900161=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] enumerate cpu based on different string on ARM
Date: Wed, 04 Jun 2014 15:34:01 +0900
Message-ID: <20140604063401.GB1099@swordfish>
In-Reply-To: 1401861438-13612-1-git-send-email-sanjay.rawat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7198898032440900161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/04/14 11:27), Sanjay Singh Rawat wrote:
> bogomips is removed by timer-backed delay loop (commit 9fc2105a)
> in ARM kernel. Using other suitable string to decide to enumerate each
> cpu.


looks good.

	-ss

> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
> ---
>  src/cpu/cpu.cpp |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index b3b6166..105c066 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -296,6 +296,18 @@ void enumerate_cpus(void)
>  				number =3D -2;
>  			}
>  		}
> +		/* bogomips is removed in ARM, using CPU revision to enumerate */
> +		if (strncasecmp(line, "CPU revision\t", 13) =3D=3D 0) {
> +			if (number =3D=3D -1) {
> +				/* Not all /proc/cpuinfo include "processor\t". */
> +				number =3D 0;
> +			}
> +			if (number >=3D 0) {
> +				handle_one_cpu(number, vendor, family, model);
> +				set_max_cpu(number);
> +				number =3D -2;
> +			}
> +		}
>  	}
>  =

>  =

> -- =

> 1.7.10.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============7198898032440900161==--

