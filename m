Content-Type: multipart/mixed; boundary="===============3340000833311543784=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Fri, 20 Jul 2012 11:06:02 +0400
Message-ID: <5009035A.9090306@samsung.com>
In-Reply-To: 50086D5E.4090608@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3340000833311543784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Anyway, that's all major Linaro's changes.
There are small minor changes to Android.mk, but it is not suitable for =

mainline.

Linaro has made only few commits after forking from mainline.

They are:

1) adding __NR_perf_event_open define
2) building without libpci
3) wrong fix for hyper-threading cpu
4) set default variable for TERM and TERMINFO variables
5) some changes in Android.mk
6) change boardname code.

That's all. So the git trees in the fact almost the same.

And now for successful build for ARM devices only two things left:

1) Define __NR_perf_event_open for ARM
2) Change csstoh build rules so that will be built with a cross-compiler
or replace it with a shell script.

Arjan van de Ven wrote:
>>      Please do not merge Intel's and Linaro repositories and send patches
>> for what comes of it.
>> If the Linaro maintainers want to do an upstream merge or if
>> contributors of Linaro want to upstream
>> patches they have authored then great.
>> Submitting patches based on other peoples work is not agreeable to me. I
>> will not take patches that
>> I even suspect isn't from the original authors, and or without the
>> authors consent. Do not just merge code bases
>> and generate patches based on the diff, and send it to the list. They
>> will not be taken.
> specifically, I really really insist on keeping the correct authorship
> information ("Author" git tag etc) for all the code going into PowerTOP.
> Credit where credit is due, but also for tracking the origin and
> copyright holders of the code.
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============3340000833311543784==--

