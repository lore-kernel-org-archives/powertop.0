Content-Type: multipart/mixed; boundary="===============4163705176557541533=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Display all P-states in HTML-report
Date: Wed, 11 Jul 2012 12:40:00 +0400
Message-ID: <4FFD3BE0.9090803@samsung.com>
In-Reply-To: 4FFD199A.2020409@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4163705176557541533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is the formatted version of the patch:

 From 66d0f194250d94afcf83eb7712af6f50c6ad8ec4 Mon Sep 17 00:00:00 2001
From: Igor Zhbanov<i.zhbanov(a)samsung.com>
Date: Wed, 11 Jul 2012 12:35:31 +0400
Subject: [PATCH] Display all P-states in HTML-report

On Arm processors there are more than 10 P-states. On my device there are 12
p-states with different frequency. But PowerTOP displays only 10. And it
doesn't display states (11 and 12) where the phone spends most of the time.

I suppose that was because of console mode of PowerTOP, when there are limi=
ted
number of lines on the console. But in the case of HTML-report this should
not be a problem.

This patch that counts the number of found P-states and displays all of the=
m.

The same issue may affect the function report_display_cpu_cstates()
but I'm not sure that CPUs with more than 10 C-states exists.

The same code is in the function impl_w_display_cpu_states(), but that
function is used in console mode only where lines limit is reasonable.
---
  src/cpu/cpu.cpp |    7 ++++++-
  1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 4096835..c3dd6a5 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -588,6 +588,11 @@ void report_display_cpu_pstates(void)
  	unsigned int package, core, cpu;
  	int line;
  	class abstract_cpu *_package, * _core, * _cpu;
+	unsigned int i, pstates_num;
+
+	for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
+		if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
+			pstates_num =3D all_cpus[i]->pstates.size();

  	if ((!reportout.csv_report)&&(!reportout.http_report))
  		return;
@@ -614,7 +619,7 @@ void report_display_cpu_pstates(void)
  			if (!_core)
  				continue;

-			for (line =3D LEVEL_HEADER; line<  10; line++) {
+			for (line =3D LEVEL_HEADER; line<  (int)pstates_num; line++) {
  				int first =3D 1;

  				if (!_package->has_pstate_level(line))
-- =

1.7.5.4

Igor Zhbanov wrote:
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
> +        if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
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
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============4163705176557541533==--

