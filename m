Content-Type: multipart/mixed; boundary="===============6482632147828495453=="
MIME-Version: 1.0
From: Martin Ziegler <ziegler at email.mathematik.uni-freiburg.de>
Subject: [Powertop] segmentation fault when shutting down
Date: Thu, 08 May 2014 21:50:55 +0200
Message-ID: <E1WiULH-0003wm-PQ@tux00.mathematik.uni-freiburg.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6482632147828495453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When shutting down powertop segfaults:


ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}=
) =3D 0
ioctl(1, SNDCTL_TMR_STOP or TCSETSW, {B38400 opost isig icanon -echo ...}) =
=3D 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon -echo ...=
}) =3D 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon -echo ...=
}) =3D 0
ioctl(1, SNDCTL_TMR_STOP or TCSETSW, {B38400 opost isig icanon echo ...}) =
=3D 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}=
) =3D 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++


This occured on v2.6-rc2 and on kernels 3.13,3.14,3.15-rc4

Regards

(Martin Ziegler)


--===============6482632147828495453==--

