Content-Type: multipart/mixed; boundary="===============0576461165415358703=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: [Powertop] PowerTOP 2.4 released!
Date: Fri, 19 Jul 2013 10:13:21 -0700
Message-ID: <20130719101321.5fe711bb@bluebird.jf.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0576461165415358703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(sorry this took so long!)

PowerTOP v2.4 Release
We are pleased to announce the release of PowerTOP v2.4.

About PowerTOP
PowerTOP is a Linux tool to diagnose issues with power consumption and =

power management. In addition to being a diagnostic tool, PowerTOP also =

has an interactive mode you can use to experiment with various power =

management settings, for cases where the Linux distribution has not =

enabled those settings.

PowerTOP reports which components in the system are most likely to blame =

for higher-than-needed power consumption, ranging from software =

applications to active components in the system. Detailed screens are =

available for CPU C and P states, device activity, and software activity.

For many years, PowerTOP has been used heavily by Intel, Linux =

distributors, and various parts of the open source community. =


Highlights
* support for the Intel Haswell ULT CPU counters
* support for reporting of SATA DEVSLP in the alpm accounting patch
* RAPL support

Thank you to everyone who contributed to this release!

David Woodhouse (1):
      Add devslp support to PowerTOP AHCI monitoring

Jani Nikula (2):
      README: add CONFIG_X86_MSR to the list of required kernel config opti=
ons
      Add a more informative error message about MSR not found

Kristen Carlson Accardi (9):
      cpu: add new Intel cpuid
      patches: add refreshed alpm accounting patch
      cpu: allow for more package than core cstates
      cpu: add support for new package states
      Add new patch which allows us to report devslp residency
      Update po files from transifex
      Fix termination issue in po file
      Configure: update for 2.4
      Fixes for build failures with the new rapl code

Srinivas Pandruvada (8):
      Common read/write MSR API
      Use MSR Lib MSR functions
      RAPL Interface
      cpu device as parent class
      Interface to get first cpu
      Added PP0 RAPL domain for CPU
      Add RAPL DRAM domain
      Add RAPL PP1 domain for GPU

Project Details
URL: https://01.org/powertop
Download: https://01.org/powertop/downloads/2013/PowerTOP-v2.4

Mailing list:
Discussions about PowerTOP occur on the PowerTOP at lists.01.org mailing li=
st.
Subscribe to the list at https://lists.01.org/mailman/listinfo/powertop
Archives are found at http://lists.01.org/pipermail/powertop
The development PowerTOP git repositories are hosted at GitHub.

URL: https://github.com/fenrus75/powertop
HTTP: https://github.com/fenrus75/powertop.git
GIT-readonly: git://github.com/fenrus75/powertop.git
Note: We will not use any of GitHub's integrate, merge, or tracking =

functions, so please continue to use the provided lists.

For localization support and contributions, we are using Transifex.
Transifex URL: https://www.transifex.com/projects/p/PowerTOP/


--===============0576461165415358703==--

