Content-Type: multipart/mixed; boundary="===============6013393162342039237=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: Re: [Powertop] powertop putting far too much blame on wifi
Date: Mon, 06 Jan 2014 11:53:15 +0100
Message-ID: <20140106105315.GA21266@rhlx01.hs-esslingen.de>
In-Reply-To: 20140105060126.GB11749@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6013393162342039237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 05, 2014 at 12:00:02PM -0800, powertop-request(a)lists.01.org w=
rote:
> From: Marc MERLIN <marc_powertop(a)merlins.org>

> Unfortunately, it's not just you. I've reported the same problem
> multiple times over the last year, but not heard back from anyone yet
> (except you saying you see the same).
> =

> I had this on a T530, and now it's even worse on a T540:
> The battery reports a discharge rate of 28.5 W
> The estimated remaining time is 1 hours, 53 minutes
> =

> Summary: 689.5 wakeups/second,  214.0 GPU ops/seconds, 0.0 VFS ops/sec an=
d 10.4% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   15.3 W     95.8%                      Device         Display backlight
>   2.07 W     36.0 ms/s     642.4        Process        /usr/bin/enlighten=
ment
>   115 mW      4.5 ms/s      62.3        Interrupt      PS/2 Touchpad / Ke=
yboard / Mouse
>  86.8 mW      0.9 ms/s      37.0        Process        xfce4-terminal -T =
window11 --role=3Dwindow11 --tab
>  71.3 mW     35.4 ms/s      36.2        Process        /usr/bin/X :0 vt7 =
-br -nolisten tcp -auth /var/r
>  51.2 mW      0.8 ms/s      27.9        Timer          hrtimer_wakeup
> =

> 15W for my backlight at mid brightness? I don't think so.

600+ wakeups/second sounds like the usual intermediate activity
due to touchpad/mouse movement (that figure is exactly what I usually got
on my machine), and if that is the case
(what happens if the human part gets its dirty fingers off the machine? :)
then it's strange to see this otherwise *very high* value (642.4)
attributed to /usr/bin/enlightenment (a very seasoned/stable WM, for
crying out loud) rather than mouse as in the *directly following*
    PS/2 Touchpad / Keyboard / Mouse
line.

Or, in other words, this example hints at a rather mischievous mixup of dat=
a,
e.g. an off-by-1 or a post-insert of certain items without accounting for o=
ther
columns (within the data model, of course), or perhaps (the column data val=
ues
might even support such a suspicion) even completely wrong (re-sorted)
display of data.

Perhaps I should actually test/investigate a recent powertop version... ;)

Andreas Mohr

-- =

GNU/Linux. It's not the software that's free, it's you.

--===============6013393162342039237==--

