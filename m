Content-Type: multipart/mixed; boundary="===============1375813292424632597=="
MIME-Version: 1.0
From: dmummenschanz at web.de
Subject: Re: [Powertop] wrong package C-State with KBL
Date: Tue, 28 Mar 2017 06:45:54 +0200
Message-ID: <trinity-5a10753a-aded-4c03-9f56-c716243fe1e3-1490676354544@3capp-webde-bs63>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1375813292424632597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
 =

of course! :) Here it is. If you need any more information please let me kn=
ow.
Btw. I`ve enabled psr and fbc but there were too many freezing screens (no =
gpu hangs) so I've disabled it. The pc states however didn't change at all =
between psr/fbc on and off.
 =

HTH
 =

cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-7400T CPU @ 2.40GHz
stepping        : 9
microcode       : 0x48
cpu MHz         : 799.658
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monit=
or ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2ap=
ic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3d=
nowprefetch epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc=
_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt xsa=
veopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_=
window hwp_epp
bugs            :
bogomips        : 4800.00
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:
processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-7400T CPU @ 2.40GHz
stepping        : 9
microcode       : 0x48
cpu MHz         : 800.097
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 4
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monit=
or ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2ap=
ic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3d=
nowprefetch epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc=
_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt xsa=
veopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_=
window hwp_epp
bugs            :
bogomips        : 4800.71
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:
processor       : 2
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-7400T CPU @ 2.40GHz
stepping        : 9
microcode       : 0x48
cpu MHz         : 799.951
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 2
cpu cores       : 4
apicid          : 4
initial apicid  : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monit=
or ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2ap=
ic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3d=
nowprefetch epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc=
_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt xsa=
veopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_=
window hwp_epp
bugs            :
bogomips        : 4800.80
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:
processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Core(TM) i5-7400T CPU @ 2.40GHz
stepping        : 9
microcode       : 0x48
cpu MHz         : 799.951
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 3
cpu cores       : 4
apicid          : 6
initial apicid  : 6
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx p=
dpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopo=
logy nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monit=
or ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2ap=
ic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3d=
nowprefetch epb intel_pt tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc=
_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt xsa=
veopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_=
window hwp_epp
bugs            :
bogomips        : 4800.81
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:
=20

--===============1375813292424632597==--

