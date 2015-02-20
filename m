Content-Type: multipart/mixed; boundary="===============7820044568364752120=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] corrupted double-linked list error on exit
Date: Fri, 20 Feb 2015 15:47:38 -0800
Message-ID: <39535.10.7.198.102.1424476058.squirrel@linux.intel.com>
In-Reply-To: 39524.10.7.198.102.1424475781.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7820044568364752120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>
>> I'm seeing the same issue on 3.18.6-1-ARCH.
>>
>> [samer(a)archbox ~]$ sudo powertop --auto-tune
>> Loaded 34 prior measurements
>> Cannot load from file /var/cache/powertop/saved_parameters.powertop
>> RAPL device for cpu 0
>> RAPL Using PowerCap Sysfs : Domain Mask f
>> RAPL device for cpu 0
>> RAPL Using PowerCap Sysfs : Domain Mask f
>> RAPL device for cpu 0
>> RAPL Using PowerCap Sysfs : Domain Mask f
>> Devfreq not enabled
>> Cannot load from file /var/cache/powertop/saved_parameters.powertop
>>    unknown op '{'
>> To show power estimates do 263 measurement(s) connected to battery
>> onlyLeaving PowerTOP
>> *** Error in `powertop': corrupted double-linked list:
>> 0x0000000000fbceb0 ***
>>
>> Any idea what's causing this?
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>


 Hi Samer,

Thank you for reporting this issue.  I'm not sure what is causing it.  But
I'm investigating, meanwhile. Can you give me more details on the platform
you are running?

Thank you,
 Alexandra.


Thank you,
Alexandra.

--===============7820044568364752120==--

