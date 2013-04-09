Content-Type: multipart/mixed; boundary="===============3617338101483920495=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] cpu: allow for more package than core cstates
Date: Tue, 09 Apr 2013 21:33:59 +0300
Message-ID: <20130409183359.GC2244@swordfish>
In-Reply-To: 1365464141-29750-1-git-send-email-kristen@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3617338101483920495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/08/13 16:35), Kristen Carlson Accardi wrote:
> Date: Mon,  8 Apr 2013 16:35:41 -0700
> From: Kristen Carlson Accardi <kristen(a)linux.intel.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] cpu: allow for more package than core cstates
> X-Mailer: git-send-email 1.7.11.7
> =

> Change reporting code to walk package, then core, the cpu to determine max
> number of cstate vs. just walking the logical cpus.
> =

> change display function to obtain max cstate num the same way.
> ---
>  src/cpu/cpu.cpp | 68 ++++++++++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 55 insertions(+), 13 deletions(-)
>

looks good to me.

	-ss

 =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index afe6a8c..9e075bd 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -402,20 +402,64 @@ static const char * fill_state_line(class abstract_=
cpu *acpu, int state, int lin
>  	return "-EINVAL";
>  }
>  =

> +static int get_cstates_num(void)
> +{
> +	unsigned int package, core, cpu;
> +	class abstract_cpu *_package, * _core, * _cpu;
> +	unsigned int i;
> +	int cstates_num;
> +
> +	for (package =3D 0, cstates_num =3D 0;
> +			package < system_level.children.size(); package++) {
> +		_package =3D system_level.children[package];
> +		if (_package =3D=3D NULL)
> +			continue;
> +
> +		/* walk package cstates and get largest cstates number */
> +		for (i =3D 0; i < _package->cstates.size(); i++)
> +			cstates_num =3D std::max(cstates_num,
> +						(_package->cstates[i])->line_level);
> +
> +		/*
> +		 * for each core in this package, walk core cstates and get
> +		 * largest cstates number
> +		 */
> +		for (core =3D 0; core < _package->children.size(); core++) {
> +			_core =3D _package->children[core];
> +			if (_core =3D=3D NULL)
> +				continue;
> +
> +			for (i =3D 0; i <  _core->cstates.size(); i++)
> +				cstates_num =3D std::max(cstates_num,
> +						(_core->cstates[i])->line_level);
> +
> +			/*
> +			 * for each core, walk the logical cpus in case
> +			 * there is are more linux cstates than hw cstates
> +			 */
> +			 for (cpu =3D 0; cpu < _core->children.size(); cpu++) {
> +				_cpu =3D _core->children[cpu];
> +				if (_cpu =3D=3D NULL)
> +					continue;
> +
> +				for (i =3D 0; i < _cpu->cstates.size(); i++)
> +					cstates_num =3D std::max(cstates_num,
> +						(_cpu->cstates[i])->line_level);
> +			}
> +		}
> +	}
> +
> +	return cstates_num;
> +}
> +
>  void report_display_cpu_cstates(void)
>  {
>  	char buffer[512], buffer2[512];
>  	unsigned int package, core, cpu;
>  	int line, cstates_num;
>  	class abstract_cpu *_package, * _core, * _cpu;
> -	unsigned int i, j;
>  =

> -	for (i =3D 0, cstates_num =3D 0; i < all_cpus.size(); i++) {
> -		if (all_cpus[i])
> -			for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
> -				cstates_num =3D std::max(cstates_num,
> -						(all_cpus[i]->cstates[j])->line_level);
> -	}
> +	cstates_num =3D get_cstates_num();
>  =

>  	report.begin_section(SECTION_CPUIDLE);
>  	report.add_header("Processor Idle state report");
> @@ -644,17 +688,15 @@ void impl_w_display_cpu_states(int state)
>  	int line, loop, cstates_num, pstates_num;
>  	class abstract_cpu *_package, * _core, * _cpu;
>  	int ctr =3D 0;
> -	unsigned int i, j;
> +	unsigned int i;
>  =

> -	for (i =3D 0, cstates_num =3D 0, pstates_num =3D 0; i < all_cpus.size()=
; i++) {
> +	cstates_num =3D get_cstates_num();
> +
> +	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++) {
>  		if (!all_cpus[i])
>  			continue;
>  =

>  		pstates_num =3D std::max<int>(pstates_num, all_cpus[i]->pstates.size()=
);
> -
> -		for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
> -			cstates_num =3D std::max(cstates_num,
> -						(all_cpus[i]->cstates[j])->line_level);
>  	}
>  =

>  	if (state =3D=3D PSTATE) {
> -- =

> 1.7.11.7
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3617338101483920495==--

