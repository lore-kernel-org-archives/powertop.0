Content-Type: multipart/mixed; boundary="===============5997323609734771038=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Fri, 20 Jul 2012 10:32:22 -0700
Message-ID: <50099626.6060106@linux.intel.com>
In-Reply-To: 5009035A.9090306@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5997323609734771038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/20/2012 12:06 AM, Igor Zhbanov wrote:
> Anyway, that's all major Linaro's changes.
I understand you don't see the severity of the issue. But I must insist =

that no more third party submittal.
> There are small minor changes to Android.mk, but it is not suitable =

> for mainline.
Please insure this is fresh code authored by you if you submit, and I =

will be happy to take it.
>
> Linaro has made only few commits after forking from mainline.
>
> They are:
>
> 1) adding __NR_perf_event_open define
Please insure this is fresh code authored by you and detailed if you =

submit, and I will be happy to take it.
>
> 2) building without libpci
Done
> 3) wrong fix for hyper-threading cpu
Not needed
> 4) set default variable for TERM and TERMINFO variables
Please insure this is fresh code authored by you if you submit, and I =

will be happy to take it.
>
> 5) some changes in Android.mk
See above
> 6) change boardname code.
I will have a fix for this today 7/20/12 PST
>
> That's all. So the git trees in the fact almost the same.
>
> And now for successful build for ARM devices only two things left:
>
> 1) Define __NR_perf_event_open for ARM
> 2) Change csstoh build rules so that will be built with a cross-compiler
> or replace it with a shell script.
Shell Script will not be considered, other solutions will be considered.
>
> Arjan van de Ven wrote:
>>>      Please do not merge Intel's and Linaro repositories and send =

>>> patches
>>> for what comes of it.
>>> If the Linaro maintainers want to do an upstream merge or if
>>> contributors of Linaro want to upstream
>>> patches they have authored then great.
>>> Submitting patches based on other peoples work is not agreeable to =

>>> me. I
>>> will not take patches that
>>> I even suspect isn't from the original authors, and or without the
>>> authors consent. Do not just merge code bases
>>> and generate patches based on the diff, and send it to the list. They
>>> will not be taken.
>> specifically, I really really insist on keeping the correct authorship
>> information ("Author" git tag etc) for all the code going into PowerTOP.
>> Credit where credit is due, but also for tracking the origin and
>> copyright holders of the code.



--===============5997323609734771038==--

