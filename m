Content-Type: multipart/mixed; boundary="===============0919002762990748749=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Bug-fix:Segmentation fault with powertop --html
Date: Thu, 22 May 2014 14:56:18 -0700
Message-ID: <53028.10.24.1.89.1400795778.squirrel@linux.intel.com>
In-Reply-To: 20140522154532.79d1ffe3@ilfaris
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0919002762990748749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>> Julian can you test the patch please. thank you. AY.
> Thank you for the patch but unfortunately powertop still segfaults:
> $ powertop --html
> Loaded 750 prior measurements
> RAPL device for cpu 0
> RAPL device for cpu 0
> Preparing to take measurements
>   unknown op '{'
> *** Error in `powertop': free(): invalid pointer: 0x000000000187cdef ***
> Taking 1 measurement(s) for a duration of 20 second(s) each.
> [1]    22616 segmentation fault (core dumped)  powertop --html
>
> Backtrace:
> #0  0x00007f63d8c8e1af in std::string::assign(std::string const&) ()
>    from /usr/lib/x86_64-linux-gnu/libstdc++.so.6
> #1  0x0000000000410f31 in operator=3D (__str=3D"C1", this=3D0x7fff65b509a=
0)
>     at /usr/include/c++/4.8/bits/basic_string.h:547
> #2  report_display_cpu_cstates () at cpu/cpu.cpp:587
> #3  0x00000000004493f4 in one_measurement (seconds=3Dseconds(a)entry=3D20,
> workload=3Dworkload(a)entry=3D0x7fff65b521b0 "") at main.cpp:221
> #4  0x00000000004496a6 in make_report (time=3D20,
> workload=3Dworkload(a)entry=3D0x7fff65b521b0 "",
> iterations=3Diterations(a)entry=3D1, file=3Dfile(a)entry=3D0x7fff65b511b0
> "powertop.html") at main.cpp:264 #5  0x000000000040741d in main
> (argc=3D2, argv=3D0x7fff65b532d8) at main.cpp:441
>
>
> Cheers,
> Julian
>

Julian, thank you for testing. The patches I sent you yesterday fixed the
previous segfault.  I'm currently looking into another solution.

Thank you,
Alexandra.

--===============0919002762990748749==--

