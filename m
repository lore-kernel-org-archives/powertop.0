Content-Type: multipart/mixed; boundary="===============5423087150892862565=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] [PATCH] intel_cpus.cpp: Change open parameter to const
 char *
Date: Mon, 01 Apr 2019 17:05:56 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F764880BBCC@ORSMSX111.amr.corp.intel.com>
In-Reply-To: 20190331032132.17697-1-rosenp@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5423087150892862565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Applied!

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> Rosen Penev
> Sent: Saturday, March 30, 2019 8:22 PM
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] intel_cpus.cpp: Change open parameter to
> const char *
> =

> ifstream::open takes std::string starting with C++11, not before.
> =

> This fixes compilation with uClibc++ and potentially other older libraries
> =

> Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
> ---
>  src/cpu/intel_cpus.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp index
> 0030dba..4dffadc 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -92,7 +92,7 @@ int is_supported_intel_cpu(int model, int cpu)
> =

>  int is_intel_pstate_driver_loaded()
>  {
> -	const string
> filename("/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver");
> +	const char *filename =3D
> +"/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver";
>  	const string intel_pstate("intel_pstate");
>  	char line[32] =3D { '\0' };
>  	ifstream file;
> --
> 2.17.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============5423087150892862565==--

