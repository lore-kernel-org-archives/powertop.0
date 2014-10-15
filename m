Content-Type: multipart/mixed; boundary="===============5327414676200365276=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 23:46:39 +0900
Message-ID: <20141015144639.GJ1189@swordfish>
In-Reply-To: 543E85ED.5000408@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5327414676200365276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 07:34), Arjan van de Ven wrote:
> >>>
> >>>well... I think, this should work for both compile time known buffers =
and
> >>>heap-alloced buffers.
> >>>
> >>
> >>this is what __builtin_object_size() is for
> >>(and sprintf already uses that due to -D_FORTIFY_SOURCE=3D2)
> >>
> >
> >yes, but I didn't want to use GCC C extensions (e.g. __builtin_foo). tho=
ugh,
> >clang/llvm probably support them.
> >
> >>btw all these "n" usages in these patches are buggy, they do not leave =
space for a trailing 0
> >>making the problem worse, not better...
> >>esp since with -D_FORTIFY_SOURCE=3D2 the compiler will abort the progra=
m if there's an overflow,
> >>and now you make it silently keep running but corrupt.
> >
> >yes, this is the reason behind this proposal. these patches a) don't che=
ck for
> >overrun; b) don't handle overrun. they just shut up the compiler.
> =

> =

> that's never a good tradeoff.
> -D_FORTIFY_SOURCE-2 is an essential compiler feature that has a defined s=
emantic/etc
> patches that make behavior worse than that baseline, but shut up some war=
ning, are damage
> not value.
> =


well, the macro handles overrun (should probably be snprintf(a, bsz - 1, ..=
.) >=3D bsz)
and replaces small part of the buffer with '...\0'. which is, imho, a bit b=
etter
than `backtrace(); abort();' (I don't think we can benefit from compile-tim=
e checks
of -D_FORTIFY_SOURCE=3D2, only run time ones) for developers that behaviour=
 makes
sense, for users it's just "seg fault/core dump/whatever". so I don't think=
 that
that _sprintf() macro makes the situation even worse. though, I'm not marri=
ed to that
macro.

	-ss

--===============5327414676200365276==--

