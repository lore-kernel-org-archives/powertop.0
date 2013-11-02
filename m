Content-Type: multipart/mixed; boundary="===============6320310388031331826=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] v2.5-rc1 testing: accounting still very wrong
Date: Sat, 02 Nov 2013 06:48:02 -0700
Message-ID: <20131102134802.GG5519@merlins.org>
In-Reply-To: 20131018110926.2deb6450@bluebird.jf.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6320310388031331826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2013 at 11:09:26AM -0700, Kristen Carlson Accardi wrote:
> Please test.

Still the same power counting bugs than previous versions.
After a few minutes, on battery, it went from 12W to 20W because of an
rsync in the background, and when that rsync was finished (sigstop), I got =
this.

Somehow I very much doubt that e17 was using 1550W.

Clearly there is at least an assert missing that should ensure that the list
of power estimated values clearly exceeds the total power.

Even if I stop enligthenment, which seems to be most of the wakeups, bad
accounting is all wrong in many ways, see below:

---------------------------------------------------------------------------=
-----
The battery reports a discharge rate of 20.3 W
The estimated remaining time is 3 hours, 48 minutes

Summary: 609.5 wakeups/second,  426.1 GPU ops/seconds, 0.0 VFS ops/sec and =
5.7% CPU use

Power est.              Usage       Events/s    Category       Description
 1.55 kW     15.5 ms/s     526.8        Process        /usr/bin/enlightenme=
nt
   198 W    496.5 =C2=B5s/s     295.9        Process        [btrfs-transact=
i]
  9.27 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
  304 mW     22.2 =C2=B5s/s       0.3        Process        xscreensaver
  242 mW      6.7%                      Device         Display backlight
 68.5 mW      5.4 ms/s      68.9        Interrupt      [42] i915(a)pci:0000=
:00:02.0
 62.6 mW     18.4 ms/s      32.2        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -auth /var/run/x
 51.3 mW      1.1 ms/s      58.5        Process        [btrfs-endio-met]
---------------------------------------------------------------------------=
-----

If I relaunch powertop, I now see:
---------------------------------------------------------------------------=
-----
The battery reports a discharge rate of 18.4 W
The estimated remaining time is 4 hours, 6 minutes

Summary: 3245.9 wakeups/second,  404.1 GPU ops/seconds, 0.0 VFS ops/sec and=
 51.4% CPU use

Power est.              Usage       Events/s    Category       Description
  18.7 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
  4.91 W    139.9 ms/s     3185.8       Process        /usr/bin/enlightenme=
nt
  309 mW    363.2 ms/s     401.2        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -auth /var/run/x
 79.2 mW      1.9%                      Device         Display backlight
 59.0 mW      0.8 ms/s      11.8        Process        xfce4-terminal -T wi=
ndow13 --role=3Dwindow13 --tab
 4.72 mW      5.7 ms/s       2.0        Interrupt      [42] i915(a)pci:0000=
:00:02.0
 653 =C2=B5W     150.1 =C2=B5s/s      16.8        Process        [rcu_preem=
pt]
---------------------------------------------------------------------------=
-----
No, alsa isn't using more battery than the total laptop either ^^^


Ok, let's wait a bit longer:
---------------------------------------------------------------------------=
-----
The battery reports a discharge rate of 18.6 W
The estimated remaining time is 4 hours, 1 minutes

Summary: 614.7 wakeups/second,  257.4 GPU ops/seconds, 0.0 VFS ops/sec and =
6.5% CPU use

Power est.              Usage       Events/s    Category       Description
  13.4 W    643.1 =C2=B5s/s       7.3        Process        /usr/bin/pulsea=
udio --start
  287 mW     28.6 ms/s     588.0        Process        /usr/bin/enlightenme=
nt
  224 mW     26.8 ms/s     158.5        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -auth /var/run/x
 58.2 mW      6.7%                      Device         Display backlight
 4.19 mW      5.6 ms/s      46.2        Interrupt      [42] i915(a)pci:0000=
:00:02.0
 3.54 mW     63.9 =C2=B5s/s       2.1        Process        xfce4-terminal =
-T window13 --role=3Dwindow13 --tab
 630 =C2=B5W       0.8 ms/s      17.8        Interrupt      [46] snd_hda_in=
tel
 492 =C2=B5W     658.9 =C2=B5s/s      26.7        Timer          tick_sched=
_timer
---------------------------------------------------------------------------=
-----


Ok, so I killed pulseaudio, which I'm pretty sure is not to blame, and now =
I se
this. So you get the idea, 621 wakeups per second isn't good, but the accou=
nting =

seems to be wrong.
---------------------------------------------------------------------------=
-----
The battery reports a discharge rate of 18.8 W
The estimated remaining time is 3 hours, 57 minutes

Summary: 621.7 wakeups/second,  191.7 GPU ops/seconds, 0.0 VFS ops/sec and =
7.5% CPU use

Power est.              Usage       Events/s    Category       Description
  13.4 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
  357 mW     25.8 ms/s     620.3        Process        /usr/bin/enlightenme=
nt
 38.8 mW      6.7%                      Device         Display backlight
 20.3 mW     26.2 ms/s      35.6        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -auth /var/run/x
 7.05 mW      9.4 ms/s      0.05        Process        /usr/bin/python /usr=
/sbin/iotop
 5.40 mW    106.8 =C2=B5s/s       3.8        Process        xfce4-terminal =
-T window14 --role=3Dwindow14 --tab
 5.09 mW      0.9 ms/s       9.7        Process        xfce4-terminal -T wi=
ndow11 --role=3Dwindow11 --tab
 4.30 mW      5.7 ms/s      65.5        Interrupt      [42] i915(a)pci:0000=
:00:02.0
---------------------------------------------------------------------------=
-----

If I kill -STOP enlightenment, I get this, 18.7W for alsa out of 15.9W tota=
l!
---------------------------------------------------------------------------=
-----
The battery reports a discharge rate of 15.9 W
The estimated remaining time is 4 hours, 35 minutes

Summary: 59.0 wakeups/second,  0.0 GPU ops/seconds, 0.0 VFS ops/sec and 5.1=
% CPU use

Power est.              Usage       Events/s    Category       Description
  18.7 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
 50.0 mW     45.8 ms/s       0.5        Process        /usr/bin/python /usr=
/sbin/iotop
 885 =C2=B5W       0.8 ms/s      16.4        Process        [btrfs-transact=
i]
 430 =C2=B5W     393.5 =C2=B5s/s       8.6        Interrupt      [4] block(=
softirq)
 403 =C2=B5W     369.5 =C2=B5s/s       0.4        kWork          kcryptd_cr=
ypt
 302 =C2=B5W     276.4 =C2=B5s/s       2.7        Timer          hrtimer_wa=
keup
 267 =C2=B5W     244.7 =C2=B5s/s       2.0        Timer          tick_sched=
_timer
---------------------------------------------------------------------------=
-----

-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============6320310388031331826==--

