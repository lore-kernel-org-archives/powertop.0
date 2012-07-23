Content-Type: multipart/mixed; boundary="===============7553489452017689754=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Mon, 23 Jul 2012 10:32:41 +0400
Message-ID: <500CF009.908@samsung.com>
In-Reply-To: 50099626.6060106@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7553489452017689754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris!
Thank you for your answer.

Chris Ferron wrote:
> On 07/20/2012 12:06 AM, Igor Zhbanov wrote:
>> Anyway, that's all major Linaro's changes.
> I understand you don't see the severity of the issue. But I must =

> insist that no more third party submittal.
>> There are small minor changes to Android.mk, but it is not suitable =

>> for mainline.
> Please insure this is fresh code authored by you if you submit, and I =

> will be happy to take it.
No, that code is not mine. I even doesn't build PowerTOP for Android.
>>
>> Linaro has made only few commits after forking from mainline.
>>
>> They are:
>>
>> 1) adding __NR_perf_event_open define
> Please insure this is fresh code authored by you and detailed if you =

> submit, and I will be happy to take it.
Yes, this is just a system call number copied from unistd.h for ARM =

platform.
Without it PowerTOP will not know what system call number =

__NR_perf_event_open has on ARM.
>>
>> 2) building without libpci
> Done
>> 3) wrong fix for hyper-threading cpu
> Not needed
>> 4) set default variable for TERM and TERMINFO variables
> Please insure this is fresh code authored by you if you submit, and I =

> will be happy to take it.
I don't need it for my builds. It was from Linaro's commits. I don't =

even send it to list.
>>
>> 5) some changes in Android.mk
> See above
Same as above.
>> 6) change boardname code.
> I will have a fix for this today 7/20/12 PST
Same as above.
>>
>> That's all. So the git trees in the fact almost the same.
>>
>> And now for successful build for ARM devices only two things left:
>>
>> 1) Define __NR_perf_event_open for ARM
>> 2) Change csstoh build rules so that will be built with a cross-compiler
>> or replace it with a shell script.
> Shell Script will not be considered, other solutions will be considered.
I saw suggestion to use HOSTCC variable to compile csstoh.c for build =

platform
but I don't know automake good enough to modify it so, that after =

running autotools
rules for building csstoh will contain HOSTCC instead of CC. I don't know
how to combine HOSTCC and noinst.

If you now good guide for writing automakes for building with a =

cross-compiler,
please tell me.

Once again, thank you for your response.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7553489452017689754==--

