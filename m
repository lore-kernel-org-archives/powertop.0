Content-Type: multipart/mixed; boundary="===============7009096130529970685=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: Re: [Powertop] [PATCH POWERTOP] Remove temporary file created during
 calibration
Date: Mon, 04 Aug 2014 19:54:10 +0600
Message-ID: <CAHu9=sN2XadgzysWQZCPR0vaWy41aXJ2G9jhznBCDqY__Z3ppQ@mail.gmail.com>
In-Reply-To: 60129.10.24.2.137.1406571225.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7009096130529970685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandra,

Sorry for late reply due to holidays. I have resent the patches. Please che=
ck.

--
Thanks,
-Meraj

On Tue, Jul 29, 2014 at 12:13 AM, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:
> Hi Mohammad and Amit,
>
>> Mohammad,
>>
>> This fix should go upstream. cc'ing the powertop list.
>>
>> Regards,
>> Amit
>>
>> On Thu, Jun 26, 2014 at 12:27 PM, Mohammad Merajul Islam Molla
>> <meraj.enigma(a)gmail.com> wrote:
>>> powertop creates temporary file in /tmp folder during calibration.
>>> Simply closing does not remove these files.
>>> Instead use unlink to remove the file.
>>>
>>> diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
>>> index db368e0..1336c3f 100644
>>> --- a/src/calibrate/calibrate.cpp
>>> +++ b/src/calibrate/calibrate.cpp
>>> @@ -242,7 +242,7 @@ static void *burn_disk(void *dummy)
>>>                 write(fd, buffer, 64*1024);
>>>                 fdatasync(fd);
>>>         }
>>> -       close(fd);
>>> +       unlink(filename);
>>>         return NULL;
>>>  }
>>>
>>>
>>>
>>> --
>>> Thanks,
>>> -Meraj
>>>
>>> _______________________________________________
>>> linaro-dev mailing list
>>> linaro-dev(a)lists.linaro.org
>>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
>
> Please send your patch against the tip of the tree.  I'm having
> difficulties applying it.  Here is the error message:
>
> Patch is empty.  Was it split wrong?
> If you would prefer to skip this patch, instead run "git am --skip".
> To restore the original branch and stop patching run "git am --abort".
>
> Thank you,
> Alexandra.

--===============7009096130529970685==--

