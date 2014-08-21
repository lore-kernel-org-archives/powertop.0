Content-Type: multipart/mixed; boundary="===============8865882056590177404=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [Powertop] powertop 2.6 still reports incorrect device battery usage
Date: Thu, 21 Aug 2014 13:49:45 -0700
Message-ID: <20140821204945.GD3875@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8865882056590177404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On kernel 3.15.5, thinkpad T540p IDPS display, intel graphics

I'm still getting bogus numbers for devices.

Snapshot #1: =

- My wifi card is certainly not using 12.7W
- Display backlight + wifi =3D 17.9W, which means the entire laptop
  would be running on 2W? That's of course wrong
- The 1117 wakeups are not accounted for and apps blamed correctly for
  that use

> The battery reports a discharge rate of 19.8 W
> The estimated remaining time is 2 hours, 37 minutes
> =

> Summary: 1117.0 wakeups/second,  182.7 GPU ops/seconds, 0.0 VFS ops/sec a=
nd 9.0% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   12.7 W     36.3 pkts/s                Device         Network interface:=
 wlan0 (iwlwifi)
>   5.17 W      8.0%                      Device         Display backlight
>   322 mW     25.0 ms/s     331.3        Process        /usr/bin/enlighten=
ment
>   179 mW     19.7 ms/s      60.7        Process        /usr/bin/X :0 vt7 =
-br -nolisten tcp -auth
>   178 mW      4.8 ms/s     246.2        Process        xmms

I blew away my calibration, upgraded from powertop 2.4 to 2.6.1, and now
I see:
The battery reports a discharge rate of 17.6 W
The estimated remaining time is 5 hours, 10 minutes

Summary: 893.0 wakeups/second,  26.4 GPU ops/seconds, 0.0 VFS ops/sec and 1=
1.3% CPU use

Power est.              Usage       Events/s    Category       Description
  18.7 W    216.8 pkts/s                Device         Network interface: w=
lan0 (iwlwifi)
  5.16 W     33.0%                      Device         Display backlight
 61.0 mW     35.8 ms/s      86.5        Process        dpkg
 39.4 mW      1.6 ms/s      24.9        Process        xfce4-terminal -T wi=
ndow1.10 --role=3Dwindow1.10 --tab
 35.6 mW      8.2 ms/s     133.2        kWork          normal_work_helper


How can powertop tell me that my wireless card is using more power than
the entire laptop?

Clearly the calibration didn't work right, but shouldn't the code have chec=
ks
for things that are clearly wrong and tell the user what to do to fix them/=
recalibrate?

Or better, shouldn't it retune the device usage on its own when it finds
something clearly wrong like power use of the laptop being negative
after removing devices, or inconsistent with the basic power usage
calculated during calibration?

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

--===============8865882056590177404==--

