Content-Type: multipart/mixed; boundary="===============5376567451660472960=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Tue, 03 Sep 2013 16:09:26 -0700
Message-ID: <52266C26.4070705@linux.intel.com>
In-Reply-To: 52266AFD.4000301@debian.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5376567451660472960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/3/2013 4:04 PM, Jose Luis Rivas wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: RIPEMD160
>
> [Please keep Julian CC'd since I don't know if he's subscribed to this
> list, I am.]
>
> Hi,
>
> During the packaging of PowerTOP for Debian we have come across and
> issue in the building for `ia64`[0][1]. Julian (co-maintainer at
> Debian) made a patch for it [2][3].
>
> Doing some research it looks like this was removed on `9ce9ec6`[4]
> altogether with `alpha` support. What are those older kernels
> mentioned in the commit message? Maybe our build-daemons for ia64 have
> older kernels in that case please let us know which is the minimum
> kernel version for this to work.
>
> If is not the case and in fact we need the patch, can this be included
> upstream before and we can make a new release of PowerTOP with this?
>
> Kind regards,
> Keep up the good work!
>
> [0]
> https://buildd.debian.org/status/fetch.php?pkg=3Dpowertop&arch=3Dia64&ver=
=3D2.4-1&stamp=3D1377923202
>
> [1] Excerpt from the build log:
> ```
> g++ -DHAVE_CONFIG_H -I. -I..  -D_FORTIFY_SOURCE=3D2
> - -I/usr/include/libnl3     -DLOCALEDIR=3D\"/usr/share/locale\"
> - -D_FORTIFY_SOURCE=3D2 -fno-omit-frame-pointer -fstack-protector -Wall
> - -Wshadow -Wformat   -I/usr/include/libnl3    -g -O2 -Wformat
> - -Werror=3Dformat-security -c -o perf/powertop-perf.o `test -f
> 'perf/perf.cpp' || echo './'`perf/perf.cpp
> perf/perf.cpp:1:0: warning: -fstack-protector not supported for this
> target [enabled by default]
> perf/perf.cpp: In function 'int sys_perf_event_open(perf_event_attr*,
> pid_t, int, int, long unsigned int)':
> perf/perf.cpp:67:17: error: '__NR_perf_event_open' was not declared in
> this scope
> perf/perf.cpp:69:1: warning: control reaches end of non-void function
> [-Wreturn-type]
> make[4]: *** [perf/powertop-perf.o] Error 1
> make[3]: *** [all] Error 2
> ```

if your kernel does not have "perf", there is no point in using powertop....
really; it will not work at all.

(including anything asm-generic/foo also is the wrong answer; that director=
y is not architectural
from a kernel perspective, only for indirect inclusion)



--===============5376567451660472960==--

