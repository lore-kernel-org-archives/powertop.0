Content-Type: multipart/mixed; boundary="===============5600891618258740967=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 18:31:05 +0300
Message-ID: <20120820153105.GD3137@swordfish>
In-Reply-To: 50325563.6040605@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5600891618258740967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/20/12 08:18), Chris Ferron wrote:
> >>right now, powertop uses ncurses.
> >>
> >>either we want to make it optional, but then this stuff needs to get a =
lot more modular,
> >>or we just declare that you need ncurses.
> >>I'm very much leaning towards the later fwiw...
> >>
> >I agree, and actually I don't like this patch (ifdef stuff also affects =
patches I'm currently
> >working on). it's rather hard to tell how many people will be affected b=
y #2 decision, but we
> >can tell the number for #1 case.
> >
> >DISABLE_NCURSES is not that nasty in overall, since it just disables som=
e application features,
> >comparing to, for example, DISABLE_TRYCATCH, which disables standard lan=
guage features for very
> >much non-obvious reason for someone with no embedded background.
> >
> >that said, it'll be nice if we forbid DISABLE_NCURSES, but we'll still h=
ave ifdefs in
> >code because of decisions different people made (like no ncurses in some=
 distros or incomplete/buggy
> >programming language support).
> >
> >
> >	-ss
> The only reason we allowed DISABLE_NCURSES in the first place, was to
> support android. If we don't want to support android out of the box,
> we can start removing the crude and android can patch PowerTOP within
> their distro if they wanted.
> =

> All other ifdef's need to be scrutinized.
> -C
> =


as far as I concerned, android build require several defines:
 -- DISABLE_NCURSES
 -- DISABLE_TRYCATCH
 -- DISABLE_I18N
 -- perhaps, some more

/* patch series by John Mathew */


	-ss

--===============5600891618258740967==--

