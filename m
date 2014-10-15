Content-Type: multipart/mixed; boundary="===============0887056269549568316=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 23:21:30 +0900
Message-ID: <20141015142130.GI1189@swordfish>
In-Reply-To: 543E7F2E.7020408@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0887056269549568316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 07:05), Arjan van de Ven wrote:
> On 10/15/2014 6:55 AM, Sergey Senozhatsky wrote:
> >On (10/15/14 21:54), Sergey Senozhatsky wrote:
> >>I believe Marc MERLIN has reported a crash due to sprint() buffer overr=
un
> >>some (long) time ago. back then my idea (which I never submitted... or
> >>did I?...) was to add our own lib.cpp::_sprint() [or whatever the name]
> >>and replace all snprintf/sprint at least for buffers with compile time
> >>known sizes (aka stack buffers) -- this let us:
> >>
> >>  a) calculate buffer sizeof() within this function and never hit any
> >>errors when someone change the buffer size from buf[32] to buf[23]
> >>and forget to update all snprint()s
> >>
> >>  b) handle buffer overruns and append too-small buffers with some
> >>meaningfull 'watermark' that will give us a hint that that buffer
> >>probably needs to be extended. (my choise was '...'). e.g.
> >>
> >>show
> >>	10	device_name_too_lo...
> >>
> >>instead of
> >>	10	device_name_too_lo
> >>
> >>
> >>and we remove a great pile of "numbers, numbers, numbers" from the code
> >>- snprintf(name, 20, "%s", all_power[i]->type());
> >>+ _sprintf(name, "%s", all_power[i]->type());
> >>
> >>
> >>  c) review can be easier, because we can make a rule to forbid
> >>direct sprint()/snprintf() usage (for compile time known buffers).
> >>
> >>  d) I forgot what was my d) point...
> >>
> >>
> >>I still think this is not that bad.
> >>any ideas/objections?
> >
> >
> >#define _sprintf(a,...)							\
> >	{								\
> >		if (((void *)&(a)) =3D=3D ((void *)(a))) {			\
> >			int bsz =3D sizeof((a));				\
> >			if (snprintf((a), bsz, __VA_ARGS__) >=3D bsz)	\
> >				strcat((a) + bsz - 4, "...");		\
> >		} else {						\
> >			sprintf((a), __VA_ARGS__);			\
> >		}							\
> >	} while (0);
> >
> >
> >well... I think, this should work for both compile time known buffers and
> >heap-alloced buffers.
> >
> =

> this is what __builtin_object_size() is for
> (and sprintf already uses that due to -D_FORTIFY_SOURCE=3D2)
> =


yes, but I didn't want to use GCC C extensions (e.g. __builtin_foo). though,
clang/llvm probably support them.

> btw all these "n" usages in these patches are buggy, they do not leave sp=
ace for a trailing 0
> making the problem worse, not better...
> esp since with -D_FORTIFY_SOURCE=3D2 the compiler will abort the program =
if there's an overflow,
> and now you make it silently keep running but corrupt.

yes, this is the reason behind this proposal. these patches a) don't check =
for
overrun; b) don't handle overrun. they just shut up the compiler.

	-ss

> =

> =

>=20

--===============0887056269549568316==--

