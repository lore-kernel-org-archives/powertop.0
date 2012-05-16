Content-Type: multipart/mixed; boundary="===============2745891914682127218=="
MIME-Version: 1.0
From: Marti Raudsepp <marti at juffo.org>
Subject: Re: [Powertop] PowerTOP 2.0 bugs
Date: Thu, 17 May 2012 00:04:04 +0300
Message-ID: <CABRT9RCxvdDgsf+-hqryrD+Ft7DPdJmBs55PORT6kPPyeEBNHw@mail.gmail.com>
In-Reply-To: 4FB29270.60008@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2745891914682127218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 8:29 PM, Chris Ferron
<chris.e.ferron(a)linux.intel.com> wrote:
> OK, lets start with bug 1. It seem there is a definite issues with non-in=
tel
> processors.
> Problem is I am having a hard time getting my hands on a non-intel based
> system.
> Second part of my thoughts is you are seeing a issues wiht you AMD, but y=
ou
> Core i5
> may look similar but actually i suspect is not incorrect.

> The reason this is important to define, is there is different code paths =
for
> Intel and non-intel processors, so getting comparable data between them is
> important. In other words there are three general areas where is issue co=
uld
> be happening, and if you are actually seeing the same issue on both
> processors then it points to the only 1 point that is shard in this area.

Well the symptoms are the same on both Intel and AMD. If you say the
code paths are independent then the problem might be something
external -- libraries, kernel, perf, etc. Maybe something specific to
Arch Linux that doesn't occur on your distro?

One thing I noticed is when I manually refresh the screen with the R
key, it always correctly reports ~399% CPU use. Only when I wait it to
refresh by itself, it displays bogus numbers.

Here's the Intel system:
Summary: 0.5 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
166.4% CPU use
                Usage       Events/s    Category       Description
            100.0%                      Device         Radio device: dell-l=
aptop
              1.8 ms/s      0.00        Process
/usr/bin/pulseaudio --start --log-target=3Dsyslog
             60.0 pkts/s                Device         Network
interface: wlan0 (iwlwifi)
            100.0%                      Device         USB device:
DW375 Bluetooth Module (Dell Computer Corp)
             20.0 =C2=B5s/s      0.20        kWork          flush_to_ldisc
             17.6 =C2=B5s/s      0.10        Process        SCREEN -Rd
             1621 ms/s      0.05        Process        openssl speed
aes -multi 4

Intel, manually refreshed:
Summary: 0.6 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
397.6% CPU use

                Usage       Events/s    Category       Description
            100.0%                      Device         Radio device: dell-l=
aptop
              7.2 ms/s      0.00        Process
/usr/bin/pulseaudio --start --log-target=3Dsyslog
             93.6 pkts/s                Device         Network
interface: wlan0 (iwlwifi)
            100.0%                      Device         USB device:
DW375 Bluetooth Module (Dell Computer Corp)
              7.6 ms/s       0.6        Process
/usr/lib/firefox/plugin-container /usr/lib/mozilla/plugins/libflas
             3724 ms/s      0.00        Process        openssl speed
aes -multi 4

AMD system:
Summary: 2.1 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
186.0% CPU use

                Usage       Events/s    Category       Description
             1760 ms/s      0.05        Process        openssl
            100.0%                      Device         Audio codec hwC0D0: =
VIA
             64.0 ms/s      0.05        Process        openssl speed
aes -multi 4

AMD, manually refreshed:
Summary: 0.0 wakeups/second,  0.0 GPU ops/second, 0.0 VFS ops/sec and
399.7% CPU use

                Usage       Events/s    Category       Description
             3902 ms/s      0.00        Process        openssl speed
aes -multi 4

I also tried launching 4 copies of 'dd if=3D/dev/zero of=3D/dev/null' to
see if this is specific to openssl, but no -- it also happens with dd.

> In regards to your Intel system. You could be seeing more the 100% of cpu=
s.
> This is the measurement of the cpus not the package. I don't have the full
> data sheet for your CPU, but you may see up to 400% as your system has
> 2cores with two threads each.
> 400% of the cpu =3D 100% of the package.

Yeah, I'm expecting to see 400% utilization.

> Could you reproduce Bug 1 and send me the data for each Processor, and if
> you feel so inclined maybe play with the changes below on you AMD system.

/proc/cpuinfo:

processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 16
model		: 4
model name	: AMD Phenom(tm) II X4 940 Processor
stepping	: 2
microcode	: 0x1000086
cpu MHz		: 800.000
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
nonstop_tsc extd_apicid pni monitor cx16 popcnt lahf_lm cmp_legacy svm
extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit
wdt npt lbrv svm_lock nrip_save
bogomips	: 6028.35
TLB size	: 1024 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

----

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 37
model name      : Intel(R) Core(TM) i5 CPU       M 560  @ 2.67GHz
stepping        : 5
microcode       : 0x2
cpu MHz         : 1199.000
cache size      : 3072 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 11
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl
vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt aes
lahf_lm ida arat dts tpr_shadow vnmi flexpriority ept vpid
bogomips        : 5322.27
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

Any other info I can provide?

> At this point I think for Bug1, this is an issue with the "last_stamp" not
> getting zeroed out, and the effective freq measurements. It could be
> something as simple as below, but like I said I haven't gotten a AMD syst=
em
> to work with.

Thanks, I tried your patch, but the issue remains.

PS: If you haven't set up your mail client to preserve tabs/long lines
then please send the patch as an attachment instead of pasting.

Regards,
Marti

--===============2745891914682127218==--

