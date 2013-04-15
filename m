Content-Type: multipart/mixed; boundary="===============3570729993659916190=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 0/8] Power Top RAPL interface v04
Date: Mon, 15 Apr 2013 23:35:43 +0300
Message-ID: <20130415203543.GE2301@swordfish>
In-Reply-To: 1366042169-14523-1-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3570729993659916190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/15/13 09:09), Srinivas Pandruvada wrote:
> This patch adds RAPL interface to powertop. RAPL can give energy consumed=
 for a domain. For
> client platform, domain are "PKG", "PP0" and "PP1". For servers "PKG", "D=
RAM" and "PP0".
> PP0 refers to CPU energy comsumtion and PP1 refers to GPUs. DRAM is for D=
RAM in servers only.
> =

> Powertop estimates how much power CPU and GPU is consuming based on the m=
easured power and
> load. This patch splits this into the following:
> - Actual CPU/GPU power reported by RAPL
> - DRAM power for servers
> - Remaining as "misc" usage for CPU/GPU
> =

> As more domain are getting added, this patch creates a parent/child relat=
ionship for CPU/GPU.
> This way when new domains are added these files don't need change. Only i=
nherit CPU/GPU class,
> and implement virtual method for consumed power.
>

Hello,
looks good to me. thanks.


any objections/inputs/etc. from list members are welcomed.

	-ss

 =

> v04 changes:
> 	Rebase with the latest git tree
> 	Add MSR access error message from previous commit to lib.cpp MSR api
> 	"_("Model-specific registers (MSR) not found (try enabling CONFIG_X86_MS=
R)"
> =

> v03 changes:
> 	close fd when pread/pwrite fails.
> =

> v02 changes:
> 	Addressed review comments
> 	Moved MSR handling to library
> 	Added interface to get the first CPU in a package
> 	Fix error in reading RAPL when system has multiple packages
> =

> =

> Srinivas Pandruvada (8):
>   Common read/write MSR API
>   Use MSR Lib MSR functions
>   RAPL Interface
>   cpu device as parent class
>   Interface to get first cpu
>   Added PP0 RAPL domain for CPU
>   Add RAPL DRAM domain
>   Add RAPL PP1 domain for GPU
> =

>  src/Makefile.am                 |   4 +-
>  src/cpu/cpu.cpp                 |  16 ++
>  src/cpu/cpu.h                   |   1 +
>  src/cpu/cpu_rapl_device.cpp     |  74 +++++
>  src/cpu/cpu_rapl_device.h       |  57 ++++
>  src/cpu/cpudevice.cpp           |  14 +
>  src/cpu/cpudevice.h             |   6 +-
>  src/cpu/dram_rapl_device.cpp    |  75 +++++
>  src/cpu/dram_rapl_device.h      |  57 ++++
>  src/cpu/intel_cpus.cpp          |  23 +-
>  src/cpu/rapl/rapl_interface.cpp | 611 ++++++++++++++++++++++++++++++++++=
++++++
>  src/cpu/rapl/rapl_interface.h   |  85 ++++++
>  src/devices/gpu_rapl_device.cpp |  70 +++++
>  src/devices/gpu_rapl_device.h   |  57 ++++
>  src/devices/i915-gpu.cpp        |  21 ++
>  src/devices/i915-gpu.h          |   6 +-
>  src/lib.cpp                     |  65 +++++
>  src/lib.h                       |   3 +-
>  18 files changed, 1222 insertions(+), 23 deletions(-)
>  create mode 100644 src/cpu/cpu_rapl_device.cpp
>  create mode 100644 src/cpu/cpu_rapl_device.h
>  create mode 100644 src/cpu/dram_rapl_device.cpp
>  create mode 100644 src/cpu/dram_rapl_device.h
>  create mode 100644 src/cpu/rapl/rapl_interface.cpp
>  create mode 100644 src/cpu/rapl/rapl_interface.h
>  create mode 100644 src/devices/gpu_rapl_device.cpp
>  create mode 100644 src/devices/gpu_rapl_device.h
> =

> -- =

> 1.7.11.7
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3570729993659916190==--

