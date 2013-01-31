Content-Type: multipart/mixed; boundary="===============8716443283995537507=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH 3/3] process: Get rid of unused
 dbg_printf_pevent_info()
Date: Thu, 31 Jan 2013 15:27:41 -0800
Message-ID: <20130131152741.5e9ecff7@bluebird.jf.intel.com>
In-Reply-To: 1354547600-1743-3-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8716443283995537507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue,  4 Dec 2012 00:13:20 +0900
Namhyung Kim <namhyung(a)gmail.com> wrote:

> This function is not used, just remove it.
> This fixes following warning:
> =

>   CXX    process/powertop-do_process.o
> process/do_process.cpp:190: warning: =E2=80=98void
> dbg_printf_pevent_info(event_format*, pevent_record*)=E2=80=99 defined but
> not used
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

> -static void dbg_printf_pevent_info(struct event_format *event,
> struct pevent_record *rec) -{
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
>  static char * get_pevent_field_str(void *trace, struct event_format
> *event, struct format_field *field) {
>  	unsigned long long offset, len;

Applied, thanks.

Kristen

--===============8716443283995537507==--

