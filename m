Content-Type: multipart/mixed; boundary="===============7362864774020279337=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] How to decrease PS/2 Touchpad / Mouse wakeups?
Date: Sun, 20 Jul 2014 18:53:24 -0700
Message-ID: <20140721015324.GE16031@merlins.org>
In-Reply-To: 20140719165128.GB26881@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7362864774020279337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2014 at 09:51:28AM -0700, Marc MERLIN wrote:
> On a thinkpad T540p, I see:
>   4.10 W      6.6 ms/s     196.3        Interrupt      PS/2 Touchpad / Ke=
yboard / Mouse
> =

> Even if the 4W figure is wrong, 200 wakeups for a touchpad and keyboard
> seems totally ridiculous.
> =

> What can be done to decrease those?

I did more tests, if I do not touch my trackpoint and touchpad, this
doesn't register in powertop, as in I get no interrupts.
I can actually use the keyboard all day long, and that's fine.

The moment I touch the trackpoint, I get:
  3.83 W      6.5 ms/s     169.9        Interrupt      PS/2 Touchpad / Keyb=
oard / Mouse

If I use the touchpad, I get:
  4.46 W      7.2 ms/s     199.8        Interrupt      PS/2 Touchpad / Keyb=
oard / Mouse

Are the drivers really that bad?

Is there any way around this?

Thanks,
Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============7362864774020279337==--

