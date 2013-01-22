Content-Type: multipart/mixed; boundary="===============7033011702067854900=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] V2: Fix C states and P states presentation
 issue.
Date: Tue, 22 Jan 2013 20:09:26 +0300
Message-ID: <20130122170926.GB2320@swordfish>
In-Reply-To: 1358855012-23798-1-git-send-email-zhang.austin@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7033011702067854900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/22/13 19:43), Austin Zhang wrote:
> Date: Tue, 22 Jan 2013 19:43:32 +0800
> From: Austin Zhang <zhang.austin(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] V2: Fix C states and P states presentation
>  issue.
> X-Mailer: git-send-email 1.7.5.4
> =

> If using '10' in this 'for' loop, for P states, once the processor
> provides more than 10 P states, those additional ones cannot been
> presented; and for C states, once the processor provides maximize
> C states level more than 9, for example, it only has POLL, C1, C3,
> C6, C10, the additional one like C10 also cannot be presented.
> =

> Now we get the loop numbers from the system information we had got
> before.
> =

> Changes from V1:
> Using std:max to simplify codes
> =

> Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> ---
>  src/cpu/cpu.cpp |   36 +++++++++++++++++++++++++++++-------
>  1 files changed, 29 insertions(+), 7 deletions(-)
> =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 7f3af69..1bae255 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -402,8 +402,16 @@ void report_display_cpu_cstates(void)
>  {
>  	char buffer[512], buffer2[512];
>  	unsigned int package, core, cpu;
> -	int line;
> +	int line, cstates_num;
>  	class abstract_cpu *_package, * _core, * _cpu;
> +	unsigned int i, j;
> +
> +	for (i =3D 0, cstates_num =3D 0; i < all_cpus.size(); i++) {
> +		if (all_cpus[i])
> +			for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
> +				cstates_num =3D std::max(cstates_num,
> +						(all_cpus[i]->cstates[j])->line_level);
> +	}
>  =

>  	report.begin_section(SECTION_CPUIDLE);
>  	report.add_header("Processor Idle state report");
> @@ -421,7 +429,7 @@ void report_display_cpu_cstates(void)
>  			if (!_core)
>  				continue;
>  =

> -			for (line =3D LEVEL_HEADER; line < 10; line++) {
> +			for (line =3D LEVEL_HEADER; line <=3D cstates_num; line++) {
>  				bool first_cpu =3D true;
>  =

>  				if (!_package->has_cstate_level(line))
> @@ -628,14 +636,29 @@ void impl_w_display_cpu_states(int state)
>  	char buffer[128];
>  	char linebuf[1024];
>  	unsigned int package, core, cpu;
> -	int line;
> +	int line, loop, cstates_num, pstates_num;
>  	class abstract_cpu *_package, * _core, * _cpu;
>  	int ctr =3D 0;
> +	unsigned int i, j;
> +
> +	for (i =3D 0, cstates_num =3D 0, pstates_num =3D 0; i < all_cpus.size()=
; i++) {
> +		if (!all_cpus[i])
> +			continue;
>  =

> -	if (state =3D=3D PSTATE)
> +		pstates_num =3D std::max<int>(pstates_num, all_cpus[i]->pstates.size()=
);
> +


just for note, perhaps we can do the same for pstates_num in report_display=
_cpu_pstates(),
to keep it similar.

	-ss


> +		for (j =3D 0; j < all_cpus[i]->cstates.size(); j++)
> +			cstates_num =3D std::max(cstates_num,
> +						(all_cpus[i]->cstates[j])->line_level);
> +	}
> +
> +	if (state =3D=3D PSTATE) {
>  		win =3D get_ncurses_win("Frequency stats");
> -	else
> +		loop =3D pstates_num;
> +	} else {
>  		win =3D get_ncurses_win("Idle stats");
> +		loop =3D cstates_num;
> +	}
>  =

>  	if (!win)
>  		return;
> @@ -656,8 +679,7 @@ void impl_w_display_cpu_states(int state)
>  			if (!_core->has_pstates() && state =3D=3D PSTATE)
>  				continue;
>  =

> -
> -			for (line =3D LEVEL_HEADER; line < 10; line++) {
> +			for (line =3D LEVEL_HEADER; line <=3D loop; line++) {
>  				int first =3D 1;
>  				ctr =3D 0;
>  				linebuf[0] =3D 0;
> -- =

> 1.7.5.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============7033011702067854900==--

