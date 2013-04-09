Content-Type: multipart/mixed; boundary="===============6855085039268584395=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: [Powertop] [PATCH 0/5] Power Top RAPL interface
Date: Tue, 09 Apr 2013 09:20:06 -0700
Message-ID: <1365524411-11566-1-git-send-email-srinivas.pandruvada@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6855085039268584395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds RAPL interface to powertop. RAPL can give energy consumed f=
or a domain. For
client platform, domain are "PKG", "PP0" and "PP1". For servers "PKG", "DRA=
M" and "PP0".
PP0 refers to CPU energy comsumtion and PP1 refers to GPUs. DRAM is for DRA=
M in servers only.

Powertop estimates how much power CPU and GPU is consuming based on the mea=
sured power and
load. This patch splits this into the following:
- Actual CPU/GPU power reported by RAPL
- DRAM power for servers
- Remaining as "misc" usage for CPU/GPU

As more domain are getting added, this patch creates a parent/child relatio=
nship for CPU/GPU.
This way when new domains are added these files don't need change. Only inh=
erit CPU/GPU class,
and implement virtual method for consumed power.


Srinivas Pandruvada (5):
  RAPL Interface
  cpu device as parent class
  Added PP0 RAPL domain for CPU
  Add RAPL DRAM domain
  Add RAPL PP1 domain for GPU

 src/Makefile.am                 |   4 +-
 src/cpu/cpu.cpp                 |  16 +
 src/cpu/cpu_rapl_device.cpp     |  70 +++++
 src/cpu/cpu_rapl_device.h       |  56 ++++
 src/cpu/cpudevice.cpp           |  14 +
 src/cpu/cpudevice.h             |   6 +-
 src/cpu/dram_rapl_device.cpp    |  71 +++++
 src/cpu/dram_rapl_device.h      |  56 ++++
 src/cpu/rapl/rapl_interface.cpp | 662 ++++++++++++++++++++++++++++++++++++=
++++
 src/cpu/rapl/rapl_interface.h   |  87 ++++++
 src/devices/gpu_rapl_device.cpp |  70 +++++
 src/devices/gpu_rapl_device.h   |  57 ++++
 src/devices/i915-gpu.cpp        |  21 ++
 src/devices/i915-gpu.h          |   6 +-
 14 files changed, 1193 insertions(+), 3 deletions(-)
 create mode 100644 src/cpu/cpu_rapl_device.cpp
 create mode 100644 src/cpu/cpu_rapl_device.h
 create mode 100644 src/cpu/dram_rapl_device.cpp
 create mode 100644 src/cpu/dram_rapl_device.h
 create mode 100644 src/cpu/rapl/rapl_interface.cpp
 create mode 100644 src/cpu/rapl/rapl_interface.h
 create mode 100644 src/devices/gpu_rapl_device.cpp
 create mode 100644 src/devices/gpu_rapl_device.h

-- =

1.7.11.7


--===============6855085039268584395==--

