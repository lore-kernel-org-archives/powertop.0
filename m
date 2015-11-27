Content-Type: multipart/mixed; boundary="===============5326189806380919366=="
MIME-Version: 1.0
From: Stewart Smith <stewart at linux.vnet.ibm.com>
Subject: [Powertop] [PATCH 0/2] powerpc powernv platform support
Date: Fri, 27 Nov 2015 11:07:27 +1100
Message-ID: <1448582849-1707-1-git-send-email-stewart@linux.vnet.ibm.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5326189806380919366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

These two patches get powertop to work on current powernv machines.

These are POWER8 based systems from IBM (and others) running OPAL firmware.

The first patch correctly parses /proc/cpuinfo so information about
processors and pstates is displayed (at all).

The second uses the existing userspace interface for getting power consumpt=
ion.

Stewart Smith (2):
  cpu: support powerpc /proc/cpuinfo
  Add support for power consumption sensors through opal-sensors sysfs

 src/Makefile.am                  |  2 ++
 src/cpu/cpu.cpp                  | 20 ++++++----------
 src/measurement/measurement.cpp  | 14 +++++++++++
 src/measurement/opal-sensors.cpp | 50 ++++++++++++++++++++++++++++++++++++=
++++
 src/measurement/opal-sensors.h   | 41 ++++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 13 deletions(-)
 create mode 100644 src/measurement/opal-sensors.cpp
 create mode 100644 src/measurement/opal-sensors.h

-- =

2.1.4


--===============5326189806380919366==--

