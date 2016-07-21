Content-Type: multipart/mixed; boundary="===============6385593208108799591=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v2 0/1] Rebase of "Calculate the number of joules
 consumed over time"
Date: Thu, 21 Jul 2016 16:24:40 -0700
Message-ID: <20160721232441.29802-1-joe.konno@linux.intel.com>
In-Reply-To: 1469075277-35705-1-git-send-email-daniel.black@au1.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6385593208108799591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Hey gang,

An attempt to apply v1 of this patch resulted in a git-am rejection in
main.cpp, in the main() function. This was due to a context change introduc=
ed
in main.cpp line 514 (post git am --reject). The following patch introduced=
 the
context change:

    - 06696d4e5f2e ("enable --auto-tune without debugfs")

As a courtesy (and as thanks for the submission), I am re-submitting with t=
he
new context incorporated.

Cheers

Daniel Black (1):
  Calculate the number of joules consumed over time

 src/calibrate/calibrate.cpp      | 26 +++++++++----------
 src/calibrate/calibrate.h        |  2 +-
 src/devices/device.cpp           | 11 ++++++--
 src/main.cpp                     | 54 ++++++++++++++++++++++++++++++++----=
----
 src/measurement/acpi.cpp         |  2 +-
 src/measurement/acpi.h           |  2 +-
 src/measurement/extech.cpp       |  2 +-
 src/measurement/extech.h         |  2 +-
 src/measurement/measurement.cpp  | 31 ++++++++++++++++++++---
 src/measurement/measurement.h    |  6 +++--
 src/measurement/opal-sensors.cpp |  2 +-
 src/measurement/opal-sensors.h   |  2 +-
 src/measurement/sysfs.h          |  2 +-
 src/parameters/parameters.cpp    |  2 +-
 src/parameters/parameters.h      |  1 +
 src/process/do_process.cpp       |  8 ++++--
 16 files changed, 113 insertions(+), 42 deletions(-)

-- =

2.9.0


--===============6385593208108799591==--

