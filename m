Content-Type: multipart/mixed; boundary="===============2810910670846706283=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [Powertop] Lenovo T530 battery saving
Date: Fri, 02 Aug 2013 10:27:38 -0700
Message-ID: <20130802172738.GC6932@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2810910670846706283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Both powertop 2.1 and now powertop 2.4 tell me my onboard laptop camera =

is burning battery.
This is a lenovo T530 with kernel 3.9.5.

However, I've unloaded the module and that doesn't help:

To save battery, I do:
ifconfig eth0 down
for i in videobuf2_core uvcvideo videodev e1000e
do
    rmmod $i
done


The battery reports a discharge rate of 14.5 W
The estimated remaining time is 2 hours, 8 minutes

Summary: 681.7 wakeups/second,  2.0 GPU ops/seconds, 0.0 VFS ops/sec and 19=
.4% CPU use

Power est.              Usage       Events/s    Category       Description
  6.13 W     73.3%                      Device         Display backlight
  3.08 W    100.0%                      Device         USB device: Integrat=
ed Camera (Chicony Electronics Co., Ltd.)
 71.2 mW    149.9 ms/s     240.0        Process        /usr/bin/enlightenme=
nt
 24.0 mW    175.6 =C2=B5s/s     144.5        Timer          menu_hrtimer_no=
tify
 12.5 mW      1.0 ms/s      75.5        kWork          od_dbs_timer
 12.1 mW     98.3 =C2=B5s/s      72.9        Process        [kworker/2:0]


Yet, powertop is still showing this below which is still visible in lsusb a=
fter I unload
uvcvideo:
Bus 003 Device 004: ID 04f2:b2ea Chicony Electronics Co., Ltd =


I often have the same problem with my audio device too:
  1.88 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)

Thankfully unloading some modules seems to fix this:
for i in snd_hda_intel snd_hda_codec_realtek snd_hda_codec snd_hwdep; do rm=
mod $i; done

Any idea how I can stop the camera from sucking power since unloading the m=
odule isn't enough?

Thanks,
Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/

--===============2810910670846706283==--

