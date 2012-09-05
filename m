Content-Type: multipart/mixed; boundary="===============7272875308006166632=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 22:49:32 +0530
Message-ID: <CA+Z25wXvAWioKXqkrN9kQwwG_9J52B6HSRR0XPobmvKjUh-Q2A@mail.gmail.com>
In-Reply-To: 5047872C.1090608@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7272875308006166632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5 September 2012 22:39, Arjan van de Ven <arjan(a)linux.intel.com> wrote:
> On 9/5/2012 9:56 AM, Rajagopal Venkat wrote:
>>> measure1:
>>> ev3.start
>>> ev1.end  <<<<<
>>
>> evX.end  <<<<<
>> These events are causing numbers to go wrong.
>
> but out of a 20 second window.. this is a tiny tiny window...
> if you see 100.1% I'd buy this reasoning.
> but you're seeing much more than that.

How about generating a report for 1sec duration?
Since timestamp itself is added to accumulated_runtime, the usage
percentage is really dependent on event end timestamp value.

>
>
>>>
>>> if so, then we're loosing events, which is no good. reporting less than=
 100%
>>> is ok, but reporting less than real is not.
>>
>> I did thought of it. Yes, agree that, we are loosing events for which
>> start timestamp
>
> we can't lose those!
> those are the events that give us the initial CPU frequency in the window=
 etc....
>

Yes agree. I will submit the next version patch considering those events end
timestamp relative to first_stamp(src/process/do_process.cpp).



-- =

Regards,
Rajagopal

--===============7272875308006166632==--

