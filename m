Content-Type: multipart/mixed; boundary="===============6145189657056675086=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Tue, 24 Feb 2015 09:47:34 -0800
Message-ID: <58718.10.24.6.25.1424800054.squirrel@linux.intel.com>
In-Reply-To: 1424773607.11596.2@mail.samertm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6145189657056675086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Hi,
>
> I'm running on a Dell XPS 15 9530. The issue went away after I compiled
> powertop from source, so I'm not sure where to go from there.
>
> -samer
>
> On Fri, Feb 20, 2015 at 3:50 PM, Alex <axfelix(a)gmail.com> wrote:
>> FYI, I'm also on Arch (I think I started this thread but I can't
>> remember) and the issue has disappeared for me, I believe after
>> updating from 3.18.2 to 3.18.3. Given that it's still appearing for
>> some users it may not actually be related to the kernel, but your
>> guess is as good as mine.
>>
>> -alex
>>
>> On Fri, 20 Feb, 2015 at 3:47 PM, Alexandra Yates
>> <alexandra.yates(a)linux.intel.com> wrote:
>>>
>>>>
>>>>>  I'm seeing the same issue on 3.18.6-1-ARCH.
>>>>>
>>>>>  [samer(a)archbox ~]$ sudo powertop --auto-tune
>>>>>  Loaded 34 prior measurements
>>>>>  Cannot load from file
>>>>> /var/cache/powertop/saved_parameters.powertop
>>>>>  RAPL device for cpu 0
>>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>>  RAPL device for cpu 0
>>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>>  RAPL device for cpu 0
>>>>>  RAPL Using PowerCap Sysfs : Domain Mask f
>>>>>  Devfreq not enabled
>>>>>  Cannot load from file
>>>>> /var/cache/powertop/saved_parameters.powertop
>>>>>     unknown op '{'
>>>>>  To show power estimates do 263 measurement(s) connected to battery
>>>>>  onlyLeaving PowerTOP
>>>>>  *** Error in `powertop': corrupted double-linked list:
>>>>>  0x0000000000fbceb0 ***
>>>>>
>>>>>  Any idea what's causing this?
>>>>>
>>>>>  _______________________________________________
>>>>>  PowerTop mailing list
>>>>>  PowerTop(a)lists.01.org
>>>>>  https://lists.01.org/mailman/listinfo/powertop
>>>>>
>>>
>>>
>>>  Hi Samer,
>>>
>>> Thank you for reporting this issue.  I'm not sure what is causing
>>> it.  But
>>> I'm investigating, meanwhile. Can you give me more details on the
>>> platform
>>> you are running?
>>>
>>> Thank you,
>>>  Alexandra.
>>>
>>>
>>> Thank you,
>>> Alexandra.
>>> _______________________________________________
>>> PowerTop mailing list
>>> PowerTop(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/powertop
>

Mhh it may be an optimization error that appears only on the release.

Thank you,
Alexandra.

--===============6145189657056675086==--

