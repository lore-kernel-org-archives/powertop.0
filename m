Content-Type: multipart/mixed; boundary="===============8514516773105200038=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: [Powertop] [Announce] PowerTOP v2.5 released
Date: Fri, 22 Nov 2013 11:53:07 -0800
Message-ID: <20131122115307.26ec8263@kcaccard-desk.amr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8514516773105200038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We are pleased to announce the release of PowerTOP v2.5.

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
* support for the Intel Baytrail-M CPU counters
* new "auto-tune" option which sets all tunable options to the GOOD setting
* support for the 3.12 libtraceevent code base

Thank you to everyone who contributed to this release!

Daniel Kahn Gillmor (1):
      Embed self-contained javascript

David Rosca (1):
      Fixed cpu_core::has_c1_res initialization

Hans-Peter Deifel (2):
      Use symbolic instead of numeric constants for keys
      Document key bindings in man page

Jaroslav Skarvada (3):
      tell user if the system is running out of FDs
      set open files rlimit to /proc/sys/fs/nr_open
      Fix for some 'requesting unregistered parameter'

Kristen Carlson Accardi (9):
      cpu: clean intel cpu model out of cpu
      cpu: clean intel cpu model out of cpu
      intel_cpus: add support for Silvermont/Baytrail-M CPU
      intel_cpus: restore support for hsw-ult
      update pot file for transifex
      change version to 2.5
      updated pot file with new version string
      updates to po files

Sanjay Singh Rawat (1):
      resolve android build errors

Sergey Senozhatsky (25):
      Suppress decimal constant compilation warning
      Seg Fault due to function format_watts in file src/lib.cpp
      Do not leak fd in perf_bundle read_file()
      README: add CONFIG_DEBUG_FS to Kernel Parameters
      Introduce --auto-tune mode
      lib: unify process_directory()
      alsa: use process_directory()
      calibrate: use process_directory()
      network: use updated process_directory()
      rfkill: use process_directory()
      usb: use process_directory()
      tuning ethernet: use updated process_directory()
      tuningusb: use process_directory()
      perf_bundle: introduce fixup_sample_trace_cpu()
      traceevent: update libtraceevent code base (3.12)
      lib: introduce ui_notify_user()
      tuning: print executed toggle script
      power_meter: introduce discharging member measurement: report total g=
lobal_time_left()
      power_supply: delete unused power_supply class
      parameters: report correct "base power" parameter
      backlight: use process_directory() helper
      backlight: decrease backlight() .ctor mem usage
      intel cpus: add proper C-states init
      html report: fix IE compatibility errors

Youquan Song (1):
      Fix running failure when > 69 CPUs for open file limitation

Project Details
URL: https://01.org/powertop
Download: https://01.org/powertop/downloads/2013/PowerTOP-v2.5

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

--===============8514516773105200038==--

