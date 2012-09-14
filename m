Content-Type: multipart/mixed; boundary="===============1563431669859096154=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Remove unneded escaping backslashes from CSS
Date: Fri, 14 Sep 2012 08:10:07 -0700
Message-ID: <505348CF.9060207@linux.intel.com>
In-Reply-To: 20120914102356.GB3053@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1563431669859096154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/14/2012 03:23 AM, Sergey Senozhatsky wrote:
> On (09/14/12 13:46), Igor Zhbanov wrote:
>> Remove unneded escaping backslashes from CSS.
>> ---
>>   src/powertop.css |   16 ++++++++--------
>>   1 files changed, 8 insertions(+), 8 deletions(-)
>>
> looks good to me, thank you Igor.
>
> 	-ss
>   =

Patch Merged
Thank You
-C

>> diff --git a/src/powertop.css b/src/powertop.css
>> index 087e384..5d303dc 100644
>> --- a/src/powertop.css
>> +++ b/src/powertop.css
>> @@ -21,14 +21,14 @@ $(document).ready(function(){
>>   	$('#tuning h2').addClass('hide');
>>   	$('#tuning table').addClass('hide');
>>   =

>> -	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSy=
stem()\">System Info<\\/div>');
>> -	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSu=
mmary()\">Summary<\\/div>');
>> -	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCp=
uidle()\">CPU Idle<\\/div>');
>> -	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCp=
ufreq()\">CPU Frequency<\\/div>');
>> -	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSo=
ftware()\">Software info<\\/div>');
>> -	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDe=
vice()\">Device Info<\\/div>');
>> -	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTu=
ning()\">Tuning<\\/div>');
>> -	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAl=
l()\">All<\\/div>');
>> +	$('#top').append('<div class=3D\"SystemButton\"   onclick=3D\"toggleSy=
stem()\">System Info</div>');
>> +	$('#top').append('<div class=3D\"SummaryButton\"  onclick=3D\"toggleSu=
mmary()\">Summary</div>');
>> +	$('#top').append('<div class=3D\"CpuidleButton\"  onclick=3D\"toggleCp=
uidle()\">CPU Idle</div>');
>> +	$('#top').append('<div class=3D\"CpufreqButton\"  onclick=3D\"toggleCp=
ufreq()\">CPU Frequency</div>');
>> +	$('#top').append('<div class=3D\"SoftwareButton\" onclick=3D\"toggleSo=
ftware()\">Software info</div>');
>> +	$('#top').append('<div class=3D\"DeviceButton\"   onclick=3D\"toggleDe=
vice()\">Device Info</div>');
>> +	$('#top').append('<div class=3D\"TuningButton\"   onclick=3D\"toggleTu=
ning()\">Tuning</div>');
>> +	$('#top').append('<div class=3D\"AllButton\"      onclick=3D\"toggleAl=
l()\">All</div>');
>>   	$('#top .SummaryButton').toggleClass('pressed');
>>   =

>>       }
>> -- =

>> 1.7.5.4
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============1563431669859096154==--

