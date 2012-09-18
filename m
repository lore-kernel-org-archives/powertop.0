Content-Type: multipart/mixed; boundary="===============2843450603552206107=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: Re: [Powertop] [PATCH 1/2] Updates to support Android platform
Date: Tue, 18 Sep 2012 09:54:37 +0530
Message-ID: <CA+Z25wU4UMNYCR7hR2LWDhSprArsSk8U=rKrGRNCM-+hYHhTRA@mail.gmail.com>
In-Reply-To: 50574FA0.1050102@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2843450603552206107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 17 September 2012 21:58, Chris Ferron <chris.e.ferron(a)linux.intel.com>=
 wrote:
> On 09/17/2012 07:34 AM, Rajagopal Venkat wrote:
>>
>>     #include "devices/device.h"
>> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
>> index eaef7f1..c9d6b0b 100644
>> --- a/src/process/do_process.cpp
>> +++ b/src/process/do_process.cpp
>> @@ -869,7 +869,7 @@ void process_update_display(void)
>>                 if (!show_power)
>>                         strcpy(power, "          ");
>>                 sprintf(name, "%s", all_power[i]->type());
>> -               while (mbstowcs(NULL,name,0) < 14) strcat(name, " ");
>> +               while (mbstowcs(NULL,name,20) < 14) strcat(name, " ");
>>
>
> mbstowcs(NULL,name,0) is a test. return will be count. while catches the
> error.

Agree. The Android bionic libc version of mbstowcs always returns zero if
max(third parameter) is zero, resulting in infinite loop.

I believe this change should not cause any adverse effect on current behavi=
or.
The mbstowcs would stop parsing source string when it encounters null-chara=
cter
or max len. Atleast I didn't observe any change in return value(count).

>
>
>>                 if (all_power[i]->events() =3D=3D 0 && all_power[i]->usa=
ge()
>> =3D=3D 0 && all_power[i]->Witts() =3D=3D 0)
>> @@ -882,7 +882,7 @@ void process_update_display(void)
>>                         else
>>                                 sprintf(usage, "%5i%s",
>> (int)all_power[i]->usage(), all_power[i]->usage_units());
>>                 }
>> -               while (mbstowcs(NULL,usage,0) < 14) strcat(usage, " ");
>> +               while (mbstowcs(NULL,usage,20) < 14) strcat(usage, " ");
>>                 sprintf(events, "%5.1f", all_power[i]->events());
>>                 if (!all_power[i]->show_events())
>>                         events[0] =3D 0;
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop



-- =

Regards,
Rajagopal

--===============2843450603552206107==--

