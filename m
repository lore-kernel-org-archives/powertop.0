Content-Type: multipart/mixed; boundary="===============8599519789486285146=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] Make it possible to include parse-events.h
 before libc headers.
Date: Thu, 26 Jul 2012 15:09:49 -0700
Message-ID: <5011C02D.80805@linux.intel.com>
In-Reply-To: 1343244370.6440.4.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8599519789486285146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/25/2012 12:26 PM, Magnus Fromreide wrote:
> On Wed, 2012-07-25 at 10:44 -0700, Chris Ferron wrote:
>> On 07/23/2012 11:03 PM, Magnus Fromreide wrote:
>>> The __unused macro interferes with the glibc and is in a reserved names=
pace
>>> so it should be renamed.
>>> Additionally the __ununsed macro is used from just one implementation f=
ile so
>>> the macro is moved there.
>>>
>>> Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
>>>    =

>>>    =

>> I will forward this on to Steve Rostedt. pevent code is not actually
>> strictly part of the powertop src, it is just temporarily being built as
>> part of the project so powertop can take advantage of it early.
> Thanks. I found no contact information for pevent but it feels like an
> imported library.
>
>> That said, it may not be a good fit for the grand scheme.
>> Which reminds me I need to push a readme explaining this.
> I am looking forward to it.
>
> Patch 2/2 depends on this, should I prepare an alternate version that
> doesn't trigger the bug in the pevent headers?
Maybe, but wait a day, you inspired me to completely update and rebase =

the pevent code.
>
> /MF
>


--===============8599519789486285146==--

