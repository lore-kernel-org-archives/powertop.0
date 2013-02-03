Content-Type: multipart/mixed; boundary="===============5489346232780717036=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] src/cpu/cpu.cpp: Add suffix `u` to
 `4294967295` to signify an unsigned number
Date: Sun, 03 Feb 2013 18:07:20 +0300
Message-ID: <20130203150720.GA2470@swordfish>
In-Reply-To: 1359843562.5545.18.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5489346232780717036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/02/13 23:19), Paul Menzel wrote:
> Date: Sat, 2 Feb 2013 22:27:58 +0100
> =

> The C++ compiler
> =

>         $ g++ --version
>         g++-4.7.real (Debian 4.7.2-15) 4.7.2
>         Copyright (C) 2012 Free Software Foundation, Inc.
>         This is free software; see the source for copying conditions.  Th=
ere is NO
>         warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULA=
R PURPOSE.
> =

> reports the following warning.
> =

>         $ make
>         [=E2=80=A6]
>           CXX    cpu/powertop-cpu.o
>         cpu/cpu.cpp:776:3: warning: this decimal constant is unsigned onl=
y in ISO C90 [enabled by default]
>         [=E2=80=A6]
> =

> Adding the suffix to the constant gets rid of the warning [1].
> =

> [1] http://stackoverflow.com/questions/2347936/cant-get-rid-of-this-decim=
al-constant-is-unsigned-only-in-iso-c90-warning
> ---
>  src/cpu/cpu.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index f875e45..401bade 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -797,7 +797,7 @@ void perf_power_bundle::handle_trace_point(void *trac=
e, int cpunr, uint64_t time
>                          exit(-1);
>                  }
>  =

> -		if (val =3D=3D 4294967295)
> +		if (val =3D=3D 4294967295u)

NACK.

cpu_idle tracepoint defined as

	 TP_PROTO(unsigned int state, unsigned int cpu_id)

please use `=3D=3D (unsigned int)-1', which is, by the way, more clear than=
 4294967295.

	-ss


>  			cpu->go_unidle(time);
>  		else
>  			cpu->go_idle(time);
> -- =

> 1.7.10.4



> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============5489346232780717036==--

