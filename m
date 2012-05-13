Content-Type: multipart/mixed; boundary="===============4807042112273268167=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: [Powertop] Excessive CPU speeds shown in VM
Date: Sun, 13 May 2012 08:03:12 +0200
Message-ID: <alpine.LNX.2.01.1205130727180.29600@frira.vanv.qr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4807042112273268167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Inside a VirtualBox VM, powertop-2.0 shows:

            Package |             Core    |            CPU 0
                    |                     | Actual    9223372036854.8 GHz
Idle       100.0%   | Idle       100.0%   | Idle       100.0%

                    |             Core    |            CPU 1
                    |                     | Actual    9223372036854.8 GHz
                    | Idle       100.0%   | Idle       100.0%

(powertop-1.13 says "Detailed C-state information is not P-states =

(frequencies)")

I'd certainly love to have such a speedy CPU, though I wonder if the
laws of physics still hold at 9.2 YHz. lscpu knows more:

Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    2
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 26
Stepping:              4
CPU MHz:               2663.279
BogoMIPS:              5326.55
L1d cache:             32K
L1d cache:             32K
L2d cache:             6144K
NUMA node0 CPU(s):     0,1

--===============4807042112273268167==--

