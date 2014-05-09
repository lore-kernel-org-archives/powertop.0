Content-Type: multipart/mixed; boundary="===============7648394787356630939=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] segmentation fault when shutting down
Date: Fri, 09 May 2014 08:14:16 +0200
Message-ID: <20140509061416.GE32300@rhrk.uni-kl.de>
In-Reply-To: 63496.10.24.17.174.1399585288.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7648394787356630939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2014 at 02:41:28PM -0700, Alexandra Yates wrote:
> This is interesting, I tested PowerTOP v2.6-rc2 on Linux Kernel 3.13.7,
> 3.14.2, 3.15.0-rc3. On Ubuntu 14.04 in four different platforms and I
> can't reproducer the segmentation faults you are seen.
>                                                                          =
            > what distribution are you running?

I also get a segfault.

Ciao
    J=C3=B6rg

powertop (git describe: v2.6-rc2-1-gb162f5d)

(gdb) bt
#0  0x00000010 in ?? ()
#1  0x0805339b in close_display () at ../../src/display.cpp:94
#2  0x08090c30 in clean_shutdown () at ../../src/main.cpp:365
#3  0x0804e575 in main (argc=3D1, argv=3D0xbff65814) at ../../src/main.cpp:=
500
(gdb) quit

jmayer(a)egg:~/work/power/powertop/git/build(master)> lsb_release -a
LSB Version: core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-ia32:=
core-3.2-ia32:core-4.0-ia32:desktop-4.0-ia32:desktop-4.0-noarch:graphics-2.=
0-ia32:graphics-2.0-noarch:graphics-3.2-ia32:graphics-3.2-noarch:graphics-4=
.0-ia32:graphics-4.0-noarch
Distributor ID: openSUSE project
Description:    openSUSE 13.1 (Bottle) (i586)
Release:        13.1
Codename:       Bottle

jmayer(a)egg:~/work/power/powertop/git/build(master)> uname -a
Linux egg 3.14.2-1.g1474ea5-desktop #1 SMP PREEMPT Sun Apr 27 14:35:22 UTC =
2014 (1474ea5) i686 i686 i386 GNU/Linux


jmayer(a)egg:~/work/power/powertop/git/build(master)> cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 23
model name      : Intel(R) Core(TM)2 Duo CPU     T8300  @ 2.40GHz
stepping        : 6
microcode       : 0x60f
cpu MHz         : 2400.000
cache size      : 3072 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fdiv_bug        : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat
+pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc a=
rch_perfmon
+pebs bts aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr =
pdcm sse4_1
+lahf_lm ida dtherm tpr_shadow vnmi flexpriority
bogomips        : 4788.29
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:
[output for processor 1 deleted]


--===============7648394787356630939==--

