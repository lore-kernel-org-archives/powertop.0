Content-Type: multipart/mixed; boundary="===============2523389195166092291=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2] Fix string null termination and SIGABRT
 from glibc
Date: Wed, 26 Sep 2012 10:13:45 -0700
Message-ID: <506337C9.1090807@linux.intel.com>
In-Reply-To: 20120926141939.GB3014@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2523389195166092291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/26/2012 07:19 AM, Sergey Senozhatsky wrote:
> On (09/26/12 16:12), Mikko Rapeli wrote:
>> According to http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D682388
>> the string is not null terminated when too much data is read.
>>
>> This patch fixes the crashes on my system.
>> ---
>>   src/process/process.cpp |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> LGTM, thanks!
>
> 	-ss
>   =

Your patch has been merged.
Thank You
-C

>> diff --git a/src/process/process.cpp b/src/process/process.cpp
>> index 71f81b6..34dc68d 100644
>> --- a/src/process/process.cpp
>> +++ b/src/process/process.cpp
>> @@ -86,7 +86,7 @@ static void cmdline_to_string(char *str)
>>   =

>>   process::process(const char *_comm, int _pid, int _tid) : power_consum=
er()
>>   {
>> -	char line[4096];
>> +	char line[4097];
>>   	ifstream file;
>>   =

>>   	strcpy(comm, _comm);
>> @@ -103,6 +103,7 @@ process::process(const char *_comm, int _pid, int _t=
id) : power_consumer()
>>   		file.open(line);
>>   		while (file) {
>>   			file.getline(line, 4096);
>> +			line[4096] =3D '\0';
>>   			if (strstr(line, "Tgid")) {
>>   				char *c;
>>   				c =3D strchr(line, ':');
>> -- =

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


--===============2523389195166092291==--

