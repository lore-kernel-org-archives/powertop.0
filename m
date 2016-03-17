Content-Type: multipart/mixed; boundary="===============1398576631054009684=="
MIME-Version: 1.0
From: Blair Bethwaite <blair.bethwaite at gmail.com>
Subject: [Powertop] powertop hci tools bug report
Date: Fri, 18 Mar 2016 10:42:26 +1100
Message-ID: <CA+z5DszTAPK48juHex0kxgMcjQu4upfKO9yKFK1oU7T0hmR2=Q@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1398576631054009684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi there,

Any particular reason there is no issue tracker for powertop on the
official site or github?

Anyhoo, bug report here from an Ubuntu Wily machine. Powertop is
currently hard-coding the location of hciconfig and friends in
src/tuning/bluetooth.cpp to /usr/sbin/hciconfig. On my platform
hciconfig lives in /bin.

This should probably be discovered via configure. Only other
questionable hard-coding seems to be for xset.

-- =

Cheers,
~Blairo

--===============1398576631054009684==--

