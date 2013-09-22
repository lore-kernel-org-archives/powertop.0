Content-Type: multipart/mixed; boundary="===============6809924513844402093=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 22 Sep 2013 16:54:00 -0700
Message-ID: <20130922235400.GE1886@merlins.org>
In-Reply-To: 20130921032203.GA8125@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6809924513844402093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So, I asked on the linux-usb list, and one thing I quickly found out is tha=
t the
Watt value given by powertop 2.4 is way off for USB devices:

Alan Stern wrote the following:

Do you have a bug on powertop 2.4 mis-calculating USB power use, both when =

power is plugged in and when it's not?

Thanks,
Marc

On Sun, Sep 22, 2013 at 12:38:56PM -0400, Alan Stern wrote:
> > > gandalfthegreat:/sys/bus/usb/devices/3-1.6/power# grep . *
> > > active_duration:61227648
> > > async:enabled
> > > autosuspend:2
> > > autosuspend_delay_ms:2000
> > > connected_duration:66830880
> > > control:auto
> > > level:auto
> > > persist:1
> > > runtime_active_kids:0
> > > runtime_active_time:18870052
> > > runtime_enabled:enabled
> > > runtime_status:active
> > > runtime_suspended_time:5324088
> > > runtime_usage:0
> >
> > This all looks correct.
>
> Since then, I've confirmed that I don't have the problem some time after
> reboot. It may be that the device doesn't seem to sleep well after I've u=
sed
> it once.
>
> What's interesting, is that I see this when power is plugged in:
>
> Power est.  Events/s    Category       Description
>   8.18 W    100.0%      Device         USB device: Yubico Yubikey II (Yub=
ico)
>   8.13 W    100.0%      Device         USB device: Integrated Camera (Chi=
cony Electronics Co., Ltd.)
>
> Once I go to batteries, I see this:
> Summary: 760.1 wakeups/second,  718.9 GPU ops/seconds, 0.0 VFS ops/sec an=
d 6.9% CPU use
>
> Power est.              Usage       Events/s    Category       Description
>   8.32 W    100.0%                      Device         USB device: Yubico=
 Yubikey II (Yubico)
>   2.52 W     73.3%                      Device         Display backlight
>
> Somehow I know that my Yubikey isn't using 8W, so powertop numbers need to
> be taken with a grain of salt.

I don't know where powertop gets its numbers from.  Perhaps it uses the
value reported by the device (bMaxPower).  That value is only a
maximum; it doesn't change to reflect the actual usage.

-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/

--===============6809924513844402093==--

