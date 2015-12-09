Content-Type: multipart/mixed; boundary="===============4910924120748163058=="
MIME-Version: 1.0
From: Swaminathan, Nivedita <nivedita.swaminathan at intel.com>
Subject: Re: [Powertop] [PATCH 0/2] powerpc powernv platform support
Date: Wed, 09 Dec 2015 23:16:14 +0000
Message-ID: <203C9A218350B94EAF34403F81F162AE1982ABFF@ORSMSX116.amr.corp.intel.com>
In-Reply-To: 1448582849-1707-1-git-send-email-stewart@linux.vnet.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4910924120748163058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for sending your patch. Your patch has been added to the github r=
epository.

Regards,
Nivedita

-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Stewar=
t Smith
Sent: Thursday, November 26, 2015 4:07 PM
To: powertop(a)lists.01.org
Cc: svaidy(a)linux.vnet.ibm.com
Subject: [Powertop] [PATCH 0/2] powerpc powernv platform support

Hi!

These two patches get powertop to work on current powernv machines.

These are POWER8 based systems from IBM (and others) running OPAL firmware.

The first patch correctly parses /proc/cpuinfo so information about process=
ors and pstates is displayed (at all).

The second uses the existing userspace interface for getting power consumpt=
ion.

Stewart Smith (2):
  cpu: support powerpc /proc/cpuinfo
  Add support for power consumption sensors through opal-sensors sysfs

 src/Makefile.am                  |  2 ++
 src/cpu/cpu.cpp                  | 20 ++++++----------
 src/measurement/measurement.cpp  | 14 +++++++++++  src/measurement/opal-se=
nsors.cpp | 50 ++++++++++++++++++++++++++++++++++++++++
 src/measurement/opal-sensors.h   | 41 ++++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 13 deletions(-)  create mode 100644 sr=
c/measurement/opal-sensors.cpp  create mode 100644 src/measurement/opal-sen=
sors.h

--
2.1.4

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============4910924120748163058==--

