Content-Type: multipart/mixed; boundary="===============5397059860490258790=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 6/8] Stop buffer overflow
Date: Wed, 15 Oct 2014 22:55:06 +0900
Message-ID: <20141015135506.GF1189@swordfish>
In-Reply-To: 20141015125449.GB1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5397059860490258790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 21:54), Sergey Senozhatsky wrote:
> I believe Marc MERLIN has reported a crash due to sprint() buffer overrun
> some (long) time ago. back then my idea (which I never submitted... or
> did I?...) was to add our own lib.cpp::_sprint() [or whatever the name]
> and replace all snprintf/sprint at least for buffers with compile time
> known sizes (aka stack buffers) -- this let us:
> =

>  a) calculate buffer sizeof() within this function and never hit any
> errors when someone change the buffer size from buf[32] to buf[23]
> and forget to update all snprint()s
> =

>  b) handle buffer overruns and append too-small buffers with some
> meaningfull 'watermark' that will give us a hint that that buffer
> probably needs to be extended. (my choise was '...'). e.g.
> =

> show
> 	10	device_name_too_lo...
> =

> instead of
> 	10	device_name_too_lo
> =

> =

> and we remove a great pile of "numbers, numbers, numbers" from the code
> - snprintf(name, 20, "%s", all_power[i]->type());
> + _sprintf(name, "%s", all_power[i]->type());
> =

> =

>  c) review can be easier, because we can make a rule to forbid
> direct sprint()/snprintf() usage (for compile time known buffers).
> =

>  d) I forgot what was my d) point...
> =

> =

> I still think this is not that bad.
> any ideas/objections?


#define _sprintf(a,...)							\
	{								\
		if (((void *)&(a)) =3D=3D ((void *)(a))) {			\
			int bsz =3D sizeof((a));				\
			if (snprintf((a), bsz, __VA_ARGS__) >=3D bsz)	\
				strcat((a) + bsz - 4, "...");		\
		} else {						\
			sprintf((a), __VA_ARGS__);			\
		}							\
	} while (0);


well... I think, this should work for both compile time known buffers and
heap-alloced buffers.


test program:

	char x[10];
	char d[240];
	char *p =3D malloc(10);

	_sprintf(x, "%s", "ttttttttttttttttttttttttttttttttttttttt");
	_sprintf(d, "%s", "ttttttttttttttttttttttttttttttttttttttt");
	/* bug here */
	_sprintf(p, "%s", "ttttttttttttttttttttttttttttttttttttttt");
	printf("%s\n%s\n%s\n", x, d, p);


$ ./a.out =

ttttttttt...
ttttttttttttttttttttttttttttttttttttttt
ttttttttttttttttttttttttttttttttttttttt


just what we want.

	-ss

> =

> > Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> > ---
> >  src/process/do_process.cpp | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > =

> > diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> > index dd7d982..2b5a327 100644
> > --- a/src/process/do_process.cpp
> > +++ b/src/process/do_process.cpp
> > @@ -856,8 +856,8 @@ void process_update_display(void)
> >  =

> >  		format_watts(all_power[i]->Witts(), power, 10);
> >  		if (!show_power)
> > -			strcpy(power, "          ");
> > -		sprintf(name, "%s", all_power[i]->type());
> > +			strncpy(power, "          ", 16);
> > +		snprintf(name, 20, "%s", all_power[i]->type());
> >  =

> >  		align_string(name, 14, 20);
> >  =

> > @@ -867,9 +867,9 @@ void process_update_display(void)
> >  		usage[0] =3D 0;
> >  		if (all_power[i]->usage_units()) {
> >  			if (all_power[i]->usage() < 1000)
> > -				sprintf(usage, "%5.1f%s", all_power[i]->usage(), all_power[i]->usa=
ge_units());
> > +				snprintf(usage, 20, "%5.1f%s", all_power[i]->usage(), all_power[i]=
->usage_units());
> >  			else
> > -				sprintf(usage, "%5i%s", (int)all_power[i]->usage(), all_power[i]->=
usage_units());
> > +				snprintf(usage, 20, "%5i%s", (int)all_power[i]->usage(), all_power=
[i]->usage_units());
> >  		}
> >  =

> >  		align_string(usage, 14, 20);
> > @@ -878,7 +878,7 @@ void process_update_display(void)
> >  		if (!all_power[i]->show_events())
> >  			events[0] =3D 0;
> >  		else if (all_power[i]->events() <=3D 0.3)
> > -			sprintf(events, "%5.2f", all_power[i]->events());
> > +			snprintf(events, 20, "%5.2f", all_power[i]->events());
> >  =

> >  		align_string(events, 12, 20);
> >  		wprintw(win, "%s  %s %s %s %s\n", power, usage, events, name, pretty=
_print(all_power[i]->description(), descr, 128));
> > -- =

> > 2.1.2
> > =

> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> >=20

--===============5397059860490258790==--

