Content-Type: multipart/mixed; boundary="===============8227716060503520587=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 0/4 v1] lib and tuning cleanup series
Date: Fri, 08 Sep 2017 15:36:47 -0700
Message-ID: <20170908223651.27979-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8227716060503520587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

This series could be split in two, one for the libpci stuff in "lib",
and another for "tuning" cleanups. The cleanups in "lib" are not
dependent on the cleanups in "tuning" and vice-versa. There should be
no changes to PowerTOP operations or usage as a result of these
patches-- code cleanups only.

I was re-learning libpci a while back and, during my walks along various
PCI buses, spotted a trivial refactor for the libpci functionality in
"lib". This is to make it (slightly) more tempting to embark on future
changes to walk PCI buses with libpci instead of sysfs-- especially in
"tuning" cases.

While looking into additional runtime PM tunables, I stumbled upon
#defines used for tunable states. Implemented those states in an enum
instead. Proved easy as those defines were not used as factors in math
operations, so they were acting as enum entries to begin with. After the
enum was implemented, gcc warned about unhandled states in
tunable::result_string()'s switch statement, so I fixed it.


Joe Konno (4):
  lib: refactor pci_access checks
  lib: have check_pci_access() scan the entire bus
  tuning: use tunable_state enum instead of defines
  tuning: complete tunable result switch

 src/lib.cpp                | 14 ++++++++++----
 src/tuning/bluetooth.cpp   |  6 +++---
 src/tuning/bluetooth.h     |  2 +-
 src/tuning/ethernet.cpp    |  4 ++--
 src/tuning/ethernet.h      |  2 +-
 src/tuning/runtime.cpp     |  2 +-
 src/tuning/runtime.h       |  2 +-
 src/tuning/tunable.h       | 26 +++++++++++++++++---------
 src/tuning/tuningi2c.cpp   |  2 +-
 src/tuning/tuningi2c.h     |  2 +-
 src/tuning/tuningsysfs.cpp |  2 +-
 src/tuning/tuningsysfs.h   |  2 +-
 src/tuning/tuningusb.cpp   |  2 +-
 src/tuning/tuningusb.h     |  2 +-
 src/tuning/wifi.cpp        |  2 +-
 src/tuning/wifi.h          |  2 +-
 16 files changed, 44 insertions(+), 30 deletions(-)

-- =

2.13.5


--===============8227716060503520587==--

