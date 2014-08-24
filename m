Content-Type: multipart/mixed; boundary="===============0428104125995240531=="
MIME-Version: 1.0
From: Nanley Chery <nanleychery at gmail.com>
Subject: [Powertop] [PATCH 0/1] confirm USB autosuspend support before adding
 as tunable
Date: Sat, 23 Aug 2014 23:22:12 -0400
Message-ID: <1408850533-5008-1-git-send-email-nanleychery@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0428104125995240531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make sure that a USB device supports autosuspend before we add it to
the list of tunables. This problem was discovered downstream in the =

Debian bug 664455. If the device does not support autosuspend, its =

settings cannot be toggled. =


The algorithm used to determine autosuspend susport is the same one
found in the usb-pm-tools program. A USB device is added if every one
of its interfaces supports autosuspend. =


Nanley Chery (1):
  tunables: check usb autosuspend support before add

 src/tuning/tuningusb.cpp | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- =

2.0.4


--===============0428104125995240531==--

