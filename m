Content-Type: multipart/mixed; boundary="===============2610345164102359628=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] powertop putting far too much blame on wifi
Date: Sat, 04 Jan 2014 22:01:26 -0800
Message-ID: <20140105060126.GB11749@merlins.org>
In-Reply-To: 3003802.GAEoeOe9H7@intelfx-laptop
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2610345164102359628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 04:01:27PM +0400, Ivan Shapovalov wrote:
> On Monday 30 December 2013 at 09:36:08, Peter wrote:
> > Hi:
> > =

> > I just got a Lenovo Yoga 2 Pro, and I'mrunning Fedora 20 on it.
> > =

> > I'm trying to get power usage down with powertop, but it is producing s=
ome
> > screwy numbers.   When I run the machine with wifi on, I get idle
> > consumption just under 7.2W but almost 5W of that is assigned to the Wi=
Fi
> > interface, even though there is little traffic. When I turn the wifi of=
f,
> > power consumption only drops to just under 7W.  I don't think that ther=
e is
> > a phantom WiFi that is still consuming power, so it appears to me that
> > powertop is assigning too much blame to the WiFi interface.
> > =

> > Is there away of fixing the assignment of blame here?

Unfortunately, it's not just you. I've reported the same problem
multiple times over the last year, but not heard back from anyone yet
(except you saying you see the same).

I had this on a T530, and now it's even worse on a T540:
The battery reports a discharge rate of 28.5 W
The estimated remaining time is 1 hours, 53 minutes

Summary: 689.5 wakeups/second,  214.0 GPU ops/seconds, 0.0 VFS ops/sec and =
10.4% CPU use

Power est.              Usage       Events/s    Category       Description
  15.3 W     95.8%                      Device         Display backlight
  2.07 W     36.0 ms/s     642.4        Process        /usr/bin/enlightenme=
nt
  115 mW      4.5 ms/s      62.3        Interrupt      PS/2 Touchpad / Keyb=
oard / Mouse
 86.8 mW      0.9 ms/s      37.0        Process        xfce4-terminal -T wi=
ndow11 --role=3Dwindow11 --tab
 71.3 mW     35.4 ms/s      36.2        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -auth /var/r
 51.2 mW      0.8 ms/s      27.9        Timer          hrtimer_wakeup

15W for my backlight at mid brightness? I don't think so.

Last time, I was getting unrealistic values for a USB key, then other
things, it's just all over the map :(

Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============2610345164102359628==--

