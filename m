Content-Type: multipart/mixed; boundary="===============1777949430856248902=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Relaxed autoconf version restriction for
 scratchbox build
Date: Mon, 23 Jul 2012 08:10:30 -0700
Message-ID: <500D6966.9040302@linux.intel.com>
In-Reply-To: 1342905401.4237.2.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1777949430856248902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/21/2012 02:16 PM, Paul Menzel wrote:
> Dear Chris,
>
>
> Am Freitag, den 20.07.2012, 10:27 -0700 schrieb Chris Ferron:
>> On 07/19/2012 11:52 PM, Igor Zhbanov wrote:
>>> Relaxed autoconf version restriction for scratchbox build.
>>> PowerTOP successfully builds with 2.67 version of Autotools.
>>> ---
>>>    configure.ac |    2 +-
>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/configure.ac b/configure.ac
>>> index 4b3d027..e1e670a 100644
>>> --- a/configure.ac
>>> +++ b/configure.ac
>>> @@ -1,7 +1,7 @@
>>>    #                                               -*- Autoconf -*-
>>>    # Process this file with autoconf to produce a configure script.
>>>    =

>>> -AC_PREREQ([2.68])
>>> +AC_PREREQ([2.67])
>>>    AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
>>>    AM_INIT_AUTOMAKE([-Wall foreign ])
>>>    AC_LANG([C++])
>> What is the problem? Why do you need to do this? What is the benefit to
>> the PowerTOP project?
> Hm, the commit message says it all if you know what Scratchbox [1] is.
I know a little about scratchbox. You should be talking the release tar =

yes?
> I guess Scratchbox only includes Autoconf 2.67 so PowerTOP does not
> build out of the box with Scratchbox.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.elinux.org/Toolchains#Scratchbox



--===============1777949430856248902==--

