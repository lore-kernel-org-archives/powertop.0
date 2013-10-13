Content-Type: multipart/mixed; boundary="===============5634263278858920268=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 13 Oct 2013 09:22:12 -0700
Message-ID: <20131013162212.GH30504@merlins.org>
In-Reply-To: 525ABD5F.6030001@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5634263278858920268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 08:33:51AM -0700, Arjan van de Ven wrote:
> On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> >So, I asked on the linux-usb list, and one thing I quickly found out is =
that the
> >Watt value given by powertop 2.4 is way off for USB devices:
> =

> what makes you think the value is off?
> =

> >>Power est.  Events/s    Category       Description
> >>   8.18 W    100.0%      Device         USB device: Yubico Yubikey II (=
Yubico)
> >>   8.13 W    100.0%      Device         USB device: Integrated Camera (=
Chicony Electronics Co., Ltd.)
> =

> having a USB device active also generally makes the CPU/etc use much more=
 power,
> which Powertop "charges" to the USB device in question.
> =

> 8 Watts sounds entirely reasonable for that to me...

Aah, if the CPU gets involved, then yes, it's a bit more possible.
So, a simple USB keyboard that's unused can keep one core awake and burn 8
watts if something else goes wrong in the kernel to cause that?

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

--===============5634263278858920268==--

