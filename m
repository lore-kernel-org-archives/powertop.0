Content-Type: multipart/mixed; boundary="===============6356017389412776506=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [Announce] PowerTOP v2.8
Date: Thu, 05 Nov 2015 17:08:40 -0800
Message-ID: <563BFD98.6010702@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6356017389412776506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

PowerTOP v2.8 Release

We are pleased to announce the release of PowerTOP v2.8.

About PowerTOP
PowerTOP is a Linux tool to diagnose issues with power consumption and
power management. In addition to being a diagnostic tool, PowerTOP also
has an interactive mode you can use to experiment with various power
management settings, for cases where the Linux distribution has not
enabled those settings.
PowerTOP reports which components in the system are most likely to blame
for higher-than-needed power consumption, ranging from software
applications to active components in the system. Detailed screens are
available for CPU C and P states, device activity, and software activity.
For many years, PowerTOP has been used heavily by Intel, Linux
distributors, and various parts of the open source community.

Highlights

Thank you to everyone who contributed to this release!
Alexandra Yates (26):
       Enable PowerTOP support for: BSW, BDW-H
       bug-fix: added devices/devreq.h to Makefile
       Merge remote-tracking branch 'ext_pwd/master'
       Adding support to SKY platforms.
       Merge branch 'ext_pwt'
       Update internal repo with external mainline
       Android Support
       Add C7- C10 support for Intel SKY
       Merge branch 'pw_ext_gh'
       Enabling Intel SKL support
       PowerTOP v2.8-rc1
       Intel Support BSW C-States
       Added SKL C7 support
       Update version to PowerTOP v2.8-rc2
       Merge branch 'master' of github.com:fenrus75/powertop
       Revert "Assign line level based on linux name"
       Fix style bugs inherited from the header and menu
       PowerTOP v2.8-rc3
       Transifex Update
       Transifex Update
       PowerTOP 2.8-rc4
       Transifex Translations
       PowerTOP v2.8

David E. Box (1):
       Fix Powertop support for Intel Braswell SOC

Jaroslav =C5=A0karvada (3):
       Patch: Add navigation hint
       Use PATH_MAX from limits.h and snprintf instead of sprintf
       Improve handling of reporting filenames
       More sprintf fixes

Lorenzo Pieralisi (1):
       powertop: fix erroneous C state detection on ARM

Michael Mullin (1):
       Powertop crashes with 'powertop --auto-tune'

Nivedita Swaminathan (1):
       Additional message printed to the powertop output

Romain Naour (2):
       add missing sys/time.h header
       add missing stdio.h header

Sami Kerola (15):
       configure: require new enough automake version
       configure: use autoconf-archive ax_pthread.m4
       add missing space to --version print out
       csstoh.sh: check every single return value
       configure: use AC_USE_SYSTEM_EXTENSIONS to determine features
       move variables to protected scope
       make --quiet option to suppress various info messages
       add missing include
       squeeze all extra bits from size of binary and html report
       fix typo in message
       textual: add new line to a message
       powertop.m4: GCC_FORTIFY_SOURCE_CC copy idea of macro from =

Archlinux pacman
       add timestamp to html report
       main: fix incompatible operand type
       configure: use autoconf-archive ax_cxx_compile_stdcxx_11.m4


-- =

Thank you,
<Alexandra>

--===============6356017389412776506==--

