Content-Type: multipart/mixed; boundary="===============8302070904376269037=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [powertop] ::wiggle() - what does that do?
Date: Tue, 19 Mar 2013 12:58:49 -0700
Message-ID: <5148C379.7000002@linux.intel.com>
In-Reply-To: 1756753.dFRy6JGU15@intelfx-laptop
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8302070904376269037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/19/2013 12:57 PM, Ivan Shapovalov wrote:
> On 19 March 2013 12:53:26 Arjan van de Ven wrote:
>> On 3/19/2013 12:51 PM, Ivan Shapovalov wrote:
>>> Hello all,
>>>
>>> I've been wondering on what does the abstract_cpu::wiggle() function do=
es
>>> and why it is needed?.. All the code says is that it is needed to "have=
 a
>>> record of CPU at the start and end of the perf trace".
>>>
>>> I'm asking just because I feel somewhat uncomfortable to have powertop
>>> changing my scaling frequency back and forth each N seconds. :)
>>
>> the reason this exists is that powertop wants to track what frequency the
>> cpu is at for the duration... ... and there's no way to ask for "current=
",
>> only to get change notifications
>>
>> so wiggle() forces a change... and from then on we know what it's at.
>
> ...And why isn't it possible to keep the value from last notification?

there may not have been one...

> Because time can pass between measurement end and new measurement start?

yep



--===============8302070904376269037==--

