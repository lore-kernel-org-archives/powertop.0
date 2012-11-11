Content-Type: multipart/mixed; boundary="===============0040791914939205629=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Sun, 11 Nov 2012 22:49:46 +0300
Message-ID: <20121111194946.GB3851@swordfish>
In-Reply-To: 20121111194528.GA3851@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0040791914939205629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/11/12 22:45), Sergey Senozhatsky wrote:
> hm, that's something. seems like enumerate_cpus(); failed
> because perf_bundle was NULL in cpu by the time of =

> 	perf_events->start();
> =

> call, but it did not crashed on any of enumerate_cpus()
> =

> 332         perf_events =3D new perf_power_bundle();
> 333 =

> 334         if (!perf_events->add_event("power:cpu_idle")){
> 335                 perf_events->add_event("power:power_start");
> 336                 perf_events->add_event("power:power_end");
> 337         }
> 338         if (!perf_events->add_event("power:cpu_frequency"))
> 339                 perf_events->add_event("power:power_frequency");
> =

> =

> so it leaves only one suspect: enumerate_cpus()
> =

> 269         file.open("/proc/cpuinfo",  ios::in);
> 270 =

> 271         if (!file)
> 272                 return;
> =

> =

> =

> is that happeninig all the time? =

> a *very* stupid question - do you have /proc/cpuinfo file?
> =


sorry for mistakes and typos.



 "# CONFIG_PROC_FS is not set" case?
 =


	-ss

--===============0040791914939205629==--

