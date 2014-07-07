Content-Type: multipart/mixed; boundary="===============7441089384637682125=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 08:25:03 -0700
Message-ID: <53BABBCF.9030601@linux.intel.com>
In-Reply-To: 20140707141825.GA955@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7441089384637682125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> not sure that powertop performs any specific MSRs at all, since most of M=
SRs are
> called correspondingly to c-state flags (has_cXXX), e.g.
>
> __init:
> 	if (model =3D=3D 0x45 || model =3D=3D0x3D)
> 		has_c8c9c10_res =3D 1;
>
>
>
> and later:
>
> 	if (has_c8c9c10_res) {
> 		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
> 		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
> 		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
> 	}
>
> 	and so on.


but if the set is empty, you don't get any data, and the "emulation" side o=
f powertop
is likely a better choice... since there are C states, just not counters.



--===============7441089384637682125==--

