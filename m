Content-Type: multipart/mixed; boundary="===============3441857747546985584=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix timer and work perf events timestamp
 tracing
Date: Wed, 05 Sep 2012 10:09:00 -0700
Message-ID: <5047872C.1090608@linux.intel.com>
In-Reply-To: CA+Z25wUBxT1oCmRujQ6_nzbdSUvEmfVXoy=gxjo0Jgj-VsYxUQ@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3441857747546985584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/5/2012 9:56 AM, Rajagopal Venkat wrote:
>> measure1:
>> ev3.start
>> ev1.end  <<<<<
> =

> evX.end  <<<<<
> These events are causing numbers to go wrong.

but out of a 20 second window.. this is a tiny tiny window...
if you see 100.1% I'd buy this reasoning.
but you're seeing much more than that.


>>
>> if so, then we're loosing events, which is no good. reporting less than =
100%
>> is ok, but reporting less than real is not.
> =

> I did thought of it. Yes, agree that, we are loosing events for which
> start timestamp

we can't lose those!
those are the events that give us the initial CPU frequency in the window e=
tc....


--===============3441857747546985584==--

