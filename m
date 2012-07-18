Content-Type: multipart/mixed; boundary="===============2239651695330014339=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Wed, 18 Jul 2012 17:21:19 +0400
Message-ID: <5006B84F.7020104@samsung.com>
In-Reply-To: 5006B615.1000305@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2239651695330014339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:
> On 7/18/2012 2:17 AM, Igor Zhbanov wrote:
>> Get rid of TRUE and FALSE ncurses' defines used for boolean variables
>> initialization. This fix also helps build without ncurses support.
> while I appreciate going to C++ true/false, building without ncurses
> isn't really a goal.
> (even on android, building ncurses is easy, and it does make the tool SO
> much more useful)
It is not good that C++ code depends on TRUE/FALSE defines
(defined in ncurses.h) in functions that are not related to ncurses.

P.S. I have merged Intel's and Linaro's repositories and will send patches =
for
review soon. I don't know why but Linaro wants to build PowerTOP without nc=
urses.
So I will send a patch that makes ncurses and libpci dependencies condition=
al.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2239651695330014339==--

