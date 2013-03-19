Content-Type: multipart/mixed; boundary="===============3686258083506043062=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: [Powertop] [Announce] PowerTOP v2.3 release
Date: Tue, 19 Mar 2013 11:58:23 -0700
Message-ID: <20130319115823.380e8e5e@bluebird.jf.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3686258083506043062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We are pleased to announce the release of PowerTOP v2.3. This is a maintena=
nce release.

About PowerTOP

PowerTOP is a Linux tool used to diagnose issues with power consumption and=
 power management. In addition to being a diagnostic tool, PowerTOP also ha=
s an interactive mode you can use to experiment with various power manageme=
nt settings, for cases where the Linux distribution has not enabled those s=
ettings.

PowerTOP reports which system components are most likely to blame for highe=
r-than-needed power consumption, ranging from software applications to acti=
ve hardware components. Detailed screens are available for CPU C and P stat=
es, device activity, and software activity.

Highlights

* Reduced duplication in CPU code
* Improved ARM build support
* Various bug fixes and cleanups

Thank you to everyone who contributed to this release!

Austin Zhang (2):
      V2: Fix C states and P states presentation issue.
      Using std::max to handle all such kind of logic
 =

Daniel Kahn Gillmor (1):
      Correct script for tuning wifi power_save with iw
 =

Ivan Shapovalov (10):
      Fix includes: do not include intel_cpus.h inside cpu.h
      Deduplication: move is_turbo() function to lib
      Deduplication: move all instances of account_freq() to abstract_cpu::=
account_freq()
      Deduplication: remove nhm_cpu::account_freq() almost identical to abs=
tract_cpu::account_freq()
      Deduplication: remove nhm_{cpu, core, package}::change_effective_freq=
uency() identical to cpu_{linux, core, package}::change_effective_frequency=
()
      Deduplication: merge cpu_{core, linux, package}::change_effective_fre=
quency() into abstract_cpu::change_effective_frequency()
      Deduplication: remove {cpu, nhm}_core::calculate_freq() identical to =
abstract_cpu::calculate_freq()
      Deduplication: remove nhm_package::calculate_freq() identical to cpu_=
package::calculate_freq()
      Deduplication: properly merge cpu_package::calculate_freq() into abst=
ract_cpu::calculate_freq()
      Deduplication: merge go_idle()/go_unidle()/change_freq() overrides in=
to abstract_cpu() class
 =

Jaroslav Skarvada (1):
      cpufreq: only try to open files under cpuX
 =

Jaroslav =C5=A0karvada (2):
      report: fixed crash when writing report to RO filesystem
      Do not call abstract_cpu::wiggle for GPU
 =

Kristen Carlson Accardi (4):
      pot update: changes required for transifex due to string change
      new and modified po files from transifex
      change version for 2.3
      fix issue with string termination
 =

Namhyung Kim (4):
      Use PACKAGE_VERSION for POWERTOP_VERSION
      process: Get rid of unused dbg_printf_pevent_info()
      main: 'quiet' option does not take an argument
      main: Fix output when running workload
 =

Paul Menzel (1):
      src/cpu/cpu.cpp: Fix typo in error message: freque*nc*y
 =

Rajagopal Venkat (1):
      Allow frequency stats when cpuidle is not enabled
 =

Sergey Senozhatsky (5):
      tab_window: null members on construction
      parameters: fix uninitialized values in param/result getters
      runtime_pm: register parameters
      remove csstoh.c
      measurement: handle multiple batteries in global_time_left()
 =

Thomas Waldecker (2):
      csstoh.sh shell script fixes cross compiling issues
      csstoh shell-script for cross-compiling
 =

Project Details
URL: https://01.org/powertop
Download: https://01.org/powertop/downloads/2012/PowerTOP-v2.2
Mailing list:
Discussions about PowerTOP occur on the PowerTOP at lists.01.org mailing li=
st.
Subscribe to the list at https://lists.01.org/mailman/listinfo/powertop
Archives are found at http://lists.01.org/pipermail/powertop
The development PowerTOP git repositories are hosted at GitHub.
 =

URL: https://github.com/fenrus75/powertop
HTTP: https://github.com/fenrus75/powertop.git
GIT-readonly: git://github.com/fenrus75/powertop.git
Note: We will not use any of GitHub's integrate, merge, or tracking =

functions, so please continue to use the provided lists.
 =

For localization support and contributions, we are using Transifex.
Transifex URL: https://www.transifex.com/projects/p/PowerTOP/

--===============3686258083506043062==--

