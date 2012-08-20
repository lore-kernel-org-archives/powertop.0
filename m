Content-Type: multipart/mixed; boundary="===============4770953836609296824=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 12:49:17 +0300
Message-ID: <20120820094917.GB3137@swordfish>
In-Reply-To: 50318786.20701@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4770953836609296824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/19/12 17:40), Arjan van de Ven wrote:
> On 8/19/2012 2:57 PM, Sergey Senozhatsky wrote:
> > do not implement get_user_input() in DISABLE_NCURSES builds
> =

> no offence.. but this ifdef madness needs to stop.
> =

> right now, powertop uses ncurses.
> =

> either we want to make it optional, but then this stuff needs to get a lo=
t more modular,
> or we just declare that you need ncurses.
> I'm very much leaning towards the later fwiw...
> =


I agree, and actually I don't like this patch (ifdef stuff also affects pat=
ches I'm currently
working on). it's rather hard to tell how many people will be affected by #=
2 decision, but we
can tell the number for #1 case. =


DISABLE_NCURSES is not that nasty in overall, since it just disables some a=
pplication features,
comparing to, for example, DISABLE_TRYCATCH, which disables standard langua=
ge features for very
much non-obvious reason for someone with no embedded background.

that said, it'll be nice if we forbid DISABLE_NCURSES, but we'll still have=
 ifdefs in
code because of decisions different people made (like no ncurses in some di=
stros or incomplete/buggy
programming language support).


	-ss

--===============4770953836609296824==--

