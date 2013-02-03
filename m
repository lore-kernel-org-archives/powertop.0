Content-Type: multipart/mixed; boundary="===============3904010106919282821=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] src/process/do_process.cpp: Add suffix `u` to
 `4294967295` to signify an unsigned number
Date: Sun, 03 Feb 2013 18:10:12 +0300
Message-ID: <20130203151012.GB2470@swordfish>
In-Reply-To: 1359843789.5545.21.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3904010106919282821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/02/13 23:23), Paul Menzel wrote:
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
>           CXX    process/powertop-do_process.o
>         process/do_process.cpp:595:3: warning: this decimal constant is u=
nsigned only in ISO C90 [enabled by default]
>         [=E2=80=A6]
> =

> Adding the suffix to the constant gets rid of the warning [1].
> =

> [1] http://stackoverflow.com/questions/2347936/cant-get-rid-of-this-decim=
al-constant-is-unsigned-only-in-iso-c90-warning
> ---
>  src/process/do_process.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index 322ad4c..3bb1573 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -579,7 +579,7 @@ void perf_process_bundle::handle_trace_point(void *tr=
ace, int cpu, uint64_t time
>  	}
>  	else if (strcmp(event->name, "cpu_idle") =3D=3D 0) {
>  		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
> -		if (val =3D=3D 4294967295)
> +		if (val =3D=3D 4294967295u)

NACK.

the same point: cpu_idle tracepoint defined as    =


         TP_PROTO(unsigned int state, unsigned int cpu_id)
please use `=3D=3D (unsigned int)-1'.
   =


+ we need there `-1' return code check from pevent_get_field_val() before
we test val.

               =

        -ss


>  			consume_blame(cpu);
>  		else
>  			set_wakeup_pending(cpu);
> -- =

> 1.7.10.4



> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============3904010106919282821==--

