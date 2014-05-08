Content-Type: multipart/mixed; boundary="===============4050156343571712915=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: Re: [Powertop] segmentation fault when shutting down
Date: Thu, 08 May 2014 14:41:28 -0700
Message-ID: <63496.10.24.17.174.1399585288.squirrel@linux.intel.com>
In-Reply-To: E1WiULH-0003wm-PQ@tux00.mathematik.uni-freiburg.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4050156343571712915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> When shutting down powertop segfaults:
>
>
> ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo
> ...}) =3D 0
> ioctl(1, SNDCTL_TMR_STOP or TCSETSW, {B38400 opost isig icanon -echo ...})
> =3D 0
> ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon -echo
> ...}) =3D 0
> ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon -echo
> ...}) =3D 0
> ioctl(1, SNDCTL_TMR_STOP or TCSETSW, {B38400 opost isig icanon echo ...})
> =3D 0
> ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo
> ...}) =3D 0
> --- SIGSEGV (Segmentation fault) @ 0 (0) ---
> +++ killed by SIGSEGV +++
>
>
> This occured on v2.6-rc2 and on kernels 3.13,3.14,3.15-rc4
>
> Regards
>
> (Martin Ziegler)
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>

This is interesting, I tested PowerTOP v2.6-rc2 on Linux Kernel 3.13.7,
3.14.2, 3.15.0-rc3. On Ubuntu 14.04 in four different platforms and I
can't reproducer the segmentation faults you are seen.

what distribution are you running?

Thank you,
Alexandra.

--===============4050156343571712915==--

