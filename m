Content-Type: multipart/mixed; boundary="===============0395668309530079953=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [Powertop] powertop 2.1 isn't measuring task power properly on my
 Thinkpad T530
Date: Fri, 31 Aug 2012 10:14:50 -0700
Message-ID: <20120831171450.GA10826@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0395668309530079953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Howdy,

I just downloaded and built 2.1, and a couple of things aren't right:
1) header columns aren't aligned with the data
2) power estimate shown in the kW range :)

See screenshot of 2.1 vs 1.98:

Is there other info I can provide?

Thanks,
Marc

----------------------------------------------------------------------------
PowerTOP 2.1      Overview   Idle stats   Frequency stats   Device stats   =
Tunables                                     =

The battery reports a discharge rate of 14.0 W
The estimated remaining time is 5 hours, 16 minutes

Summary: 448.2 wakeups/second,  82.7 GPU ops/seconds, 0.0 VFS ops/sec and 1=
0.6% CPU use

Power est.              Usage       Events/s    Category       Description
 10.0 kW     66.2 ms/s     257.2        Process        /usr/bin/enlightenme=
nt
 3.72 kW    566.5 =C2=B5s/s      69.9        Process        nm-applet --sm-=
disable
  79.4 W      0.9 ms/s       9.7        Process        xfce4-terminal -T wi=
ndow9 --role=3Dwindow9
  6.26 W    123.2 =C2=B5s/s      0.00        Process        xfce4-terminal =
-T window12 --role=3Dwindow12
  5.89 W     26.7%                      Device         Display backlight
  2.10 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
  2.09 W     11.2 =C2=B5s/s      0.15        Process        xscreensaver
  1.37 W     35.4 pkts/s                Device         Network interface: w=
lan0 (iwlwifi)
  180 mW      3.7 ms/s      54.9        Interrupt      [6] tasklet(softirq)
  105 mW      1.1 ms/s      32.1        Process        /usr/bin/python /usr=
/local/bin/offlineimap
 77.8 mW      1.3 ms/s      23.7        Interrupt      [47] i915(a)pci:0000=
:00:02.0
 63.4 mW      0.8 ms/s      19.3        Timer          hrtimer_wakeup
 47.0 mW      1.1 ms/s      14.3        Timer          tick_sched_timer
 35.5 mW      1.5 ms/s      10.8        Interrupt      [7] sched(softirq)

----------------------------------------------------------------------------

PowerTOP 1.98     Overview   Idle stats   Frequency stats   Device stats   =
Tunab

The battery reports a discharge rate of 14.1 W

Summary: 627.6 wakeups/second,  0.0 GPU ops/second and 0.0 VFS ops/sec

Power est.      Usage       Events/s    Category       Description
  21.4 W     26.7%                      Device         Display backlight
    0 mW     88.5 ms/s     148.6        Process        /usr/bin/enlightenme=
nt
    0 mW     45.9 ms/s       0.5        Process        powertop-2.1
    0 mW     15.8 ms/s     147.2        Process        /usr/bin/X :0 vt7 -b=
r -no
    0 mW      6.2 ms/s       1.4        Process        /usr/sbin/NetworkMan=
ager
    0 mW      4.7 ms/s       9.0        Interrupt      [46] iwlwifi
    0 mW      2.8 ms/s      0.15        Process        [kswapd0]
    0 mW      1.9 ms/s      85.0        Interrupt      [6] tasklet(softirq)
    0 mW      1.4 ms/s       5.9        Process        gvim /home/merlin/po=
werto
    0 mW      1.3 ms/s      39.3        Interrupt      [47] i915(a)pci:0000=
:00:02.
    0 mW      1.2 ms/s      49.7        Timer          tick_sched_timer
    0 mW      1.1 ms/s      30.5        Interrupt      [7] sched(softirq)

-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/


--===============0395668309530079953==--

