Content-Type: multipart/mixed; boundary="===============5196029736389150050=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Tue, 08 Jul 2014 20:05:42 +0900
Message-ID: <20140708110542.GC947@swordfish>
In-Reply-To: 53BABBCF.9030601@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5196029736389150050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/07/14 08:25), Arjan van de Ven wrote:
> >not sure that powertop performs any specific MSRs at all, since most of =
MSRs are
> >called correspondingly to c-state flags (has_cXXX), e.g.
> >
> >__init:
> >	if (model =3D=3D 0x45 || model =3D=3D0x3D)
> >		has_c8c9c10_res =3D 1;
> >
> >
> >
> >and later:
> >
> >	if (has_c8c9c10_res) {
> >		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
> >		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
> >		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
> >	}
> >
> >	and so on.
> =

> =

> but if the set is empty, you don't get any data, and the "emulation" side=
 of powertop
> is likely a better choice... since there are C states, just not counters.
> =


looks like powertop checks C6 state `get_msr(number, MSR_PKG_C6_RESIDENCY)'=
 in start
and end measurement for any intel cpu, along with `get_msr(first_cpu, MSR_T=
SC)'. anyway,
need to investigate. the output that Valentin sees is rather strange, sayin=
g that cpu0
is 138% Idle.

	          CPU 0
	Idle      138%

	          CPU 2
	Idle      111,7%

	          CPU 1
	Idle      111,7%

	          CPU 3
	Idle      111,7%

	-ss

--===============5196029736389150050==--

