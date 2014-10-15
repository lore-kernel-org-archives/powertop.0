Content-Type: multipart/mixed; boundary="===============8625172825652881868=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Thu, 16 Oct 2014 00:01:50 +0900
Message-ID: <20141015150150.GK1189@swordfish>
In-Reply-To: 20141015144639.GJ1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8625172825652881868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 23:46), Sergey Senozhatsky wrote:
> > >>
> > >>this is what __builtin_object_size() is for
> > >>(and sprintf already uses that due to -D_FORTIFY_SOURCE=3D2)
> > >>
> > >
> > >yes, but I didn't want to use GCC C extensions (e.g. __builtin_foo). t=
hough,
> > >clang/llvm probably support them.
> > >
> > >>btw all these "n" usages in these patches are buggy, they do not leav=
e space for a trailing 0
> > >>making the problem worse, not better...
> > >>esp since with -D_FORTIFY_SOURCE=3D2 the compiler will abort the prog=
ram if there's an overflow,
> > >>and now you make it silently keep running but corrupt.
> > >
> > >yes, this is the reason behind this proposal. these patches a) don't c=
heck for
> > >overrun; b) don't handle overrun. they just shut up the compiler.
> > =

> > =

> > that's never a good tradeoff.
> > -D_FORTIFY_SOURCE-2 is an essential compiler feature that has a defined=
 semantic/etc
> > patches that make behavior worse than that baseline, but shut up some w=
arning, are damage
> > not value.
> > =

> =

> well, the macro handles overrun (should probably be snprintf(a, bsz - 1, =
...) >=3D bsz)
> and replaces small part of the buffer with '...\0'. which is, imho, a bit=
 better
> than `backtrace(); abort();' (I don't think we can benefit from compile-t=
ime checks
> of -D_FORTIFY_SOURCE=3D2, only run time ones) for developers that behavio=
ur makes
> sense, for users it's just "seg fault/core dump/whatever". so I don't thi=
nk that
> that _sprintf() macro makes the situation even worse. though, I'm not mar=
ried to that
> macro.
> =


I think I recall my missing "d) point":
-- bug fixing is harder with only -D_FORTIFY_SOURCE=3D2 behaviour for strip=
-ed
ELFs (not sure how often distros do this. in embedded may be. I guess).

	-ss

--===============8625172825652881868==--

