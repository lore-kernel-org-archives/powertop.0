Content-Type: multipart/mixed; boundary="===============7128387425237102065=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] tuning: print executed toggle script
Date: Wed, 09 Oct 2013 17:33:11 +0300
Message-ID: <20131009143311.GC2305@swordfish.minsk.epam.com>
In-Reply-To: 1381326875.9101.52.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7128387425237102065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/09/13 15:54), Magnus Fromreide wrote:
> On Wed, 2013-10-09 at 16:17 +0300, Sergey Senozhatsky wrote:
> > report executed toggle_script back to user via ui_notify_user().
> > =

> > Example:
> >  Execute: echo 'auto' > '/sys/bus/pci/devices/0000:00:1c.1/power/contro=
l';
> >  Execute: echo 'on' > '/sys/bus/pci/devices/0000:00:1c.1/power/control';
> > =

> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > =

> > ---
> >  src/tuning/tuning.cpp | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > =

> > diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> > index ff3d715..5adcbfe 100644
> > --- a/src/tuning/tuning.cpp
> > +++ b/src/tuning/tuning.cpp
> > @@ -141,11 +141,15 @@ void tuning_window::repaint(void)
> >  void tuning_window::cursor_enter(void)
> >  {
> >  	class tunable *tun;
> > -
> > +	const char *toggle_script;
> >  	tun =3D all_tunables[cursor_pos];
> >  	if (!tun)
> >  		return;
> > +	/** device will change its state so need to store toggle script before
> > +	 * we toggle()*/
> > +	toggle_script =3D tun->toggle_script();
> >  	tun->toggle();
> > +	ui_notify_user("Execute: %s\n", toggle_script);
> >  }
> >  =

> >  static bool tunables_sort(class tunable * i, class tunable * j)
> =

> This only shows the toggle script when you run it, right?
> =

> What about the following:
> =

> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> index ff3d715..505274c 100644
> --- a/src/tuning/tuning.cpp
> +++ b/src/tuning/tuning.cpp
> @@ -119,7 +119,11 @@ static void __tuning_update_display(int cursor_pos)
>  			wattrset(win, A_REVERSE);
>  			wprintw(win, ">> ");
>  		}
> -		wprintw(win, "%s  %s\n", _(res), _(desc));
> +                if (all_tunables[i]->good_bad() !=3D TUNE_BAD)
> +                        wprintw(win, "%s  %s\n", _(res), _(desc));
> +                else
> +                        wprintw(win, "%s  %s  %s\n", _(res), _(desc),
> +                                all_tunables[i]->toggle_script());
>  	}
>  }
>  =

> which shows it in the list of bad tunables.
> =

> Maybe both are useful as my version have the disadvantage of not showing
> anything after the script is executed.

well, I thought about that and decided to go with "I did X" notification
rather than "I will do X". the idea is that user request some action and
we report back what we did.

	-ss

> /MF
> =

> (attached a copy of the patch for easier applying)

> diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
> index ff3d715..505274c 100644
> --- a/src/tuning/tuning.cpp
> +++ b/src/tuning/tuning.cpp
> @@ -119,7 +119,11 @@ static void __tuning_update_display(int cursor_pos)
>  			wattrset(win, A_REVERSE);
>  			wprintw(win, ">> ");
>  		}
> -		wprintw(win, "%s  %s\n", _(res), _(desc));
> +                if (all_tunables[i]->good_bad() !=3D TUNE_BAD)
> +                        wprintw(win, "%s  %s\n", _(res), _(desc));
> +                else
> +                        wprintw(win, "%s  %s  %s\n", _(res), _(desc),
> +                                all_tunables[i]->toggle_script());
>  	}
>  }
>  =


> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============7128387425237102065==--

