Content-Type: multipart/mixed; boundary="===============3491680957016458012=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] cpufreq: only try to open files under cpuX
Date: Thu, 13 Dec 2012 21:21:42 +0300
Message-ID: <20121213182142.GA12076@swordfish>
In-Reply-To: 369549318.642394.1355409786073.JavaMail.root@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3491680957016458012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/13/12 09:43), Jaroslav Skarvada wrote:
> There are called many useless 'open' syscalls that always fail, like:
>   open("/sys/devices/system/cpu/uevent/cpufreq/scaling_governor", O_RDONL=
Y) =3D -1 ENOTDIR (Not a directory)
> This patch filters them to 'likely' patterns, like e.g.:
> /sys/devices/system/cpu/cpuX/cpufreq/scaling_governor, where X is string
> starting with digit. For match cases it will add only small overhead.
> =

> Originally reported as:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D886185
> =

> Signed-off-by: Jaroslav ??karvada <jskarvad(a)redhat.com>
> ---
>  src/devices/alsa.cpp       |  2 +-
>  src/devices/backlight.cpp  |  2 ++
>  src/devlist.cpp            |  3 ++-
>  src/tuning/cpufreq.cpp     | 11 ++++++-----
>  src/tuning/tuningsysfs.cpp |  5 +----
>  5 files changed, 12 insertions(+), 11 deletions(-)
>

looks good to me, thanks.

	-ss

 =

> diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
> index 4f5d3f9..33a52f5 100644
> --- a/src/devices/alsa.cpp
> +++ b/src/devices/alsa.cpp
> @@ -167,7 +167,7 @@ void create_all_alsa(void)
>  		entry =3D readdir(dir);
>  		if (!entry)
>  			break;
> -		if (entry->d_name[0] =3D=3D '.')
> +		if (strncmp(entry->d_name, "hwC", 3) !=3D 0)
>  			continue;
>  		sprintf(filename, "/sys/class/sound/card0/%s/power_on_acct", entry->d_=
name);
>  =

> diff --git a/src/devices/backlight.cpp b/src/devices/backlight.cpp
> index b8c9147..03aa5bc 100644
> --- a/src/devices/backlight.cpp
> +++ b/src/devices/backlight.cpp
> @@ -90,6 +90,8 @@ static int dpms_screen_on(void)
>  		if (!entry)
>  			break;
>  =

> +		if (strncmp(entry->d_name, "card", 4) !=3D 0)
> +			continue;
>  		sprintf(filename, "/sys/class/drm/card0/%s/enabled", entry->d_name);
>  		file.open(filename, ios::in);
>  		if (!file)
> diff --git a/src/devlist.cpp b/src/devlist.cpp
> index de5abff..633a568 100644
> --- a/src/devlist.cpp
> +++ b/src/devlist.cpp
> @@ -37,6 +37,7 @@
>  #include <sys/types.h>
>  #include <dirent.h>
>  #include <string.h>
> +#include <ctype.h>
>  =

>  using namespace std;
>  =

> @@ -117,7 +118,7 @@ void collect_open_devices(void)
>  			entry2 =3D readdir(dir2);
>  			if (!entry2)
>  				break;
> -			if (entry2->d_name[0] =3D=3D '.')
> +			if (!isdigit(entry2->d_name[0]))
>  				continue;
>  			sprintf(filename, "/proc/%s/fd/%s", entry->d_name, entry2->d_name);
>  			memset(link, 0, 4096);
> diff --git a/src/tuning/cpufreq.cpp b/src/tuning/cpufreq.cpp
> index df245ad..e870559 100644
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
> +		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_nam=
e[3]))
>  			continue;
>  		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor=
", dirent->d_name);
>  		file =3D fopen(filename, "r");
> @@ -123,7 +124,7 @@ void cpufreq_tunable::toggle(void)
>  			return;
>  =

>  		while ((dirent =3D readdir(dir))) {
> -			if (dirent->d_name[0]=3D=3D'.')
> +			if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_na=
me[3]))
>  				continue;
>  			sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governo=
r", dirent->d_name);
>  			file =3D fopen(filename, "w");
> @@ -141,7 +142,7 @@ void cpufreq_tunable::toggle(void)
>  		return;
>  =

>  	while ((dirent =3D readdir(dir))) {
> -		if (dirent->d_name[0]=3D=3D'.')
> +		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_nam=
e[3]))
>  			continue;
>  		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor=
", dirent->d_name);
>  		file =3D fopen(filename, "w");
> @@ -171,7 +172,7 @@ const char *cpufreq_tunable::toggle_script(void) {
>  			return NULL;
>  =

>  		while ((dirent =3D readdir(dir))) {
> -			if (dirent->d_name[0]=3D=3D'.')
> +			if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_na=
me[3]))
>  				continue;
>  			sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governo=
r", dirent->d_name);
>  			if (stat(filename, &statbuf) =3D=3D -1)
> @@ -189,7 +190,7 @@ const char *cpufreq_tunable::toggle_script(void) {
>  		return NULL;
>  =

>  	while ((dirent =3D readdir(dir))) {
> -		if (dirent->d_name[0]=3D=3D'.')
> +		if (strncmp(dirent->d_name, "cpu", 3) !=3D 0 || !isdigit(dirent->d_nam=
e[3]))
>  			continue;
>  		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/scaling_governor=
", dirent->d_name);
>  		if (stat(filename, &statbuf) =3D=3D -1)
> diff --git a/src/tuning/tuningsysfs.cpp b/src/tuning/tuningsysfs.cpp
> index 33d3786..ec1ca6b 100644
> --- a/src/tuning/tuningsysfs.cpp
> +++ b/src/tuning/tuningsysfs.cpp
> @@ -131,10 +131,7 @@ void add_sata_tunables(void)
>  		if (!entry)
>  			break;
>  =

> -                if (strcmp(entry->d_name, ".") =3D=3D 0)
> -                        continue;
> -
> -		if (strcmp(entry->d_name, "..") =3D=3D 0)
> +		if (entry->d_name[0] =3D=3D '.')
>  			continue;
>  =

>  		sprintf(filename, "/sys/class/scsi_host/%s/link_power_management_polic=
y", entry->d_name);
> -- =

> 1.7.11.7
> =


> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============3491680957016458012==--

