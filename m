Content-Type: multipart/mixed; boundary="===============7724423363408865788=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Wed, 04 Sep 2013 10:32:59 +0300
Message-ID: <20130904073258.GA2616@swordfish>
In-Reply-To: 52266C26.4070705@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7724423363408865788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/03/13 16:09), Arjan van de Ven wrote:
> >g++ -DHAVE_CONFIG_H -I. -I..  -D_FORTIFY_SOURCE=3D2
> >- -I/usr/include/libnl3     -DLOCALEDIR=3D\"/usr/share/locale\"
> >- -D_FORTIFY_SOURCE=3D2 -fno-omit-frame-pointer -fstack-protector -Wall
> >- -Wshadow -Wformat   -I/usr/include/libnl3    -g -O2 -Wformat
> >- -Werror=3Dformat-security -c -o perf/powertop-perf.o `test -f
> >'perf/perf.cpp' || echo './'`perf/perf.cpp
> >perf/perf.cpp:1:0: warning: -fstack-protector not supported for this
> >target [enabled by default]
> >perf/perf.cpp: In function 'int sys_perf_event_open(perf_event_attr*,
> >pid_t, int, int, long unsigned int)':
> >perf/perf.cpp:67:17: error: '__NR_perf_event_open' was not declared in
> >this scope
> >perf/perf.cpp:69:1: warning: control reaches end of non-void function
> >[-Wreturn-type]
> >make[4]: *** [perf/powertop-perf.o] Error 1
> >make[3]: *** [all] Error 2
> >```
> =

> if your kernel does not have "perf", there is no point in using powertop.=
...
> really; it will not work at all.
> =

> (including anything asm-generic/foo also is the wrong answer; that direct=
ory is not architectural
> from a kernel perspective, only for indirect inclusion)
> =


we had this workaround some time ago, it was removed by

commit 9ce9ec662ce7b642967fd75222114b624b8a503a
Author: Chris E Ferron <chris.e.ferron(a)linux.intel.com>
Date:   Fri Jul 20 15:14:08 2012 -0700

    removed re-define of __NR_perf_event_open, what was needed for stale
    headers in older kernels. sys/syscall.h will not be correct.


-/* __NR_perf_event_open in ia64 and alpha is defined elsewhere */
-#ifdef __ia64__
-#include <asm-generic/unistd.h>
-#endif


	-ss

--===============7724423363408865788==--

