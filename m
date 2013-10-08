Content-Type: multipart/mixed; boundary="===============1556641392662250783=="
MIME-Version: 1.0
From: Shaojie Sun <shaojie.sun at linaro.org>
Subject: Re: [Powertop] [PATCH POWERTOP V3] resolve the bug that powertop
 doesn't show correct frequency stats
Date: Tue, 08 Oct 2013 16:58:41 +0800
Message-ID: <CANHzE=3B1HATt=6=On+NWchhT_JhP2wDAz7D5M3=Vt6xXeit8A@mail.gmail.com>
In-Reply-To: 20131008085359.GA2495@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1556641392662250783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks.

On Tue, Oct 8, 2013 at 4:54 PM, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> Hello,
>
> On (10/08/13 16:45), Shaojie Sun wrote:
>> Hi Sergey
>>
>> I tested in powertop tool and find that there is no cpu_id filed in
>> some perf events. such as sched_switch, hrtimer_expire_exit and so on.
>> so we can't modify this change in src/perf/perf_bundle (perf_sample's
>> perf_event_header).
>>
>> And we didn't find any bugs on other perf events. So we only modified
>> it in src/cpu/cpu.cpp.
>>
>
> thanks. I'll try to find some time today (or tomorrow) to take a look
> on it.
>
>         -ss

--===============1556641392662250783==--

