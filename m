Content-Type: multipart/mixed; boundary="===============9188799903159600853=="
MIME-Version: 1.0
From: Zeitouny, Christophe G <christophe.g.zeitouny at intel.com>
Subject: [Powertop] [PATCH] [PowerTOP] Add Device Hierarchy Support
Date: Mon, 29 Jul 2013 10:59:56 -0700
Message-ID: <1375120797-12625-1-git-send-email-christophe.g.zeitouny@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9188799903159600853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: "Zeitouny, Christophe G" <christophe.g.zeitouny(a)intel.com>

This patch series adds support for device hierarchy in PowerTOP.
The hierarchy is reflected in the "root_devices" vector in "device.cpp".
The historical "all_devices" vector is conserved, in order to allow for par=
ts that =

do not make use of hierarchy to still function without any modification.

The built-in ncurses UI and the HTML and CSV reports still use the old flat=
 model,
but can be easily adapted to the hierarchical model (some UI decisions need=
 to be made,
not to mention decisions on how to represent hierarchy in the reports).

The hierarchy is discovered using the sysfs interface, where every discover=
able relationship
is gathered and stored.

PowerTOP can now recursively discover all child devices under the PCI/USB b=
usses,
and can link SPI, I2C, and RFKill interfaces back to their parent devices.

Zeitouny, Christophe G (1):
  Add support for device hierarchy. Preserves backward compatibility
    with flat list of devices

 src/devices/ahci.cpp           |   61 ++--
 src/devices/ahci.h             |    4 +-
 src/devices/alsa.cpp           |   30 +-
 src/devices/alsa.h             |    4 +-
 src/devices/backlight.cpp      |   29 +-
 src/devices/backlight.h        |    4 +-
 src/devices/device.cpp         |  737 ++++++++++++++++++++++++++++++++++++=
+++-
 src/devices/device.h           |   47 +++
 src/devices/i915-gpu.cpp       |   28 +-
 src/devices/i915-gpu.h         |    5 +-
 src/devices/network.cpp        |   15 +-
 src/devices/network.h          |    1 +
 src/devices/rfkill.cpp         |   45 +--
 src/devices/rfkill.h           |    4 +-
 src/devices/runtime_pm.cpp     |  106 +++---
 src/devices/runtime_pm.h       |    9 +-
 src/devices/thinkpad-fan.cpp   |    8 +-
 src/devices/thinkpad-fan.h     |    4 +-
 src/devices/thinkpad-light.cpp |   10 +-
 src/devices/thinkpad-light.h   |    4 +-
 src/devices/usb.cpp            |   43 +++
 src/devices/usb.h              |    4 +-
 22 files changed, 1005 insertions(+), 197 deletions(-)

-- =

1.7.9.5


--===============9188799903159600853==--

