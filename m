Content-Type: multipart/mixed; boundary="===============5771570790719943018=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 23:18:25 +0900
Message-ID: <20140707141825.GA955@swordfish>
In-Reply-To: 53BAA7E6.8070200@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5771570790719943018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/07/14 07:00), Arjan van de Ven wrote:
> >>Hi,
> >>
> >>thanks a lot for your efforts, I appreciate it.
> >>My co-worker applied your patch and sent me the following output:
> >>
> >>   --------------------------------------------------
> >>/   ./powertop -t 1 --csv
> >>                                             =E2=8F=8E
> >>
> >
> >thanks! ok, so cpu model 0x17 is not listed as a supported one in
> >src/cpu/intel_cpus.cpp:intel_cpu_models[] to begin with, and no
> >C-states are initialized as a result. Let's wait for Intel devs
> >to add cpu/core/package models and corresponding C-states.
> >
> >Alexandra, will you take care of this?
> >
> >	-ss
> >
> >>Loaded 0 prior measurements
> >>Cannot load from file /var/cache/powertop/saved_parameters.powertop
> >>check cpu model 0x17
> >>ERROR: not supported
> >>RAPL device for cpu 0
> >>RAPL device for cpu 0
> >>check cpu model 0x17
> =

> so turns out the L5410 is one generation prior to NHM, and does not suppo=
rt some of the internal MSRs we're using.
> I'll talk to Alexandra (pending vacations, it's that season) to see what =
we can do
> =


not sure that powertop performs any specific MSRs at all, since most of MSR=
s are
called correspondingly to c-state flags (has_cXXX), e.g.

__init:
	if (model =3D=3D 0x45 || model =3D=3D0x3D)
		has_c8c9c10_res =3D 1;



and later:

	if (has_c8c9c10_res) {
		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
	}

	and so on.

	-ss

--===============5771570790719943018==--

