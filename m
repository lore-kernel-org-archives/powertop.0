Content-Type: multipart/mixed; boundary="===============8058072072436862865=="
MIME-Version: 1.0
From: Jan Engelhardt <jengelh at inai.de>
Subject: [Powertop] Fix crash due to unbounded string copies
Date: Fri, 13 Nov 2015 16:50:19 +0100
Message-ID: <1447429821-1631-1-git-send-email-jengelh@inai.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8058072072436862865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


The following changes since commit 35057dc9d707076a9fe5fee17e2c8357a942e167:

  PowerTOP v2.8 (2015-11-05 15:47:37 -0800)

are available in the git repository at:

  git://github.com/jengelh/powertop master

for you to fetch changes up to f212625d0acbc6340e6b61b1538f318302c8cb90:

  Avoid hardcoding magic values when sizeof can be used (2015-11-13 15:07:5=
6 +0100)

----------------------------------------------------------------
Jan Engelhardt (2):
      Fix crash due to buffer overruns
      Avoid hardcoding magic values when sizeof can be used

 src/calibrate/calibrate.cpp    | 16 ++++++------
 src/cpu/abstract_cpu.cpp       | 18 ++++++-------
 src/cpu/cpu.cpp                | 18 ++++++-------
 src/cpu/cpu_linux.cpp          | 36 +++++++++++++-------------
 src/cpu/cpudevice.cpp          |  5 ++--
 src/cpu/intel_cpus.cpp         |  6 ++---
 src/devices/ahci.cpp           | 58 +++++++++++++++++++++-----------------=
----
 src/devices/alsa.cpp           | 34 ++++++++++++-------------
 src/devices/backlight.cpp      | 18 ++++++-------
 src/devices/devfreq.cpp        |  2 +-
 src/devices/device.cpp         |  4 +--
 src/devices/i915-gpu.cpp       |  6 ++---
 src/devices/network.cpp        | 35 ++++++++++++-------------
 src/devices/rfkill.cpp         | 30 +++++++++++-----------
 src/devices/runtime_pm.cpp     | 34 ++++++++++++-------------
 src/devices/thinkpad-fan.cpp   |  2 +-
 src/devices/thinkpad-light.cpp |  2 +-
 src/devices/usb.cpp            | 40 ++++++++++++++---------------
 src/devlist.cpp                | 14 +++++-----
 src/lib.cpp                    | 10 ++++----
 src/lib.h                      |  7 +++++
 src/main.cpp                   |  6 ++---
 src/measurement/acpi.cpp       | 11 ++++----
 src/measurement/sysfs.cpp      |  2 +-
 src/parameters/parameters.cpp  |  4 +--
 src/process/do_process.cpp     | 36 +++++++++++++-------------
 src/process/interrupt.cpp      |  4 +--
 src/process/process.cpp        |  7 ++---
 src/process/processdevice.cpp  |  2 +-
 src/process/timer.cpp          |  2 +-
 src/process/work.cpp           |  2 +-
 src/report/report.cpp          |  4 +--
 src/tuning/bluetooth.cpp       |  4 +--
 src/tuning/ethernet.cpp        |  6 ++---
 src/tuning/runtime.cpp         | 14 +++++-----
 src/tuning/tunable.cpp         | 15 ++++++-----
 src/tuning/tuning.cpp          |  4 +--
 src/tuning/tuningi2c.cpp       | 18 ++++++-------
 src/tuning/tuningsysfs.cpp     | 14 +++++-----
 src/tuning/tuningusb.cpp       | 28 ++++++++++----------
 src/tuning/wifi.cpp            |  6 ++---
 41 files changed, 298 insertions(+), 286 deletions(-)

--===============8058072072436862865==--

