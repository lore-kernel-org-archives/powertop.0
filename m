Content-Type: multipart/mixed; boundary="===============3936349772605998392=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Thu, 16 Oct 2014 00:19:41 +0900
Message-ID: <20141015151941.GL1189@swordfish>
In-Reply-To: 543E8C47.1050504@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3936349772605998392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 08:01), Arjan van de Ven wrote:
> >>>yes, this is the reason behind this proposal. these patches a) don't c=
heck for
> >>>overrun; b) don't handle overrun. they just shut up the compiler.
> >>
> >>
> >>that's never a good tradeoff.
> >>-D_FORTIFY_SOURCE-2 is an essential compiler feature that has a defined=
 semantic/etc
> >>patches that make behavior worse than that baseline, but shut up some w=
arning, are damage
> >>not value.
> >>
> >
> >well, the macro handles overrun (should probably be snprintf(a, bsz - 1,=
 ...) >=3D bsz)
> >and replaces small part of the buffer with '...\0'. which is, imho, a bi=
t better
> >than `backtrace(); abort();' (I don't think we can benefit from compile-=
time checks
> >of -D_FORTIFY_SOURCE=3D2, only run time ones) for developers that behavi=
our makes
> >sense, for users it's just "seg fault/core dump/whatever"
> =

> well it's that or corruption....

well '...' is just for example. we usually don't see processes
with '...' or devices with '...' in their names. could be any
error indication. e.g. 'ERROR', 'E2BIG', etc.

> the data is still truncated and partial.. and you keep running with it.

which is not that big deal. I agree, that this is not 100% handy.
but suppose there is a process with very long name. long enough to cause
overrun and powertop abort(). and that process is part of a runtime and
it must be alive, etc... and that automatically leaves only one option --
either that process or powertop. and never together.

	-ss

> (this is why many people first think strlcpy is a good idea, and then the=
y think more about it and realize it's not)
> =

>=20

--===============3936349772605998392==--

