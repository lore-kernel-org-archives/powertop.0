Content-Type: multipart/mixed; boundary="===============2999462682967121072=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCH 00/11] Code deduplication and a single
 i965 P-states accounting bugfix in cpu/*
Date: Mon, 05 Nov 2012 16:08:23 +0400
Message-ID: <4124665.ciaSzWZmn4@intelfx-laptop>
In-Reply-To: 20121105113037.GE3123@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2999462682967121072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05 =D0=BD=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2012 14:30:37 Sergey Senozhatsky=
 wrote:
> On (11/05/12 15:12), Ivan Shapovalov wrote:
> > This is a series of refactor (well, mainly deduplication) of cpu/* code
> > followed with a single bugfix patch.
> =

> thanks for patches, we'll review. code is frozen for a release, so it'll
> take some time.

Ok, thanks.
FYI: the last patch in series is a bugfix, so it probably shall go into the =

upcoming release independently of refactoring..

- Ivan

> =

> 	-ss
> =

> > The bugfix itself may be applied even without applying refactoring, but
> > then the same change shall be applied to all copies of calculate_freq().
> > =

> > So the whole purpose of the series is to
> > =

> >  1) mercilessly purge those method overrides which are identical to the
> >  methods in base>  =

> >     classes, and
> >  =

> >  2) prefer defining a helper function and overriding it rather than
> >  copy-pasting>  =

> >     the whole big function whose behavior needs to be altered and chang=
ing
> >     one-two lines in it.> =

> > Ivan Shapovalov (11):
> >   Fix includes: do not include intel_cpus.h inside cpu.h
> >   Deduplication: move is_turbo() function to lib
> >   Deduplication: move all instances of account_freq() to
> >   =

> >     abstract_cpu::account_freq()
> >   =

> >   Deduplication: remove nhm_cpu::account_freq() almost identical to
> >   =

> >     abstract_cpu::account_freq()
> >   =

> >   Deduplication: remove
> >   =

> >     nhm_{cpu,core,package}::change_effective_frequency() identical to
> >     cpu_{linux,core,package}::change_effective_frequency()
> >   =

> >   Deduplication: merge
> >   =

> >     cpu_{core,linux,package}::change_effective_frequency() into
> >     abstract_cpu::change_effective_frequency()
> >   =

> >   Deduplication: remove {cpu,nhm}_core::calculate_freq() identical to
> >   =

> >     abstract_cpu::calculate_freq()
> >   =

> >   Deduplication: remove nhm_package::calculate_freq() identical to
> >   =

> >     cpu_package::calculate_freq()
> >   =

> >   Deduplication: properly merge cpu_package::calculate_freq() into
> >   =

> >     abstract_cpu::calculate_freq()
> >   =

> >   Deduplication: merge go_idle()/go_unidle()/change_freq() overrides
> >   =

> >     into abstract_cpu() class
> >   =

> >   Ignore non-P-state-enabled CPUs when calculating frequency.
> >  =

> >  src/cpu/abstract_cpu.cpp |  69 ++++++++++--
> >  src/cpu/cpu.cpp          |   1 +
> >  src/cpu/cpu.h            |  29 ++----
> >  src/cpu/cpu_core.cpp     |  97 -----------------
> >  src/cpu/cpu_linux.cpp    |  98 ------------------
> >  src/cpu/cpu_package.cpp  | 102 ++----------------
> >  src/cpu/intel_cpus.cpp   | 265
> >  +---------------------------------------------- src/cpu/intel_cpus.h  =
  =

> >  |  23 +---
> >  src/cpu/intel_gpu.cpp    |   2 +-
> >  src/lib.cpp              |   9 ++
> >  src/lib.h                |   1 +
> >  11 files changed, 94 insertions(+), 602 deletions(-)
> > =

> > --
> > 1.8.0
> > =

> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
-- =

=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=A8=D0=B0=D0=BF=D0=BE=D0=B2=D0=B0=D0=BB=D0=BE=D0=B2 =D0=98=D0=B2=D0=B0=
=D0=BD.

--===============2999462682967121072==--

