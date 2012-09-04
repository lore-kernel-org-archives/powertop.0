Content-Type: multipart/mixed; boundary="===============6319159741848838738=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] Query: Weird Output values: Percentage over 100%
Date: Tue, 04 Sep 2012 11:30:50 +0400
Message-ID: <5045AE2A.7000302@samsung.com>
In-Reply-To: 5044F182.8010407@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6319159741848838738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Arjan van de Ven wrote:

> shouldn't... the buffers are quite large....

By the way, I just curious, why events processing are limited to 5000?
I mean the PowerTOP has f half-megabyte buffer for each type of events
but wishes to process only 5000 even if data is there?

void perf_event::process(void *cookie)
{
...
	while (pc->data_tail !=3D pc->data_head && i++ < 5000) {
...

In the case of many cores sched:switch will be fired at least CONFIG_HZ * n=
r_cpus
times per second (as I understand), and that could easily be larger than 50=
00.
Especially when we measuring for several seconds.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6319159741848838738==--

