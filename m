Content-Type: multipart/mixed; boundary="===============7939731988467425998=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Tue, 22 May 2012 12:35:50 -0700
Message-ID: <1337715350.2334.YahooMailNeo@web160306.mail.bf1.yahoo.com>
In-Reply-To: 20120520221720.GC3585@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7939731988467425998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks, same result:


PowerTOP v2.0 needs the kernel to support the 'perf' subsystem
as well as support for trace points in the kernel:

CONFIG_PERF_EVENTS=3Dy =

CONFIG_PERF_COUNTERS=3Dy
CONFIG_TRACEPOINTS=3Dy
CONFIG_TRACING=3Dy


Regards,

Rui



________________________________
 From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
To: Rui DaCosta <ruidc(a)yahoo.com> =

Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron <chris.e.ferro=
n(a)linux.intel.com>; "powertop(a)lists.01.org" <powertop(a)lists.01.org> =

Sent: Monday, 21 May 2012, 0:17
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =

On (05/20/12 12:32), Rui DaCosta wrote:
> =

>=C2=A0 =C2=A0 it was pointed out to me that=C2=A0 CONFIG_PERF_COUNTERS has=
 been superseded by
>=C2=A0 =C2=A0 PERF_EVENTS since 2.6.32 =C2=A0- see bottom section of
>=C2=A0 =C2=A0 http://cateee.net/lkddb/web-lkddb/PERF_COUNTERS.html
>=C2=A0 =C2=A0 so is=C2=A0 CONFIG_PERF_COUNTERS really required?
> =


Could you please try the following patch?

---

src/perf/perf.cpp |=C2=A0 =C2=A0 3 +++
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

#include "perf.h"
#include "../lib.h"

--===============7939731988467425998==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+dGhhbmtzLCBzYW1lIHJlc3VsdDo8L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+UG93ZXJUT1AgdjIuMCBuZWVk
cyB0aGUga2VybmVsIHRvIHN1cHBvcnQgdGhlICdwZXJmJyBzdWJzeXN0ZW08YnI+YXMgd2VsbCBh
cyBzdXBwb3J0IGZvciB0cmFjZSBwb2ludHMgaW4gdGhlIGtlcm5lbDo8YnI+PGJyPkNPTkZJR19Q
RVJGX0VWRU5UUz15IDxicj5DT05GSUdfUEVSRl9DT1VOVEVSUz15PGJyPkNPTkZJR19UUkFDRVBP
SU5UUz15PGJyPkNPTkZJR19UUkFDSU5HPXk8YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PGJy
Pjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlJlZ2FyZHMsPGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPlJ1aTxicj48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+ICA8ZGl2IHN0eWxlPSJmb250
LXNpemU6IDEycHQ7IGZvbnQtZmFtaWx5OiAmcXVvdDt0aW1lcyBuZXcgcm9tYW4mcXVvdDssICZx
dW90O25ldyB5b3JrJnF1b3Q7LCAmcXVvdDt0aW1lcyZxdW90Oywgc2VyaWYiPiA8ZGl2IHN0eWxl
PSJmb250LXNpemU6IDEycHQ7IGZvbnQtZmFtaWx5OiAmcXVvdDt0aW1lcyBuZXcgcm9tYW4mcXVv
dDssICZxdW90O25ldyB5b3JrJnF1b3Q7LCAmcXVvdDt0aW1lcyZxdW90Oywgc2VyaWYiPiA8ZGl2
IGRpcj0ibHRyIj4gPGZvbnQgc2l6ZT0iMiIgZmFjZT0iQXJpYWwiPiA8aHIgc2l6ZT0iMSI+ICA8
Yj48c3BhbiBzdHlsZT0iZm9udC13ZWlnaHQ6Ym9sZDsiPkZyb206PC9zcGFuPjwvYj4gU2VyZ2V5
IFNlbm96aGF0c2t5ICZsdDtzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tJmd0Ozxicj4KIDxi
PjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlRvOjwvc3Bhbj48L2I+IFJ1aSBEYUNv
c3RhICZsdDtydWlkY0B5YWhvby5jb20mZ3Q7IDxicj48Yj48c3BhbiBzdHlsZT0iZm9udC13ZWln
aHQ6IGJvbGQ7Ij5DYzo8L3NwYW4+PC9iPiBBcmphbiB2YW4gZGUgVmVuICZsdDthcmphbkBsaW51
eC5pbnRlbC5jb20mZ3Q7OyBDaHJpcyBGZXJyb24gJmx0O2NocmlzLmUuZmVycm9uQGxpbnV4Lmlu
dGVsLmNvbSZndDs7ICJwb3dlcnRvcEBsaXN0cy4wMS5vcmciICZsdDtwb3dlcnRvcEBsaXN0cy4w
MS5vcmcmZ3Q7IDxicj4gPGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyI+U2VudDo8
L3NwYW4+PC9iPiBNb25kYXksIDIxIE1heSAyMDEyLCAwOjE3PGJyPiA8Yj48c3BhbiBzdHlsZT0i
Zm9udC13ZWlnaHQ6IGJvbGQ7Ij5TdWJqZWN0Ojwvc3Bhbj48L2I+IFJlOiBbUG93ZXJ0b3BdIHNl
Z2ZhdWx0IG9uIFNoZWV2YXBsdWcgKEFSTSBLaXJrd29vZCk8YnI+IDwvZm9udD4gPC9kaXY+IDxi
cj5PbiAoMDUvMjAvMTIgMTI6MzIpLCBSdWkgRGFDb3N0YSB3cm90ZTo8YnI+Jmd0OyA8YnI+Jmd0
OyZuYnNwOyAmbmJzcDsgaXQgd2FzIHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQmbmJzcDsgQ09ORklH
X1BFUkZfQ09VTlRFUlMgaGFzIGJlZW4gc3VwZXJzZWRlZCBieTxicj4mZ3Q7Jm5ic3A7ICZuYnNw
OyBQRVJGX0VWRU5UUyBzaW5jZSAyLjYuMzIgJm5ic3A7LSBzZWUgYm90dG9tIHNlY3Rpb24gb2Y8
YnI+Jmd0OyZuYnNwOyAmbmJzcDsgPGEgaHJlZj0iaHR0cDovL2NhdGVlZS5uZXQvbGtkZGIvd2Vi
LWxrZGRiL1BFUkZfQ09VTlRFUlMuaHRtbCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9jYXRlZWUu
bmV0L2xrZGRiL3dlYi1sa2RkYi9QRVJGX0NPVU5URVJTLmh0bWw8L2E+PGJyPiZndDsmbmJzcDsg
Jm5ic3A7IHNvIGlzJm5ic3A7IENPTkZJR19QRVJGX0NPVU5URVJTIHJlYWxseQogcmVxdWlyZWQ/
PGJyPiZndDsgPGJyPjxicj5Db3VsZCB5b3UgcGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIHBhdGNo
Pzxicj48YnI+LS0tPGJyPjxicj4gc3JjL3BlcmYvcGVyZi5jcHAgfCZuYnNwOyAmbmJzcDsgMyAr
Kys8YnI+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyk8YnI+PGJyPmRpZmYgLS1naXQg
YS9zcmMvcGVyZi9wZXJmLmNwcCBiL3NyYy9wZXJmL3BlcmYuY3BwPGJyPmluZGV4IGNlOWFlNmEu
LjA5Y2EzOTAgMTAwNjQ0PGJyPi0tLSBhL3NyYy9wZXJmL3BlcmYuY3BwPGJyPisrKyBiL3NyYy9w
ZXJmL3BlcmYuY3BwPGJyPkBAIC00OCw2ICs0OCw5IEBAPGJyPiAjaWZkZWYgX19hbHBoYV9fPGJy
PiAjaW5jbHVkZSAmbHQ7YXNtLWdlbmVyaWMvdW5pc3RkLmgmZ3Q7PGJyPiAjZW5kaWY8YnI+KyNp
ZmRlZiBfX2FybV9fPGJyPisjaW5jbHVkZSAmbHQ7YXNtLWdlbmVyaWMvdW5pc3RkLmgmZ3Q7PGJy
PisjZW5kaWY8YnI+IDxicj4gI2luY2x1ZGUgInBlcmYuaCI8YnI+ICNpbmNsdWRlICIuLi9saWIu
aCI8YnI+PGJyPjxicj48YnI+IDwvZGl2PiA8L2Rpdj4gIDwvZGl2PjwvYm9keT48L2h0bWw+
--===============7939731988467425998==--

