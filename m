Content-Type: multipart/mixed; boundary="===============5244717814499129877=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Wed, 23 May 2012 00:23:43 +0300
Message-ID: <20120522212343.GA1215@swordfish>
In-Reply-To: 1337715350.2334.YahooMailNeo@web160306.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5244717814499129877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/22/12 12:35), Rui DaCosta wrote:
> =

>    thanks, same result:
>    PowerTOP v2.0 needs the kernel to support the 'perf' subsystem
>    as well as support for trace points in the kernel:
> =

>    CONFIG_PERF_EVENTS=3Dy
>    CONFIG_PERF_COUNTERS=3Dy
>    CONFIG_TRACEPOINTS=3Dy
>    CONFIG_TRACING=3Dy
>
>

Hm...
Could you please tell the number of '__NR_perf_event_open' syscall in your
unistd.h?


	-ss


>    Regards,
>    Rui
> =

>    =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> =

>    From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>    To: Rui DaCosta <ruidc(a)yahoo.com>
>    Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron
>    <chris.e.ferron(a)linux.intel.com>; "powertop(a)lists.01.org"
>    <powertop(a)lists.01.org>
>    Sent: Monday, 21 May 2012, 0:17
>    Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
>    On (05/20/12 12:32), Rui DaCosta wrote:
>    >
>    >=C2=A0 =C2=A0 it was pointed out to me that=C2=A0 CONFIG_PERF_COUNTER=
S has been
>    superseded by
>    >=C2=A0 =C2=A0 PERF_EVENTS since 2.6.32 =C2=A0- see bottom section of
>    >=C2=A0 =C2=A0 [1]http://cateee.net/lkddb/web-lkddb/PERF_COUNTERS.html
>    >=C2=A0 =C2=A0 so is=C2=A0 CONFIG_PERF_COUNTERS really required?
>    >
> =

>    Could you please try the following patch?
> =

>    ---
> =

>    src/perf/perf.cpp |=C2=A0 =C2=A0 3 +++
>    1 file changed, 3 insertions(+)
> =

>    diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
>    index ce9ae6a..09ca390 100644
>    --- a/src/perf/perf.cpp
>    +++ b/src/perf/perf.cpp
>    @@ -48,6 +48,9 @@
>    #ifdef __alpha__
>    #include <asm-generic/unistd.h>
>    #endif
>    +#ifdef __arm__
>    +#include <asm-generic/unistd.h>
>    +#endif
> =

>    #include "perf.h"
>    #include "../lib.h"
> =

> References
> =

>    Visible links
>    1. http://cateee.net/lkddb/web-lkddb/PERF_COUNTERS.html

--===============5244717814499129877==--

