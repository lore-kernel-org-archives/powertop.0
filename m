Content-Type: multipart/mixed; boundary="===============1116202239212200597=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
Date: Sun, 13 Oct 2013 17:30:04 +0300
Message-ID: <20131013143004.GA2563@swordfish>
In-Reply-To: CAM7PDoj+Hskmnje+chjYn6jM2D_zwqhLx-7LcQ5NE2UP8wyexg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1116202239212200597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/13/13 12:45), David Rosca wrote:
> Date: Sun, 13 Oct 2013 12:45:05 +0200
> From: David Rosca <nowrep(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
> =

>    This is regression from 8d6e716
> =

>    cpu_core::has_c1_res is left uninitialized for anything other than BYT=
-M,
>    resulting in error at startup:
> =

>    =C2=A0 unknown op '{'
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_msr cpu0 =
0x660 : Argument list too long.
> =

>    Signed-off-by: David Rosca <[1]nowrep(a)gmail.com>
> =

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
>    + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_c1_res =
=3D 0;
	^^^^^^^^^^^^^^^^

>    + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
	^^^^^^
>    =C2=A0}

good catch.

could you please use original code indentation?

	-ss

>    =C2=A0
>    =C2=A0void nhm_core::measurement_start(void)
>    --
>    1.8.4.rc3
> =

> References
> =

>    Visible links
>    1. mailto:nowrep(a)gmail.com

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============1116202239212200597==--

