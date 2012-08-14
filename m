Content-Type: multipart/mixed; boundary="===============8198209151512458095=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Tue, 14 Aug 2012 10:11:49 +0400
Message-ID: <5029EC25.3080101@samsung.com>
In-Reply-To: 50293AD3.6020900@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8198209151512458095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On my desktop PC running Ubuntu 11.10 with 3.0.0-24-generic-pae kernel
I have /sys/class/backlight/eeepc-wmi symbolic link pointing to
/sys/devices/platform/eeepc-wmi/backlight/eeepc-wmi

My PC is non an EEEPC. Perhaps Linux kernel wrongly detects type of =

hardware,
I don't know. I just have a PC with an LCD monitor.

P.S.
By the way, when I use the default mobile kernel without needed CONFIG_s =

I have
several more division by zero since PowerTOP uses default value of 0 to =

lot's of variables.
But since that CONFIG_s are required to run PowerTOP I have not reported it.

Arjan van de Ven wrote:
> On 8/13/2012 9:52 AM, Igor Zhbanov wr
>> The problem is that on some architectures max_brightness is 0.
> oooof that's bad
> yes we shouldn't do divide by zero
>
> but what kind of platform has a max brightness of 0 ?????
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============8198209151512458095==--

