Content-Type: multipart/mixed; boundary="===============6781359342564611603=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Stilll seeing bogus wattage reported to USB devices
Date: Fri, 31 Jan 2014 00:54:22 +0300
Message-ID: <20140130215422.GA3160@swordfish>
In-Reply-To: 20140130182345.GA26750@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6781359342564611603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/30/14 10:23), Marc MERLIN wrote:
> With powertop 2.5, see these 3 report taken a minute apart with no
> change of load.
> All I did was remove the yubikey and put it back in, and unload wlan0
> =

> =

> =

> > Yubikey was showing 6W, so I removed it. that didn't change the dischar=
ge rate:
> =

> The battery reports a discharge rate of 19.9 W
> The estimated remaining time is 3 hours, 23 minutes
> =

> Summary: 1196.2 wakeups/second,  74.9 GPU ops/seconds, 0.0 VFS ops/sec an=
d 16.6% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   10.7 W     48.4 pkts/s                Device         Network interface:=
 wlan0 (iwlwifi)
>   2.39 W     57.1%                      Device         Display backlight
>   2.39 W     17.3%                      Device         Display backlight
>   395 mW      8.5 ms/s     249.8        Process        /usr/local/opt/goo=
gle/chrome-beta/chrome
>   363 mW      6.4 ms/s     168.0        Process        /usr/local/opt/goo=
gle/chrome-beta/chrome
>   226 mW      5.7 ms/s     155.7        Timer          hrtimer_wakeup
> =

> =

> =

> > So I put the yubikey back and and unloaded wlan0 since it was said to
> > take 10W (I knew that was false).
> No real change either (little drop from removing wireless, but not 10W)
> =

> The battery reports a discharge rate of 17.8 W
> The estimated remaining time is 3 hours, 43 minutes
> =

> Summary: 1155.3 wakeups/second,  81.8 GPU ops/seconds, 0.0 VFS ops/sec an=
d 7.9% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   5.90 W    100.0%                      Device         USB device: Yubico =

>   3.15 W     57.1%                      Device         Display backlight
>   3.15 W     17.3%                      Device         Display backlight
>   353 mW      3.7 ms/s     170.1        Process        /usr/local/opt/goo=
gle/chrome-beta/chrome
>   340 mW     13.0 ms/s     252.8        Process        /usr/local/opt/goo=
gle/chrome-beta/chrome
>   320 mW      6.1 ms/s     238.4        Timer          hrtimer_wakeup
> =

> =

> > Yubikye is said to take 6W again, really? I know that's a lie. I removed
> and power went up 0.4W (normal variance unrelated to yubikey).
> =

> The battery reports a discharge rate of 18.2 W
> The estimated remaining time is 3 hours, 38 minutes
> =

> Summary: 1284.1 wakeups/second,  36.2 GPU ops/seconds, 0.0 VFS ops/sec and
> =

> Power est.              Usage       Events/s    Category       Description
>   3.15 W     57.1%                      Device         Display backlight
>   3.15 W     17.3%                      Device         Display backlight
>   426 mW     20.8 ms/s     166.8        Process        /usr/bin/enlightenm
>   343 mW     11.8 ms/s     236.3        Process        /usr/local/opt/goo=
gle/chrome-beta/chrome
>   301 mW      6.3 ms/s     207.0        Timer          hrtimer_wakeup
>   168 mW      2.8 ms/s     115.6        Interrupt      PS/2 Touchpad / Ke=
yboard / Mouse
> =

> =

> Is anyone closer to fixing this bug? It's impossible to get real battery
> usage and due tuning with it present.
> =


not yet, unfortunately. still don't have enough spare time to go
step-by-step.

	-ss

> Thanks
> Marc
> -- =

> "A mouse is a device used to point at the xterm you want to type in" - A.=
S.R.
> Microsoft is to operating systems ....
>                                       .... what McDonalds is to gourmet c=
ooking
> Home page: http://marc.merlins.org/                         | PGP 1024R/7=
63BE901
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6781359342564611603==--

