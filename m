Content-Type: multipart/mixed; boundary="===============2457874810935263473=="
MIME-Version: 1.0
From: Swaminathan, Nivedita <nivedita.swaminathan at intel.com>
Subject: Re: [Powertop] Fix crash due to unbounded string copies
Date: Mon, 23 Nov 2015 19:39:28 +0000
Message-ID: <203C9A218350B94EAF34403F81F162AE1975125D@ORSMSX116.amr.corp.intel.com>
In-Reply-To: 1447429821-1631-1-git-send-email-jengelh@inai.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2457874810935263473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for sending your patches. Your patches have been added to the git=
hub repository.

Regards,
Nivedita

-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Jan En=
gelhardt
Sent: Friday, November 13, 2015 7:50 AM
To: powertop(a)lists.01.org
Subject: [Powertop] Fix crash due to unbounded string copies


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
 41 files changed, 298 insertions(+), 286 deletions(-) ____________________=
___________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============2457874810935263473==--

