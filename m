Content-Type: multipart/mixed; boundary="===============8355195539830862459=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Mon, 24 Sep 2012 17:52:50 +0530
Message-ID: <CA+Z25wX33MJqM1DPYwMXm8Uc3W0DgGuR2Gts5uiUTmu_DLSXcw@mail.gmail.com>
In-Reply-To: 5058768D.1090701@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8355195539830862459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18 September 2012 18:56, Arjan van de Ven <arjan(a)linux.intel.com> wrot=
e:
> On 9/17/2012 10:53 PM, Rajagopal Venkat wrote:
>> On 18 September 2012 10:53, Magnus Fromreide <magfr(a)lysator.liu.se> wr=
ote:
>>> On Tue, 2012-09-18 at 09:54 +0530, Rajagopal Venkat wrote:
>>>> On 17 September 2012 21:58, Chris Ferron <chris.e.ferron(a)linux.intel=
.com> wrote:
>>>>> On 09/17/2012 07:34 AM, Rajagopal Venkat wrote:
>>>>>>
>>>>>>     #include "devices/device.h"
>>>>>> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
>>>>>> index eaef7f1..c9d6b0b 100644
>>>>>> --- a/src/process/do_process.cpp
>>>>>> +++ b/src/process/do_process.cpp
>>>>>> @@ -869,7 +869,7 @@ void process_update_display(void)
>>>>>>                 if (!show_power)
>>>>>>                         strcpy(power, "          ");
>>>>>>                 sprintf(name, "%s", all_power[i]->type());
>>>>>> -               while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
>>>>>> +               while (mbstowcs(NULL,name,20) < 14) strcat(name, " "=
);
>>>>>>
>>>>>
>>>>> mbstowcs(NULL,name,0) is a test. return will be count. while catches =
the
>>>>> error.
>>>>
>>>> Agree. The Android bionic libc version of mbstowcs always returns zero=
 if
>>>> max(third parameter) is zero, resulting in infinite loop.
>>>
>>> Have you reported the bug in the library to Google? If the first
>>> argument is NULL posix says the third argument should be ignored.
>>
>> I don't see bionic libc claiming to be posix compliant.
>
> can you make a small wrapper in your android compat header to cope with t=
his case?
> (in the idea of keeping all the junk to work around a buggy platform in o=
ne place)
>

Next patch version will add this.

>
>



-- =

Regards,
Rajagopal

--===============8355195539830862459==--

