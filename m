Content-Type: multipart/mixed; boundary="===============5188182784757963626=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] close_display() sigsegv
Date: Thu, 20 Nov 2014 21:51:46 +0000
Message-ID: <CAG27Bk0_Aur0GxHEC=T6zD+o9zLHigiNvwajUB-yJtXOupRcaA@mail.gmail.com>
In-Reply-To: 49456.10.24.1.226.1416512862.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5188182784757963626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20 November 2014 19:47, Alexandra Yates
<alexandra.yates(a)linux.intel.com> wrote:

Hi Alexandra,

> Followed all steps, in two platforms still cant reproduce.  (Difference)
> I'm running Ubuntu.

I just reproduced the issue with g++, without CFLAGS, or anything in
environment that I could tell would effect to compilation. Backtrace
is pretty similar.

(gdb) bt full
#0  0x000000000040a14e in _M_lower_bound (this=3D<optimized out>,
__k=3D<error reading variable: Cannot access memory at address
0xffffffffffffffe8>, __y=3D0x477368 <tab_windows+8>, __x=3D0x363e930)
    at /usr/include/c++/4.9.2/bits/stl_tree.h:1260
No locals.
#1  lower_bound (__k=3D<error reading variable: Cannot access memory at
address 0xffffffffffffffe8>, this=3D0x477360 <tab_windows>) at
/usr/include/c++/4.9.2/bits/stl_tree.h:927
No locals.
#2  lower_bound (__x=3D<error reading variable: Cannot access memory at
address 0xffffffffffffffe8>, this=3D0x477360 <tab_windows>) at
/usr/include/c++/4.9.2/bits/stl_map.h:902
No locals.
#3  operator[] (__k=3D<error reading variable: Cannot access memory at
address 0xffffffffffffffe8>, this=3D0x477360 <tab_windows>) at
/usr/include/c++/4.9.2/bits/stl_map.h:496
        __i =3D <optimized out>
#4  close_display () at display.cpp:93
        i =3D 5
#5  0x0000000000411e5e in clean_shutdown () at main.cpp:378
No locals.
#6  0x0000000000406d6d in main (argc=3D1, argv=3D0x7fff51015798) at main.cp=
p:519
        option_index =3D 0
        c =3D <optimized out>
        iterations =3D 1
        filename =3D '\000' <repeats 2928 times>...
        workload =3D '\000' <repeats 4095 times>
        auto_tune =3D 0

Maybe comparing my config.log with your will give a hint what could be goin=
g on.

http://ut3.org/~kerolasa/config.log.gz

> I will revert the culprit commit.  I would appreciate you testing again.

I think the line below should be removed as well.

main.cpp: In function 'void clean_shutdown()':
main.cpp:378:16: error: 'close_display' was not declared in this scope
  close_display();

-- =

Sami Kerola
http://www.iki.fi/kerolasa/

--===============5188182784757963626==--

