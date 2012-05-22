Content-Type: multipart/mixed; boundary="===============1741610702330772604=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Tue, 22 May 2012 15:08:14 -0700
Message-ID: <1337724494.90372.YahooMailNeo@web160304.mail.bf1.yahoo.com>
In-Reply-To: 20120522212343.GA1215@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1741610702330772604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

running:
find / -name unistd.h | xargs /bin/grep __NR_perf_event_open

resulted in output of:

/usr/include/asm/unistd.h:#define __NR_perf_event_open          (__NR_SYSCA=
LL_BASE+364)
/usr/include/asm-generic/unistd.h:#define __NR_perf_event_open 241
/usr/include/asm-generic/unistd.h:__SYSCALL(__NR_perf_event_open, sys_perf_=
event_open)
/usr/src/linux-3.1.10-11-ARCH/include/asm-generic/unistd.h:#define __NR_per=
f_event_open 241
/usr/src/linux-3.1.10-11-ARCH/include/asm-generic/unistd.h:__SYSCALL(__NR_p=
erf_event_open, sys_perf_event_open)
/usr/src/linux-3.1.10-11-ARCH/arch/arm/include/asm/unistd.h:#define __NR_pe=
rf_event_open                (__NR_SYSCALL_BASE+364)


HTH

Rui



________________________________
 From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
To: Rui DaCosta <ruidc(a)yahoo.com> =

Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron <chris.e.ferro=
n(a)linux.intel.com>; "powertop(a)lists.01.org" <powertop(a)lists.01.org> =

Sent: Tuesday, 22 May 2012, 23:23
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =

On (05/22/12 12:35), Rui DaCosta wrote:
> =

>=C2=A0 =C2=A0 thanks, same result:
>=C2=A0 =C2=A0 PowerTOP v2.0 needs the kernel to support the 'perf' subsyst=
em
>=C2=A0 =C2=A0 as well as support for trace points in the kernel:
> =

>=C2=A0 =C2=A0 CONFIG_PERF_EVENTS=3Dy
>=C2=A0 =C2=A0 CONFIG_PERF_COUNTERS=3Dy
>=C2=A0 =C2=A0 CONFIG_TRACEPOINTS=3Dy
>=C2=A0 =C2=A0 CONFIG_TRACING=3Dy
>
>

Hm...
Could you please tell the number of '__NR_perf_event_open' syscall in your
unistd.h?


=C2=A0=C2=A0=C2=A0 -ss


>=C2=A0 =C2=A0 Regards,
>=C2=A0 =C2=A0 Rui
> =

>=C2=A0 =C2=A0 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80
> =

>=C2=A0 =C2=A0 From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>=C2=A0 =C2=A0 To: Rui DaCosta <ruidc(a)yahoo.com>
>=C2=A0 =C2=A0 Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron
>=C2=A0 =C2=A0 <chris.e.ferron(a)linux.intel.com>; "powertop(a)lists.01.org"
>=C2=A0 =C2=A0 <powertop(a)lists.01.org>
>=C2=A0 =C2=A0 Sent: Monday, 21 May 2012, 0:17
>=C2=A0 =C2=A0 Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
>=C2=A0 =C2=A0 On (05/20/12 12:32), Rui DaCosta wrote:
>=C2=A0 =C2=A0 >
>=C2=A0 =C2=A0 >=C2=A0 =C2=A0 it was pointed out to me that=C2=A0 CONFIG_PE=
RF_COUNTERS has been
>=C2=A0 =C2=A0 superseded by
>=C2=A0 =C2=A0 >=C2=A0 =C2=A0 PERF_EVENTS since 2.6.32 =C2=A0- see bottom s=
ection of
>=C2=A0 =C2=A0 >=C2=A0 =C2=A0 [1]http://cateee.net/lkddb/web-lkddb/PERF_COU=
NTERS.html
>=C2=A0 =C2=A0 >=C2=A0 =C2=A0 so is=C2=A0 CONFIG_PERF_COUNTERS really requi=
red?
>=C2=A0 =C2=A0 >
> =

>=C2=A0 =C2=A0 Could you please try the following patch?
> =

>=C2=A0 =C2=A0 ---
> =

>=C2=A0 =C2=A0 src/perf/perf.cpp |=C2=A0 =C2=A0 3 +++
>=C2=A0 =C2=A0 1 file changed, 3 insertions(+)
> =

>=C2=A0 =C2=A0 diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
>=C2=A0 =C2=A0 index ce9ae6a..09ca390 100644
>=C2=A0 =C2=A0 --- a/src/perf/perf.cpp
>=C2=A0 =C2=A0 +++ b/src/perf/perf.cpp
>=C2=A0 =C2=A0 @@ -48,6 +48,9 @@
>=C2=A0 =C2=A0 #ifdef __alpha__
>=C2=A0 =C2=A0 #include <asm-generic/unistd.h>
>=C2=A0 =C2=A0 #endif
>=C2=A0 =C2=A0 +#ifdef __arm__
>=C2=A0 =C2=A0 +#include <asm-generic/unistd.h>
>=C2=A0 =C2=A0 +#endif
> =

>=C2=A0 =C2=A0 #include "perf.h"
>=C2=A0 =C2=A0 #include "../lib.h"
> =

> References
> =

>=C2=A0 =C2=A0 Visible links
>=C2=A0 =C2=A0 1. http://cateee.net/lkddb/web-lkddb/PERF_COUNTERS.html

--===============1741610702330772604==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+cnVubmluZzo8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5m
aW5kIC8gLW5hbWUgdW5pc3RkLmggfCB4YXJncyAvYmluL2dyZXAgX19OUl9wZXJmX2V2ZW50X29w
ZW48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+cmVz
dWx0ZWQgaW4gb3V0cHV0IG9mOjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPjxicj4vdXNyL2luY2x1
ZGUvYXNtL3VuaXN0ZC5oOiNkZWZpbmUgX19OUl9wZXJmX2V2ZW50X29wZW4gICAgICAgICAgKF9f
TlJfU1lTQ0FMTF9CQVNFKzM2NCk8YnI+L3Vzci9pbmNsdWRlL2FzbS1nZW5lcmljL3VuaXN0ZC5o
OiNkZWZpbmUgX19OUl9wZXJmX2V2ZW50X29wZW4gMjQxPGJyPi91c3IvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy91bmlzdGQuaDpfX1NZU0NBTEwoX19OUl9wZXJmX2V2ZW50X29wZW4sIHN5c19wZXJmX2V2
ZW50X29wZW4pPGJyPi91c3Ivc3JjL2xpbnV4LTMuMS4xMC0xMS1BUkNIL2luY2x1ZGUvYXNtLWdl
bmVyaWMvdW5pc3RkLmg6I2RlZmluZSBfX05SX3BlcmZfZXZlbnRfb3BlbiAyNDE8YnI+L3Vzci9z
cmMvbGludXgtMy4xLjEwLTExLUFSQ0gvaW5jbHVkZS9hc20tZ2VuZXJpYy91bmlzdGQuaDpfX1NZ
U0NBTEwoX19OUl9wZXJmX2V2ZW50X29wZW4sIHN5c19wZXJmX2V2ZW50X29wZW4pPGJyPi91c3Iv
c3JjL2xpbnV4LTMuMS4xMC0xMS1BUkNIL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3VuaXN0ZC5oOiNk
ZWZpbmUgX19OUl9wZXJmX2V2ZW50X29wZW4gICAgICAgICAgICAgICAKIChfX05SX1NZU0NBTExf
QkFTRSszNjQpPGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPkhUSDxicj48L3NwYW4+PC9kaXY+
PGRpdj48c3Bhbj5SdWk8YnI+PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PiAgPGRpdiBzdHls
ZT0iZm9udC1zaXplOiAxMnB0OyBmb250LWZhbWlseTogJnF1b3Q7dGltZXMgbmV3IHJvbWFuJnF1
b3Q7LCAmcXVvdDtuZXcgeW9yayZxdW90OywgJnF1b3Q7dGltZXMmcXVvdDssIHNlcmlmIj4gPGRp
diBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyBmb250LWZhbWlseTogJnF1b3Q7dGltZXMgbmV3IHJv
bWFuJnF1b3Q7LCAmcXVvdDtuZXcgeW9yayZxdW90OywgJnF1b3Q7dGltZXMmcXVvdDssIHNlcmlm
Ij4gPGRpdiBkaXI9Imx0ciI+IDxmb250IHNpemU9IjIiIGZhY2U9IkFyaWFsIj4gPGhyIHNpemU9
IjEiPiAgPGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OmJvbGQ7Ij5Gcm9tOjwvc3Bhbj48L2I+
IFNlcmdleSBTZW5vemhhdHNreSAmbHQ7c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbSZndDs8
YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlRvOjwvc3Bhbj48L2I+IFJ1
aSBEYUNvc3RhICZsdDtydWlkY0B5YWhvby5jb20mZ3Q7IDxicj48Yj48c3BhbiBzdHlsZT0iZm9u
dC13ZWlnaHQ6IGJvbGQ7Ij5DYzo8L3NwYW4+PC9iPiBBcmphbiB2YW4gZGUgVmVuICZsdDthcmph
bkBsaW51eC5pbnRlbC5jb20mZ3Q7OyBDaHJpcyBGZXJyb24gJmx0O2NocmlzLmUuZmVycm9uQGxp
bnV4LmludGVsLmNvbSZndDs7ICJwb3dlcnRvcEBsaXN0cy4wMS5vcmciICZsdDtwb3dlcnRvcEBs
aXN0cy4wMS5vcmcmZ3Q7IDxicj4gPGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyI+
U2VudDo8L3NwYW4+PC9iPiBUdWVzZGF5LCAyMiBNYXkgMjAxMiwgMjM6MjM8YnI+IDxiPjxzcGFu
IHN0eWxlPSJmb250LXdlaWdodDoKIGJvbGQ7Ij5TdWJqZWN0Ojwvc3Bhbj48L2I+IFJlOiBbUG93
ZXJ0b3BdIHNlZ2ZhdWx0IG9uIFNoZWV2YXBsdWcgKEFSTSBLaXJrd29vZCk8YnI+IDwvZm9udD4g
PC9kaXY+IDxicj5PbiAoMDUvMjIvMTIgMTI6MzUpLCBSdWkgRGFDb3N0YSB3cm90ZTo8YnI+Jmd0
OyA8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgdGhhbmtzLCBzYW1lIHJlc3VsdDo8YnI+Jmd0OyZuYnNw
OyAmbmJzcDsgUG93ZXJUT1AgdjIuMCBuZWVkcyB0aGUga2VybmVsIHRvIHN1cHBvcnQgdGhlICdw
ZXJmJyBzdWJzeXN0ZW08YnI+Jmd0OyZuYnNwOyAmbmJzcDsgYXMgd2VsbCBhcyBzdXBwb3J0IGZv
ciB0cmFjZSBwb2ludHMgaW4gdGhlIGtlcm5lbDo8YnI+Jmd0OyA8YnI+Jmd0OyZuYnNwOyAmbmJz
cDsgQ09ORklHX1BFUkZfRVZFTlRTPXk8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgQ09ORklHX1BFUkZf
Q09VTlRFUlM9eTxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyBDT05GSUdfVFJBQ0VQT0lOVFM9eTxicj4m
Z3Q7Jm5ic3A7ICZuYnNwOyBDT05GSUdfVFJBQ0lORz15PGJyPiZndDs8YnI+Jmd0Ozxicj48YnI+
SG0uLi48YnI+Q291bGQgeW91IHBsZWFzZSB0ZWxsIHRoZSBudW1iZXIgb2YgJ19fTlJfcGVyZl9l
dmVudF9vcGVuJyBzeXNjYWxsIGluIHlvdXI8YnI+dW5pc3RkLmg/PGJyPjxicj48YnI+Jm5ic3A7
Jm5ic3A7Jm5ic3A7IC1zczxicj48YnI+PGJyPiZndDsmbmJzcDsgJm5ic3A7IFJlZ2FyZHMsPGJy
PiZndDsmbmJzcDsgJm5ic3A7IFJ1aTxicj4mZ3Q7IDxicj4mZ3Q7Jm5ic3A7ICZuYnNwOwog4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSAPGJyPiZndDsg
PGJyPiZndDsmbmJzcDsgJm5ic3A7IEZyb206IFNlcmdleSBTZW5vemhhdHNreSAmbHQ7PGEgeW1h
aWx0bz0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20iIGhyZWY9Im1haWx0bzpz
ZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29t
PC9hPiZndDs8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgVG86IFJ1aSBEYUNvc3RhICZsdDs8YSB5bWFp
bHRvPSJtYWlsdG86cnVpZGNAeWFob28uY29tIiBocmVmPSJtYWlsdG86cnVpZGNAeWFob28uY29t
Ij5ydWlkY0B5YWhvby5jb208L2E+Jmd0Ozxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyBDYzogQXJqYW4g
dmFuIGRlIFZlbiAmbHQ7PGEgeW1haWx0bz0ibWFpbHRvOmFyamFuQGxpbnV4LmludGVsLmNvbSIg
aHJlZj0ibWFpbHRvOmFyamFuQGxpbnV4LmludGVsLmNvbSI+YXJqYW5AbGludXguaW50ZWwuY29t
PC9hPiZndDs7IENocmlzIEZlcnJvbjxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmbHQ7PGEgeW1haWx0
bz0ibWFpbHRvOmNocmlzLmUuZmVycm9uQGxpbnV4LmludGVsLmNvbSIgaHJlZj0ibWFpbHRvOmNo
cmlzLmUuZmVycm9uQGxpbnV4LmludGVsLmNvbSI+Y2hyaXMuZS5mZXJyb25AbGludXguaW50ZWwu
Y29tPC9hPiZndDs7ICI8YSB5bWFpbHRvPSJtYWlsdG86cG93ZXJ0b3BAbGlzdHMuMDEub3JnIgog
aHJlZj0ibWFpbHRvOnBvd2VydG9wQGxpc3RzLjAxLm9yZyI+cG93ZXJ0b3BAbGlzdHMuMDEub3Jn
PC9hPiI8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgJmx0OzxhIHltYWlsdG89Im1haWx0bzpwb3dlcnRv
cEBsaXN0cy4wMS5vcmciIGhyZWY9Im1haWx0bzpwb3dlcnRvcEBsaXN0cy4wMS5vcmciPnBvd2Vy
dG9wQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPiZndDsmbmJzcDsgJm5ic3A7IFNlbnQ6IE1vbmRh
eSwgMjEgTWF5IDIwMTIsIDA6MTc8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgU3ViamVjdDogUmU6IFtQ
b3dlcnRvcF0gc2VnZmF1bHQgb24gU2hlZXZhcGx1ZyAoQVJNIEtpcmt3b29kKTxicj4mZ3Q7Jm5i
c3A7ICZuYnNwOyBPbiAoMDUvMjAvMTIgMTI6MzIpLCBSdWkgRGFDb3N0YSB3cm90ZTo8YnI+Jmd0
OyZuYnNwOyAmbmJzcDsgJmd0Ozxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmZ3Q7Jm5ic3A7ICZuYnNw
OyBpdCB3YXMgcG9pbnRlZCBvdXQgdG8gbWUgdGhhdCZuYnNwOyBDT05GSUdfUEVSRl9DT1VOVEVS
UyBoYXMgYmVlbjxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyBzdXBlcnNlZGVkIGJ5PGJyPiZndDsmbmJz
cDsgJm5ic3A7ICZndDsmbmJzcDsgJm5ic3A7IFBFUkZfRVZFTlRTIHNpbmNlIDIuNi4zMiAmbmJz
cDstIHNlZSBib3R0b20gc2VjdGlvbiBvZjxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmZ3Q7Jm5ic3A7
ICZuYnNwOyBbMV08YSBocmVmPSJodHRwOi8vY2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIvUEVS
Rl9DT1VOVEVSUy5odG1sIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2NhdGVlZS5uZXQvbGtkZGIv
d2ViLWxrZGRiL1BFUkZfQ09VTlRFUlMuaHRtbDwvYT48YnI+Jmd0OyZuYnNwOyAmbmJzcDsgJmd0
OyZuYnNwOyAmbmJzcDsgc28gaXMmbmJzcDsgQ09ORklHX1BFUkZfQ09VTlRFUlMgcmVhbGx5IHJl
cXVpcmVkPzxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAmZ3Q7PGJyPiZndDsKIDxicj4mZ3Q7Jm5ic3A7
ICZuYnNwOyBDb3VsZCB5b3UgcGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIHBhdGNoPzxicj4mZ3Q7
IDxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAtLS08YnI+Jmd0OyA8YnI+Jmd0OyZuYnNwOyAmbmJzcDsg
c3JjL3BlcmYvcGVyZi5jcHAgfCZuYnNwOyAmbmJzcDsgMyArKys8YnI+Jmd0OyZuYnNwOyAmbmJz
cDsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKTxicj4mZ3Q7IDxicj4mZ3Q7Jm5ic3A7
ICZuYnNwOyBkaWZmIC0tZ2l0IGEvc3JjL3BlcmYvcGVyZi5jcHAgYi9zcmMvcGVyZi9wZXJmLmNw
cDxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyBpbmRleCBjZTlhZTZhLi4wOWNhMzkwIDEwMDY0NDxicj4m
Z3Q7Jm5ic3A7ICZuYnNwOyAtLS0gYS9zcmMvcGVyZi9wZXJmLmNwcDxicj4mZ3Q7Jm5ic3A7ICZu
YnNwOyArKysgYi9zcmMvcGVyZi9wZXJmLmNwcDxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyBAQCAtNDgs
NiArNDgsOSBAQDxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyAjaWZkZWYgX19hbHBoYV9fPGJyPiZndDsm
bmJzcDsgJm5ic3A7ICNpbmNsdWRlICZsdDthc20tZ2VuZXJpYy91bmlzdGQuaCZndDs8YnI+Jmd0
OyZuYnNwOyAmbmJzcDsgI2VuZGlmPGJyPiZndDsmbmJzcDsgJm5ic3A7ICsjaWZkZWYgX19hcm1f
Xzxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyArI2luY2x1ZGUgJmx0O2FzbS1nZW5lcmljL3VuaXN0ZC5o
Jmd0Ozxicj4mZ3Q7Jm5ic3A7ICZuYnNwOyArI2VuZGlmPGJyPiZndDsgPGJyPiZndDsmbmJzcDsg
Jm5ic3A7ICNpbmNsdWRlICJwZXJmLmgiPGJyPiZndDsmbmJzcDsgJm5ic3A7ICNpbmNsdWRlICIu
Li9saWIuaCI8YnI+Jmd0OyA8YnI+Jmd0OyBSZWZlcmVuY2VzPGJyPiZndDsgPGJyPiZndDsmbmJz
cDsgJm5ic3A7IFZpc2libGUgbGlua3M8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgMS4gPGEKIGhyZWY9
Imh0dHA6Ly9jYXRlZWUubmV0L2xrZGRiL3dlYi1sa2RkYi9QRVJGX0NPVU5URVJTLmh0bWwiIHRh
cmdldD0iX2JsYW5rIj5odHRwOi8vY2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIvUEVSRl9DT1VO
VEVSUy5odG1sPC9hPjxicj48YnI+PGJyPiA8L2Rpdj4gPC9kaXY+ICA8L2Rpdj48L2JvZHk+PC9o
dG1sPg==
--===============1741610702330772604==--

