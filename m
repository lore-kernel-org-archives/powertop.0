Content-Type: multipart/mixed; boundary="===============8828864657769575429=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 22:39:43 +0300
Message-ID: <20120820193942.GE3137@swordfish>
In-Reply-To: 50327F4D.1010605@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8828864657769575429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/20/12 11:17), Chris Ferron wrote:
> On 08/20/2012 08:34 AM, Arjan van de Ven wrote:
> >On 8/20/2012 8:31 AM, Chris Ferron wrote:
> >>On 08/20/2012 08:21 AM, Arjan van de Ven wrote:
> >>>On 8/20/2012 8:18 AM, Chris Ferron wrote:
> >>>>The only reason we allowed DISABLE_NCURSES in the first place, was to=
 support android. If we don't want to support android out of the box, we ca=
n start removing the crude
> >>>>and android can patch PowerTOP within their distro if they wanted.
> >>>..or for an android build one adds ncurses to the local android.. like=
 libpci and libnl are anyway
> >>>
> >>Yep, another perfectly reasonable option. So lets make ncurses a hard r=
equirement and remove the ifdef's.
> >it's already a runtime option anyway (with --html and co)
> >
> >worst case, if someone really cannot stand this, they can contribute a m=
ini "stub" ncurses that we then
> >compile in for those people who can't cope. But that really should be a =
separate stub (similar to how we
> >do the pevent lib), not a ton of ifdefs in code.
> >
> Sergey good patch but it sounds like the ifdefs for ncurses and
> others should go. I have fixed this, hopefully this also helps you
> out.
> =


Good job! I'm happy that you washed away these ifdefs.

	-ss

--===============8828864657769575429==--

