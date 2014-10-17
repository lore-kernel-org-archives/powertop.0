Content-Type: multipart/mixed; boundary="===============5840881771331137824=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 5/8] Limit sprintf to buffer size length.
Date: Fri, 17 Oct 2014 10:36:37 -0700
Message-ID: <544153A5.8000306@linux.intel.com>
In-Reply-To: 20141015121557.GA1189@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5840881771331137824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/15/2014 05:15 AM, Sergey Senozhatsky wrote:
> On (10/14/14 11:09), Joe Konno wrote:
>> diff --git a/src/lib.cpp b/src/lib.cpp
>> index 437803b..9cbf78d 100644
>> --- a/src/lib.cpp
>> +++ b/src/lib.cpp
>> @@ -474,10 +474,10 @@ int read_msr(int cpu, uint64_t offset, uint64_t *v=
alue)
>>  	int fd;
>>  	char msr_path[256];
>>  =

>> -	sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
>> +	fd =3D snprintf(msr_path, 256, "/dev/cpu/%d/msr", cpu);
> =

> iirc, this `fd =3D' has been removed. it's useless per se.
> =

> 	-ss

Will fix.

--===============5840881771331137824==--

