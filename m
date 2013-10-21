Content-Type: multipart/mixed; boundary="===============6553007531282101220=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] update source file for android
Date: Mon, 21 Oct 2013 15:03:42 +0300
Message-ID: <20131021120342.GA2429@swordfish.minsk.epam.com>
In-Reply-To: 1382356066-21359-1-git-send-email-sanjay.rawat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6553007531282101220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/21/13 17:17), Sanjay Singh Rawat wrote:
> - these files are missing in the android makefile
> =

> Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>

Hello,

I took both patches and merged them into one

	[PATCH] resolve android build errors

since they address RAPL android build errors.


added to the -next tree. thank you.

	-ss

> ---
>  Android.mk |    4 ++++
>  1 file changed, 4 insertions(+)
> =

> diff --git a/Android.mk b/Android.mk
> index ec47c4b..cf13fe8 100644
> --- a/Android.mk
> +++ b/Android.mk
> @@ -31,6 +31,9 @@ LOCAL_SRC_FILES +=3D \
>  	src/cpu/cpu_core.cpp \
>  	src/cpu/cpu_package.cpp \
>  	src/cpu/abstract_cpu.cpp \
> +	src/cpu/cpu_rapl_device.cpp \
> +	src/cpu/dram_rapl_device.cpp \
> +	src/cpu/rapl/rapl_interface.cpp \
>  	src/measurement/measurement.cpp \
>  	src/measurement/acpi.cpp \
>  	src/measurement/extech.cpp \
> @@ -62,6 +65,7 @@ LOCAL_SRC_FILES +=3D \
>  	src/devices/backlight.cpp \
>  	src/devices/network.cpp \
>  	src/devices/device.cpp \
> +	src/devices/gpu_rapl_device.cpp \
>  	src/devlist.cpp \
>  	src/calibrate/calibrate.cpp \
>  	src/lib.cpp \
> -- =

> 1.7.9.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6553007531282101220==--

