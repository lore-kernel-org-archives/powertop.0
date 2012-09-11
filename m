Content-Type: multipart/mixed; boundary="===============1518456329306078953=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] PowerTOP UI navigation enhancement(v3).
Date: Wed, 12 Sep 2012 01:37:44 +0300
Message-ID: <20120911223744.GE2955@swordfish.minsk.epam.com>
In-Reply-To: CAMFVxVikj+FrNAMzphyu-6Y1_DEPo8_s=2a3JspQjL2FvYLxNA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1518456329306078953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/11/12 14:59), Ferron, Chris E wrote:
> >
> > I can scroll down/right as much as I want (can), even to (signed int)-1.
> > the biggest in LINES window seems to be `Overview'. is that window limi=
ted to max pid?
> >
> The Window is created to size of terminal, but PowerTOP creates a
> winpad at 1000x1000. So the real max is the actual max of the pad for
> PowerTOP. Overview can be big in terms of lines drawn to the pad, but
> so can tunables, but I tend to agree Overview will have the most lines
> for the most part. Didn't really think of the implications of max_pid
> or wrapping, but im thinking it may not be a big issue overall.
>

agree.

 =

> >
> ya, this should be tightened regardless
> >         -ss
> So tuning and comments aside, will this fix your intrest to truncate
> for terminal sizing issues?
> =


absolutely, I like the patch. great job!


	-ss

--===============1518456329306078953==--

