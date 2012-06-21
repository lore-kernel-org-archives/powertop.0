Content-Type: multipart/mixed; boundary="===============3913943236511133219=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] Use printf, not sprintf,
 to print messages to stdout.
Date: Thu, 21 Jun 2012 21:48:56 +0200
Message-ID: <1340308136.14495.4.camel@sara>
In-Reply-To: 1715014.OogSz8kVBe@al
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3913943236511133219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-21 at 21:42 +0200, Lekensteyn wrote:
> On Thursday 21 June 2012 22:14:41 Sergey Senozhatsky wrote:
> > On (06/16/12 18:14), Magnus Fromreide wrote:
> > > This undos the last printf->sprintf change from 8fd54ace.
> > > =

> > > Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
> > > ---
> > > =

> > >  src/main.cpp |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/src/main.cpp b/src/main.cpp
> > > index 880d745..a2d8700 100644
> > > --- a/src/main.cpp
> > > +++ b/src/main.cpp
> > > @@ -229,7 +229,7 @@ void one_measurement(int seconds, char *workload)
> > > =

> > >  void out_of_memory()
> > >  {
> > >  =

> > >  	reset_display();
> > > =

> > > -	sprintf("%s...\n",_("PowerTOP is out of memory. PowerTOP is =

> Aborting"));
> > > +	printf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting=
"));
> > > =

> > >  	abort();
> > >  =

> > >  }
> > > =

> > > @@ -458,7 +458,7 @@ int main(int argc, char **argv)
> > > =

> > >  #ifndef DISABLE_NCURSES
> > >  =

> > >  	endwin();
> > >  =

> > >  #endif
> > > =

> > > -	sprintf("%s\n", _("Leaving PowerTOP"));
> > > +	printf("%s\n", _("Leaving PowerTOP"));
> > > =

> > >  	end_process_data();
> > >  	clear_process_data();
> > =

> > Oh, good catch!
> > =

> > Looks like changes were introduced by commit
> > 8fd54ace0a398cd155bf0af620c85d0105778f6a.
> =

> That commit contains more abuse of sprintf:
> https://github.com/fenrus75/powertop/commit/8fd54ace0a398cd155bf0af620c85=
d0105778f6a#L1L102
> Writing to a constant string is not going to work, eh?

Yes, lots of sprintf abuse there but most of it is fixed in other
patches. I think these are the only ones left.

/MF


--===============3913943236511133219==--

