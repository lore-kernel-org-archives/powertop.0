Content-Type: multipart/mixed; boundary="===============3963333481653360139=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [PowerTOP] how to stop after count is 0 gpu c0
Date: Sat, 19 Sep 2020 17:20:52 -0700
Message-ID: <20200920002052.GA1463@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3963333481653360139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Howdy,

Been using powertop for a while now, my current version is
2.8-1+b2 in debian.

It works, but it's really maddening as it keeps displaying this
after count is 0 gpu c0
                       after count is 0 gpu rc6
                                               after count is 0 gpu rc6p
                                                                        aft=
er count is 0 gpu rc6pp
                                                                           =
                       after count is 0 gpu c0
      after count is 0 gpu rc6
                              after count is 0 gpu rc6p
                                                       after count is 0 gpu=
 rc6pp


Yes, it's displayed like that, newline, no carriage return, and screws
up the entire display every 10 seconds.

--quiet doesn't make it go away.
powertop 2>/dev/null
doesn't stop it either. =


Do I need to find those lines in the source and remove them?
But more importantly why has it been doing that by default
(at least in debian) for quite a while now.
Is it just on my laptop? (thinkpad P73)

Thanks,
Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
 =

Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AA=
F9D08

--===============3963333481653360139==--

