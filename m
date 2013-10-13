Content-Type: multipart/mixed; boundary="===============0281468412814428080=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
Date: Sun, 13 Oct 2013 21:14:42 +0300
Message-ID: <20131013181441.GB2563@swordfish>
In-Reply-To: CAM7PDojA73CEVeR39a6ndkXYcc1G_ypVe4+nHbOd8_EjYYkopg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0281468412814428080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/13/13 19:41), David Rosca wrote:
>    Oops, gmail screw it ...
>    Hope it will be ok this time:
> =

>    PS: Sorry, I sent the first reply only to Sergey.
>    Signed-off-by: David Rosca <[1]nowrep(a)gmail.com>

thanks. will add to -next tree.

	-ss

>    ---
>    =C2=A0src/cpu/intel_cpus.cpp | 4 +++-
>    =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> =

>    diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
>    index 3348dba..6330b6f 100644
>    --- a/src/cpu/intel_cpus.cpp
>    +++ b/src/cpu/intel_cpus.cpp
>    @@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
>    =C2=A0 =C2=A0 =C2=A0if (model =3D=3D 0x37) {
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c3_res =3D 0;
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c1_res =3D 1;
>    - =C2=A0 =C2=A0} else
>    + =C2=A0 =C2=A0} else {
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c3_res =3D 1;
>    + =C2=A0 =C2=A0 =C2=A0=C2=A0 has_c1_res =3D 0;
>    + =C2=A0=C2=A0 }
>    =C2=A0}
>    =C2=A0
>    =C2=A0void nhm_core::measurement_start(
>    void)
>    --
>    1.8.4.rc3
> =

>    2013/10/13 Sergey Senozhatsky <[2]sergey.senozhatsky(a)gmail.com>
> =

>      On (10/13/13 12:45), David Rosca wrote:
>      > Date: Sun, 13 Oct 2013 12:45:05 +0200
>      > From: David Rosca <[3]nowrep(a)gmail.com>
>      > To: [4]powertop(a)lists.01.org
>      > Subject: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initializat=
ion.
>      >
>      > =C2=A0 =C2=A0This is regression from 8d6e716
>      >
>      > =C2=A0 =C2=A0cpu_core::has_c1_res is left uninitialized for anythi=
ng other than
>      BYT-M,
>      > =C2=A0 =C2=A0resulting in error at startup:
>      >
>      > =C2=A0 =C2=A0=C2=A0 unknown op '{'
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 read_msr cpu0 0x660 : Argument list too long.
>      >
>      > =C2=A0 =C2=A0Signed-off-by: David Rosca <[1][5]nowrep(a)gmail.com>
>      >
>      > =C2=A0 =C2=A0---
>      > =C2=A0 =C2=A0=C2=A0src/cpu/intel_cpus.cpp | 4 +++-
>      > =C2=A0 =C2=A0=C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>      >
>      > =C2=A0 =C2=A0diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_c=
pus.cpp
>      > =C2=A0 =C2=A0index 3348dba..6330b6f 100644
>      > =C2=A0 =C2=A0--- a/src/cpu/intel_cpus.cpp
>      > =C2=A0 =C2=A0+++ b/src/cpu/intel_cpus.cpp
>      > =C2=A0 =C2=A0@@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0if (model =3D=3D 0x37) {
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c3_res =3D 0;
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c1_res =3D 1;
>      > =C2=A0 =C2=A0- =C2=A0 =C2=A0} else
>      > =C2=A0 =C2=A0+ =C2=A0 =C2=A0} else {
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c3_res =3D 1;
>      > =C2=A0 =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0has_c1_res =3D 0;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^
> =

>      > =C2=A0 =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^
>      > =C2=A0 =C2=A0=C2=A0}
> =

>      good catch.
> =

>      could you please use original code indentation?
> =

>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
>      > =C2=A0 =C2=A0=C2=A0
>      > =C2=A0 =C2=A0=C2=A0void nhm_core::measurement_start(void)
>      > =C2=A0 =C2=A0--
>      > =C2=A0 =C2=A01.8.4.rc3
>      >
>      > References
>      >
>      > =C2=A0 =C2=A0Visible links
>      > =C2=A0 =C2=A01. mailto:[6]nowrep(a)gmail.com
> =

>      > _______________________________________________
>      > PowerTop mailing list
>      > [7]PowerTop(a)lists.01.org
>      > [8]https://lists.01.org/mailman/listinfo/powertop
> =

> References
> =

>    Visible links
>    1. mailto:nowrep(a)gmail.com
>    2. mailto:sergey.senozhatsky(a)gmail.com
>    3. mailto:nowrep(a)gmail.com
>    4. mailto:powertop(a)lists.01.org
>    5. mailto:nowrep(a)gmail.com
>    6. mailto:nowrep(a)gmail.com
>    7. mailto:PowerTop(a)lists.01.org
>    8. https://lists.01.org/mailman/listinfo/powertop

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============0281468412814428080==--

