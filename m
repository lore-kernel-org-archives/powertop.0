Content-Type: multipart/mixed; boundary="===============3553752691138025159=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Thu, 17 Oct 2013 17:01:54 -0700
Message-ID: <20131018000154.GA5362@merlins.org>
In-Reply-To: 20131013162212.GH30504@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3553752691138025159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 09:22:12AM -0700, Marc MERLIN wrote:
> On Sun, Oct 13, 2013 at 08:33:51AM -0700, Arjan van de Ven wrote:
> > On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> > >So, I asked on the linux-usb list, and one thing I quickly found out i=
s that the
> > >Watt value given by powertop 2.4 is way off for USB devices:
> > =

> > what makes you think the value is off?
> > =

> > >>Power est.  Events/s    Category       Description
> > >>   8.18 W    100.0%      Device         USB device: Yubico Yubikey II=
 (Yubico)
> > >>   8.13 W    100.0%      Device         USB device: Integrated Camera=
 (Chicony Electronics Co., Ltd.)
> > =

> > having a USB device active also generally makes the CPU/etc use much mo=
re power,
> > which Powertop "charges" to the USB device in question.
> > =

> > 8 Watts sounds entirely reasonable for that to me...
> =

> Aah, if the CPU gets involved, then yes, it's a bit more possible.
> So, a simple USB keyboard that's unused can keep one core awake and burn 8
> watts if something else goes wrong in the kernel to cause that?

So, I just upgraded to 3.11.5, and see things like this below. Can alsa sou=
nd
really take 10W when I'm batteries?
Let me put it another way, it just cannot be correct. Full power use is 15W=
 and
if you removed 10W for audio (I'm sure that's wrong) and 3W for wifi (that =
may be correct)
it means my quad core laptop is running at 2W with the screen on?
Not possible at all.

So there has to be a bug in powertop 2.4 USB device power calculation.

For what it's worth, I got the data below right after running
powertop --calibrate and letting it go through a full cycle.

----------------------------------------------------------------------------
The battery reports a discharge rate of 15.1 W
The estimated remaining time is 4 hours, 53 minutes

Summary: 572.4 wakeups/second,  18.3 GPU ops/seconds, 0.0 VFS ops/sec and 8=
.3% CPU use

Power est.              Usage       Events/s    Category       Description
  10.5 W    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
  3.10 W      7.0 pkts/s                Device         Network interface: w=
lan0 (iwlwifi)
  772 mW     25.1 ms/s     208.4        Process        /usr/bin/enlightenme=
nt
 13.4 mW      1.2 ms/s       8.5        Process        xfce4-terminal -T wi=
ndow10 --role=3Dwindow10 --tab
(...)
----------------------------------------------------------------------------

Calibrate results if that helps:
gandalfthegreat:~# powertop --calibrate
Loaded 750 prior measurements
RAPL device for cpu 0
RAPL device for cpu 0
RAPL device for cpu 0
Starting PowerTOP power estimate calibration =

Calibrating idle
Calibrating: disk usage =

Calibrating backlight
.... device /sys/class/backlight/intel_backlight/brightness =

.... device /sys/class/backlight/acpi_video0/brightness =

Calibrating idle
Calibrating: CPU usage on 1 threads
Calibrating: CPU usage on 4 threads
Calibrating: CPU wakeup power consumption
Calibrating: CPU wakeup power consumption
Calibrating: CPU wakeup power consumption
Calibrating USB devices
.... device /sys/bus/usb/devices/3-1/power/control =

.... device /sys/bus/usb/devices/4-1/power/control =

.... device /sys/bus/usb/devices/usb1/power/control =

.... device /sys/bus/usb/devices/usb2/power/control =

.... device /sys/bus/usb/devices/usb3/power/control =

.... device /sys/bus/usb/devices/usb4/power/control =

.... device /sys/bus/usb/devices/3-1.2/power/control =

.... device /sys/bus/usb/devices/3-1.6/power/control =

Calibrating radio devices
.... device /sys/class/rfkill/rfkill0/soft =

.... device /sys/class/rfkill/rfkill1/soft =

.... device /sys/class/rfkill/rfkill0/soft =

.... device /sys/class/rfkill/rfkill1/soft =

Finishing PowerTOP power estimate calibration =

Parameters after calibration:


Parameter state =

----------------------------------
Value		Name
 2.23		alsa-codec-power (2)
 0.37		backlight (3)
 3.51		backlight-boost-100 (4)
 2.52		backlight-boost-40 (5)
 6.65		backlight-boost-80 (6)
 0.00		backlight-power (7)
 0.21		base power (8)
 0.00		cpu-consumption (9)
 0.00		cpu-wakeups (10)
 0.00		disk-operations (11)
 0.00		disk-operations-hard (12)
 0.00		eth0-link-100 (13)
10.93		eth0-link-1000 (14)
 0.00		eth0-link-high (15)
 0.00		eth0-packets (16)
 0.00		eth0-powerunsave (17)
 0.00		eth0-up (18)
 0.20		gpu-operations (19)
 0.00		radio:hci0 (20)
 0.00		radio:phy0 (21)
 0.31		radio:tpacpi_bluetooth_sw (22)
 0.00		runtime-0000:00:00.0 (23)
 0.00		runtime-0000:00:02.0 (24)
 0.00		runtime-0000:00:14.0 (25)
 0.00		runtime-0000:00:16.0 (26)
 0.00		runtime-0000:00:16.3 (27)
 0.00		runtime-0000:00:19.0 (28)
 0.00		runtime-0000:00:1a.0 (29)
 0.00		runtime-0000:00:1b.0 (30)
 0.00		runtime-0000:00:1c.0 (31)
 0.00		runtime-0000:00:1c.1 (32)
 0.00		runtime-0000:00:1c.2 (33)
 0.00		runtime-0000:00:1d.0 (34)
 0.00		runtime-0000:00:1f.0 (35)
 0.00		runtime-0000:00:1f.2 (36)
 0.00		runtime-0000:00:1f.3 (37)
 0.00		runtime-0000:02:00.0 (38)
 0.00		runtime-0000:03:00.0 (39)
 0.00		thinkpad-fan (40)
 0.00		thinkpad-fan-cub (41)
 0.00		thinkpad-fan-sqr (42)
 0.00		thinkpad-light (43)
 0.00		usb-device-0403-6001 (44)
 0.00		usb-device-04e8-6860 (45)
 0.00		usb-device-04e8-6864 (46)
 2.58		usb-device-04f2-b2ea (47)
 0.00		usb-device-058f-6387 (48)
 0.00		usb-device-091e-0003 (49)
 1.34		usb-device-0a5c-21e6 (50)
 9.82		usb-device-1050-0010 (51)
 0.00		usb-device-18d1-4ee2 (52)
 0.00		usb-device-18d1-4ee4 (53)
 0.00		usb-device-1d6b-0002 (54)
 0.00		usb-device-1d6b-0003 (55)
 0.00		usb-device-8087-0024 (56)
 0.00		usb0-link-100 (57)
 0.00		usb0-link-1000 (58)
 0.00		usb0-link-high (59)
 0.00		usb0-packets (60)
 0.00		usb0-powerunsave (61)
 0.00		usb0-up (62)
 0.00		vboxnet0-link-100 (63)
 0.00		vboxnet0-link-1000 (64)
 0.00		vboxnet0-link-high (65)
 0.00		vboxnet0-packets (66)
 0.00		vboxnet0-powerunsave (67)
 0.00		vboxnet0-up (68)
 0.00		wlan0-link-100 (69)
 0.00		wlan0-link-1000 (70)
 0.00		wlan0-link-high (71)
 0.00		wlan0-packets (72)
 1.64		wlan0-powerunsave (73)
 0.00		wlan0-up (74)
 0.00		xwakes (75)

Score:    2.6  (104691.5)
Guess:   13.2
Actual:  13.6
----------------------------------


-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/ =20

--===============3553752691138025159==--

