Content-Type: multipart/mixed; boundary="===============3689132663529778258=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Allow frequency stats when cpuidle is not
 enabled
Date: Thu, 29 Nov 2012 08:04:20 -0800
Message-ID: <50B78784.6070808@linux.intel.com>
In-Reply-To: 20121123153051.GA3236@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3689132663529778258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/23/2012 07:30 AM, Sergey Senozhatsky wrote:
> On (11/22/12 13:05), Rajagopal Venkat wrote:
>> Powertop fails to display frequency stats when cpuidle subsystem
>> is not enabled. Fix it.
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> ---
>>   src/cpu/cpu_linux.cpp | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> thanks for your patch.
>
> frankly, looking at measurement_start()/measurement_end() I've a feeling =
that it's
> better to refactor these functions. both of them are performing different=
 parsings of
> P/C states, and with your patch we jump over 50% of functionality, which =
looks to me
> like a reason to make measurement_start()/measurement_end() smaller by mo=
ving
> P/C states parsing to separate functions:
Sorry for the late response, but I think i agree with Sergey is connect =

here. Besides I personally am not a huge fan of using "goto" statements =

unless there really no other alternatives.
>
> for example (a bit ugly function names)
>
> measurement_start()
> {
> 	parse_idle_on_measure_start();
> 	parse_stats_on_measure_start();
> }
>
> and similar for measurement_end().
I think this concept may work just fine.
>
>
>
> what do you, guys, think?
Can you refactor your change to eliminate the "goto" statements, and =

apply something like what Sergey has suggested?
>
> 	-ss
>
>
>> diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
>> index d6caf45..b8dbbc5 100644
>> --- a/src/cpu/cpu_linux.cpp
>> +++ b/src/cpu/cpu_linux.cpp
>> @@ -63,7 +63,7 @@ void cpu_linux::measurement_start(void)
>>   =

>>   	dir =3D opendir(filename);
>>   	if (!dir)
>> -		return;
>> +		goto cpufreq;
>>   =

>>   	/* For each C-state, there is a stateX directory which
>>   	 * contains a 'usage' and a 'time' (duration) file */
>> @@ -112,6 +112,7 @@ void cpu_linux::measurement_start(void)
>>   	}
>>   	closedir(dir);
>>   =

>> +cpufreq:
>>   	last_stamp =3D 0;
>>   =

>>   	for (i =3D 0; i < children.size(); i++)
>> @@ -149,7 +150,7 @@ void cpu_linux::measurement_end(void)
>>   =

>>   	dir =3D opendir(filename);
>>   	if (!dir)
>> -		return;
>> +		goto cpufreq;
>>   =

>>   	/* For each C-state, there is a stateX directory which
>>   	 * contains a 'usage' and a 'time' (duration) file */
>> @@ -188,6 +189,7 @@ void cpu_linux::measurement_end(void)
>>   	}
>>   	closedir(dir);
>>   =

>> +cpufreq:
>>   	sprintf(filename, "/sys/devices/system/cpu/cpu%i/cpufreq/stats/time_i=
n_state", number);
>>   =

>>   	file.open(filename, ios::in);
>> -- =

>> 1.7.11.3
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop
>>


--===============3689132663529778258==--

