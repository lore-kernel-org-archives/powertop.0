Content-Type: multipart/mixed; boundary="===============8944715692300593497=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 02:19:22 -0700
Message-ID: <1337505562.47794.BPMail_high_noncarrier@web160306.mail.bf1.yahoo.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8944715692300593497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Sure and thanks,
(v1.13 worked fine btw)
Processor	: Feroceon 88FR131 rev 1 (v5l)
BogoMIPS	: 1191.11
Features	: swp half thumb fastmult edsp =

CPU implementer	: 0x56
CPU architecture: 5TE
CPU variant	: 0x2
CPU part	: 0x131
CPU revision	: 1

Hardware	: Marvell SheevaPlug Reference Board
Revision	: 0000
Serial		: 0000000000000000


------------------------------
On Sun, May 20, 2012 11:05 AM CEST Sergey Senozhatsky wrote:

>On (05/20/12 01:41), Rui DaCosta wrote:
>>    I get the following segfault running 2.0 from unmodified source and
>>    default build options in Arch Linux ARM:
>>    Linux alarm 3.1.10-10-ARCH #1 PREEMPT Thu May 10 02:00:37 UTC 2012
>>    armv5tel GNU/Linux
>>    Cannot load from file /var/cache/powertop/saved_results.powertop
>>    Cannot load from file /var/cache/powertop/saved_parameters.powertop
>>    Segmentation fault
>>    trace is:
>>    #0 handle_one_cpu (model=3D0, family=3D0, vendor=3D0xbeffcf8c ",
>>    number=3D4294967295)
>
>weird and overflowed input.
>could you please provide your /proc/cpuinfo output?
>
>	-ss
>
>>    at cpu/cpu.cpp:210
>>    #1 enumerate_cpus () at cpu/cpu.cpp:276
>>    #2 0x000495d8 in main (argc=3D1, argv=3D0xbefffcc4) at main.cpp:382
>>    please let me know if there's anything else I can provide to assist.
>>    Regards,
>>    RuiDC
>
>


--===============8944715692300593497==--

