Content-Type: multipart/mixed; boundary="===============6888480137936097119=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Wed, 14 Nov 2012 01:04:22 +0000
Message-ID: <1660193715.142272.1352855062386.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: 20121113192839.GB3314@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6888480137936097119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

----- Original Message -----
Sent: Tuesday, November 13, 2012 2:28:39 PM
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
>
> hm. this is very-very early stages of calibration process, and it's very
> unlikely that powertop has done something to your system.
>
>>
>> a *very* stupid question - do you have /proc/cpuinfo file?
>>
>> Yes, I do.
>>
>> Any idea about my problem?
>>
>
> are you talking about WIFI button?


Yes sir, the WIFI button. It started flashing (orange (off) to blue (on)) t=
he moment I ran PowerTop and continues whenever I run openSUSE. I set the m=
achine up to dual-boot openSUSE and Win7 Pro. Windows does not exhibit this=
 behavior. I have tried a number of LiveCDs as well, such as Mint, Ubuntu, =
even an openSUSE KDE LiveCD, and none exhibits this behavior.

Incidentally, a number of other things happened when I ran PowerTop on this=
 machine. The screen went black and the WIFI hardware button switched to of=
f (orange). After ~two minutes the screen came back to life, albeit at 40% =
power. I had to push the WIFI button to reenable WIFI. At that point, and s=
ince then, the button flashes.

I also checked the BIOS to make sure no changes were made. I'm fairly sure =
the BIOS is unchanged.


> may I ask you to do two things
>
>	$ ls  /proc/cpuinfo
> and
>	$ cat /proc/cpuinfo
>

Sure.

cms(a)6930p:~> ls -al /proc/cpuinfo =

-r--r--r-- 1 root root 0 Nov 13 20:00 /proc/cpuinfo
cms(a)6930p:~> cat /proc/cpuinfo =

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 23
model name      : Intel(R) Core(TM)2 Duo CPU     T9800  @ 2.93GHz
stepping        : 10
microcode       : 0xa0b
cpu MHz         : 800.000
cache size      : 6144 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx l=
m constant_tsc arch_perfmon pebs bts nopl aperfmperf pni dtes64 monitor ds_=
cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm ida dtherm tp=
r_shadow vnmi flexpriority
bogomips        : 5851.79
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 23
model name      : Intel(R) Core(TM)2 Duo CPU     T9800  @ 2.93GHz
stepping        : 10
microcode       : 0xa0b
cpu MHz         : 800.000
cache size      : 6144 KB
physical id     : 0
siblings        : 2
core id         : 1
cpu cores       : 2
apicid          : 1      =

initial apicid  : 1      =

fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx l=
m constant_tsc arch_perfmon pebs bts nopl aperfmperf pni dtes64 monitor ds_=
cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm ida dtherm tp=
r_shadow vnmi flexpriority
bogomips        : 5851.79
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:


--
Chris

--===============6888480137936097119==--

