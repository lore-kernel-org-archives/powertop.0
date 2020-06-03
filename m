Content-Type: multipart/mixed; boundary="===============4753949028715440965=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [PowerTOP] Pre-release v2.13-rc1
Date: Wed, 03 Jun 2020 10:57:41 -0700
Message-ID: <20200603175741.GA21623@localhost>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4753949028715440965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey all,

Just wanted to let you know that I tagged v2.13-rc1[1]. This is the first
release candidate for v2.13. Thank you to all who have contributed!

If you discover severe bugs-- hangs, crashes, and the like-- let us know
on the GitHub issue tracker[2]. Barring any nasty discoveries, v2.13
will be coming soon.


Output of 'git shortlog -n --no-merges v2.12..v2.13-rc1'

Joe Konno (17):
      README.md: rename, add md syntax, and major tweaks
      README.md: Fix a misspelled name
      Add CONTRIBUTE.md
      Remove Android build artifacts
      configure.ac: bump version to v2.13-pre
      configure.ac: use ax_cxx_compile_stdcxx instead
      po: regenerate gettext files
      Enable support for DNV
      intel_cpus: Fix ICX definition
      configure.ac: add missing checks from autoscan
      gettext: update to 0.20.2
      remove INSTALL relic
      gitignore: refresh ignored files
      Doxyfile.in: refresh for version 1.8.18
      Doxyfile.in: modernize configuration
      intel_cpus: Fix SKY-X definition
      configure.ac: bump to version v2.13-rc1

Edward Betts (1):
      correct spelling mistake

James Earl Douglas (1):
      Update wording to match units of measure

Jaroslav =C5=A0karvada (1):
      Dropped unused variable "entry" detected by Coverity

Michael Vetter (1):
      intel_cpus.cpp: Only call closedir() if opened


[1] https://github.com/fenrus75/powertop/releases/tag/v2.13-rc1
[2] https://github.com/fenrus75/powertop/issues


Cheers!

--===============4753949028715440965==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlIVUVBUllJQUIwV0lRUWk2UE1HeVBwTHFp
cGZOdk9nTURzR0NSaVVIQVVDWHRma2xRQUtDUkNnTURzR0NSaVUKSEZMZEFRRFRHWWNjYUxXUWkx
a24zb3AyN2RiOHBQVGxLN2F1NkMrY2JQdVNYNXdkUWdFQThRMncyMmpsejA0bwphYjE2QmxHNVpq
eGowTzVJaERUQ1JIZERMOXd0S1F3PQo9TUtnSQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============4753949028715440965==--

