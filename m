Content-Type: multipart/mixed; boundary="===============7776392634475570366=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: [Powertop] [PATCH 0/2] Show evil usbdevfs users
Date: Sat, 18 Jun 2016 20:26:00 -0400
Message-ID: <1466295962-1181132-1-git-send-email-green@linuxhacker.ru>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7776392634475570366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It turns out that powertop does not yet recognise that usbdevfs
users that hold usb device open like that cause it to operate at full
power, kind of like ALSA sound device users.
So the first patch adds support for ussbdevfs users to shame them
for needlessly draining power (I am looking at you, fwupd), and
patch two fixes an issue where such processes are not displayed in the
summary because they did not have any runtime at all, as if that would
somehow prevent the device-opening-damage.

Oleg Drokin (2):
  Add support for usbdevfs
  Show idle processes holding devices at full power

 src/devices/usb.cpp     | 28 ++++++++++++++++++++++++++++
 src/devices/usb.h       |  3 +++
 src/process/process.cpp |  3 ++-
 3 files changed, 33 insertions(+), 1 deletion(-)

-- =

2.7.4


--===============7776392634475570366==--

