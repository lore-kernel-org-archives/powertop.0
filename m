Content-Type: multipart/mixed; boundary="===============7234205126963873856=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 22:26:21 +0530
Message-ID: <CA+Z25wUBxT1oCmRujQ6_nzbdSUvEmfVXoy=gxjo0Jgj-VsYxUQ@mail.gmail.com>
In-Reply-To: 20120905124458.GA16664@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7234205126963873856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 September 2012 18:14, Sergey Senozhatsky
<sergey.senozhatsky(a)gmail.com> wrote:
> Hi,
>
> On (09/05/12 15:52), Rajagopal Venkat wrote:
>> Incorrect timer and work perf events timestamp tracing is one
>> of the reason for reporting usage over 100%. This patch will
>> resolve the issue by
>> - rejecting the events for which entry timestamp is not recorded.
>
> how is that possible?
> do you mean erasing between measurements?
>
>
> schematically:
>
> measure0:
>
> ev1.start
> ev2.start
> ev2.end
>
> processing
> clear
>
>
> measure1:
> ev3.start
> ev1.end  <<<<<

evX.end  <<<<<
These events are causing numbers to go wrong.

delta =3D time - running_since[timer_struct];
accumulated_runtime +=3D delta

Since running_since[timer_struct] returns zero, event timestamp
itself gets added to accumulated_runtime, causing usage to go
high something like 2693%.

> ev3.end
>
> processing
> clear
>
>
> if so, then we're loosing events, which is no good. reporting less than 1=
00%
> is ok, but reporting less than real is not.

I did thought of it. Yes, agree that, we are loosing events for which
start timestamp
is not recorded. I believe correct solution would be to consider these
events end
timestamp relative to first_stamp(src/process/do_process.cpp).

>
>
> p.s.
> I'll try to check emails, but most probably will be off-line most of the =
day.
>
>         -ss
>
>
>> Currently these events exit timestamp itself is considered as
>> usage period resulting in over 100% usage.
>> - clearing event timestamps from global map at the end of each
>> measurement to avoid collision with earlier recorded timestamps.
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> ---
>>  src/process/timer.cpp | 5 ++++-
>>  src/process/work.cpp  | 5 ++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/src/process/timer.cpp b/src/process/timer.cpp
>> index 8917490..db074c4 100644
>> --- a/src/process/timer.cpp
>> +++ b/src/process/timer.cpp
>> @@ -79,7 +79,8 @@ uint64_t timer::done(uint64_t time, uint64_t timer_str=
uct)
>>  {
>>       int64_t delta;
>>
>> -     if (running_since[timer_struct] > time)
>> +     if (running_since.find(timer_struct) =3D=3D running_since.end() ||
>> +                     running_since[timer_struct] > time)
>>               return 0;
>>
>>       delta =3D time - running_since[timer_struct];
>> @@ -147,6 +148,8 @@ void clear_timers(void)
>>               all_timers.erase(it);
>>               it =3D all_timers.begin();
>>       }
>> +
>> +     running_since.clear();
>>  }
>>
>>  bool timer::is_deferred(void)
>> diff --git a/src/process/work.cpp b/src/process/work.cpp
>> index 82f13a2..e436643 100644
>> --- a/src/process/work.cpp
>> +++ b/src/process/work.cpp
>> @@ -56,7 +56,8 @@ uint64_t work::done(uint64_t time, uint64_t work_struc=
t)
>>  {
>>       int64_t delta;
>>
>> -     if (running_since[work_struct] > time)
>> +     if (running_since.find(work_struct) =3D=3D running_since.end() ||
>> +                     running_since[work_struct] > time)
>>               return 0;
>>
>>       delta =3D time - running_since[work_struct];
>> @@ -102,6 +103,8 @@ void clear_work(void)
>>               all_work.erase(it);
>>               it =3D all_work.begin();
>>       }
>> +
>> +     running_since.clear();
>>  }
>>
>>
>> --
>> 1.7.11.3
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>



-- =

Regards,
Rajagopal

--===============7234205126963873856==--

