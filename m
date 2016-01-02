Content-Type: multipart/mixed; boundary="===============6752276855868691295=="
MIME-Version: 1.0
From: George Barrett <bob at bob131.so>
Subject: [Powertop] Fwd: Suggested tunables addition: sysctl
 kernel.core_pattern
Date: Sat, 02 Jan 2016 21:00:57 +1100
Message-ID: <1451728857.27353.1@mail.bob131.so>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6752276855868691295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, first off thanks for the great tool!

I currently rely on a systemd unit file present in the Fedora package =

for powertop to do most of my laptop's power saving config on boot, and =

it works great. However, I've noticed a missing tunable which might be =

helpful for some folks: setting the kernel.core_pattern sysctl =

parameter to |/dev/null or similar. On my x220, this parameter set to =

it's default causes systemd-coredump to peg a single core, sometimes =

for quite an extended period of time. On many devices this would cause =

substantially greater heat output, and most importantly substantially =

higher power consumption.

I had a quick browse of the source code to see if this addition was =

trivial enough for me to submit a patch over, but from what I could see =

the existing tunables seem to work exclusively with sysfs. =

Unfortunately I don't write much C++, so I apologise for sending this =

particular email rather than submitting a patch for y'all.

Thanks


--===============6752276855868691295==--

