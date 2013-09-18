Content-Type: multipart/mixed; boundary="===============1208721013089217848=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] Fwd: powertop 2.4 questions
Date: Wed, 18 Sep 2013 12:53:52 -0700
Message-ID: <20130918195352.GG6886@merlins.org>
In-Reply-To: CABsxX9+8LhnUWCmWfZq6uJp_J35X0F6C2gcf6n-1o9CA3PRxLQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1208721013089217848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 12:42:17PM -0700, Kok, Auke-jan H wrote:
> On Wed, Sep 18, 2013 at 12:29 PM, Marc MERLIN <marc_powertop(a)merlins.or=
g> wrote:
> > On Wed, Sep 18, 2013 at 09:33:53PM +0300, Sergey Senozhatsky wrote:
> >> >  So, I got powertop 2.4 from
> >> >  [5]https://01.org/powertop/downloads/2013/powertop-v2.4
> >> >
> >> >  Like I showed you on my laptop, when I go left and right with my ar=
rows,
> >> >  I'm on the Overview screen, and I can't move to Idle stats or Freq =
stats
> >> >  like I could in older powertops:
> >>
> >> in order to move between tabs use TAB button.
> >
> > That works indeed, I didn't realize it changed.
> =

> I think Chris had to do that since he implemented scrollable ncurses
> windows, and you need up/down/left/right to move the viewport around.
> It's been a while that this code was in and the announcement went
> out... sadly it's hard to get distros to pick up details like that.

No worries at all, it happens :)

By the way, my more nagging question was, how can I stop the built in camera
in my T530 from taking so much power? (I'm sure the number is wrong, but st=
ill)

The battery reports a discharge rate of 18.4 W
The estimated remaining time is 4 hours, 18 minutes

Summary: 657.6 wakeups/second,  28.4 GPU ops/seconds, 0.0 VFS ops/sec and 9=
.3% CPU use

Power est.  Usage       Events/s   Category       Description
  12.2 W    100.0%                 Device         USB device: Integrated Ca=
mera (Chicony Electronics Co., Ltd.)
  997 mW     60.0%                 Device         Display backlight
 76.1 mW     34.9 =C2=B5s/s      34.8   Process        [rcu_preempt]
 23.1 mW      1.5 ms/s      16.5   Process        xfce4-terminal -T window1=
1 --role=3Dwindow11
 9.20 mW     59.0 ms/s     347.4   Process        /usr/bin/enlightenment

Note that tunables says:
   Good          Autosuspend for USB device Integrated Camera [Chicony Elec=
tronics Co., Ltd.]

Kernel 3.10.6.

Any ideas?

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

--===============1208721013089217848==--

