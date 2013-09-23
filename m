Content-Type: multipart/mixed; boundary="===============2771927170559609561=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] Tunables: Ondemand Governor and intel_pstate
Date: Mon, 23 Sep 2013 12:10:12 -0700
Message-ID: <20130923121012.4a237c32@bluebird.jf.intel.com>
In-Reply-To: 20130920075259.GA6749@mobster.intranet.ufz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2771927170559609561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Sep 2013 09:52:59 +0200
Christian Krause <christian.krause(a)ufz.de> wrote:

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


yes, I've been meaning to take that suggestion out of the tunables all
together for a while, as the value of using ondemand is pretty
questionable.

--===============2771927170559609561==--

