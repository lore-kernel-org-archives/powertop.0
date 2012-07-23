Content-Type: multipart/mixed; boundary="===============4610013822778865573=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Relaxed autoconf version restriction for
 scratchbox build
Date: Mon, 23 Jul 2012 10:19:41 +0400
Message-ID: <500CECFD.8040108@samsung.com>
In-Reply-To: 50099506.4010601@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4610013822778865573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

One of our build systems has autotools v2.67. So we need to apply the patch
to build with it. The benefit is that PowerTOP can be build on a wider range
of platforms. And it seems that configure.ac doesn't have any checks that
requires 2.68 version.

By the way, PowerTOP's configure.ac contains many tests which results
are never checked in source files. If you grep HAVE_ or #ifdef strings =

across
all source files, you will find only #ifdef HAVE_LIBNL20.
So IMHO configure.ac can be significantly simplified.

Although it is not a big benefit to the project, except perhaps of more =

readability
of source code.

Thank you.

Chris Ferron wrote:
> On 07/19/2012 11:52 PM, Igor Zhbanov wrote:
>> Relaxed autoconf version restriction for scratchbox build.
>> PowerTOP successfully builds with 2.67 version of Autotools.
>> ---
>>   configure.ac |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index 4b3d027..e1e670a 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -1,7 +1,7 @@
>>   #                                               -*- Autoconf -*-
>>   # Process this file with autoconf to produce a configure script.
>>   -AC_PREREQ([2.68])
>> +AC_PREREQ([2.67])
>>   AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
>>   AM_INIT_AUTOMAKE([-Wall foreign ])
>>   AC_LANG([C++])
> What is the problem? Why do you need to do this? What is the benefit =

> to the PowerTOP project?
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============4610013822778865573==--

