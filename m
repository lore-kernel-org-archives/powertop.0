Content-Type: multipart/mixed; boundary="===============6840584912356253373=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Mon, 13 Aug 2012 20:52:28 +0400
Message-ID: <502930CC.5070204@samsung.com>
In-Reply-To: 50292E9F.40009@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6840584912356253373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arjan,

Please look at my next patch too. I try to get rid of things like:
-2147483648%, "Display backlight",

The problem is that on some architectures max_brightness is 0. And you =

can find
division by zero and getting NaNs in backlight code. So I try to fix it =

not to use incorrect
values when DPMS is disabled or backlight control is not supported.

Arjan van de Ven wrote:
> On 8/13/2012 9:41 AM, Igor Zhbanov wrote:
>> Consider DPMS disabled when we can't open /sys/class/drm/card0 directory.
> if you don't have a graphics card with proper driver...
> there's nothing we can do and pretending that DPMS is disabled sounds lik=
e a mostly bad idea
> on first sight
>
> what is behind the idea of assuming it disabled ???
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6840584912356253373==--

