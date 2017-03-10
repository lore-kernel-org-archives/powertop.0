Content-Type: multipart/mixed; boundary="===============4836591949814813561=="
MIME-Version: 1.0
From: Swaminathan, Nivedita <nivedita.swaminathan at intel.com>
Subject: [Powertop]  [Announce] PowerTOP v2.9
Date: Fri, 10 Mar 2017 23:17:13 +0000
Message-ID: <203C9A218350B94EAF34403F81F162AE1AF3CF78@ORSMSX116.amr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4836591949814813561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

PowerTOP v2.9 Release

We are pleased to announce the release of PowerTOP v2.9.

About PowerTOP:
PowerTOP is a Linux tool to diagnose issues with power consumption and powe=
r management. In addition to being a diagnostic tool, PowerTOP also has an =
interactive mode you can use to experiment with various power management se=
ttings, for cases where the Linux distribution has not enabled those settin=
gs.
PowerTOP reports which components in the system are most likely to blame fo=
r higher-than-needed power consumption, ranging from software applications =
to active components in the system. Detailed screens are available for CPU =
C and P states, device activity, and software activity. For many years, Pow=
erTOP has been used heavily by Intel, Linux distributors, and various parts=
 of the open source community.

About PowerTOP v2.9 release:
This is a minor release enabling support for the 7th generation IntelR Core=
T processors based on Kaby Lake microarchitecture and Next Generation Intel=
 Atom processors based on Goldmont Microarchitecture. Other important featu=
re change in this release is that, for Intel cpus we have stopped displayin=
g pstate idle percentage when intel_pstate is enabled. This change will be =
reflected in the Frequency Stats tab. There has also been a lot of bug fixe=
s thanks to the contributors' from the open source community. =

 =

Highlights:

Thank you to everyone who contributed to this release!

Boris ARZUR (1):
      enable --auto-tune without debugfs

Daniel Black (5):
      Makefile.am need reference to m4 directory
      Add process_glob similar to process_directory.
      Widen ppc64 paths for sysfs file
      MSR is valid for x86_32/x86_64 only
      Calculate the number of joules consumed over time

Jan Engelhardt (2):
      Fix crash due to buffer overruns
      Avoid hardcoding magic values when sizeof can be used

Joe Konno (17):
      .gitignore: ignore vim swap, cscope, ctags
      intel_cpus: frequency: clarify average clock speed
      intel_cpus: no pstate Idle pct with intel_pstate
      configure.ac: bump version to 2.9-pre
      Makefile.am: add --install to ACLOCAL_AMFLAGS
      gettext: run gettextize-0.18.2
      .gitignore: ignnore m4/pkg.m4
      Makevars: align more closely to generated .template
      scripts: add regenerate-potfiles-in script
      POTFILES.in: refresh files with strings
      powertop.pot: xgettext refresh, attribution fix
      po: regenerate with new POT and strings
      main.cpp: remove __DATE__ from --version
      configure.ac: version strings from git describe
      search/replace POWERTOP_VERSION and SHORT_VERSION
      Doxyfile.in: add doxygen support
      Enable Intel KBL support

Madper Xie (1):
      Throw error message when system cmd returns Non-zero value.

Nivedita Swaminathan (5):
      Adding the PTHREAD_CFLAGS option
      Fix crash due to unbounded string copies
      Revert "Fix crash due to unbounded string copies"
      Enabling Intel BXT support
      Additional comments added for clarity

Oleg Drokin (3):
      Add support for usbdevfs
      Show idle processes holding devices at full power
      Fix misaligned curly brace

Ond=C5=99ej Lyson=C4=9Bk (2):
      Fixed some potentially unterminated strings
      Fixed a dangling pointer

Paul Menzel (1):
      cpu: Add space after comma

Stewart Smith (2):
      cpu: support powerpc /proc/cpuinfo
      Add support for power consumption sensors through opal-sensors sysfs

Thomas Ilsche (1):
      powertop changes the frequency set by the userspace governor to the m=
inimum available frequency.

Yaroslav Isakov (2):
      Detect all audio cards in the system (not only card0)
      Fixed bug when all PCI devices usage is shown as 00%

eSyr (2):
      Checking whether librt is needed for clock_gettime().
      Adding PID to process description.


Thanks and regards,

Nivedita Swaminathan




--===============4836591949814813561==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="1_Warning.txt"

DQpCTE9DS0VEIEZJTEUgQUxFUlRBIGZpbGUgaGFzIGJlZW4gYmxvY2tlZCBkdWUgdG8gdGhlICdJ
bnRlbCBFbWFpbCBGaWxlIEZpbHRlcmluZyBQb2xpY3knIHJ1bGUuQ29udGV4dDogJ2F1dG9nZW4u
c2gnRGlzYWxsb3dlZCBkdWUgdG8gZmlsZW5hbWVUaWNrZXQgTnVtYmVyOiAnMGI5NC01OGMzLTMz
ZmQtMDAwMScNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpC
TE9DS0VEIEZJTEUgQUxFUlRBIGZpbGUgaGFzIGJlZW4gYmxvY2tlZCBkdWUgdG8gdGhlICdJbnRl
bCBFbWFpbCBGaWxlIEZpbHRlcmluZyBQb2xpY3knIHJ1bGUuQ29udGV4dDogJ2Nzc3RvaC5zaCdE
aXNhbGxvd2VkIGR1ZSB0byBmaWxlbmFtZVRpY2tldCBOdW1iZXI6ICcwYjk0LTU4YzMtMzNmZC0w
MDAxJw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkJMT0NL
RUQgRklMRSBBTEVSVEEgZmlsZSBoYXMgYmVlbiBibG9ja2VkIGR1ZSB0byB0aGUgJ0ludGVsIEVt
YWlsIEZpbGUgRmlsdGVyaW5nIFBvbGljeScgcnVsZS5Db250ZXh0OiAnbHRtYWluLnNoJ0Rpc2Fs
bG93ZWQgZHVlIHRvIGZpbGVuYW1lVGlja2V0IE51bWJlcjogJzBiOTQtNThjMy0zM2ZkLTAwMDEn
DQpTZWUgeW91ciBzeXN0ZW0gYWRtaW5pc3RyYXRvciBmb3IgZnVydGhlciBpbmZvcm1hdGlvbi4g
Q29weXJpZ2h0IDE5OTktMjAxMSBNY0FmZWUsIEluYy5BbGwgUmlnaHRzIFJlc2VydmVkLmh0dHA6
Ly93d3cubWNhZmVlLmNvbQ==
--===============4836591949814813561==--

