Content-Type: multipart/mixed; boundary="===============2231965948607249907=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Tunables: Ondemand Governor and intel_pstate
Date: Fri, 20 Sep 2013 14:55:31 +0300
Message-ID: <20130920115530.GA2428@swordfish.minsk.epam.com>
In-Reply-To: 20130920075259.GA6749@mobster.intranet.ufz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2231965948607249907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/20/13 09:52), Christian Krause wrote:
> Dear PowerTop Developers,
> =

> I have been wondering for a while and just found out:
> =

> tunables show:
> =

>     Bad           Using 'ondemand' cpufreq governor
> =

> but: I don't have a ondemand cpufreq governor -- that is what I just foun=
d out: since some kernel
> versions ago the intel_pstate driver is the default for my cpu:
> =


Hello,
I'll take a look, thanks.

	-ss

>     # zgrep PSTATE /proc/config.gz
>     CONFIG_X86_INTEL_PSTATE=3Dy
> =

>     # cat /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_driver
>     intel_pstate
>     intel_pstate
>     intel_pstate
>     intel_pstate
> =

> intel_pstate does not provide ondemand governor, just powersave and perfo=
rmance. It saves power by
> putting the cpu in sleep mode instead of decreasing the frequency, see id=
le stats: C7-SNB 98.7% ...
> =

> Please include a check in PowerTop so ondemand governor does not get sugg=
ested for intel_pstate.
> That was really confusing at first to have powertop suggest that but me n=
ot having ondemand
> governor.
> =

> =

> -- =

> =

> Mit freundlichen Gr=C3=BC=C3=9Fen /  =

> With kind regards
> =

> -------------------------------------------
> =

> Christian Krause
> =

> Wissenschaftliche und Kaufm=C3=A4nnische Datenverarbeitung /  =

> Scientific and Commercial Data Processing (WKDV)
> =

> Wissenschaftliches Rechnen und Wissenschaftliches Datenmanagement /  =

> Scientific Computing and Scientific Data Management (WRWD)
> =

> -------------------------------------------
> =

> Helmholtz-Zentrum f=C3=BCr Umweltforschung GmbH - UFZ /  =

> Helmholtz Centre for Environmental Research - UFZ  =

> Permoserstr. 15 / 04318 Leipzig / Germany  =

> phone +49 341 235 1001 / fax +49 341 235 1468  =

> <christian.krause(a)ufz.de> / <http://www.ufz.de>
> =

> Sitz der Gesellschaft: Leipzig  =

> Registergericht: Amtsgericht Leipzig, Handelsregister Nr. B 4703  =

> Vorsitzender des Aufsichtsrats: MinDirig Wilfried Kraus  =

> Wissenschaftlicher Gesch=C3=A4ftsf=C3=BChrer: Prof. Dr. Georg Teutsch  =

> Administrative Gesch=C3=A4ftsf=C3=BChrerin: Dr. Heike Gra=C3=9Fmann
> =

> -------------------------------------------
> =

> Bitte denken Sie an die Umwelt bevor Sie diese E-Mail ausdrucken. /  =

> Please consider the environment before printing this e-mail.
> =

> -------------------------------------------
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============2231965948607249907==--

