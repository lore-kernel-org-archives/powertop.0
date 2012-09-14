Content-Type: multipart/mixed; boundary="===============5100406606584286318=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Remove unneded escaping backslashes from CSS
Date: Fri, 14 Sep 2012 14:15:33 +0400
Message-ID: <505303C5.8090902@samsung.com>
In-Reply-To: 1347616964.6783.13.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5100406606584286318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear Paul,

Paul Menzel wrote:
> Am Freitag, den 14.09.2012, 13:46 +0400 schrieb Igor Zhbanov:
>> Remove unneded escaping backslashes from CSS.
> copying the summary into the body is not useful, because it adds no
> further information.
What to do when the commit summary describes all of the issue?
Should I left body empty?
> Please also add why the escaping was added beforehand and why it is
> unneeded.
I don't know why this particular escapes was added.
In the file powertop.css there are lots of escaped quotes characters (")
because later each line of this file will be wrapped inside of "LINE\n"
to form a C array css[] in the file css.h.

But I don't know the reason for putting backslashes before slash in a =

closing
</div> tag for jQuery append() method. I don't know any special handling
of slashes in append() method.

Should I repost the patch with another description?

>> ---
>>   src/powertop.css |   16 ++++++++--------
>>   1 files changed, 8 insertions(+), 8 deletions(-)
>>
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

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============5100406606584286318==--

