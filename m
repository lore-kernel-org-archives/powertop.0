Content-Type: multipart/mixed; boundary="===============4079333325496877865=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] enumerate cpu based on different string on ARM
Date: Wed, 04 Jun 2014 15:01:52 -0700
Message-ID: <63810.10.24.5.211.1401919312.squirrel@linux.intel.com>
In-Reply-To: 20140604063401.GB1099@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4079333325496877865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Patch added.

Sanjay thank you for sending the patch.

Sergey thank you for looking at this.

Alex
> On (06/04/14 11:27), Sanjay Singh Rawat wrote:
>> bogomips is removed by timer-backed delay loop (commit 9fc2105a)
>> in ARM kernel. Using other suitable string to decide to enumerate each
>> cpu.
>
>
> looks good.
>
> 	-ss
>
>> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
>> ---
>>  src/cpu/cpu.cpp |   12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>> index b3b6166..105c066 100644
>> --- a/src/cpu/cpu.cpp
>> +++ b/src/cpu/cpu.cpp
>> @@ -296,6 +296,18 @@ void enumerate_cpus(void)
>>  				number =3D -2;
>>  			}
>>  		}
>> +		/* bogomips is removed in ARM, using CPU revision to enumerate */
>> +		if (strncasecmp(line, "CPU revision\t", 13) =3D=3D 0) {
>> +			if (number =3D=3D -1) {
>> +				/* Not all /proc/cpuinfo include "processor\t". */
>> +				number =3D 0;
>> +			}
>> +			if (number >=3D 0) {
>> +				handle_one_cpu(number, vendor, family, model);
>> +				set_max_cpu(number);
>> +				number =3D -2;
>> +			}
>> +		}
>>  	}
>>
>>
>> --
>> 1.7.10.4
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
>


Thank you,
Alexandra.

--===============4079333325496877865==--

