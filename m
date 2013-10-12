Content-Type: multipart/mixed; boundary="===============2476599703589421680=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [BUG] powertop shows estimates only for 1st battery
 from 2
Date: Sat, 12 Oct 2013 20:53:12 +0300
Message-ID: <20131012175312.GC2248@swordfish.minsk.epam.com>
In-Reply-To: CAGbmdnVwzFMNWQZ6sUHJ494XVW0OybiT99DEMVxymsaW=uT54A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2476599703589421680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/12/13 18:06), Maksim Melnikau wrote:
> > v2: after some thinking, better to fix parameters.
> I'm don't think that values below is correct now
> =

> # powertop, Device stats page
> The battery reports a discharge rate of 12.9 W
> System baseline power is estimated at 16.5 W

could you please post:

ls /sys/class/backlight/

cat /sys/class/backlight/*/device/enabled
cat /sys/class/backlight/*/type

	-ss

> Power est.    Usage     Device name
>   12.2 W     86.2%        Display backlight
>   3.17 W     44.0%        Display backlight
>   639 mW      9.4%        CPU core
>   475 mW      9.4%        CPU misc
>=20

--===============2476599703589421680==--

