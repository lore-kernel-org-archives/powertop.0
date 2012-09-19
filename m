Content-Type: multipart/mixed; boundary="===============4798020587258524841=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Powertop doesn't detects sleeping ARM cores
Date: Wed, 19 Sep 2012 12:26:59 +0400
Message-ID: <505981D3.7010403@samsung.com>
In-Reply-To: 50571E4F.1010604@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4798020587258524841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Here is some notes to my previous post.

I mean that only online cores are shown in /proc/cpuinfo.
So the PowerTOP doesn't count currently offline ones.
And you must run the PowerTOP on a heavy loaded system
to let the PowerTOP see all CPU cores.

Therefore it is impossible to run the PowerTOP before starting
of heavy application to get information about all CPU cores.

Probably the PowerTOP could cache CPU information in some file,
so it will be possible to register trace events for all cores.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============4798020587258524841==--

