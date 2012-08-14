Content-Type: multipart/mixed; boundary="===============1834921248648340641=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix screen DPMS support detection
Date: Tue, 14 Aug 2012 08:34:10 -0700
Message-ID: <502A6FF2.4060204@linux.intel.com>
In-Reply-To: 5029EC25.3080101@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1834921248648340641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/13/2012 11:11 PM, Igor Zhbanov wrote:
> On my desktop PC running Ubuntu 11.10 with 3.0.0-24-generic-pae kernel
> I have /sys/class/backlight/eeepc-wmi symbolic link pointing to
> /sys/devices/platform/eeepc-wmi/backlight/eeepc-wmi
>
> My PC is non an EEEPC. Perhaps Linux kernel wrongly detects type of =

> hardware,
> I don't know. I just have a PC with an LCD monitor.
>
> P.S.
> By the way, when I use the default mobile kernel without needed =

> CONFIG_s I have
> several more division by zero since PowerTOP uses default value of 0 =

> to lot's of variables.
> But since that CONFIG_s are required to run PowerTOP I have not =

> reported it.
Oh that's not good. If you share your notes on this, I would be happy to =

find solutions for this. Division by zero is bad, even if its a config =

issue.
Thanks for the info
Chris

>
> Arjan van de Ven wrote:
>> On 8/13/2012 9:52 AM, Igor Zhbanov wr
>>> The problem is that on some architectures max_brightness is 0.
>> oooof that's bad
>> yes we shouldn't do divide by zero
>>
>> but what kind of platform has a max brightness of 0 ?????


--===============1834921248648340641==--

