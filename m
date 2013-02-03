Content-Type: multipart/mixed; boundary="===============7050685154083624125=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: Re: [Powertop] [PATCH] src/cpu/cpu.cpp: Add suffix `u` to
 `4294967295` to signify an unsigned number
Date: Sun, 03 Feb 2013 23:39:24 +0100
Message-ID: <1359931164.5132.5.camel@mattotaupa>
In-Reply-To: 20130203150720.GA2470@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7050685154083624125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Sergey,


thank you for your review!


Am Sonntag, den 03.02.2013, 18:07 +0300 schrieb Sergey Senozhatsky:
> On (02/02/13 23:19), Paul Menzel wrote:
> > Date: Sat, 2 Feb 2013 22:27:58 +0100
> > =

> > The C++ compiler
> > =

> >         $ g++ --version
> >         g++-4.7.real (Debian 4.7.2-15) 4.7.2
> >         Copyright (C) 2012 Free Software Foundation, Inc.
> >         This is free software; see the source for copying conditions.  =
There is NO
> >         warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU=
LAR PURPOSE.
> > =

> > reports the following warning.
> > =

> >         $ make
> >         [=E2=80=A6]
> >           CXX    cpu/powertop-cpu.o
> >         cpu/cpu.cpp:776:3: warning: this decimal constant is unsigned o=
nly in ISO C90 [enabled by default]
> >         [=E2=80=A6]
> > =

> > Adding the suffix to the constant gets rid of the warning [1].
> > =

> > [1] http://stackoverflow.com/questions/2347936/cant-get-rid-of-this-dec=
imal-constant-is-unsigned-only-in-iso-c90-warning
> > ---
> >  src/cpu/cpu.cpp |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> > index f875e45..401bade 100644
> > --- a/src/cpu/cpu.cpp
> > +++ b/src/cpu/cpu.cpp
> > @@ -797,7 +797,7 @@ void perf_power_bundle::handle_trace_point(void *tr=
ace, int cpunr, uint64_t time
> >                          exit(-1);
> >                  }
> >  =

> > -		if (val =3D=3D 4294967295)
> > +		if (val =3D=3D 4294967295u)
> =

> NACK.
> =

> cpu_idle tracepoint defined as
> =

> 	 TP_PROTO(unsigned int state, unsigned int cpu_id)
> =

> please use `=3D=3D (unsigned int)-1', which is, by the way, more clear th=
an 4294967295.

Could you please elaborate your answer as I do not understand it. I
could not find that `TP_PROTO` definition in the PowerTOP source using
`git grep`.

Also beforehand `val` is defined as follows.

	unsigned long long val;


Thanks and sorry for not understanding it,

Paul

--===============7050685154083624125==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxFTzV4d0FDZ2tRUFgxYUsyd09IVmdEb2dDZlFhRC9PZ0U5
VjZmdTNCbkxxZHJXOVBMTQozQTBBbjF3V25ISU9rODZFVm9ZenpyYXU1ZStMYzRWVgo9OTY0aAot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============7050685154083624125==--

