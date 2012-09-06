Content-Type: multipart/mixed; boundary="===============0491449562140596499=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Thu, 06 Sep 2012 19:12:32 +0530
Message-ID: <CA+Z25wX6CkgLbKwKw6yei2i=R1AawdkEY0UWgjWDwuv9BLu=oQ@mail.gmail.com>
In-Reply-To: 504794AC.9040305@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0491449562140596499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 September 2012 23:36, Arjan van de Ven <arjan(a)linux.intel.com> wrote:
> On 9/5/2012 10:45 AM, Rajagopal Venkat wrote:
>> On 5 September 2012 22:52, Arjan van de Ven <arjan(a)linux.intel.com> wr=
ote:
>>> On 9/5/2012 10:19 AM, Rajagopal Venkat wrote:
>>>> On 5 September 2012 22:39, Arjan van de Ven <arjan(a)linux.intel.com> =
wrote:
>>>>> On 9/5/2012 9:56 AM, Rajagopal Venkat wrote:
>>>>>>> measure1:
>>>>>>> ev3.start
>>>>>>> ev1.end  <<<<<
>>>>>>
>>>>>> evX.end  <<<<<
>>>>>> These events are causing numbers to go wrong.
>>>>>
>>>>> but out of a 20 second window.. this is a tiny tiny window...
>>>>> if you see 100.1% I'd buy this reasoning.
>>>>> but you're seeing much more than that.
>>>>
>>>> How about generating a report for 1sec duration?
>>>
>>> even for 1 second... still it's miniscule compared to this whole 1 seco=
nd
>>> the amount of setup/teardown time just is not that huge.
>>>
>> Here are some perf timestamps,
>> (3979299431)
>> (3979303554)
>> (4079217947)
>> (4091306943)
>> (4091322535)
>> (4091336882)
>> When 1sec report is generated and if above timestamp gets
>> added to timer accumulated_runtime, no wonder why such
>> huge usage is reported.
>
> question is... how did these get here?
> is the kernel reporting garbage time ????
>
>
oops wrong numbers! Here is the data captured for timer::delayed_work_timer=
_fn
events on snowball. Prints are from timer::done() of src/process/timer.cpp.

---------------------------------------------------------------------------=
-------------
Measurement start time(first_stamp)  - (4379576721191)
Measurement end time(last_stamp)   - (4380607421874)

accumulated         end_timestamp  	     start_timestamp
runtime
(61035)               (4379586975097)		(4379586914062)
(122071)	      (4379607116699)		(4379607055663)
(152589)	      (4379607177734)		(4379607147216)
(183106)	      (4379627105712)		(4379627075195)
(244142)	      (4379647186279)		(4379647125243)
(274660)	      (4380506896972)		(4380506866454)
(274660)	      (4380506927490)		(4380506927490)
(305177)	      (4380506958007)		(4380506927490)
(305177)	      (4380506988525)		(4380506988525)
(4380507324219)       (4380507019042)		(0)    <<<<<<<
(4380507354736)       (4380596923827)		(4380596893310)
(4380507415771)       (4380606964111)		(4380606903076)

cpu usage from total_cpu_time() - (425033.990889%)
---------------------------------------------------------------------------=
---

As mentioned in my earlier comments, next patch will be submitted
to handle these events(for which start time is not recorded) instead
of ignoring them.

-- =

Regards,
Rajagopal

--===============0491449562140596499==--

