Content-Type: multipart/mixed; boundary="===============2699296388516514952=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Display all P-states in HTML-report
Date: Tue, 17 Jul 2012 15:08:57 -0700
Message-ID: <5005E279.2020601@linux.intel.com>
In-Reply-To: 4FFD199A.2020409@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2699296388516514952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/10/2012 11:13 PM, Igor Zhbanov wrote:
> Hello!
>
> On Arm processors there are more than 10 P-states. On my device there =

> are 12
> p-states with different frequency. But PowerTOP displays only 10. And it
> doesn't display states (11 and 12) where the phone spends most of the =

> time.
>
> I suppose that was because of console mode of PowerTOP, when there are =

> limited
> number of lines on the console. But in the case of HTML-report this =

> should
> not be a problem.
>
> Here is the patch that counts the number of found P-states and =

> displays all
> of them.
>
> --8<--Cut =

> here----------------------------------------------------------------
> diff -purN -X dontdiff-powertop powertop-intel/config.h powertop/config.h
> diff -purN -X dontdiff-powertop powertop-intel/src/cpu/cpu.cpp =

> powertop/src/cpu/cpu.cpp
> --- powertop-intel/src/cpu/cpu.cpp    2012-07-05 13:06:16.000000000 +0400
> +++ powertop/src/cpu/cpu.cpp    2012-07-05 18:43:19.704809327 +0400
> @@ -618,6 +618,11 @@ void report_display_cpu_pstates(void)
>      unsigned int package, core, cpu;
>      int line;
>      class abstract_cpu *_package, * _core, * _cpu;
> +    unsigned int i, pstates_num;
> +
> +    for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
> +        if (all_cpus[i]&& all_cpus[i]->pstates.size()>  pstates_num)
> +            pstates_num =3D all_cpus[i]->pstates.size();
>
>      if ((!reportout.csv_report)&&(!reportout.http_report))
>          return;
> @@ -644,7 +649,7 @@ void report_display_cpu_pstates(void)
>              if (!_core)
>                  continue;
>
> -            for (line =3D LEVEL_HEADER; line<  10; line++) {
> +            for (line =3D LEVEL_HEADER; line<  (int)pstates_num; line++)=
 {
>                  int first =3D 1;
>
>                  if (!_package->has_pstate_level(line))
> --8<---------------------------------------------------------------------=
----- =

>
>
> The same issue may affect the function report_display_cpu_cstates()
> but I'm not sure that CPUs with more than 10 C-states exists.
>
> The same code is in the function impl_w_display_cpu_states(), but that
> function is used in console mode only.
>
> Thank you.
>
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

Your patch has been merged.
Thank you,

--===============2699296388516514952==--

