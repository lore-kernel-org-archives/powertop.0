Content-Type: multipart/mixed; boundary="===============7721508568410162561=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: Re: [Powertop] [PATCH] src/main: Add missing pthread header
Date: Fri, 29 Mar 2019 21:40:50 +0000
Message-ID: <2824B99DC70CE746926327C52CA42F764880B6DD@ORSMSX111.amr.corp.intel.com>
In-Reply-To: 20190329040926.18563-1-rosenp@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7721508568410162561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Applied!

> -----Original Message-----
> From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of
> Rosen Penev
> Sent: Thursday, March 28, 2019 9:09 PM
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH] src/main: Add missing pthread header
> =

> Otherwise compilation can fail with:
> =

> main.cpp: In function 'void one_measurement(int, int, char*)':
> main.cpp:226:3: error: 'pthread_t' was not declared in this scope
>    pthread_t thread =3D 0UL;
>    ^~~~~~~~~
> main.cpp:226:3: note: suggested alternative: 'pread'
>    pthread_t thread =3D 0UL;
>    ^~~~~~~~~
>    pread
> =

> et al.
> =

> Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
> ---
>  src/main.cpp | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/src/main.cpp b/src/main.cpp index cbb7a4e..75d4202 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -39,6 +39,7 @@
>  #include <locale.h>
>  #include <sys/resource.h>
>  #include <limits.h>
> +#include <pthread.h>
> =

>  #include "cpu/cpu.h"
>  #include "process/process.h"
> --
> 2.17.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============7721508568410162561==--

