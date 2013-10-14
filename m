Content-Type: multipart/mixed; boundary="===============7974696997217273847=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 00/10] pull request
Date: Mon, 14 Oct 2013 11:40:47 +0300
Message-ID: <1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7974696997217273847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

the following patch set contains a number of fixes and updates.
added to -next tree.

I think this is the last pull request before 2.5 release.


David Rosca (1):
  Fixed cpu_core::has_c1_res initialization

Jaroslav Skarvada (2):
  tell user if the system is running out of FDs
  set open files rlimit to /proc/sys/fs/nr_open

Sergey Senozhatsky (7):
  lib: introduce ui_notify_user()
  tuning: print executed toggle script
  power_meter: introduce discharging member     measurement: report
    total global_time_left()
  power_supply: delete unused power_supply class
  parameters: report correct "base power" parameter
  backlight: use process_directory() helper
  backlight: decrease backlight() .ctor mem usage

 Android.mk                       |   2 +-
 src/Makefile.am                  |   4 +-
 src/cpu/intel_cpus.cpp           |   4 +-
 src/devices/backlight.cpp        |  46 ++++------
 src/devices/backlight.h          |   4 +-
 src/lib.cpp                      |  20 +++++
 src/lib.h                        |   2 +
 src/main.cpp                     |  20 ++++-
 src/measurement/measurement.cpp  |  62 +++----------
 src/measurement/measurement.h    |  24 +++--
 src/measurement/power_supply.cpp | 190 -----------------------------------=
----
 src/measurement/power_supply.h   |  46 ----------
 src/measurement/sysfs.cpp        |   7 +-
 src/parameters/parameters.cpp    |  10 +--
 src/perf/perf.cpp                |  13 ++-
 src/tuning/tuning.cpp            |   6 +-
 16 files changed, 117 insertions(+), 343 deletions(-)
 delete mode 100644 src/measurement/power_supply.cpp
 delete mode 100644 src/measurement/power_supply.h

-- =

1.8.4.679.g0a1a803


--===============7974696997217273847==--

