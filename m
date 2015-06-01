Content-Type: multipart/mixed; boundary="===============4385103790952004763=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [RFC 0/9] Use udev for accessing sysfs
Date: Mon, 01 Jun 2015 09:09:06 -0700
Message-ID: <1433174955-17349-1-git-send-email-nanleychery@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4385103790952004763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Nanley Chery <nanley.g.chery(a)intel.com>

This patch series changes PowerTOP's method of accessing sysfs (for =

tunables mainly) from explicitly accessing files to using the standard
udev device management library and API.

The current codebase collects data on devices by probing sysfs files
directly with the usual low-level file handling API. This method is
not recommended by the Linux kernel maintainers because the sysfs
organization is not guaranteed to be stable over time. This can lead
to dependent applications breaking with newer kernel releases. Instead
using an abstraction layer, like udev, is suggested
(see https://www.kernel.org/doc/Documentation/sysfs-rules.txt).

The benefits of switching to udev include:
* The removal of libpci and a reduction in repetitive code.
* Improved readability of the tunable code.
* Faster reading of device state values due to caching provided by udev.

I've tried to make this transition as simple as possible by including
the bare minimum of changes required for this feature. There's at least
one more tunable that can be converted (i2c), but I would like to get
feedback on the current implementation first.

Nanley Chery (9):
  build with udev library
  add udev helper functions
  usb_tunable: use udev
  syfs_tunable: use udev
  runtime_tunable: use udev
  replace pciutils usage with udevhwdb
  runtime_pm: use udev
  remove libpci and most dead code
  calibrate: use udev

 Android.mk                  |   1 -
 README                      |   1 -
 configure.ac                |  20 ++-----
 src/Makefile.am             |   6 +-
 src/calibrate/calibrate.cpp |  44 ++++----------
 src/devices/runtime_pm.cpp  | 105 +++++++++++---------------------
 src/devices/runtime_pm.h    |   1 +
 src/lib.cpp                 | 100 +++++++++++++++++++++----------
 src/lib.h                   |   7 ++-
 src/main.cpp                |   4 +-
 src/tuning/runtime.cpp      | 139 +++++++++++++---------------------------=
---
 src/tuning/runtime.h        |   6 +-
 src/tuning/tuningsysfs.cpp  |  12 +++-
 src/tuning/tuningsysfs.h    |   1 +
 src/tuning/tuningusb.cpp    | 142 ++++++++++++++--------------------------=
----
 src/tuning/tuningusb.h      |   5 +-
 16 files changed, 231 insertions(+), 363 deletions(-)

-- =

2.4.1


--===============4385103790952004763==--

