Content-Type: multipart/mixed; boundary="===============8516960994278622308=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] fix cpuidle state name parsing
Date: Tue, 31 Jul 2012 15:04:44 -0700
Message-ID: <54463.10.255.82.41.1343772284.squirrel@linux.jf.intel.com>
In-Reply-To: CA+Z25wXABDtAnmPAUXzBfRofz=t0qyzcUpdiaMGGTOaaJT1wHA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8516960994278622308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> This patch fixes powertop to display cpuidle states on platforms
> where cpuidle stateX directory name field does not contain
> "CX" string. On some platforms, the name field contains meaningful
> strings like WFI, Sleep, DeepSleep.
>
> Please review the patch.
>
Im not sure this is doing what you think it is, and if it is doing
something; then i fear its an weird artifact of something else.

I assume when you say "some platforms" you mean "ARM"?
Can you detail out with data what the bug is you are having, along with
expected results?
What is your test platform, kernel version, etc.
By your comment of what fields contents, I am betting there is more work
to be done here
then just what you sent regardless.
Im not going to take this patch at this time, until I understand the full
details.

Please be verbose, I have no ARM platforms to experiment or test with.

-Chris


> On 23 June 2012 00:08, Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> wrote:
>
>> parse cpuidle C state based on sysfs file entry(stateX)
>> instead of state name/description
>>
>> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
>> ---
>>  src/cpu/abstract_cpu.cpp |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
>> index cd4eba0..72969fc 100644
>> --- a/src/cpu/abstract_cpu.cpp
>> +++ b/src/cpu/abstract_cpu.cpp
>> @@ -147,7 +147,7 @@ void abstract_cpu::insert_cstate(const char
>> *linux_name, const char *human_name,
>>         strcpy(state->linux_name, linux_name);
>>         strcpy(state->human_name, human_name);
>>
>> -       c =3D human_name;
>> +       c =3D linux_name;
>>         while (*c) {
>>                 if (strcmp(linux_name, "active")=3D=3D0) {
>>                         state->line_level =3D LEVEL_C0;
>> --
>> 1.7.9.5
>>
>>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


--===============8516960994278622308==--

