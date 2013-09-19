Content-Type: multipart/mixed; boundary="===============5248528329532376600=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 0/8] use process_directory() to read dir
Date: Thu, 19 Sep 2013 15:35:37 +0300
Message-ID: <20130919123537.GA2300@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5248528329532376600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

This patch series removes some code duplication in trivial cases and
replaces explicit opendir()/readdir() handling with existing common
lib process_directory() helper.

 src/calibrate/calibrate.cpp | 151 ++++++++++++++++++++++++++++++++++++++++=
++++++++-------------------------------------------------------------------=
------------------------------------
 src/devices/alsa.cpp        |  46 +++++++++++++++++-----------------------=
------
 src/devices/alsa.h          |   4 ++--
 src/devices/network.cpp     |   8 ++++----
 src/devices/rfkill.cpp      |  46 +++++++++++++++++-----------------------=
------
 src/devices/usb.cpp         |  79 +++++++++++++++++++++++++++++++---------=
---------------------------------------
 src/lib.cpp                 |   4 ----
 src/tuning/ethernet.cpp     |  10 +++++-----
 src/tuning/tuningusb.cpp    |  46 ++++++++++++++--------------------------=
------

 9 files changed, 138 insertions(+), 256 deletions(-)


--===============5248528329532376600==--

