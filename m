Content-Type: multipart/mixed; boundary="===============0011579936321607577=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: Re: [Powertop] [RFC] [PATCH 01/11] Fix includes: do not include
 intel_cpus.h inside cpu.h
Date: Mon, 05 Nov 2012 15:26:50 +0400
Message-ID: <1748183.YgtRxh8Mka@intelfx-laptop>
In-Reply-To: 20121105111625.GD3123@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0011579936321607577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05 Nov 2012 14:16:25 Sergey Senozhatsky wrote:
> On (11/05/12 15:12), Ivan Shapovalov wrote:
> > The file "cpu.h" is generic (unlike "intel_cpus.h"), so the existing or=
der
> > seems illogical.
> >
> >Also it broke KDevelop's code completion.
> =

> just a side note. no offense, but are you gonna fix every product kdevelop
> fails to parse instead of fixing just kdevelop?

It's a big architectural WIP there (on kdevelop).

- Ivan

> =

> =

> 	-ss
> =

> > Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
> > ---
> > =

> >  src/cpu/cpu.cpp        | 1 +
> >  src/cpu/cpu.h          | 2 --
> >  src/cpu/intel_cpus.cpp | 2 +-
> >  src/cpu/intel_cpus.h   | 2 ++
> >  src/cpu/intel_gpu.cpp  | 2 +-
> >  5 files changed, 5 insertions(+), 4 deletions(-)
> > =

> > diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> > index 7f3af69..3314e82 100644
> > --- a/src/cpu/cpu.cpp
> > +++ b/src/cpu/cpu.cpp
> > @@ -31,6 +31,7 @@
> > =

> >  #include <unistd.h>
> >  #include "cpu.h"
> >  #include "cpudevice.h"
> > =

> > +#include "intel_cpus.h"
> > =

> >  #include "../parameters/parameters.h"
> >  =

> >  #include "../perf/perf_bundle.h"
> > =

> > diff --git a/src/cpu/cpu.h b/src/cpu/cpu.h
> > index 4480b11..a9f258a 100644
> > --- a/src/cpu/cpu.h
> > +++ b/src/cpu/cpu.h
> > =

> > @@ -210,8 +210,6 @@ public:
> >  };
> > =

> > -#include "intel_cpus.h"
> > -
> > =

> >  extern void enumerate_cpus(void);
> >  =

> >  extern void report_display_cpu_pstates(void);
> > =

> > diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> > index 24465a0..a5684aa 100644
> > --- a/src/cpu/intel_cpus.cpp
> > +++ b/src/cpu/intel_cpus.cpp
> > @@ -22,7 +22,7 @@
> > =

> >   * Authors:
> >   *	Arjan van de Ven <arjan(a)linux.intel.com>
> >   */
> > =

> > -#include "cpu.h"
> > +#include "intel_cpus.h"
> > =

> >  #include <iostream>
> >  #include <fstream>
> >  #include <stdlib.h>
> > =

> > diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> > index 1949af1..a8bb892 100644
> > --- a/src/cpu/intel_cpus.h
> > +++ b/src/cpu/intel_cpus.h
> > @@ -25,6 +25,8 @@
> > =

> >  #include <stdint.h>
> >  #include <sys/time.h>
> > =

> > +#include "cpu.h"
> > +
> > =

> >  #define MSR_TSC				0x10
> >  #define MSR_NEHALEM_PLATFORM_INFO	0xCE
> > =

> > diff --git a/src/cpu/intel_gpu.cpp b/src/cpu/intel_gpu.cpp
> > index 57474f1..e0f4ac2 100644
> > --- a/src/cpu/intel_gpu.cpp
> > +++ b/src/cpu/intel_gpu.cpp
> > @@ -22,7 +22,7 @@
> > =

> >   * Authors:
> >   *	Arjan van de Ven <arjan(a)linux.intel.com>
> >   */
> > =

> > -#include "cpu.h"
> > +#include "intel_cpus.h"
> > =

> >  #include <iostream>
> >  #include <fstream>
> >  #include <stdlib.h>

--===============0011579936321607577==--

