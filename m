Content-Type: multipart/mixed; boundary="===============7873968119300752927=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 12:05:01 +0300
Message-ID: <20120520090501.GA3515@swordfish>
In-Reply-To: 1337503302.67870.YahooMailNeo@web160301.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7873968119300752927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/20/12 01:41), Rui DaCosta wrote:
>    I get the following segfault running 2.0 from unmodified source and
>    default build options in Arch Linux ARM:
>    Linux alarm 3.1.10-10-ARCH #1 PREEMPT Thu May 10 02:00:37 UTC 2012
>    armv5tel GNU/Linux
>    Cannot load from file /var/cache/powertop/saved_results.powertop
>    Cannot load from file /var/cache/powertop/saved_parameters.powertop
>    Segmentation fault
>    trace is:
>    #0 handle_one_cpu (model=3D0, family=3D0, vendor=3D0xbeffcf8c "",
>    number=3D4294967295)

weird and overflowed input.
could you please provide your /proc/cpuinfo output?

	-ss

>    at cpu/cpu.cpp:210
>    #1 enumerate_cpus () at cpu/cpu.cpp:276
>    #2 0x000495d8 in main (argc=3D1, argv=3D0xbefffcc4) at main.cpp:382
>    please let me know if there's anything else I can provide to assist.
>    Regards,
>    RuiDC



--===============7873968119300752927==--

