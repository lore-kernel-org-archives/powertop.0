Content-Type: multipart/mixed; boundary="===============3884797389163473202=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Thu, 17 Oct 2013 17:24:41 -0700
Message-ID: <20131018002441.GB5362@merlins.org>
In-Reply-To: 20131018000154.GA5362@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3884797389163473202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 05:01:54PM -0700, Marc MERLIN wrote:
> On Sun, Oct 13, 2013 at 09:22:12AM -0700, Marc MERLIN wrote:
> > On Sun, Oct 13, 2013 at 08:33:51AM -0700, Arjan van de Ven wrote:
> > > On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> > > >So, I asked on the linux-usb list, and one thing I quickly found out=
 is that the
> > > >Watt value given by powertop 2.4 is way off for USB devices:
> > > =

> > > what makes you think the value is off?
> > > =

> > > >>Power est.  Events/s    Category       Description
> > > >>   8.18 W    100.0%      Device         USB device: Yubico Yubikey =
II (Yubico)
> > > >>   8.13 W    100.0%      Device         USB device: Integrated Came=
ra (Chicony Electronics Co., Ltd.)
> > > =

> > > having a USB device active also generally makes the CPU/etc use much =
more power,
> > > which Powertop "charges" to the USB device in question.
> > > =

> > > 8 Watts sounds entirely reasonable for that to me...
> > =

> > Aah, if the CPU gets involved, then yes, it's a bit more possible.
> > So, a simple USB keyboard that's unused can keep one core awake and bur=
n 8
> > watts if something else goes wrong in the kernel to cause that?
> =

> So, I just upgraded to 3.11.5, and see things like this below. Can alsa s=
ound
> really take 10W when I'm batteries?
> Let me put it another way, it just cannot be correct. Full power use is 1=
5W and
> if you removed 10W for audio (I'm sure that's wrong) and 3W for wifi (tha=
t may be correct)
> it means my quad core laptop is running at 2W with the screen on?
> Not possible at all.

> So there has to be a bug in powertop 2.4 USB device power calculation.
> =

> For what it's worth, I got the data below right after running
> powertop --calibrate and letting it go through a full cycle.
> =

> -------------------------------------------------------------------------=
---
> The battery reports a discharge rate of 15.1 W
> The estimated remaining time is 4 hours, 53 minutes
> =

> Summary: 572.4 wakeups/second,  18.3 GPU ops/seconds, 0.0 VFS ops/sec and=
 8.3% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   10.5 W    100.0%                      Device         Audio codec alsa:h=
wC0D0: thinkpad (Realtek)
>   3.10 W      7.0 pkts/s                Device         Network interface:=
 wlan0 (iwlwifi)
>   772 mW     25.1 ms/s     208.4        Process        /usr/bin/enlighten=
ment
>  13.4 mW      1.2 ms/s       8.5        Process        xfce4-terminal -T =
window10 --role=3Dwindow10 --tab
> (...)
> -------------------------------------------------------------------------=
---

Just after I wrote this, I'm now seeing my yubikey back to 10W when it was
alsa holding the slot earlier.
 =

> -------------------------------------------------------------------------=
---
The battery reports a discharge rate of 21.3 W
The estimated remaining time is 3 hours, 0 minutes

Summary: 2685.1 wakeups/second,  149.8 GPU ops/seconds, 0.0 VFS ops/sec and=
 31.2% CPU use

Power est.              Usage       Events/s    Category       Description
  10.4 W    100.0%                      Device         USB device: Yubico Y=
ubikey II (Yubico)
  5.50 W     13.0%                      Device         Display backlight
  1.51 W     17.4 pkts/s                Device         Network interface: w=
lan0 (iwlwifi)
  566 mW     85.8 ms/s     1520.4       Process        /usr/bin/enlightenme=
nt
  109 mW    100.0%                      Device         Audio codec alsa:hwC=
0D0: thinkpad (Realtek)
 43.2 mW      5.2 ms/s      72.9        Process        xfce4-terminal -T wi=
ndow5 --role=3Dwindow5
 25.9 mW      0.8 ms/s      14.8        Process        xfce4-terminal -T wi=
ndow9 --role=3Dwindow9 --tab
> -------------------------------------------------------------------------=
---

I hope this is useful.

Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/ =20

--===============3884797389163473202==--

