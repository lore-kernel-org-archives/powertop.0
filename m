Content-Type: multipart/mixed; boundary="===============8796340874055476060=="
MIME-Version: 1.0
From: Jose Luis Rivas <ghostbar at debian.org>
Subject: [Powertop] ia64 builds fails (and maybe alpha too?)
Date: Tue, 03 Sep 2013 18:34:29 -0430
Message-ID: <52266AFD.4000301@debian.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8796340874055476060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

[Please keep Julian CC'd since I don't know if he's subscribed to this
list, I am.]

Hi,

During the packaging of PowerTOP for Debian we have come across and
issue in the building for `ia64`[0][1]. Julian (co-maintainer at
Debian) made a patch for it [2][3].

Doing some research it looks like this was removed on `9ce9ec6`[4]
altogether with `alpha` support. What are those older kernels
mentioned in the commit message? Maybe our build-daemons for ia64 have
older kernels in that case please let us know which is the minimum
kernel version for this to work.

If is not the case and in fact we need the patch, can this be included
upstream before and we can make a new release of PowerTOP with this?

Kind regards,
Keep up the good work!

[0]
https://buildd.debian.org/status/fetch.php?pkg=3Dpowertop&arch=3Dia64&ver=
=3D2.4-1&stamp=3D1377923202

[1] Excerpt from the build log:
```
g++ -DHAVE_CONFIG_H -I. -I..  -D_FORTIFY_SOURCE=3D2
- -I/usr/include/libnl3     -DLOCALEDIR=3D\"/usr/share/locale\"
- -D_FORTIFY_SOURCE=3D2 -fno-omit-frame-pointer -fstack-protector -Wall
- -Wshadow -Wformat   -I/usr/include/libnl3    -g -O2 -Wformat
- -Werror=3Dformat-security -c -o perf/powertop-perf.o `test -f
'perf/perf.cpp' || echo './'`perf/perf.cpp
perf/perf.cpp:1:0: warning: -fstack-protector not supported for this
target [enabled by default]
perf/perf.cpp: In function 'int sys_perf_event_open(perf_event_attr*,
pid_t, int, int, long unsigned int)':
perf/perf.cpp:67:17: error: '__NR_perf_event_open' was not declared in
this scope
perf/perf.cpp:69:1: warning: control reaches end of non-void function
[-Wreturn-type]
make[4]: *** [perf/powertop-perf.o] Error 1
make[3]: *** [all] Error 2
```

[2] https://github.com/ghostbar/powertop.deb/pull/2

[3]
https://github.com/juw/powertop.deb/blob/1a298734a297f83a72601fe0c2aab7f88b=
cd6b3b/debian/patches/0001-Fix-build-on-ia64.patch

[4]
https://github.com/fenrus75/powertop/commit/9ce9ec662ce7b642967fd75222114b6=
24b8a503a
- -- =

Jose Luis Rivas
The Debian Project -- http://debian.org
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEAREDAAYFAlImav0ACgkQOKCtW8rKsRjqxwCgkk9dVz7MaYPZdJ8vZ2a/wodO
GLYAnRkoeXYPiW4n805L2pL+YCgO8spV
=3D2eeU
-----END PGP SIGNATURE-----

--===============8796340874055476060==--

