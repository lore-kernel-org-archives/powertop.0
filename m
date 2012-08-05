Content-Type: multipart/mixed; boundary="===============5043633017750514018=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 4/4] Add support for Intel GPU statistics
Date: Sun, 05 Aug 2012 20:32:44 +0300
Message-ID: <20120805173244.GA3199@swordfish>
In-Reply-To: 501EA9E1.1030905@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5043633017750514018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (08/05/12 10:14), Arjan van de Ven wrote:
>
> +static void handle_i965_gpu(void)
> +{
> +	ifstream file;

seems to be unused


> +	unsigned int core_number =3D 0;
> +	class abstract_cpu *package;
> +
> +
> +	package =3D system_level.children[0];
> +	=

> +	core_number =3D package->children.size();
> +
> +	if (package->children.size() <=3D core_number)
> +		package->children.resize(core_number + 1, NULL);
> +
> +	if (!package->children[core_number]) {
> +		package->children[core_number] =3D new_i965_gpu();
> +		package->childcount++;
> +	}
> +}
> +
> +
>  void enumerate_cpus(void)
>  {
>  	ifstream file;
> @@ -288,6 +319,13 @@ void enumerate_cpus(void)
> =

>  	file.close();
> =

> +	file.open("/sys/class/drm/card0/power/rc6_residency_ms",  ios::in);
> +
> +	if (file) {
> +		handle_i965_gpu();
> +		file.close();
> +	}
> +

side note: just wonder how much C++ stream with its heavy buffering, etc. i=
s slower
than stat(). I'll review and if it makes sense will probably prepare simple=
 stat()
wrapper to lib.cpp


>  	perf_events =3D new perf_power_bundle();
> =

>  	if (!perf_events->add_event("power:cpu_idle")){
> diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> index b69c5c6..1949af1 100644
> --- a/src/cpu/intel_cpus.h
> +++ b/src/cpu/intel_cpus.h
> @@ -137,3 +137,26 @@ public:
> =

> =

>  extern int has_c2c7_res;
> +
> +class i965_core: public cpu_core
> +{
> +private:
> +	uint64_t	rc6_before, rc6_after;
> +	uint64_t	rc6p_before, rc6p_after;
> +	uint64_t	rc6pp_before, rc6pp_after;
> +	=

> +	struct timeval	before;
> +	struct timeval	after;
> +
> +public:
> +	virtual void	measurement_start(void);
> +	virtual void	measurement_end(void);
> +	virtual int     can_collapse(void) { return 0;};
> +
> +	virtual char *  fill_pstate_line(int line_nr, char *buffer);
> +	virtual char *  fill_pstate_name(int line_nr, char *buffer);
> +	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char =
*separator);
> +	virtual int	has_pstate_level(int level) { return 0; };
> +	virtual int	has_pstates(void) { return 0; };
> +
> +};
> diff --git a/src/cpu/intel_gpu.cpp b/src/cpu/intel_gpu.cpp
> new file mode 100644
> index 0000000..77a7051
> --- /dev/null
> +++ b/src/cpu/intel_gpu.cpp
> @@ -0,0 +1,116 @@
> +/*
> + * Copyright 2012, Intel Corporation
> + *
> + * This file is part of PowerTOP
> + *
> + * This program file is free software; you can redistribute it and/or mo=
dify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> + * for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program in a file named COPYING; if not, write to the
> + * Free Software Foundation, Inc,
> + * 51 Franklin Street, Fifth Floor,
> + * Boston, MA 02110-1301 USA
> + * or just google for it.
> + *
> + * Authors:
> + *	Arjan van de Ven <arjan(a)linux.intel.com>
> + */
> +#include "cpu.h"
> +#include <iostream>
> +#include <fstream>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <sys/time.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <unistd.h>
> +
> +#include "../lib.h"
> +#include "../parameters/parameters.h"
> +#include "../display.h"
> +
> +void i965_core::measurement_start(void)
> +{
> +	ifstream file;
> +
> +	gettimeofday(&before, NULL);
> +	rc6_before =3D read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms"=
, NULL);
> +	rc6p_before =3D read_sysfs("/sys/class/drm/card0/power/rc6p_residency_m=
s", NULL);
> +	rc6pp_before =3D read_sysfs("/sys/class/drm/card0/power/rc6pp_residency=
_ms", NULL);
> +
> +	update_cstate("gpu c0", "Active", 0, 0, 1, 0);
> +	update_cstate("gpu rc6", "RC6", 0, rc6_before, 1, 1);
> +	update_cstate("gpu rc6p", "RC6p", 0, rc6p_before, 1, 2);
> +	update_cstate("gpu rc6pp", "RC6pp", 0, rc6pp_before, 1, 3);
> +}
> +
> +char * i965_core::fill_cstate_line(int line_nr, char *buffer, const char=
 *separator)
> +{
> +	buffer[0] =3D 0;
> +	double ratio, d =3D -1.0, time_delta;
> +
> +	if (line_nr =3D=3D LEVEL_HEADER) {
> +		sprintf(buffer,_("  GPU "));
> +		return buffer;
> +	}
> +
> +	buffer[0] =3D 0;
> +	=

> +	time_delta  =3D 1000000 * (after.tv_sec - before.tv_sec) + after.tv_use=
c - before.tv_usec;
> +	ratio =3D 100000.0/time_delta;
> +	=

> +	if (line_nr =3D=3D 0)
> +		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_befo=
re - rc6p_before - rc6pp_before);
> +	if (line_nr =3D=3D 1)
> +		d =3D ratio * (rc6_after - rc6_before);
> +	if (line_nr =3D=3D 2)
> +		d =3D ratio * (rc6p_after - rc6p_before);
> +	if (line_nr =3D=3D 3)
> +		d =3D ratio * (rc6pp_after - rc6pp_before);
> +	if (line_nr >=3D 4 || line_nr < 0)
> +		return buffer;
> +

small side note /* someone will do it anyway :-) */:
how about

	if (line_nr =3D=3D 0)
		d =3D 100.0 - ratio * (rc6_after + rc6p_after + rc6pp_after - rc6_before =
- rc6p_before - rc6pp_before);
	else if (line_nr =3D=3D 1)
		d =3D ratio * (rc6_after - rc6_before);
	else if (line_nr =3D=3D 2)
		d =3D ratio * (rc6p_after - rc6p_before);
	else if (line_nr =3D=3D 3)
		d =3D ratio * (rc6pp_after - rc6pp_before);
	else if (line_nr >=3D 4 || line_nr < 0)
		return buffer;

	=

> +	/* cope with rounding errors due to the measurement interval */
> +	if (d < 0.0)
> +		d =3D 0.0;
> +	if (d > 100.0)
> +		d =3D 100.0;
> +	=

> +	sprintf(buffer,"%5.1f%%", d);
> +
> +	return buffer;
> +}
> +
> +
> +void i965_core::measurement_end(void)
> +{
> +	gettimeofday(&after, NULL);
> +
> +	rc6_after =3D read_sysfs("/sys/class/drm/card0/power/rc6_residency_ms",=
 NULL);
> +	rc6p_after =3D read_sysfs("/sys/class/drm/card0/power/rc6p_residency_ms=
", NULL);
> +	rc6pp_after =3D read_sysfs("/sys/class/drm/card0/power/rc6pp_residency_=
ms", NULL);
> +}
> +
> +char * i965_core::fill_pstate_line(int line_nr, char *buffer)
> +{
> +	buffer[0] =3D 0;
> +	return buffer;
> +}
> +
> +char * i965_core::fill_pstate_name(int line_nr, char *buffer)
> +{
> +	buffer[0] =3D 0;
> +	return buffer;
> +}
> +
> -- =

> 1.7.7.6
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============5043633017750514018==--

