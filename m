Content-Type: multipart/mixed; boundary="===============5048462324183525570=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 10:22:32 -0700
Message-ID: <50478A58.5020704@linux.intel.com>
In-Reply-To: CA+Z25wXvAWioKXqkrN9kQwwG_9J52B6HSRR0XPobmvKjUh-Q2A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5048462324183525570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/5/2012 10:19 AM, Rajagopal Venkat wrote:
> On 5 September 2012 22:39, Arjan van de Ven <arjan(a)linux.intel.com> wro=
te:
>> On 9/5/2012 9:56 AM, Rajagopal Venkat wrote:
>>>> measure1:
>>>> ev3.start
>>>> ev1.end  <<<<<
>>>
>>> evX.end  <<<<<
>>> These events are causing numbers to go wrong.
>>
>> but out of a 20 second window.. this is a tiny tiny window...
>> if you see 100.1% I'd buy this reasoning.
>> but you're seeing much more than that.
> =

> How about generating a report for 1sec duration?

even for 1 second... still it's miniscule compared to this whole 1 second
the amount of setup/teardown time just is not that huge.



--===============5048462324183525570==--

