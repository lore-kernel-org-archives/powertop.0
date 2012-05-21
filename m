Content-Type: multipart/mixed; boundary="===============7859447081580206576=="
MIME-Version: 1.0
From: Bram Bouwens <bram at bouwens.org>
Subject: [Powertop] PowerTop configure fails on BeagleBone/Ubuntu
Date: Mon, 21 May 2012 16:56:20 +0200
Message-ID: <4FBA5794.60107@bouwens.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7859447081580206576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

I'm trying to build powertop-2.0 on a BeagleBone running Ubuntu:

root(a)omap:~/powertop-2.0# uname -a
Linux omap 3.2.0-psp7 #1 Fri Apr 13 04:55:05 UTC 2012 armv7l armv7l armv7l =
GNU/Linux

but I get an error in the ./configure stage:

checking for strtoull... yes
checking for library containing delwin... -lncurses
./configure: line 19020: syntax error near unexpected token `PCIUTILS,'
./configure: line 19020: `PKG_CHECK_MODULES(PCIUTILS, libpci,,'

I do have the pci utils I think:

root(a)omap:~/powertop-2.0# dpkg --list | egrep -i pci
ii  libpci-dev                      1:3.1.8-2ubuntu5                 Linux =
PCI Utilities (development files)
ii  libpci3                         1:3.1.8-2ubuntu5                 Linux =
PCI Utilities (shared library)
ii  libpciaccess0                   0.12.902-1                       Generi=
c PCI access library for X
ii  pciutils                        1:3.1.8-2ubuntu5                 Linux =
PCI Utilities

though I see something unexpected with the PCI bus:

root(a)omap:~/powertop-2.0# ls /proc/bus/pci
ls: cannot access /proc/bus/pci: No such file or directory

I'm not sure this board has a PCI bus, actually.

How should I proceed?

Bram

--===============7859447081580206576==--

