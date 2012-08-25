Content-Type: multipart/mixed; boundary="===============8913019181012556123=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Warning fixes 1/6] if 0/endif out unused function
 dbg_printf_pevent_info
Date: Sat, 25 Aug 2012 12:26:51 +0300
Message-ID: <20120825092651.GA3444@swordfish>
In-Reply-To: 20120824173217.DE322DFFDB@linda.rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8913019181012556123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/24/12 18:48), Joerg Mayer wrote:
> Is someone intending to use it or should it be removed instead?
> =

> Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
> =

> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index cb7c672..3db5331 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -186,6 +186,7 @@ int dont_blame_me(char *comm)
>  	return 0;
>  }
>  =

> +#if 0
>  static void dbg_printf_pevent_info(struct event_format *event, struct pe=
vent_record *rec)
>  {
>  	static struct trace_seq s;
> @@ -198,6 +199,7 @@ static void dbg_printf_pevent_info(struct event_forma=
t *event, struct pevent_rec
>  	fprintf(stderr, "%.*s", s.len, s.buffer);
>  	trace_seq_destroy(&s);
>  }
> +#endif
>  =

>  static char * get_pevent_field_str(void *trace, struct event_format *eve=
nt, struct format_field *field)
>  {
> -- =


This one could be helpful for debugging. Let's remove it, since the appropr=
iate place
for this sort of routines is within pevent, to my mind.


	-ss

--===============8913019181012556123==--

