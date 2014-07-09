Content-Type: multipart/mixed; boundary="===============5757220397987381539=="
MIME-Version: 1.0
From: Valentin Hoebel <valentin.hoebel at nfon.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Wed, 09 Jul 2014 17:30:18 +0200
Message-ID: <53BD600A.7020304@nfon.com>
In-Reply-To: 20140708110542.GC947@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5757220397987381539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

not sure if this is an important information or not, but I am getting =

the "138% idle" behaviour for all of the systems where reading out the =

current CPU frequencies via PowerTop is not possible.

Best regards
Valentin


Am 08.07.2014 13:05, schrieb Sergey Senozhatsky:
> On (07/07/14 08:25), Arjan van de Ven wrote:
>>> not sure that powertop performs any specific MSRs at all, since most of=
 MSRs are
>>> called correspondingly to c-state flags (has_cXXX), e.g.
>>>
>>> __init:
>>> 	if (model =3D=3D 0x45 || model =3D=3D0x3D)
>>> 		has_c8c9c10_res =3D 1;
>>>
>>>
>>>
>>> and later:
>>>
>>> 	if (has_c8c9c10_res) {
>>> 		c8_before    =3D get_msr(number, MSR_PKG_C8_RESIDENCY);
>>> 		c9_before    =3D get_msr(number, MSR_PKG_C9_RESIDENCY);
>>> 		c10_before    =3D get_msr(number, MSR_PKG_C10_RESIDENCY);
>>> 	}
>>>
>>> 	and so on.
>>
>>
>> but if the set is empty, you don't get any data, and the "emulation" sid=
e of powertop
>> is likely a better choice... since there are C states, just not counters.
>>
>
> looks like powertop checks C6 state `get_msr(number, MSR_PKG_C6_RESIDENCY=
)' in start
> and end measurement for any intel cpu, along with `get_msr(first_cpu, MSR=
_TSC)'. anyway,
> need to investigate. the output that Valentin sees is rather strange, say=
ing that cpu0
> is 138% Idle.
>
> 	          CPU 0
> 	Idle      138%
>
> 	          CPU 2
> 	Idle      111,7%
>
> 	          CPU 1
> 	Idle      111,7%
>
> 	          CPU 3
> 	Idle      111,7%
>
> 	-ss
>

-- =

Mit freundlichen Gr=C3=BC=C3=9Fen

Valentin H=C3=B6bel
Cloud Architect

NFON AG
Leonrodstra=C3=9Fe 68
D-80636 M=C3=BCnchen

Telefon +49 89 45300-407
valentin.hoebel(a)nfon.com
www.nfon.com

Support-Hotline der NFON AG
Telefon 0800 - 6366 555

Die gesetzlichen Pflichtangaben finden Sie unter =

https://www.nfon.net/pflichtangaben

--===============5757220397987381539==--

