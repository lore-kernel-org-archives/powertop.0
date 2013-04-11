Content-Type: multipart/mixed; boundary="===============8126314265250099093=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/5] RAPL Interface
Date: Thu, 11 Apr 2013 16:31:46 +0300
Message-ID: <20130411133146.GA2191@swordfish.datadirectnet.com>
In-Reply-To: 1365524411-11566-2-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8126314265250099093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (04/09/13 09:20), Srinivas Pandruvada wrote:
> Date: Tue,  9 Apr 2013 09:20:07 -0700
> From: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 1/5] RAPL Interface
> X-Mailer: git-send-email 1.7.11.7
> =

> Added RAPL interface class. This provides methods to get the status
> of RAPL domains and get energy and power status.
> =

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> ---
>  src/Makefile.am                 |   3 +-
>  src/cpu/rapl/rapl_interface.cpp | 662 ++++++++++++++++++++++++++++++++++=
++++++
>  src/cpu/rapl/rapl_interface.h   |  87 ++++++
>  3 files changed, 751 insertions(+), 1 deletion(-)
>  create mode 100644 src/cpu/rapl/rapl_interface.cpp
>  create mode 100644 src/cpu/rapl/rapl_interface.h
> =

> diff --git a/src/Makefile.am b/src/Makefile.am
> index 398b8a7..0983b51 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -31,7 +31,8 @@ powertop_SOURCES =3D parameters/persistent.cpp paramete=
rs/learn.cpp parameters/par
>  		report/report-formatter-base.cpp report/report-formatter-base.h \
>  		report/report-formatter-csv.cpp report/report-formatter-csv.h \
>  		report/report-formatter-html.cpp report/report-formatter-html.h \
> -		main.cpp css.h powertop.css cpu/intel_gpu.cpp
> +		main.cpp css.h powertop.css cpu/intel_gpu.cpp \
> +		cpu/rapl/rapl_interface.cpp
>  =

>  =

>  powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -W=
shadow -Wformat $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBNL_CFLAGS) $(GLIB=
2_CFLAGS)
> diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interfac=
e.cpp
> new file mode 100644
> index 0000000..3e54201
> --- /dev/null
> +++ b/src/cpu/rapl/rapl_interface.cpp
> @@ -0,0 +1,662 @@
> +/* rapl_interface.cpp: rapl interface for power top implementation
> + *
> + * Copyright (C) 2012 Intel Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> + * 02110-1301, USA.
> + *
> + *
> + * Author Name <Srinivas.Pandruvada(a)linux.intel.com>
> + *
> + */
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include "rapl_interface.h"
> +
> +#ifdef DEBUG
> +#define RAPL_DBG_PRINT printf
> +#define RAPL_ERROR_PRINT printf
> +#else
> +#define RAPL_DBG_PRINT(...)	((void) 0)
> +#define RAPL_ERROR_PRINT(...) ((void) 0)
> +#endif
> +#define MAX_TEMP_STR_SIZE	20
> +
> +// RAPL interface
> +#define MSR_RAPL_POWER_UNIT	0x606
> +#define MSR_PKG_POWER_LIMIT	0x610
> +
> +#define MSR_PKG_ENERY_STATUS	0x611
> +#define MSR_PKG_POWER_INFO	0x614
> +#define MSR_PKG_PERF_STATUS	0x613
> +
> +#define MSR_DRAM_POWER_LIMIT	0x618
> +#define MSR_DRAM_ENERY_STATUS	0x619
> +#define MSR_DRAM_PERF_STATUS	0x61B
> +#define MSR_DRAM_POWER_INFO	0x61c
> +
> +#define MSR_PP0_POWER_LIMIT	0x638
> +#define MSR_PP0_ENERY_STATUS	0x639
> +#define MSR_PP0_POLICY		0x63A
> +#define MSR_PP0_PERF_STATUS	0x63B
> +
> +#define MSR_PP1_POWER_LIMIT	0x640
> +#define MSR_PP1_ENERY_STATUS	0x641
> +#define MSR_PP1_POLICY		0x642
> +
> +#define PKG_DOMAIN_PRESENT	0x01
> +#define DRAM_DOMAIN_PRESENT	0x02
> +#define PP0_DOMAIN_PRESENT	0x04
> +#define PP1_DOMAIN_PRESENT	0x08
> +
> +c_rapl_interface::c_rapl_interface() :
> +	measurment_interval(def_sampling_interval),
> +	last_pkg_energy_status(0.0),
> +	last_dram_energy_status(0.0),
> +	last_pp0_energy_status(0.0),
> +	last_pp1_energy_status(0.0)
> +{
> +	char path_str[MAX_TEMP_STR_SIZE];
> +	unsigned long long value;
> +	int ret;
> +
> +	no_of_cpus =3D 0;
> +	for(int i =3D 0; i < 64; ++i)

			^^^^^^^^
why 64?


> +	{
> +		struct stat s;
> +		sprintf(path_str, "/dev/cpu/%d", i);
> +		if(stat(path_str, &s) =3D=3D 0) {
> +			no_of_cpus++;
> +		}
> +	}
> +

sysconf(_SC_NPROCESSORS_ONLN) ?


> +	rapl_domains =3D 0;
> +
> +	// presence of each domain
> +	// Check presence of PKG domain
> +	ret =3D read_msr(0, MSR_PKG_ENERY_STATUS, &value);
> +	if (ret > 0) {
> +		rapl_domains |=3D PKG_DOMAIN_PRESENT;
> +		RAPL_DBG_PRINT("Domain : PKG present\n");
> +	} else {
> +		RAPL_DBG_PRINT("Domain : PKG Not present\n");
> +	}
> +
> +	// Check presence of DRAM domain
> +	ret =3D read_msr(0, MSR_DRAM_ENERY_STATUS, &value);
> +	if (ret > 0) {
> +		rapl_domains |=3D DRAM_DOMAIN_PRESENT;
> +		RAPL_DBG_PRINT("Domain : DRAM present\n");
> +	} else {
> +		RAPL_DBG_PRINT("Domain : DRAM Not present\n");
> +	}
> +
> +	// Check presence of PP0 domain
> +	ret =3D read_msr(0, MSR_PP0_ENERY_STATUS, &value);
> +	if (ret > 0) {
> +		rapl_domains |=3D PP0_DOMAIN_PRESENT;
> +		RAPL_DBG_PRINT("Domain : PP0 present\n");
> +	} else {
> +		RAPL_DBG_PRINT("Domain : PP0 Not present\n");
> +	}
> +
> +	// Check presence of PP1 domain
> +	ret =3D read_msr(0, MSR_PP1_ENERY_STATUS, &value);
> +	if (ret > 0) {
> +		rapl_domains |=3D PP1_DOMAIN_PRESENT;
> +		RAPL_DBG_PRINT("Domain : PP1 present\n");
> +	} else {
> +		RAPL_DBG_PRINT("Domain : PP1 Not present\n");
> +	}
> +
> +	power_units =3D get_power_unit();
> +	energy_status_units =3D get_energy_status_unit();
> +	time_units =3D get_time_unit();
> +
> +	RAPL_DBG_PRINT("RAPL Domain mask: %x\n", rapl_domains);
> +}
> +
> +bool c_rapl_interface::pkg_domain_present()
> +{
> +	if ((rapl_domains & PKG_DOMAIN_PRESENT)) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +bool c_rapl_interface::dram_domain_present()
> +{
> +	if ((rapl_domains & DRAM_DOMAIN_PRESENT)) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +bool c_rapl_interface::pp0_domain_present()
> +{
> +	if ((rapl_domains & PP0_DOMAIN_PRESENT)) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +bool c_rapl_interface::pp1_domain_present()
> +{
> +	if ((rapl_domains & PP1_DOMAIN_PRESENT)) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +int c_rapl_interface::get_no_cpus()
> +{
> +	return no_of_cpus;
> +}
> +
> +int c_rapl_interface::read_msr(int cpu, unsigned int idx, unsigned long =
long *val)
> +{
> +	int ret =3D  - 1;
> +	char path_str[MAX_TEMP_STR_SIZE];
> +	struct stat s;
> +

we have that code in src/cpu/intel_cpus.cpp get_msr(int cpu, uint64_t offse=
t).
can we make it general and move to lib part?


> +	sprintf(path_str, "/dev/cpu/%d/msr", cpu);
> +	if(stat(path_str, &s) =3D=3D 0) {
> +		int fd =3D ::open(path_str, O_RDONLY);
> +		if(fd < 0)
> +			return  -errno;
> +		if(::lseek(fd, idx, SEEK_CUR) =3D=3D  - 1)
> +			return  - errno;
> +		ret =3D ::read(fd, val, sizeof(unsigned long long));
> +		close(fd);
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::write_msr(int cpu, unsigned int idx, unsigned long=
 long val)
> +{
> +	int ret =3D  - 1;
> +	char path_str[MAX_TEMP_STR_SIZE];
> +	struct stat s;
> +
> +	sprintf(path_str, "/dev/cpu/%d/msr", cpu);
> +	if(stat(path_str, &s) =3D=3D 0) {
> +		int fd =3D ::open(path_str, O_WRONLY);
> +		if(fd < 0)
> +			return  -errno;
> +		if(::lseek(fd, idx, SEEK_CUR) =3D=3D  - 1)
> +			return  - errno;
> +		ret =3D ::write(fd, &val, sizeof(unsigned long long));
> +		close(fd);
> +	}
> +
> +	return ret;
> +}
> +
> +unsigned int c_rapl_interface::int_2_pow(int pow)
> +{
> +	int i;
> +	int _pow =3D 1;
> +
> +	for(i =3D 0; i < pow; ++i)
> +		_pow =3D _pow * 2;
> +

why not c++ pow()?

> +	return _pow;
> +}
> +
> +int c_rapl_interface::get_rapl_power_unit(unsigned long long *value)
> +{
> +	int ret;
> +
> +	ret =3D read_msr(0, MSR_RAPL_POWER_UNIT, value);
> +
> +	return ret;
> +}
> +
> +double c_rapl_interface::get_power_unit()
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	ret =3D get_rapl_power_unit(&value);
> +	if(ret < 0)
> +	{
> +		return ret;
> +	}
> +
> +	return (double) 1/int_2_pow(value & 0xf);
> +}
> +
> +double c_rapl_interface::get_energy_status_unit()
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	ret =3D get_rapl_power_unit(&value);
> +	if(ret < 0)
> +	{
> +		return ret;
> +	}
> +
> +	return (double)1/ int_2_pow((value & 0x1f00) >> 8);
> +}
> +
> +double c_rapl_interface::get_time_unit()
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	ret =3D get_rapl_power_unit(&value);
> +	if(ret < 0)
> +	{
> +		return ret;
> +	}
> +
> +	return (double)1 / int_2_pow((value & 0xf0000) >> 16);
> +}
> +
> +int c_rapl_interface::get_pkg_energy_status(double *status)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PKG_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +

well, then why have c_rapl_interface::pkg_domain_present()?
+ a bunch of direct rapl_domains bit checks.



> +	ret =3D read_msr(0, MSR_PKG_ENERY_STATUS, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pkg_energy_status failed\n");
> +		return ret;
> +	}
> +
> +	*status =3D (double) (value & 0xffffffff) * get_energy_status_unit();
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pkg_power_info(double *thermal_spec_power,
> +			double *max_power, double *min_power, double *max_time_window)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PKG_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +	ret =3D read_msr(0, MSR_PKG_POWER_INFO, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pkg_power_info failed\n");
> +		return ret;
> +	}
> +	*thermal_spec_power =3D  (value & 0x7FFF) * power_units;
> +	*min_power =3D  ((value & 0x7FFF0000) >> 16) * power_units;
> +	*max_power =3D  ((value & 0x7FFF00000000) >> 32) * power_units;
> +	*max_time_window =3D ((value & 0x3f000000000000)>>48) * time_units;
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pkg_power_limit(unsigned long long *value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PKG_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PKG_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pkg_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::set_pkg_power_limit(unsigned long long value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PKG_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D write_msr(0, MSR_PKG_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("set_pkg_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_dram_energy_status(double *status)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & DRAM_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_DRAM_ENERY_STATUS, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_dram_energy_status failed\n");
> +		return ret;
> +	}
> +
> +	*status =3D (double) (value & 0xffffffff) * get_energy_status_unit();
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_dram_power_info(double *thermal_spec_power,
> +			double *max_power, double *min_power, double *max_time_window)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & DRAM_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +	ret =3D read_msr(0, MSR_DRAM_POWER_INFO, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_dram_power_info failed\n");
> +		return ret;
> +	}
> +
> +	*thermal_spec_power =3D  (value & 0x7FFF) * power_units;
> +	*min_power =3D  ((value & 0x7FFF0000) >> 16) * power_units;
> +	*max_power =3D  ((value & 0x7FFF00000000) >> 32) * power_units;
> +	*max_time_window =3D ((value & 0x3f000000000000)>>48) * time_units;
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_dram_power_limit(unsigned long long *value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & DRAM_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_DRAM_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_dram_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::set_dram_power_limit(unsigned long long value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & DRAM_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D write_msr(0, MSR_DRAM_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("set_dram_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp0_energy_status(double *status)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PP0_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP0_ENERY_STATUS, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp0_energy_status failed\n");
> +		return ret;
> +	}
> +
> +	*status =3D (double) (value & 0xffffffff) * get_energy_status_unit();
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp0_power_limit(unsigned long long *value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PP0_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP0_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp0_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::set_pp0_power_limit(unsigned long long value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PP0_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D write_msr(0, MSR_PP0_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("set_pp0_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp0_power_policy(unsigned int *pp0_power_polic=
y)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PP0_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP0_POLICY, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp0_power_policy failed\n");
> +		return ret;
> +	}
> +
> +	*pp0_power_policy =3D  value & 0x0f;
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp1_energy_status(double *status)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PP1_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP1_ENERY_STATUS, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp1_energy_status failed\n");
> +		return ret;
> +	}
> +
> +	*status =3D (double) (value & 0xffffffff) * get_energy_status_unit();
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp1_power_limit(unsigned long long *value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PP1_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP1_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp1_power_info failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::set_pp1_power_limit(unsigned long long value)
> +{
> +	int ret;
> +
> +	if (!(rapl_domains & PP1_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D write_msr(0, MSR_PP1_POWER_LIMIT, value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("set_pp1_power_limit failed\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int c_rapl_interface::get_pp1_power_policy(unsigned int *pp1_power_polic=
y)
> +{
> +	int ret;
> +	unsigned long long value;
> +
> +	if (!(rapl_domains & PP1_DOMAIN_PRESENT)) {
> +		return -1;
> +	}
> +
> +	ret =3D read_msr(0, MSR_PP1_POLICY, &value);
> +	if(ret < 0)
> +	{
> +		RAPL_ERROR_PRINT("get_pp1_power_policy failed\n");
> +		return ret;
> +	}
> +
> +	*pp1_power_policy =3D  value & 0x0f;
> +
> +	return ret;
> +}
> +
> +void c_rapl_interface::rapl_measure_energy()
> +{
> +#ifdef RAPL_TEST_MODE
> +	int ret;
> +	double energy_status;
> +	double thermal_spec_power;
> +	double max_power;
> +	double min_power;
> +	double max_time_window;
> +	double pkg_watts =3D 0;
> +	double dram_watts =3D 0;
> +	double pp0_watts =3D 0;
> +	double pp1_watts =3D 0;
> +	double pkg_joules =3D 0;
> +	double dram_joules =3D 0;
> +	double pp0_joules =3D 0;
> +	double pp1_joules =3D 0;
> +
> +	ret =3D get_pkg_power_info(&thermal_spec_power, &max_power, &min_power,=
 &max_time_window);
> +	RAPL_DBG_PRINT("Pkg Power Info: Thermal spec %f watts, max %f watts, mi=
n %f watts, max time window %f seconds\n", thermal_spec_power, max_power, m=
in_power, max_time_window);
> +	ret =3D get_dram_power_info(&thermal_spec_power, &max_power, &min_power=
, &max_time_window);
> +	RAPL_DBG_PRINT("DRAM Power Info: Thermal spec %f watts, max %f watts, m=
in %f watts, max time window %f seconds\n", thermal_spec_power, max_power, =
min_power, max_time_window);
> +
> +	for (;;) {
> +		if (pkg_domain_present()) {
> +			ret =3D get_pkg_energy_status(&energy_status);
> +			if (last_pkg_energy_status =3D=3D 0)
> +				last_pkg_energy_status =3D energy_status;
> +			if (ret > 0) {
> +				pkg_joules =3D energy_status;
> +				pkg_watts =3D (energy_status-last_pkg_energy_status)/measurment_inte=
rval;
> +			}
> +			last_pkg_energy_status =3D energy_status;
> +		}
> +		if (dram_domain_present()) {
> +			ret =3D get_dram_energy_status(&energy_status);
> +			if (last_dram_energy_status =3D=3D 0)
> +				last_dram_energy_status =3D energy_status;
> +			if (ret > 0){
> +				dram_joules =3D energy_status;
> +				dram_watts =3D (energy_status-last_dram_energy_status)/measurment_in=
terval;
> +			}
> +			last_dram_energy_status =3D energy_status;
> +		}
> +		if (pp0_domain_present()) {
> +			ret =3D get_pp0_energy_status(&energy_status);
> +			if (last_pp0_energy_status =3D=3D 0)
> +				last_pp0_energy_status =3D energy_status;
> +			if (ret > 0){
> +				pp0_joules =3D energy_status;
> +				pp0_watts =3D (energy_status-last_pp0_energy_status)/measurment_inte=
rval;
> +			}
> +			last_pp0_energy_status =3D energy_status;
> +		}
> +		if (pp1_domain_present()) {
> +			ret =3D get_pp1_energy_status(&energy_status);
> +			if (last_pp1_energy_status =3D=3D 0)
> +				last_pp1_energy_status =3D energy_status;
> +			if (ret > 0){
> +				pp1_joules =3D energy_status;
> +				pp1_watts =3D (energy_status-last_pp1_energy_status)/measurment_inte=
rval;
> +			}
> +			last_pp1_energy_status =3D energy_status;
> +		}
> +		RAPL_DBG_PRINT("%f, %f, %f, %f\n", pkg_watts, dram_watts, pp0_watts, p=
p1_watts);
> +		sleep(measurment_interval);
> +	}
> +#endif
> +}
> diff --git a/src/cpu/rapl/rapl_interface.h b/src/cpu/rapl/rapl_interface.h
> new file mode 100644
> index 0000000..f9f2098
> --- /dev/null
> +++ b/src/cpu/rapl/rapl_interface.h
> @@ -0,0 +1,87 @@
> +/* rapl_interface.h: rapl interface for power top
> + *
> + * Copyright (C) 2012 Intel Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> + * 02110-1301, USA.
> + *
> + *
> + * Author Name <Srinivas.Pandruvada(a)linux.intel.com>
> + *
> + */
> +
> +#ifndef RAPL_INTERFACE_H
> +#define RAPL_INTERFACE_H
> +
> +class c_rapl_interface
> +{
> +private:
> +	static const int def_sampling_interval =3D 1; //In seconds
> +	int no_of_cpus;
> +	unsigned char rapl_domains;
> +	int measurment_interval;
> +
> +	double power_units;
> +	double energy_status_units;
> +	double time_units;
> +
> +	double last_pkg_energy_status;
> +	double last_dram_energy_status;
> +	double last_pp0_energy_status;
> +	double last_pp1_energy_status;
> +
> +	int get_no_cpus();
> +	int read_msr(int cpu, unsigned int idx, unsigned long long *val);
> +	int write_msr(int cpu, unsigned int idx, unsigned long long val);
> +
> +public:
> +	c_rapl_interface();
> +
> +	unsigned int int_2_pow(int pow);
> +	int get_rapl_power_unit(unsigned long long *value);
> +	double get_power_unit();
> +	double get_energy_status_unit();
> +	double get_time_unit();
> +
> +	int get_pkg_energy_status(double *status);
> +	int get_pkg_power_info(double *thermal_spec_power,
> +			double *max_power, double *min_power, double *max_time_window);
> +	int get_pkg_power_limit(unsigned long long *value);
> +	int set_pkg_power_limit(unsigned long long value);
> +
> +	int get_dram_energy_status(double *status);
> +	int get_dram_power_info(double *thermal_spec_power,
> +			double *max_power, double *min_power, double *max_time_window);
> +	int get_dram_power_limit(unsigned long long *value);
> +	int set_dram_power_limit(unsigned long long value);
> +
> +	int get_pp0_energy_status(double *status);
> +	int get_pp0_power_limit(unsigned long long *value);
> +	int set_pp0_power_limit(unsigned long long value);
> +	int get_pp0_power_policy(unsigned int *pp0_power_policy);
> +
> +	int get_pp1_energy_status(double *status);
> +	int get_pp1_power_limit(unsigned long long *value);
> +	int set_pp1_power_limit(unsigned long long value);
> +	int get_pp1_power_policy(unsigned int *pp1_power_policy);
> +
> +	bool pkg_domain_present();
> +	bool dram_domain_present();
> +	bool pp0_domain_present();
> +	bool pp1_domain_present();
> +
> +	void rapl_measure_energy();
> +};
> +
> +#endif
> -- =

> 1.7.11.7
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8126314265250099093==--

