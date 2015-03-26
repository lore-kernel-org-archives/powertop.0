Content-Type: multipart/mixed; boundary="===============0527273431405659755=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: [Powertop] Incorrect reporting for Intel 3930K model and others
Date: Thu, 26 Mar 2015 19:39:50 +0100
Message-ID: <alpine.LSU.2.20.1503261922370.16949@nerf40.vanv.qr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0527273431405659755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Using powertop v2.7-28-g3f5bccb, combined with the following CPU/system:

19:21 niw-hv03:~ # lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                12
On-line CPU(s) list:   0-11
Thread(s) per core:    2
Core(s) per socket:    6
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 45
Model name:            Intel(R) Core(TM) i7-3930K CPU @ 3.20GHz
Stepping:              7
CPU MHz:               3400.000
CPU max MHz:           3800.0000
CPU min MHz:           1200.0000
BogoMIPS:              6400.76
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              12288K
NUMA node0 CPU(s):     0-11


and the following computational non-IO load:

19:23 niw-hv03:~ # w
 19:23:42 up 10 days, 18:44,  1 user,  load average: 12.73, 12.54, 12.43
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    ares40.inai.de   19:17    6.00s  0.06s  0.00s w

19:23 niw-hv03:~ # sensors
coretemp-isa-0000
Adapter: ISA adapter
Physical id 0:  +80.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 0:         +80.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 1:         +79.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 2:         +74.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 3:         +76.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 4:         +78.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)
Core 5:         +79.0=C2=B0C  (high =3D +81.0=C2=B0C, crit =3D +91.0=C2=B0C)


Leads to these frequencies being shown across the system:

19:21 niw-hv03:~ # cpupower frequency-info
analyzing CPU 0:
  driver: intel_pstate
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 0.97 ms.
  hardware limits: 1.20 GHz - 3.80 GHz
  available cpufreq governors: performance, powersave
  current policy: frequency should be within 1.20 GHz and 3.80 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency is 3.40 GHz (asserted by call to hardware).
  boost state support:
    Supported: yes
    Active: yes
    3600 MHz max turbo 4 active cores
    3700 MHz max turbo 3 active cores
    3800 MHz max turbo 2 active cores
    3800 MHz max turbo 1 active cores


# powertop
<Frequency Stats tab>:
            Package |             Core    |            CPU 0       CPU 1
                    |                     | Actual    3.4 GHz     3.4 GHz
Idle       100.0%   | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 2       CPU 3
                    |                     | Actual    3.4 GHz     3.4 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 4       CPU 5
                    |                     | Actual    3.4 GHz     3.4 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 6       CPU 7
                    |                     | Actual    3.4 GHz     3.4 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%

                    |             Core    |            CPU 8       CPU 9
                    |                     | Actual    3.4 GHz     3.4 GHz
                    | Idle       100.0%   | Idle       100.0%      100.0%


Why is it showing all-idle-100%? That makes no sense.

Another user reported this to me for a similar model, apparently with a =

BIOS-overclocked 4460(non-K) [fam 6 model 60 stepping 3]. BOINC global =

host info reveals that 6-60-3 is also used for 4790K.

--===============0527273431405659755==--

