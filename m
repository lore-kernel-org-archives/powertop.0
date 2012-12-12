Content-Type: multipart/mixed; boundary="===============1571082403456885011=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] cpufreq: only try to open files under cpuX
Date: Wed, 12 Dec 2012 20:56:57 +0300
Message-ID: <20121212175657.GA5332@swordfish>
In-Reply-To: 1355328973-22767-1-git-send-email-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1571082403456885011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/12/12 17:16), Jaroslav =C5=A0karvada wrote:
> There are called many useless 'open' syscalls that always fail, like:
>   open("/sys/devices/system/cpu/uevent/cpufreq/scaling_governor", O_RDONL=
Y) =3D -1 ENOTDIR (Not a directory)
> This patch filters this to /sys/devices/system/cpu/cpuX, where X is string
> starting with digit (from kernel sources it seems that X can only be inte=
ger).
> For match cases it will add only small overhead.
> =

> Originally reported as:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D886185
> =

> Signed-off-by: Jaroslav =C5=A0karvada <jskarvad(a)redhat.com>
> ---
>  src/tuning/cpufreq.cpp | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/src/tuning/cpufreq.cpp b/src/tuning/cpufreq.cpp
> index df245ad..c448f4c 100644
> --- a/src/tuning/cpufreq.cpp
> +++ b/src/tuning/cpufreq.cpp
> @@ -36,6 +36,7 @@
>  #include <dirent.h>
>  #include <errno.h>
>  #include <sys/stat.h>
> +#include <ctype.h>
>  =

>  #include "../lib.h"
>  #include "cpufreq.h"
> @@ -72,7 +73,7 @@ int cpufreq_tunable::good_bad(void)
>  		return ret;
>  =

>  	while ((dirent =3D readdir(dir))) {
> -		if (dirent->d_name[0]=3D=3D'.')
> +		if (strlen(dirent->d_name) < 4 || strncmp(dirent->d_name, "cpu", 3) !=
=3D 0 || !isdigit(dirent->d_name[3]))
>  			continue;
>  		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor=
", dirent->d_name);
>  		file =3D fopen(filename, "r");
> -- =

> 1.7.11.7
> =


Hello,
thanks for your patch. however, I'm afraid it does not fix all the cases. l=
ooking at src/tuning/cpufreq.cpp we
have several more places with exactly the same cpuX detection -- ::toggle*(=
).

could you also please remove 'strlen(dirent->d_name) < 4', looks loke a sma=
ll overhead there.

	-ss

--===============1571082403456885011==--

