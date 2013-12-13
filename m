Content-Type: multipart/mixed; boundary="===============2931219356807824366=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 29/31] tunables: removed on-demand cpu
 frequency governor
Date: Fri, 13 Dec 2013 10:43:49 -0800
Message-ID: <20131213104349.47f57798@kcaccard-desk.amr.corp.intel.com>
In-Reply-To: 20131210202752.GE2422@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2931219356807824366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Dec 2013 23:27:52 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> On (11/18/13 12:27), Alexandra Yates wrote:
> > Remove suggestion to use the on-demand cpu frequency governor from
> > PowerTOP tunables as that is no longer a good suggestion since the
> > P-State driver is the Intel recommended replacement.
> =

> I need to think about it.
> =

> IIRC, in this email
> https://lists.01.org/pipermail/powertop/2013-September/000952.html
> =

> Christian Krause wrote:
> =

> >
> >tunables show:
> >
> >    Bad           Using 'ondemand' cpufreq governor
> >
> >but: I don't have a ondemand cpufreq governor -- that is what I just fou=
nd out: since some kernel
> >versions ago the intel_pstate driver is the default for my cpu:
> >
> >    # zgrep PSTATE /proc/config.gz
> >    CONFIG_X86_INTEL_PSTATE=3Dy
> >
> >    # cat /sys/devices/system/cpu/cpu[0-9]*/cpufreq/scaling_driver
> >    intel_pstate
> >    intel_pstate
> >    intel_pstate
> >    intel_pstate
> >
> =

> =

> =

> I'm not really sure why we delete cpufreq code and kill this feature.
> =

> =

> =

> for example:
> =

> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
> ondemand performance
> =

> $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> performance
> =

> =

> =

> powertop can help here
> =

> =

> 	-ss
> =


Actually, in most cases using performance would be preferred over
ondemand unless you are on ancient hardware.  You may be interested in
reading this article which sort of summarizes the situation.

http://www.phoronix.com/scan.php?page=3Dnews_item&px=3DMTM3NDQ



--===============2931219356807824366==--

