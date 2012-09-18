Content-Type: multipart/mixed; boundary="===============5562328951443887020=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 11:23:29 +0530
Message-ID: <CA+Z25wVQO-a7Rqjh+XA0iAb04sNoRE8bd2H0UBXtjjrM-b5KuA@mail.gmail.com>
In-Reply-To: 1347945791.3210.9.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5562328951443887020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18 September 2012 10:53, Magnus Fromreide <magfr(a)lysator.liu.se> wrote:
> On Tue, 2012-09-18 at 09:54 +0530, Rajagopal Venkat wrote:
>> On 17 September 2012 21:58, Chris Ferron <chris.e.ferron(a)linux.intel.c=
om> wrote:
>> > On 09/17/2012 07:34 AM, Rajagopal Venkat wrote:
>> >>
>> >>     #include "devices/device.h"
>> >> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
>> >> index eaef7f1..c9d6b0b 100644
>> >> --- a/src/process/do_process.cpp
>> >> +++ b/src/process/do_process.cpp
>> >> @@ -869,7 +869,7 @@ void process_update_display(void)
>> >>                 if (!show_power)
>> >>                         strcpy(power, "          ");
>> >>                 sprintf(name, "%s", all_power[i]->type());
>> >> -               while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
>> >> +               while (mbstowcs(NULL,name,20) < 14) strcat(name, " ");
>> >>
>> >
>> > mbstowcs(NULL,name,0) is a test. return will be count. while catches t=
he
>> > error.
>>
>> Agree. The Android bionic libc version of mbstowcs always returns zero if
>> max(third parameter) is zero, resulting in infinite loop.
>
> Have you reported the bug in the library to Google? If the first
> argument is NULL posix says the third argument should be ignored.

I don't see bionic libc claiming to be posix compliant.
>
> What happens if 'name' is more than 20 characters? It shouldn't affect
> this use of mbstowcs but there might be others.
>
>> I believe this change should not cause any adverse effect on current beh=
avior.
>> The mbstowcs would stop parsing source string when it encounters null-ch=
aracter
>> or max len. Atleast I didn't observe any change in return value(count).
>
> It shouldn't change the behaviour since mbstowcs is required to ignore
> it's third argument if the first argument is NULL.
As there is no change in current behaviour. Can this be considered for
supporting
Android?

>
> /MF
>



-- =

Regards,
Rajagopal

--===============5562328951443887020==--

