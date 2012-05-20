Content-Type: multipart/mixed; boundary="===============1150485032944036282=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 04:01:58 -0700
Message-ID: <1337511718.10611.YahooMailNeo@web160306.mail.bf1.yahoo.com>
In-Reply-To: 20120520093441.GB3515@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1150485032944036282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks,

this has gotten past the issue. I now get:


PowerTOP v2.0 needs the kernel to support the 'perf' subsystem
as well as support for trace points in the kernel:

CONFIG_PERF_EVENTS=3Dy =

CONFIG_PERF_COUNTERS=3Dy
CONFIG_TRACEPOINTS=3Dy
CONFIG_TRACING=3Dy

all these except CONFIG_PERF_COUNTERS are already set, so i'll need to see =
if i can get a kernel built with that option on.

Will this patch make it into trunk?

Many thanks.


________________________________
 From: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
To: Rui DaCosta <ruidc(a)yahoo.com> =

Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron <chris.e.ferro=
n(a)linux.intel.com>; powertop(a)lists.01.org =

Sent: Sunday, 20 May 2012, 11:34
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =

On (05/20/12 02:19), Rui DaCosta wrote:
> Sure and thanks,
> (v1.13 worked fine btw)
> Processor=C2=A0=C2=A0=C2=A0 : Feroceon 88FR131 rev 1 (v5l)
> BogoMIPS=C2=A0=C2=A0=C2=A0 : 1191.11
> Features=C2=A0=C2=A0=C2=A0 : swp half thumb fastmult edsp =

> CPU implementer=C2=A0=C2=A0=C2=A0 : 0x56
> CPU architecture: 5TE
> CPU variant=C2=A0=C2=A0=C2=A0 : 0x2
> CPU part=C2=A0=C2=A0=C2=A0 : 0x131
> CPU revision=C2=A0=C2=A0=C2=A0 : 1
> =

> Hardware=C2=A0=C2=A0=C2=A0 : Marvell SheevaPlug Reference Board
> Revision=C2=A0=C2=A0=C2=A0 : 0000
> Serial=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 0000000000000000
> =

> =


Thanks,

Well, that's the problem. Current cpu info parser doesn't understand your
cpuinfo format. It awaits for sane values on special places. For example, w=
ord =

"processor" should be followed by a number, not model name.

=C2=A0=C2=A0=C2=A0 processor=C2=A0=C2=A0=C2=A0 : 2
=C2=A0=C2=A0=C2=A0 vendor_id=C2=A0=C2=A0=C2=A0 : GenuineIntel
=C2=A0=C2=A0=C2=A0 cpu family=C2=A0=C2=A0=C2=A0 : 6
=C2=A0=C2=A0=C2=A0 model=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 37
=C2=A0=C2=A0=C2=A0 bogomips=C2=A0=C2=A0=C2=A0 : 4522.66

while cpuinfo on your system is totally different.

the following is untested patch (I'm a bit skeptical) plus I don't have =

ARM device for testing.

---

src/cpu/cpu.cpp |=C2=A0  26 ++++++++++++++------------
1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 09d4a2d..143e18c 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -225,7 +225,7 @@ void enumerate_cpus(void)
=C2=A0=C2=A0=C2=A0 ifstream file;
=C2=A0=C2=A0=C2=A0 char line[1024];

-=C2=A0=C2=A0=C2=A0 int number =3D -1;
+=C2=A0=C2=A0=C2=A0 int number =3D 1;
=C2=A0=C2=A0=C2=A0 char vendor[128];
=C2=A0=C2=A0=C2=A0 int family =3D 0;
=C2=A0=C2=A0=C2=A0 int model =3D 0;
@@ -236,7 +236,6 @@ void enumerate_cpus(void)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;

=C2=A0=C2=A0=C2=A0 while (file) {
-
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 file.getline(line, sizeof(line));
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "vendor_id\t",10) =
=3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
@@ -247,42 +246,45 @@ void enumerate_cpus(void)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 c++;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 strncpy(vendor,c, 127);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "processor\t",10) =
=3D=3D 0) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "processor\=
t",10) =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(line,=
 ':');
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 c++;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 number =3D strtoull(c, NULL, 10);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "cpu family\t",11)=
 =3D=3D 0) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "Processor\=
t",10) =3D=3D 0) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(line=
, ':');
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 c++;
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 if (*c =3D=3D ' ')
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 c++;
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 strncpy(vendor, c, 127);
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }=C2=A0 else if (strncmp(line, "cpu =
family\t",11) =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(line,=
 ':');
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 c++;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 family =3D strtoull(c, NULL, 10);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "model\t",6) =3D=
=3D 0) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "model\t",6=
) =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(line,=
 ':');
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 c++;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 model =3D strtoull(c, NULL, 10);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncasecmp(line, "bogomips\t", =
9) =3D=3D 0) {
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncasecmp(line, "bogomi=
ps\t", 9) =3D=3D 0) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 handle_one_cpu(num=
ber, vendor, family, model);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 set_max_cpu(number=
);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 }

-
=C2=A0=C2=A0=C2=A0 file.close();

=C2=A0=C2=A0=C2=A0 perf_events =3D new perf_power_bundle();
-
=C2=A0=C2=A0=C2=A0 if (!perf_events->add_event("power:cpu_idle")){
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 perf_events->add_event("power:power_s=
tart");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 perf_events->add_event("power:power_e=
nd");

--===============1150485032944036282==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+VGhhbmtzLDxicj48L3NwYW4+PC9kaXY+PGRpdj48c3Bh
bj50aGlzIGhhcyBnb3R0ZW4gcGFzdCB0aGUgaXNzdWUuIEkgbm93IGdldDo8YnI+PC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlBvd2VyVE9QIHYyLjAg
bmVlZHMgdGhlIGtlcm5lbCB0byBzdXBwb3J0IHRoZSAncGVyZicgc3Vic3lzdGVtPGJyPmFzIHdl
bGwgYXMgc3VwcG9ydCBmb3IgdHJhY2UgcG9pbnRzIGluIHRoZSBrZXJuZWw6PGJyPjxicj5DT05G
SUdfUEVSRl9FVkVOVFM9eSA8YnI+Q09ORklHX1BFUkZfQ09VTlRFUlM9eTxicj5DT05GSUdfVFJB
Q0VQT0lOVFM9eTxicj5DT05GSUdfVFJBQ0lORz15PGJyPjxicj5hbGwgdGhlc2UgZXhjZXB0IENP
TkZJR19QRVJGX0NPVU5URVJTIGFyZSBhbHJlYWR5IHNldCwgc28gaSdsbCBuZWVkIHRvIHNlZSBp
ZiBpIGNhbiBnZXQgYSBrZXJuZWwgYnVpbHQgd2l0aCB0aGF0IG9wdGlvbiBvbi48L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+V2lsbCB0aGlzIHBhdGNo
IG1ha2UgaXQgaW50byB0cnVuaz88L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj48YnI+TWFueSB0aGFu
a3MuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PiAgPGRpdiBzdHlsZT0iZm9udC1zaXplOiAx
MnB0OyBmb250LWZhbWlseTogJnF1b3Q7dGltZXMgbmV3IHJvbWFuJnF1b3Q7LCAmcXVvdDtuZXcg
eW9yayZxdW90OywgJnF1b3Q7dGltZXMmcXVvdDssIHNlcmlmIj4gPGRpdiBzdHlsZT0iZm9udC1z
aXplOiAxMnB0OyBmb250LWZhbWlseTogJnF1b3Q7dGltZXMgbmV3IHJvbWFuJnF1b3Q7LAogJnF1
b3Q7bmV3IHlvcmsmcXVvdDssICZxdW90O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgZGlyPSJs
dHIiPiA8Zm9udCBzaXplPSIyIiBmYWNlPSJBcmlhbCI+IDxociBzaXplPSIxIj4gIDxiPjxzcGFu
IHN0eWxlPSJmb250LXdlaWdodDpib2xkOyI+RnJvbTo8L3NwYW4+PC9iPiBTZXJnZXkgU2Vub3po
YXRza3kgJmx0O3NlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20mZ3Q7PGJyPiA8Yj48c3BhbiBz
dHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQ7Ij5Ubzo8L3NwYW4+PC9iPiBSdWkgRGFDb3N0YSAmbHQ7
cnVpZGNAeWFob28uY29tJmd0OyA8YnI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xk
OyI+Q2M6PC9zcGFuPjwvYj4gQXJqYW4gdmFuIGRlIFZlbiAmbHQ7YXJqYW5AbGludXguaW50ZWwu
Y29tJmd0OzsgQ2hyaXMgRmVycm9uICZsdDtjaHJpcy5lLmZlcnJvbkBsaW51eC5pbnRlbC5jb20m
Z3Q7OyBwb3dlcnRvcEBsaXN0cy4wMS5vcmcgPGJyPiA8Yj48c3BhbiBzdHlsZT0iZm9udC13ZWln
aHQ6IGJvbGQ7Ij5TZW50Ojwvc3Bhbj48L2I+IFN1bmRheSwgMjAgTWF5IDIwMTIsIDExOjM0PGJy
PiA8Yj48c3BhbiBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQ7Ij5TdWJqZWN0Ojwvc3Bhbj48L2I+
IFJlOiBbUG93ZXJ0b3BdIHNlZ2ZhdWx0IG9uIFNoZWV2YXBsdWcgKEFSTSBLaXJrd29vZCk8YnI+
IDwvZm9udD4gPC9kaXY+IDxicj5PbiAoMDUvMjAvMTIgMDI6MTkpLCBSdWkgRGFDb3N0YSB3cm90
ZTo8YnI+Jmd0OyBTdXJlIGFuZCB0aGFua3MsPGJyPiZndDsgKHYxLjEzIHdvcmtlZCBmaW5lIGJ0
dyk8YnI+Jmd0OyBQcm9jZXNzb3ImbmJzcDsmbmJzcDsmbmJzcDsgOiBGZXJvY2VvbiA4OEZSMTMx
IHJldiAxICh2NWwpPGJyPiZndDsgQm9nb01JUFMmbmJzcDsmbmJzcDsmbmJzcDsgOiAxMTkxLjEx
PGJyPiZndDsgRmVhdHVyZXMmbmJzcDsmbmJzcDsmbmJzcDsgOiBzd3AgaGFsZiB0aHVtYgogZmFz
dG11bHQgZWRzcCA8YnI+Jmd0OyBDUFUgaW1wbGVtZW50ZXImbmJzcDsmbmJzcDsmbmJzcDsgOiAw
eDU2PGJyPiZndDsgQ1BVIGFyY2hpdGVjdHVyZTogNVRFPGJyPiZndDsgQ1BVIHZhcmlhbnQmbmJz
cDsmbmJzcDsmbmJzcDsgOiAweDI8YnI+Jmd0OyBDUFUgcGFydCZuYnNwOyZuYnNwOyZuYnNwOyA6
IDB4MTMxPGJyPiZndDsgQ1BVIHJldmlzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7IDogMTxicj4mZ3Q7
IDxicj4mZ3Q7IEhhcmR3YXJlJm5ic3A7Jm5ic3A7Jm5ic3A7IDogTWFydmVsbCBTaGVldmFQbHVn
IFJlZmVyZW5jZSBCb2FyZDxicj4mZ3Q7IFJldmlzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7IDogMDAw
MDxicj4mZ3Q7IFNlcmlhbCZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgOiAw
MDAwMDAwMDAwMDAwMDAwPGJyPiZndDsgPGJyPiZndDsgPGJyPjxicj5UaGFua3MsPGJyPjxicj5X
ZWxsLCB0aGF0J3MgdGhlIHByb2JsZW0uIEN1cnJlbnQgY3B1IGluZm8gcGFyc2VyIGRvZXNuJ3Qg
dW5kZXJzdGFuZCB5b3VyPGJyPmNwdWluZm8gZm9ybWF0LiBJdCBhd2FpdHMgZm9yIHNhbmUgdmFs
dWVzIG9uIHNwZWNpYWwgcGxhY2VzLiBGb3IgZXhhbXBsZSwgd29yZCA8YnI+InByb2Nlc3NvciIg
c2hvdWxkIGJlIGZvbGxvd2VkIGJ5IGEgbnVtYmVyLCBub3QgbW9kZWwgbmFtZS48YnI+PGJyPiZu
YnNwOyZuYnNwOyZuYnNwOyBwcm9jZXNzb3ImbmJzcDsmbmJzcDsmbmJzcDsgOiAyPGJyPiZuYnNw
OyZuYnNwOyZuYnNwOyB2ZW5kb3JfaWQmbmJzcDsmbmJzcDsmbmJzcDsgOiBHZW51aW5lSW50ZWw8
YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNwdSBmYW1pbHkmbmJzcDsmbmJzcDsmbmJzcDsgOiA2PGJy
PiZuYnNwOyZuYnNwOyZuYnNwOyBtb2RlbCZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsm
bmJzcDsgOiAzNzxicj4mbmJzcDsmbmJzcDsmbmJzcDsKIGJvZ29taXBzJm5ic3A7Jm5ic3A7Jm5i
c3A7IDogNDUyMi42Njxicj48YnI+d2hpbGUgY3B1aW5mbyBvbiB5b3VyIHN5c3RlbSBpcyB0b3Rh
bGx5IGRpZmZlcmVudC48YnI+PGJyPnRoZSBmb2xsb3dpbmcgaXMgdW50ZXN0ZWQgcGF0Y2ggKEkn
bSBhIGJpdCBza2VwdGljYWwpIHBsdXMgSSBkb24ndCBoYXZlIDxicj5BUk0gZGV2aWNlIGZvciB0
ZXN0aW5nLjxicj48YnI+LS0tPGJyPjxicj4gc3JjL2NwdS9jcHUuY3BwIHwmbmJzcDsgIDI2ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tPGJyPiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pPGJyPjxicj5kaWZmIC0tZ2l0IGEvc3JjL2NwdS9jcHUuY3Bw
IGIvc3JjL2NwdS9jcHUuY3BwPGJyPmluZGV4IDA5ZDRhMmQuLjE0M2UxOGMgMTAwNjQ0PGJyPi0t
LSBhL3NyYy9jcHUvY3B1LmNwcDxicj4rKysgYi9zcmMvY3B1L2NwdS5jcHA8YnI+QEAgLTIyNSw3
ICsyMjUsNyBAQCB2b2lkIGVudW1lcmF0ZV9jcHVzKHZvaWQpPGJyPiAmbmJzcDsmbmJzcDsmbmJz
cDsgaWZzdHJlYW0gZmlsZTs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyBjaGFyIGxpbmVbMTAyNF07
PGJyPiA8YnI+LSZuYnNwOyZuYnNwOyZuYnNwOyBpbnQgbnVtYmVyID0gLTE7PGJyPismbmJzcDsm
bmJzcDsmbmJzcDsgaW50IG51bWJlciA9IDE7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgY2hhciB2
ZW5kb3JbMTI4XTs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyBpbnQgZmFtaWx5ID0gMDs8YnI+ICZu
YnNwOyZuYnNwOyZuYnNwOyBpbnQgbW9kZWwgPSAwOzxicj5AQCAtMjM2LDcgKzIzNiw2IEBAIHZv
aWQgZW51bWVyYXRlX2NwdXModm9pZCk8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJz
cDsmbmJzcDsgcmV0dXJuOzxicj4gPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgd2hpbGUgKGZpbGUp
IHs8YnI+LTxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7CiAmbmJzcDsmbmJzcDsmbmJzcDsgZmlsZS5n
ZXRsaW5lKGxpbmUsIHNpemVvZihsaW5lKSk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJ2ZW5kb3JfaWRcdCIsMTApID09IDApIHs8
YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7IGNoYXIgKmM7PGJyPkBAIC0yNDcsNDIgKzI0Niw0NSBAQCB2b2lkIGVudW1lcmF0ZV9jcHVz
KHZvaWQpPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGMrKzs8YnI+
ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
ICZuYnNwOyZuYnNwOyZuYnNwOyBzdHJuY3B5KHZlbmRvcixjLCAxMjcpOzxicj4gJm5ic3A7Jm5i
c3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4tJm5i
c3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPi0mbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJwcm9jZXNzb3JcdCIsMTAp
ID09IDApIHs8YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfSBlbHNl
IGlmIChzdHJuY21wKGxpbmUsICJwcm9jZXNzb3JcdCIsMTApID09IDApIHs8YnI+ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGNoYXIgKmM7
PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyBjID0gc3RyY2hyKGxpbmUsICc6Jyk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7CiAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGMpIHs8YnI+ICZuYnNwOyZuYnNw
OyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNw
OyZuYnNwOyBjKys7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgbnVtYmVyID0gc3RydG91bGwoYywg
TlVMTCwgMTApOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJz
cDsmbmJzcDsmbmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNw
OyB9PGJyPi0mbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChzdHJuY21w
KGxpbmUsICJjcHUgZmFtaWx5XHQiLDExKSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7IH0gZWxzZSBpZiAoc3RybmNtcChsaW5lLCAiUHJvY2Vzc29yXHQi
LDEwKSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZu
YnNwOyZuYnNwOyZuYnNwOyBjaGFyICpjOzxicj4rJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgYyA9IHN0cmNocihsaW5lLCAnOicpOzxicj4r
Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsg
aWYgKGMpIHs8YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjKys7PGJyPismbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgaWYgKCpjID09ICcgJyk8YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsKICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7IGMrKzs8YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBzdHJuY3B5KHZlbmRvciwgYywgMTI3KTs8
YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7IH08YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfSZuYnNwOyBl
bHNlIGlmIChzdHJuY21wKGxpbmUsICJjcHUgZmFtaWx5XHQiLDExKSA9PSAwKSB7PGJyPiAmbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjaGFy
ICpjOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJz
cDsmbmJzcDsgYyA9IHN0cmNocihsaW5lLCAnOicpOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGMpIHs8YnI+ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZu
YnNwOyZuYnNwOyBjKys7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgZmFtaWx5ID0gc3RydG91bGwo
YywgTlVMTCwgMTApOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyB9PGJyPi0mbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChzdHJu
Y21wKGxpbmUsICJtb2RlbFx0Iiw2KSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsKICZu
YnNwOyZuYnNwOyZuYnNwOyB9IGVsc2UgaWYgKHN0cm5jbXAobGluZSwgIm1vZGVsXHQiLDYpID09
IDApIHs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5i
c3A7Jm5ic3A7IGNoYXIgKmM7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjID0gc3RyY2hyKGxpbmUsICc6Jyk7PGJyPiAmbmJzcDsm
bmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYykg
ezxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsm
bmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGMrKzs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBtb2Rl
bCA9IHN0cnRvdWxsKGMsIE5VTEwsIDEwKTs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsm
bmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+LSZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyBpZiAoc3RybmNhc2VjbXAobGluZSwgImJvZ29taXBzXHQiLCA5KSA9PSAwKSB7PGJyPism
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH0gZWxzZSBpZiAoc3RybmNhc2Vj
bXAobGluZSwgImJvZ29taXBzXHQiLCA5KSA9PSAwKSB7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBoYW5kbGVfb25lX2NwdShudW1i
ZXIsIHZlbmRvciwgZmFtaWx5LCBtb2RlbCk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOwogc2V0X21heF9jcHUobnVtYmVyKTs8YnI+
ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4gJm5ic3A7Jm5ic3A7
Jm5ic3A7IH08YnI+IDxicj4tPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgZmlsZS5jbG9zZSgpOzxi
cj4gPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgcGVyZl9ldmVudHMgPSBuZXcgcGVyZl9wb3dlcl9i
dW5kbGUoKTs8YnI+LTxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmICghcGVyZl9ldmVudHMtJmd0
O2FkZF9ldmVudCgicG93ZXI6Y3B1X2lkbGUiKSl7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5i
c3A7Jm5ic3A7Jm5ic3A7IHBlcmZfZXZlbnRzLSZndDthZGRfZXZlbnQoInBvd2VyOnBvd2VyX3N0
YXJ0Iik7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IHBlcmZfZXZl
bnRzLSZndDthZGRfZXZlbnQoInBvd2VyOnBvd2VyX2VuZCIpOzxicj48YnI+PGJyPjxicj4gPC9k
aXY+IDwvZGl2PiAgPC9kaXY+PC9ib2R5PjwvaHRtbD4=
--===============1150485032944036282==--

