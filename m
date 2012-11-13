Content-Type: multipart/mixed; boundary="===============2240647536535792931=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Tue, 13 Nov 2012 22:28:39 +0300
Message-ID: <20121113192839.GB3314@swordfish>
In-Reply-To: 179380942.45470.1352685662441.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2240647536535792931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/12/12 02:01), cshanahan(a)comcast.net wrote:
> > hm, that's something. seems like enumerate_cpus(); failed
> > because perf_bundle was NULL in cpu by the time of =

> >	perf_events->start();
> >
> > call, but it did not crashed on any of enumerate_cpus()
> >
> > 332         perf_events =3D new perf_power_bundle();
> > 333 =

> > 334         if (!perf_events->add_event("power:cpu_idle")){
> > 335                 perf_events->add_event("power:power_start");
> > 336                 perf_events->add_event("power:power_end");
> > 337         }
> > 338         if (!perf_events->add_event("power:cpu_frequency"))
> > 339                 perf_events->add_event("power:power_frequency");
> >
> >
> > so it leaves only one suspect: enumerate_cpus()
> >
> > 269         file.open("/proc/cpuinfo",  ios::in);
> > 270 =

> > 271         if (!file)
> > 272                 return;
> >
> >
> > is that happeninig all the time?
> =

> Yes. Happens all the time.
> =

>

hm. this is very-very early stages of calibration process, and it's very
unlikely that powertop has done something to your system.

 =

> > a *very* stupid question - do you have /proc/cpuinfo file?
> =

> Yes, I do.
> =

> Any idea about my problem?
> =


are you talking about WIFI button?


may I ask you to do two things

	$ ls  /proc/cpuinfo
and
	$ cat /proc/cpuinfo


	-ss

--===============2240647536535792931==--

