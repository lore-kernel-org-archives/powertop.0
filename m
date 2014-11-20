Content-Type: multipart/mixed; boundary="===============5808985855542388345=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] close_display() sigsegv
Date: Wed, 19 Nov 2014 20:13:34 -0800
Message-ID: <58593.10.24.5.197.1416456814.squirrel@linux.intel.com>
In-Reply-To: CAG27Bk39ET-Ccz0ahfufUwHgxQiWKj=MCioVx+3ztomLtwXxng@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5808985855542388345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sami,

> Hello,
>
> It might be good idea to check before final release if the issue
> reported in this email can be reproduced.
>
> $ echo $CC
> clang
> $ echo $CFLAGS
> -O0 -g -ggdb -Wall -Wextra -pedantic -fno-omit-frame-pointer
> $ echo $LD
> ld.gold
>
> After compiling the version above I always get crash.
>
> $ git describe
> v2.7-rc1-1-g959227c
>
> $ ./src/powertop
> ....
> Leaving PowerTOPtimates do 21 measurement(s) connected to battery only
> Segmentation fault (core dumped)
>
> It looks like commit 706bc28ff536f4f53fdf6e24178b9e3bac67d53f might
> have something to do with the issue.
>
> (gdb) bt full
> #0  0x00007f59287ed200 in std::string::compare(std::string const&)
> const () from /usr/lib/libstdc++.so.6
> No symbol table info available.
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> #1  0x000000000041066d in std::operator< <char,
> std::char_traits<char>, std::allocator<char> > (__lhs=3D, __rhs=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/basic_string.h:2590
> No locals.
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> #2  0x000000000040f681 in std::less<std::string>::operator()
> (this=3D0x6c3268 <tab_windows>, __x=3D, __y=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/stl_function.h:371
> No locals.
> #3  0x0000000000411817 in std::_Rb_tree<std::string,
> std::pair<std::string const, tab_window*>,
> std::_Select1st<std::pair<std::string const, tab_window*> >,
> std::less<std::string>, std::allocator<std::pair<std::string const,
> tab_window*> > >::_M_lower_bound (
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
>     this=3D0x6c3268 <tab_windows>, __x=3D0x5828990, __y=3D0x6c3270
> <tab_windows+8>, __k=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/stl_tree.h:1261
> No locals.
> #4  0x00000000004117c1 in std::_Rb_tree<std::string,
> std::pair<std::string const, tab_window*>,
> std::_Select1st<std::pair<std::string const, tab_window*> >,
> std::less<std::string>, std::allocator<std::pair<std::string const,
> tab_window*> > >::lower_bound (
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
>     this=3D0x6c3268 <tab_windows>, __k=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/stl_tree.h:927
> No locals.
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> #5  0x00000000004107ed in std::map<std::string, tab_window*,
> std::less<std::string>, std::allocator<std::pair<std::string const,
> tab_window*> > >::lower_bound (this=3D0x6c3268 <tab_windows>, __x=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/stl_map.h:902
> No locals.
> Python Exception <class 'gdb.error'> There is no member named
> _M_dataplus.:
> #6  0x000000000040f0a2 in std::map<std::string, tab_window*,
> std::less<std::string>, std::allocator<std::pair<std::string const,
> tab_window*> > >::operator[] (this=3D0x6c3268 <tab_windows>, __k=3D)
>     at
> /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.2/../../../../include/=
c++/4.9.2/bits/stl_map.h:496
>         __i =3D {first =3D <error reading variable>
> #7  0x000000000040e03a in close_display () at display.cpp:93
>         i =3D 5
> #8  0x0000000000416c2e in clean_shutdown () at main.cpp:378
> No locals.
> #9  0x0000000000417477 in main (argc=3D1, argv=3D0x7fff77810778) at
> main.cpp:519
>         option_index =3D 0
>         c =3D -1
>         filename =3D
> "\210\a\201w\377\177\000\000\b-.)Y\177\000\000\000\000\000\000\000\000\00=
0\000\303Z\355'Y\177\000\000\020\220i\002\000\000\000\000\320\366\200w\377\=
177\000\000x\a\201w\377\177\000\000e\356\f)Y\177\000\000\350\003\000\000@\0=
00\000\000(a)B\017\000\000\312\232;/proc/net/psched",
> '\000' <repeats 2680 times>...
>         workload =3D '\000' <repeats 4095 times>
>         iterations =3D 1
>         auto_tune =3D 0
>
> --
> Sami Kerola
> http://www.iki.fi/kerolasa/
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

Thank you for sending this bug report.  Yes I want to get this workout
before the release.

I'm trying to reproduce this error but I cant get it to show me the seg
fault.

Please help me review the steps to compile powertop using clang.

Thank you,
Alexandra.

--===============5808985855542388345==--

