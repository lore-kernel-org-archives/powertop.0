Content-Type: multipart/mixed; boundary="===============9203938793296587185=="
MIME-Version: 1.0
From: Harvey <harv at gmx.de>
Subject: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Sun, 21 Dec 2014 20:10:24 +0100
Message-ID: <54971B20.6020708@gmx.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9203938793296587185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hope I am right here:

On Archlinux 64bit as well as 32bit systems powertop 2.7 crashes
reproducible like this when called with the parameter --auto-tune:

Steps to reproduce: Just try:

[root(a)teefax ~]# powertop --auto-tune
Loaded 0 prior measurements
Cannot load from file /var/cache/powertop/saved_parameters.powertop
RAPL device for cpu 0
RAPL device for cpu 0
RAPL device for cpu 0
Devfreq not enabled
Cannot load from file /var/cache/powertop/saved_parameters.powertop
unknown op '{'
Leaving PowerTOP
*** Error in `powertop': double free or corruption (!prev): 0x0975bc20 ***
=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
/usr/lib/libc.so.6(+0x6b5c9)[0xb74685c9]
/usr/lib/libc.so.6(+0x71217)[0xb746e217]
/usr/lib/libc.so.6(+0x719ed)[0xb746e9ed]
/usr/lib/libc.so.6(closedir+0x23)[0xb74aafd3]
powertop[0x806fb31]
powertop[0x805758a]
powertop[0x804d36e]
/usr/lib/libc.so.6(__libc_start_main+0xde)[0xb7414e5e]
powertop[0x804e39d]
=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D
08048000-080bb000 r-xp 00000000 08:13 129320 /usr/bin/powertop
080bb000-080bc000 r--p 00072000 08:13 129320 /usr/bin/powertop
080bc000-080bd000 rw-p 00073000 08:13 129320 /usr/bin/powertop
080bd000-080bf000 rw-p 00000000 00:00 0
09529000-09ae7000 rw-p 00000000 00:00 0 [heap]
b73e1000-b73e4000 rw-p 00000000 00:00 0
b73e4000-b73f8000 r-xp 00000000 08:13 149123 /usr/lib/libresolv-2.20.so
b73f8000-b73f9000 ---p 00014000 08:13 149123 /usr/lib/libresolv-2.20.so
b73f9000-b73fa000 r--p 00014000 08:13 149123 /usr/lib/libresolv-2.20.so
b73fa000-b73fb000 rw-p 00015000 08:13 149123 /usr/lib/libresolv-2.20.so
b73fb000-b73fd000 rw-p 00000000 00:00 0
b73fd000-b75ae000 r-xp 00000000 08:13 149166 /usr/lib/libc-2.20.so
b75ae000-b75b1000 r--p 001b0000 08:13 149166 /usr/lib/libc-2.20.so
b75b1000-b75b3000 rw-p 001b3000 08:13 149166 /usr/lib/libc-2.20.so
b75b3000-b75b5000 rw-p 00000000 00:00 0
b75b5000-b75d1000 r-xp 00000000 08:13 159577 /usr/lib/libgcc_s.so.1
b75d1000-b75d2000 rw-p 0001b000 08:13 159577 /usr/lib/libgcc_s.so.1
b75d2000-b761d000 r-xp 00000000 08:13 149165 /usr/lib/libm-2.20.so
b761d000-b761e000 r--p 0004a000 08:13 149165 /usr/lib/libm-2.20.so
b761e000-b761f000 rw-p 0004b000 08:13 149165 /usr/lib/libm-2.20.so
b761f000-b7708000 r-xp 00000000 08:13 159583 /usr/lib/libstdc++.so.6.0.20
b7708000-b770c000 r--p 000e9000 08:13 159583 /usr/lib/libstdc++.so.6.0.20
b770c000-b770d000 rw-p 000ed000 08:13 159583 /usr/lib/libstdc++.so.6.0.20
b770d000-b7715000 rw-p 00000000 00:00 0
b7715000-b772d000 r-xp 00000000 08:13 149130 /usr/lib/libpthread-2.20.so
b772d000-b772e000 r--p 00017000 08:13 149130 /usr/lib/libpthread-2.20.so
b772e000-b772f000 rw-p 00018000 08:13 149130 /usr/lib/libpthread-2.20.so
b772f000-b7731000 rw-p 00000000 00:00 0
b7731000-b773d000 r-xp 00000000 08:13 137914 /usr/lib/libpci.so.3.3.0
b773d000-b773e000 r--p 0000b000 08:13 137914 /usr/lib/libpci.so.3.3.0
b773e000-b773f000 rw-p 0000c000 08:13 137914 /usr/lib/libpci.so.3.3.0
b773f000-b77a1000 r-xp 00000000 08:13 132783 /usr/lib/libncursesw.so.5.9
b77a1000-b77a3000 r--p 00062000 08:13 132783 /usr/lib/libncursesw.so.5.9
b77a3000-b77a4000 rw-p 00064000 08:13 132783 /usr/lib/libncursesw.so.5.9
b77a4000-b77c2000 r-xp 00000000 08:13 149793 /usr/lib/libnl-3.so.200.20.0
b77c2000-b77c3000 r--p 0001d000 08:13 149793 /usr/lib/libnl-3.so.200.20.0
b77c3000-b77c4000 rw-p 0001e000 08:13 149793 /usr/lib/libnl-3.so.200.20.0
b77c4000-b77c9000 r-xp 00000000 08:13 149794
/usr/lib/libnl-genl-3.so.200.20.0
b77c9000-b77ca000 r--p 00004000 08:13 149794
/usr/lib/libnl-genl-3.so.200.20.0
b77ca000-b77cb000 rw-p 00005000 08:13 149794
/usr/lib/libnl-genl-3.so.200.20.0
b77d6000-b77d8000 rw-p 00000000 00:00 0
b77d8000-b77da000 r--p 00000000 00:00 0 [vvar]
b77da000-b77db000 r-xp 00000000 00:00 0 [vdso]
b77db000-b77fc000 r-xp 00000000 08:13 149126 /usr/lib/ld-2.20.so
b77fc000-b77fd000 rw-p 00000000 00:00 0
b77fd000-b77fe000 r--p 00021000 08:13 149126 /usr/lib/ld-2.20.so
b77fe000-b77ff000 rw-p 00022000 08:13 149126 /usr/lib/ld-2.20.so
bfe80000-bfea1000 rw-p 00000000 00:00 0 [stack]
Aborted (core dumped)

See also Arch Bug report here:
https://bugs.archlinux.org/task/43150

They pointed me to this mailing list. Hope I am right here.

Harvey

-- =

I am root. If you see me laughing, you'd better have a backup!

--===============9203938793296587185==--

