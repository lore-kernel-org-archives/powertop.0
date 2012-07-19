Content-Type: multipart/mixed; boundary="===============4212030280129094339=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Make ncurses dependency optional
Date: Thu, 19 Jul 2012 10:26:57 +0400
Message-ID: <5007A8B1.9090404@samsung.com>
In-Reply-To: 5006D6FF.7090804@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4212030280129094339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:
> On 7/18/2012 7:54 AM, Igor Zhbanov wrote:
>> Make ncurses dependency optional. Provide --without-ncurses option
>> to configure.
> I'm sorry but this patch is disgusting;
> PowerTOP uses ncurses. Really.
>
> crapping ifdefs all over the codebase to pretend it does not, we're just
> really not going to do that this way.
I agree that lots of #ifdefs are ugly. But some mobile platforms doesn't
have ncurses. And is is not convenient to run PowerTOP via terminal on it.
Sometimes HTML-report is all that we need. So I try to make possible to bui=
ld
PowerTOP without ncurses. Linaro's version does the same except that they
just provide -DDISABLE_NCURSES to make without any configure options.

Thank you.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============4212030280129094339==--

