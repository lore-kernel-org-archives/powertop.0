Content-Type: multipart/mixed; boundary="===============3672665726725737813=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCHv2 00/10] Code deduplication in cpu/*
Date: Mon, 24 Dec 2012 03:08:42 +0400
Message-ID: <1356304132-3889-1-git-send-email-intelfx100@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3672665726725737813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a resend (unchanged but rebased) of the patch series about refactor=
ing code
in cpu/* by deduplication. From this series, only the last bugfix patch has=
 been applied
so far due to a code freeze.

Ivan Shapovalov (10):
      Fix includes: do not include intel_cpus.h inside cpu.h
      Deduplication: move is_turbo() function to lib
      Deduplication: move all instances of account_freq() to abstract_cpu::=
account_freq()
      Deduplication: remove nhm_cpu::account_freq() almost identical to abs=
tract_cpu::account_freq()
      Deduplication: remove nhm_{cpu,core,package}::change_effective_freque=
ncy() identical to cpu_{linux,core,package}::change_effective_frequency()
      Deduplication: merge cpu_{core,linux,package}::change_effective_frequ=
ency() into abstract_cpu::change_effective_frequency()
      Deduplication: remove {cpu,nhm}_core::calculate_freq() identical to a=
bstract_cpu::calculate_freq()
      Deduplication: remove nhm_package::calculate_freq() identical to cpu_=
package::calculate_freq()
      Deduplication: properly merge cpu_package::calculate_freq() into abst=
ract_cpu::calculate_freq()
      Deduplication: merge go_idle()/go_unidle()/change_freq() overrides in=
to abstract_cpu() class

--===============3672665726725737813==--

