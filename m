Content-Type: multipart/mixed; boundary="===============9014427876946550566=="
MIME-Version: 1.0
From: Rosen Penev <rosenp at gmail.com>
Subject: Re: [Powertop] [PATCH] event-parse: Add compatibility for non GNU
 strerror_r
Date: Thu, 06 Jun 2019 18:24:46 -0700
Message-ID: <1670e3ae-6772-cf27-b60d-0c5d7a3b21de@gmail.com>
In-Reply-To: 20190605065304.GA18527@noemi.bahnhof.se
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9014427876946550566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 6/4/2019 11:53 PM, Magnus Fromreide wrote:
> On Tue, Jun 04, 2019 at 12:04:47PM -0700, Rosen Penev wrote:
>> Needed for libraries like musl that do not implement the GNU variant.
> This patch seems curious.
>
>> Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
>> ---
>>   traceevent/event-parse.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/traceevent/event-parse.c b/traceevent/event-parse.c
>> index 5a717a0..1f7eb80 100644
>> --- a/traceevent/event-parse.c
>> +++ b/traceevent/event-parse.c
>> @@ -5121,12 +5121,17 @@ int pevent_strerror(struct pevent *pevent __mayb=
e_unused,
>>   	const char *msg;
>>   =

>>   	if (errnum >=3D 0) {
>> +#if defined(__GLIBC__)
>>   		msg =3D strerror_r(errnum, buf, buflen);
>>   		if (msg !=3D buf) {
>>   			size_t len =3D strlen(msg);
>>   			memcpy(buf, msg, min(buflen - 1, len));
>>   			*(buf + min(buflen - 1, len)) =3D '\0';
>>   		}
>> +#else
>> +		if (strerror_r(errnum, buf, buflen))
>> +			snprintf(buf, buflen, "errnum %i", errnum);
> Was
>
> if (a human readable response is returned from strerror_r)
>    clobber it with a numeric version of the error
>
> really what you wanted to achieve?
>
> I would rather expect something like
>
> 	if (errnum >=3D 0) {
> 		msg =3D strerror_r(errnum, buf, buflen);
No idea what you mean by this. The XSI strerror_r returns an int, not a =

char pointer.
> #if defined(__GLIBC__)
> 		if (msg !=3D buf)
> 			strlcpy(buf, msg, buflen);
> 	#endif
> 	}
>
> where the #ifdef ends up as a pure optimization if strerror_r is the XSI =
version.
>
> /MF
>
>> +#endif
>>   		return 0;
>>   	}
>>   =

>> -- =

>> 2.17.1
>>
>> _______________________________________________
>> PowerTop mailing list
>> PowerTop(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/powertop

--===============9014427876946550566==--

