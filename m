Content-Type: multipart/mixed; boundary="===============5946292267563015499=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [PowerTOP] ANNOUNCING PowerTOP v2.13
Date: Thu, 11 Jun 2020 13:22:51 -0700
Message-ID: <20200611202251.GA160987@localhost>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5946292267563015499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey all,

PowerTOP v2.13 has been tagged and released[1]. Thank you to all who have
contributed!

This release does have functional fixes (see shortlog below), but is more a
"cleanup" release.

Developers and enthusiasts, the project has documented how you can
contribute to the project. See the CONTRIBUTE.md document for more. The
short version? Fork on GitHub, and send us your pull requests!

I encourage you to monitor the project issue tracker[2]. Within the next few
weeks, PowerTOP's maintainers will open issues to scrutinize PowerTOP's
existing feature set. Your input (and patches) will be welcomed.

If you use PowerTOP and find a bug, or have an idea for improving
PowerTOP, please open an issue[2] to start a discussion. Pull requests
are always welcome.


Output of 'git shortlog -n --no-merges v2.12..v2.13'

Joe Konno (19):
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
      README: clarify dependencies, contrib, and support
      PowerTOP v2.13

Edward Betts (1):
      correct spelling mistake

James Earl Douglas (1):
      Update wording to match units of measure

Jaroslav =C5=A0karvada (1):
      Dropped unused variable "entry" detected by Coverity

Michael Vetter (1):
      intel_cpus.cpp: Only call closedir() if opened


[1] https://github.com/fenrus75/powertop/releases/tag/v2.13
[2] https://github.com/fenrus75/powertop/issues


Cheers!

--===============5946292267563015499==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlIVUVBUllJQUIwV0lRUWk2UE1HeVBwTHFp
cGZOdk9nTURzR0NSaVVIQVVDWHVLU213QUtDUkNnTURzR0NSaVUKSEV2K0FQOWQ4VWlQak1Wa3dn
RmhUU2YvUjlJRDVYODBNVWZwOTlGeVNzTFBvblFVWkFFQXNPWisrRXZaeEduZQoxMGROMWJKY0cr
aE5JVmVKMGhVNnExK3dSZTZCb3dBPQo9T002NAotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============5946292267563015499==--

