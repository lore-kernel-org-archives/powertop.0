Content-Type: multipart/mixed; boundary="===============7804045020534422961=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 08:01:27 -0700
Message-ID: <543E8C47.1050504@linux.intel.com>
In-Reply-To: 20141015144639.GJ1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7804045020534422961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>>> yes, this is the reason behind this proposal. these patches a) don't ch=
eck for
>>> overrun; b) don't handle overrun. they just shut up the compiler.
>>
>>
>> that's never a good tradeoff.
>> -D_FORTIFY_SOURCE-2 is an essential compiler feature that has a defined =
semantic/etc
>> patches that make behavior worse than that baseline, but shut up some wa=
rning, are damage
>> not value.
>>
>
> well, the macro handles overrun (should probably be snprintf(a, bsz - 1, =
...) >=3D bsz)
> and replaces small part of the buffer with '...\0'. which is, imho, a bit=
 better
> than `backtrace(); abort();' (I don't think we can benefit from compile-t=
ime checks
> of -D_FORTIFY_SOURCE=3D2, only run time ones) for developers that behavio=
ur makes
> sense, for users it's just "seg fault/core dump/whatever"

well it's that or corruption....
the data is still truncated and partial.. and you keep running with it.

(this is why many people first think strlcpy is a good idea, and then they =
think more about it and realize it's not)



--===============7804045020534422961==--

