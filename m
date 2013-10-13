Content-Type: multipart/mixed; boundary="===============5491579247613057804=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] USB devices get wrong power use values
Date: Sun, 13 Oct 2013 08:33:51 -0700
Message-ID: <525ABD5F.6030001@linux.intel.com>
In-Reply-To: 20130922235400.GE1886@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5491579247613057804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/22/2013 4:54 PM, Marc MERLIN wrote:
> So, I asked on the linux-usb list, and one thing I quickly found out is t=
hat the
> Watt value given by powertop 2.4 is way off for USB devices:

what makes you think the value is off?

>> Power est.  Events/s    Category       Description
>>    8.18 W    100.0%      Device         USB device: Yubico Yubikey II (Y=
ubico)
>>    8.13 W    100.0%      Device         USB device: Integrated Camera (C=
hicony Electronics Co., Ltd.)

having a USB device active also generally makes the CPU/etc use much more p=
ower,
which Powertop "charges" to the USB device in question.

8 Watts sounds entirely reasonable for that to me...



--===============5491579247613057804==--

