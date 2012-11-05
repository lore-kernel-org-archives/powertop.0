Content-Type: multipart/mixed; boundary="===============6375606808717152810=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCH 00/11] Code deduplication and a single i965
 P-states accounting bugfix in cpu/*
Date: Mon, 05 Nov 2012 15:12:22 +0400
Message-ID: <1352113953-24687-1-git-send-email-intelfx100@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6375606808717152810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a series of refactor (well, mainly deduplication) of cpu/* code fol=
lowed with a
single bugfix patch.

The bugfix itself may be applied even without applying refactoring, but then
the same change shall be applied to all copies of calculate_freq().

So the whole purpose of the series is to
 1) mercilessly purge those method overrides which are identical to the met=
hods in base
    classes, and
 2) prefer defining a helper function and overriding it rather than copy-pa=
sting
    the whole big function whose behavior needs to be altered and changing =
one-two lines in it.

Ivan Shapovalov (11):
  Fix includes: do not include intel_cpus.h inside cpu.h
  Deduplication: move is_turbo() function to lib
  Deduplication: move all instances of account_freq() to
    abstract_cpu::account_freq()
  Deduplication: remove nhm_cpu::account_freq() almost identical to
    abstract_cpu::account_freq()
  Deduplication: remove
    nhm_{cpu,core,package}::change_effective_frequency() identical to
    cpu_{linux,core,package}::change_effective_frequency()
  Deduplication: merge
    cpu_{core,linux,package}::change_effective_frequency() into
    abstract_cpu::change_effective_frequency()
  Deduplication: remove {cpu,nhm}_core::calculate_freq() identical to
    abstract_cpu::calculate_freq()
  Deduplication: remove nhm_package::calculate_freq() identical to
    cpu_package::calculate_freq()
  Deduplication: properly merge cpu_package::calculate_freq() into
    abstract_cpu::calculate_freq()
  Deduplication: merge go_idle()/go_unidle()/change_freq() overrides
    into abstract_cpu() class
  Ignore non-P-state-enabled CPUs when calculating frequency.

 src/cpu/abstract_cpu.cpp |  69 ++++++++++--
 src/cpu/cpu.cpp          |   1 +
 src/cpu/cpu.h            |  29 ++----
 src/cpu/cpu_core.cpp     |  97 -----------------
 src/cpu/cpu_linux.cpp    |  98 ------------------
 src/cpu/cpu_package.cpp  | 102 ++----------------
 src/cpu/intel_cpus.cpp   | 265 +------------------------------------------=
----
 src/cpu/intel_cpus.h     |  23 +---
 src/cpu/intel_gpu.cpp    |   2 +-
 src/lib.cpp              |   9 ++
 src/lib.h                |   1 +
 11 files changed, 94 insertions(+), 602 deletions(-)

--
1.8.0


--===============6375606808717152810==--

