Content-Type: multipart/mixed; boundary="===============6871798207525708958=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Mon, 23 Jul 2012 11:48:06 +0400
Message-ID: <500D01B6.5020001@samsung.com>
In-Reply-To: 1343028693.3103.4.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6871798207525708958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

Magnus Fromreide wrote:
> On Mon, 2012-07-23 at 10:32 +0400, Igor Zhbanov wrote:
>> Hi Chris!
>> Thank you for your answer.
>>
>> Chris Ferron wrote:
>>> On 07/20/2012 12:06 AM, Igor Zhbanov wrote:
>>>> Linaro has made only few commits after forking from mainline.
>>>>
>>>> They are:
>>>>
>>>> 1) adding __NR_perf_event_open define
>>> Please insure this is fresh code authored by you and detailed if you
>>> submit, and I will be happy to take it.
>> Yes, this is just a system call number copied from unistd.h for ARM
>> platform.
>> Without it PowerTOP will not know what system call number
>> __NR_perf_event_open has on ARM.
> Why can't it take __NR_perf_event_open from the libc headers?
> That is, why can't the whole ifdef under /* some people have stale
> headers */ go?
>
> Powertop is rather demanding with regards to the environment anyhow and
> magic constants are never fun.
>
> /MF
I can confirm that PowerTOP successfully builds for ARM both with ScratchBo=
x and with a cross-compiler without that define. I send this patch to be un=
iform with other platforms as I can't guarantee that all platforms has corr=
ect headers.

Perhaps that defines can be removed.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6871798207525708958==--

