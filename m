Content-Type: multipart/mixed; boundary="===============0687481718941279717=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 23:15:59 +0530
Message-ID: <CA+Z25wXrKPzkNDR5CbNNPW4YFLUgqPCXBDNthL09dv-4EnSdOw@mail.gmail.com>
In-Reply-To: 50478A58.5020704@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0687481718941279717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 September 2012 22:52, Arjan van de Ven <arjan(a)linux.intel.com> wrote:
> On 9/5/2012 10:19 AM, Rajagopal Venkat wrote:
>> On 5 September 2012 22:39, Arjan van de Ven <arjan(a)linux.intel.com> wr=
ote:
>>> On 9/5/2012 9:56 AM, Rajagopal Venkat wrote:
>>>>> measure1:
>>>>> ev3.start
>>>>> ev1.end  <<<<<
>>>>
>>>> evX.end  <<<<<
>>>> These events are causing numbers to go wrong.
>>>
>>> but out of a 20 second window.. this is a tiny tiny window...
>>> if you see 100.1% I'd buy this reasoning.
>>> but you're seeing much more than that.
>>
>> How about generating a report for 1sec duration?
>
> even for 1 second... still it's miniscule compared to this whole 1 second
> the amount of setup/teardown time just is not that huge.
>
Here are some perf timestamps,
(3979299431)
(3979303554)
(4079217947)
(4091306943)
(4091322535)
(4091336882)
When 1sec report is generated and if above timestamp gets
added to timer accumulated_runtime, no wonder why such
huge usage is reported.


-- =

Regards,
Rajagopal

--===============0687481718941279717==--

