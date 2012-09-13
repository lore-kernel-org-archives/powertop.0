Content-Type: multipart/mixed; boundary="===============0802181965310065963=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Warning fixes 1/6] if 0/endif out unused function
 dbg_printf_pevent_info
Date: Thu, 13 Sep 2012 15:46:25 +0300
Message-ID: <20120913124625.GB4894@swordfish.minsk.epam.com>
In-Reply-To: 20120824173217.DE322DFFDB@linda.rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0802181965310065963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/24/12 18:48), Joerg Mayer wrote:
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

Hello,

sorry, did you re-send your patches? for some reason I can't find them in m=
y box.

	-ss

--===============0802181965310065963==--

