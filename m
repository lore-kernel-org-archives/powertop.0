Content-Type: multipart/mixed; boundary="===============0518941875271748010=="
MIME-Version: 1.0
From: Peter F. Patel-Schneider <pfpschneider at gmail.com>
Subject: [Powertop] powertop putting far too much blame on wifi
Date: Mon, 30 Dec 2013 09:36:08 -0800
Message-ID: <52C1AF08.8000602@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0518941875271748010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi:

I just got a Lenovo Yoga 2 Pro, and I'mrunning Fedora 20 on it.

I'm trying to get power usage down with powertop, but it is producing some =

screwy numbers.   When I run the machine with wifi on, I get idle consumpti=
on =

just under 7.2W but almost 5W of that is assigned to the WiFi interface, ev=
en =

though there is little traffic. When I turn the wifi off, power consumption =

only drops to just under 7W.  I don't think that there is a phantom WiFi th=
at =

is still consuming power, so it appears to me that powertop is assigning to=
o =

much blame to the WiFi interface.

Is there away of fixing the assignment of blame here?

peter

PS: Here are truncated typical powertop outputs, first with wifi on and the=
n =

with wifi off.

1/
The battery reports a discharge rate of 7.15 W
The estimated remaining time is 3 hours, 39 minutes

Summary: 251.9 wakeups/second, 4.2 GPU ops/seconds, 0.0 VFS ops/sec and 1.6=
% =

CPU use

Power est. Usage Events/s Category Description
   4.82 W 1.2 pkts/s Device Network interface: wlp1s0 (iwlwifi)
   1.72 W 10.0% Device Display backlight
   131 mW 13.1 ms/s 188.4 Process /usr/lib64/thunderbird/thunderbird
  11.7 mW 398.5 =C2=B5s/s 19.9 Process [irq/61-iwlwifi]


2/
The battery reports a discharge rate of 6.92 W
The estimated remaining time is 3 hours, 42 minutes

Summary: 453.6 wakeups/second, 23.2 GPU ops/seconds, 0.0 VFS ops/sec and 3.=
0% =

CPU use

Power est. Usage Events/s Category Description
   1.47 W 10.0% Device Display backlight
   205 mW 14.4 ms/s 197.5 Process /usr/lib64/thunderbird/thunderbird
   184 mW 2.2 ms/s 34.1 Process /usr/bin/xfce4-terminal
   110 mW 2.4 ms/s 164.4 Interrupt PS/2 Touchpad / Keyboard / Mouse


--===============0518941875271748010==--

