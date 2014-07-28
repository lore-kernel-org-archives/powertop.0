Content-Type: multipart/mixed; boundary="===============9191213866869957026=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH POWERTOP] Remove temporary file created during
 calibration
Date: Mon, 28 Jul 2014 11:13:45 -0700
Message-ID: <60129.10.24.2.137.1406571225.squirrel@linux.intel.com>
In-Reply-To: CAP245DWNT1zu8=0ryAN1k2RAbaxfUEsgU24G6pLQ8hv3pmN6wg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9191213866869957026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mohammad and Amit,

> Mohammad,
>
> This fix should go upstream. cc'ing the powertop list.
>
> Regards,
> Amit
>
> On Thu, Jun 26, 2014 at 12:27 PM, Mohammad Merajul Islam Molla
> <meraj.enigma(a)gmail.com> wrote:
>> powertop creates temporary file in /tmp folder during calibration.
>> Simply closing does not remove these files.
>> Instead use unlink to remove the file.
>>
>> diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
>> index db368e0..1336c3f 100644
>> --- a/src/calibrate/calibrate.cpp
>> +++ b/src/calibrate/calibrate.cpp
>> @@ -242,7 +242,7 @@ static void *burn_disk(void *dummy)
>>                 write(fd, buffer, 64*1024);
>>                 fdatasync(fd);
>>         }
>> -       close(fd);
>> +       unlink(filename);
>>         return NULL;
>>  }
>>
>>
>>
>> --
>> Thanks,
>> -Meraj
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev(a)lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Please send your patch against the tip of the tree.  I'm having
difficulties applying it.  Here is the error message:

Patch is empty.  Was it split wrong?
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

Thank you,
Alexandra.

--===============9191213866869957026==--

