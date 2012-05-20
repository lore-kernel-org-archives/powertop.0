Content-Type: multipart/mixed; boundary="===============2861211928677778968=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Mon, 21 May 2012 01:17:20 +0300
Message-ID: <20120520221720.GC3585@swordfish>
In-Reply-To: 1337542376.55788.YahooMailNeo@web160303.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2861211928677778968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/20/12 12:32), Rui DaCosta wrote:
> =

>    it was pointed out to me that=C2=A0 CONFIG_PERF_COUNTERS has been supe=
rseded by
>    PERF_EVENTS since 2.6.32 =C2=A0- see bottom section of
>    http://cateee.net/lkddb/web-lkddb/PERF_COUNTERS.html
>    so is=C2=A0 CONFIG_PERF_COUNTERS really required?
> =


Could you please try the following patch?

---

 src/perf/perf.cpp |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index ce9ae6a..09ca390 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -48,6 +48,9 @@
 #ifdef __alpha__
 #include <asm-generic/unistd.h>
 #endif
+#ifdef __arm__
+#include <asm-generic/unistd.h>
+#endif
 =

 #include "perf.h"
 #include "../lib.h"


--===============2861211928677778968==--

