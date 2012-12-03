Content-Type: multipart/mixed; boundary="===============6263551969486019920=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 3/3] process: Get rid of unused
 dbg_printf_pevent_info()
Date: Mon, 03 Dec 2012 19:16:21 +0300
Message-ID: <20121203161621.GA2623@swordfish>
In-Reply-To: 1354547600-1743-3-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6263551969486019920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/04/12 00:13), Namhyung Kim wrote:
> This function is not used, just remove it.
> This fixes following warning:
> =

>   CXX    process/powertop-do_process.o
> process/do_process.cpp:190: warning: =E2=80=98void dbg_printf_pevent_info=
(event_format*, pevent_record*)=E2=80=99 defined but not used
> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/process/do_process.cpp |   13 -------------
>  1 file changed, 13 deletions(-)
> =

> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index 6ac0fae..a07b3f3 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -187,19 +187,6 @@ int dont_blame_me(char *comm)
>  	return 0;
>  }
>  =

> -static void dbg_printf_pevent_info(struct event_format *event, struct pe=
vent_record *rec)
> -{
> -	static struct trace_seq s;
> -
> -	event->pevent->print_raw =3D 1;
> -	trace_seq_init(&s);
> -	pevent_event_info(&s, event, rec);
> -	trace_seq_putc(&s, '\n');
> -	trace_seq_terminate(&s);
> -	fprintf(stderr, "%.*s", s.len, s.buffer);
> -	trace_seq_destroy(&s);
> -}
> -
>  static char * get_pevent_field_str(void *trace, struct event_format *eve=
nt, struct format_field *field)
>  {
>  	unsigned long long offset, len;


this one looks good to me.

	-ss

--===============6263551969486019920==--

