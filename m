Content-Type: multipart/mixed; boundary="===============0807337706321971561=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 08:12:44 -0700
Message-ID: <50476BEC.3080308@linux.intel.com>
In-Reply-To: 20120905124458.GA16664@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0807337706321971561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/05/2012 05:44 AM, Sergey Senozhatsky wrote:
> Hi,
>
> On (09/05/12 15:52), Rajagopal Venkat wrote:
>> Incorrect timer and work perf events timestamp tracing is one
>> of the reason for reporting usage over 100%. This patch will
>> resolve the issue by
>> - rejecting the events for which entry timestamp is not recorded.
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
> ev3.end
>
> processing
> clear
>
>
> if so, then we're loosing events, which is no good. reporting less than 1=
00%
> is ok, but reporting less than real is not.
>
>
> p.s.
> I'll try to check emails, but most probably will be off-line most of the =
day.
>
> 	-ss
Yes! This is a hard issues. Some report say CPU usage over 100% which in =

some cases is correct. For instance for IA, a CPU can run over 100% of =

it's listed frequency. For instance listed freq could be 3.4 but in =

turbo mode the freq govonor can request max and be given 3.8Ghz for a =

duration. Also overall if all processor cores are running at 100% you =

essentially can have a overall usage of over 100%.
There have been some cases reported where CPU usage is WAY over 100% and =

that is an issue, but I have has a hard time reproducing the issues.

This can be tricky business, so care is needed.

-Chris


>
>
>> Currently these events exit timestamp itself is considered as
>> usage period resulting in over 100% usage.
>> - clearing event timestamps from global map at the end of each
>> measurement to avoid collision with earlier recorded timestamps.
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> ---
>>   src/process/timer.cpp | 5 ++++-
>>   src/process/work.cpp  | 5 ++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/src/process/timer.cpp b/src/process/timer.cpp
>> index 8917490..db074c4 100644
>> --- a/src/process/timer.cpp
>> +++ b/src/process/timer.cpp
>> @@ -79,7 +79,8 @@ uint64_t timer::done(uint64_t time, uint64_t timer_str=
uct)
>>   {
>>   	int64_t delta;
>>   =

>> -	if (running_since[timer_struct] > time)
>> +	if (running_since.find(timer_struct) =3D=3D running_since.end() ||
>> +			running_since[timer_struct] > time)
>>   		return 0;
>>   =

>>   	delta =3D time - running_since[timer_struct];
>> @@ -147,6 +148,8 @@ void clear_timers(void)
>>   		all_timers.erase(it);
>>   		it =3D all_timers.begin();
>>   	}
>> +
>> +	running_since.clear();
>>   }
>>   =

>>   bool timer::is_deferred(void)
>> diff --git a/src/process/work.cpp b/src/process/work.cpp
>> index 82f13a2..e436643 100644
>> --- a/src/process/work.cpp
>> +++ b/src/process/work.cpp
>> @@ -56,7 +56,8 @@ uint64_t work::done(uint64_t time, uint64_t work_struc=
t)
>>   {
>>   	int64_t delta;
>>   =

>> -	if (running_since[work_struct] > time)
>> +	if (running_since.find(work_struct) =3D=3D running_since.end() ||
>> +			running_since[work_struct] > time)
>>   		return 0;
>>   =

>>   	delta =3D time - running_since[work_struct];
>> @@ -102,6 +103,8 @@ void clear_work(void)
>>   		all_work.erase(it);
>>   		it =3D all_work.begin();
>>   	}
>> +
>> +	running_since.clear();
>>   }
>>   =

>>   =

>> -- =

>> 1.7.11.3
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============0807337706321971561==--

