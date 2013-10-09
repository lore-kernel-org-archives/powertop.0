Content-Type: multipart/mixed; boundary="===============8886396617935738760=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] intel_cpus: add support for
 Silvermont/Baytrail-M CPU
Date: Wed, 09 Oct 2013 12:21:38 +0300
Message-ID: <20131009092138.GA2210@swordfish.datadirectnet.com>
In-Reply-To: 1381276268-23515-1-git-send-email-kristen@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8886396617935738760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/08/13 16:51), Kristen Carlson Accardi wrote:
> ---
>  src/cpu/intel_cpus.cpp | 24 ++++++++++++++++++++++--
>  src/cpu/intel_cpus.h   |  3 +++
>  2 files changed, 25 insertions(+), 2 deletions(-)

merged to -next

	-ss

> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> index 5b2e205..3348dba 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -54,6 +54,7 @@ static int intel_cpu_models[] =3D {
>  	0x3A,   /* IVB */
>  	0x3C,
>  	0x3D,	/* IVB Xeon */
> +	0x37,	/* BYT-M */
>  	0	/* last entry must be zero */
>  };
>  =

> @@ -96,7 +97,12 @@ nhm_core::nhm_core(int model)
>  			has_c2c7_res =3D 1;
>  	}
>  =

> -	has_c3_res =3D 1;
> +	/* BYT-M does not support C3/C4 */
> +	if (model =3D=3D 0x37) {
> +		has_c3_res =3D 0;
> +		has_c1_res =3D 1;
> +	} else
> +		has_c3_res =3D 1;
>  }
>  =

>  void nhm_core::measurement_start(void)
> @@ -109,6 +115,8 @@ void nhm_core::measurement_start(void)
>  =

>  	last_stamp =3D 0;
>  =

> +	if (this->has_c1_res)
> +		c1_before =3D get_msr(first_cpu, MSR_CORE_C1_RESIDENCY);
>  	if (this->has_c3_res)
>  		c3_before    =3D get_msr(first_cpu, MSR_CORE_C3_RESIDENCY);
>  	c6_before    =3D get_msr(first_cpu, MSR_CORE_C6_RESIDENCY);
> @@ -116,6 +124,8 @@ void nhm_core::measurement_start(void)
>  		c7_before    =3D get_msr(first_cpu, MSR_CORE_C7_RESIDENCY);
>  	tsc_before   =3D get_msr(first_cpu, MSR_TSC);
>  =

> +	if (this->has_c1_res)
> +		insert_cstate("core c1", "C1 (cc1)", 0, c1_before, 1);
>  	if (this->has_c3_res)
>  		insert_cstate("core c3", "C3 (cc3)", 0, c3_before, 1);
>  	insert_cstate("core c6", "C6 (cc6)", 0, c6_before, 1);
> @@ -149,6 +159,8 @@ void nhm_core::measurement_end(void)
>  	uint64_t time_delta;
>  	double ratio;
>  =

> +	if (this->has_c1_res)
> +		c1_after =3D get_msr(first_cpu, MSR_CORE_C1_RESIDENCY);
>  	if (this->has_c3_res)
>  		c3_after    =3D get_msr(first_cpu, MSR_CORE_C3_RESIDENCY);
>  	c6_after    =3D get_msr(first_cpu, MSR_CORE_C6_RESIDENCY);
> @@ -156,6 +168,8 @@ void nhm_core::measurement_end(void)
>  		c7_after    =3D get_msr(first_cpu, MSR_CORE_C7_RESIDENCY);
>  	tsc_after   =3D get_msr(first_cpu, MSR_TSC);
>  =

> +	if (this->has_c1_res)
> +		finalize_cstate("core c1", 0, c1_after, 1);
>  	if (this->has_c3_res)
>  		finalize_cstate("core c3", 0, c3_after, 1);
>  	finalize_cstate("core c6", 0, c6_after, 1);
> @@ -241,12 +255,18 @@ nhm_package::nhm_package(int model)
>  		case 0x2D:	/* SNB Xeon */
>  		case 0x3A:      /* IVB */
>  		case 0x3C:
> +		case 0x37:
>  		case 0x3D:      /* IVB Xeon */
>  		case 0x45:
>  			has_c2c7_res =3D 1;
>  	}
>  =

> -	has_c3_res =3D 1;
> +	/* BYT-M doesn't have C3 */
> +	if (model =3D=3D 0x37)
> +		has_c3_res =3D 0;
> +	else
> +		has_c3_res =3D 1;
> +
>  =

>  	/* Haswell-ULT has C8/9/10*/
>  	if (model =3D=3D 0x45)
> diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> index 4a51494..57afd8a 100644
> --- a/src/cpu/intel_cpus.h
> +++ b/src/cpu/intel_cpus.h
> @@ -40,6 +40,7 @@
>  #define MSR_PKG_C8_RESIDENCY		0x630
>  #define MSR_PKG_C9_RESIDENCY		0x631
>  #define MSR_PKG_C10_RESIDENCY		0x632
> +#define MSR_CORE_C1_RESIDENCY		0x660
>  #define MSR_CORE_C3_RESIDENCY		0x3FC
>  #define MSR_CORE_C6_RESIDENCY		0x3FD
>  #define MSR_CORE_C7_RESIDENCY		0x3FE
> @@ -73,6 +74,7 @@ public:
>  class nhm_core: public cpu_core
>  {
>  private:
> +	uint64_t	c1_before, c1_after;
>  	uint64_t	c3_before, c3_after;
>  	uint64_t	c6_before, c6_after;
>  	uint64_t	c7_before, c7_after;
> @@ -81,6 +83,7 @@ private:
>  	uint64_t	last_stamp;
>  	uint64_t	total_stamp;
>  public:
> +	int		has_c1_res;
>  	int		has_c2c7_res;
>  	int		has_c3_res;
>  	nhm_core(int model);
> -- =

> 1.8.3.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8886396617935738760==--

