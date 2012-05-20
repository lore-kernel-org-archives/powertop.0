Content-Type: multipart/mixed; boundary="===============4888508548367072604=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Sun, 20 May 2012 12:32:56 -0700
Message-ID: <1337542376.55788.YahooMailNeo@web160303.mail.bf1.yahoo.com>
In-Reply-To: 1337511718.10611.YahooMailNeo@web160306.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4888508548367072604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

it was pointed out to me that=C2=A0 CONFIG_PERF_COUNTERS has been supersede=
d by PERF_EVENTS since 2.6.32 =C2=A0- see bottom section of http://cateee.n=
et/lkddb/web-lkddb/PERF_COUNTERS.html

so is=C2=A0 CONFIG_PERF_COUNTERS really required?




________________________________
 From: Rui DaCosta <ruidc(a)yahoo.com>
To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> =

Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron <chris.e.ferro=
n(a)linux.intel.com>; "powertop(a)lists.01.org" <powertop(a)lists.01.org> =

Sent: Sunday, 20 May 2012, 13:01
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =


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
> Features=C2=A0=C2=A0=C2=A0 : swp half thumb
 fastmult edsp =

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
=C2=A0=C2=A0=C2=A0
 bogomips=C2=A0=C2=A0=C2=A0 : 4522.66

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
=C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0 file.getline(line, sizeof(line));
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
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0 if (c) {
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
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c++;
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
+=C2=A0=C2=A0=C2=A0
 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "model\t",6) =3D=3D 0) {
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
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0
 set_max_cpu(number);
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

--===============4888508548367072604==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+aXQgd2FzIHBvaW50ZWQgb3V0IHRvIG1lIHRoYXQmbmJz
cDs8L3NwYW4+CjxzcGFuPkNPTkZJR19QRVJGX0NPVU5URVJTIGhhcyBiZWVuIHN1cGVyc2VkZWQg
YnkgUEVSRl9FVkVOVFMgc2luY2UgMi42LjMyICZuYnNwOy0gc2VlIGJvdHRvbSBzZWN0aW9uIG9m
IDwvc3Bhbj48c3Bhbj5odHRwOi8vY2F0ZWVlLm5ldC9sa2RkYi93ZWItbGtkZGIvUEVSRl9DT1VO
VEVSUy5odG1sPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPnNvIGlzJm5ic3A7PC9zcGFuPgo8c3Bhbj5DT05GSUdfUEVSRl9DT1VOVEVSUyByZWFsbHkg
cmVxdWlyZWQ/PC9zcGFuPjxzcGFuPjxicj48L3NwYW4+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj4gIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgZm9udC1mYW1pbHk6
ICZxdW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsmcXVvdDssICZxdW90
O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgZm9udC1m
YW1pbHk6ICZxdW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsmcXVvdDss
ICZxdW90O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgZGlyPSJsdHIiPiA8Zm9udCBzaXplPSIy
IiBmYWNlPSJBcmlhbCI+IDxociBzaXplPSIxIj4gIDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdo
dDpib2xkOyI+RnJvbTo8L3NwYW4+PC9iPiBSdWkgRGFDb3N0YSAmbHQ7cnVpZGNAeWFob28uY29t
Jmd0Ozxicj4gPGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyI+VG86PC9zcGFuPjwv
Yj4gU2VyZ2V5IFNlbm96aGF0c2t5ICZsdDtzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tJmd0
OyA8YnI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyI+Q2M6PC9zcGFuPjwvYj4g
QXJqYW4gdmFuIGRlIFZlbiAmbHQ7YXJqYW5AbGludXguaW50ZWwuY29tJmd0OzsgQ2hyaXMgRmVy
cm9uICZsdDtjaHJpcy5lLmZlcnJvbkBsaW51eC5pbnRlbC5jb20mZ3Q7OyAicG93ZXJ0b3BAbGlz
dHMuMDEub3JnIiAmbHQ7cG93ZXJ0b3BAbGlzdHMuMDEub3JnJmd0OyA8YnI+IDxiPjxzcGFuIHN0
eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlNlbnQ6PC9zcGFuPjwvYj4gU3VuZGF5LCAyMCBNYXkg
MjAxMiwgMTM6MDE8YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlN1Ympl
Y3Q6PC9zcGFuPjwvYj4gUmU6CiBbUG93ZXJ0b3BdIHNlZ2ZhdWx0IG9uIFNoZWV2YXBsdWcgKEFS
TSBLaXJrd29vZCk8YnI+IDwvZm9udD4gPC9kaXY+IDxicj48ZGl2IGlkPSJ5aXY3MjA5NjQ4NzQi
PjxkaXY+PGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjog
cmdiKDI1NSwgMjU1LCAyNTUpOyBmb250LXNpemU6IDEycHQ7IGZvbnQtZmFtaWx5OiAmcXVvdDt0
aW1lcyBuZXcgcm9tYW4mcXVvdDssICZxdW90O25ldyB5b3JrJnF1b3Q7LCAmcXVvdDt0aW1lcyZx
dW90Oywgc2VyaWYiPjxkaXY+PHNwYW4+VGhhbmtzLDxicj48L3NwYW4+PC9kaXY+PGRpdj48c3Bh
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
a3MuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PiAgPGRpdiBzdHlsZT0iZm9udC1zaXplOjEy
cHQ7Ij4gPGRpdgogc3R5bGU9ImZvbnQtc2l6ZToxMnB0OwoiPiA8ZGl2IGRpcj0ibHRyIj4gPGZv
bnQgc2l6ZT0iMiIgZmFjZT0iQXJpYWwiPiA8aHIgc2l6ZT0iMSI+ICA8Yj48c3BhbiBzdHlsZT0i
Zm9udC13ZWlnaHQ6Ym9sZDsiPkZyb206PC9zcGFuPjwvYj4gU2VyZ2V5IFNlbm96aGF0c2t5ICZs
dDtzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tJmd0Ozxicj4gPGI+PHNwYW4gc3R5bGU9ImZv
bnQtd2VpZ2h0OmJvbGQ7Ij5Ubzo8L3NwYW4+PC9iPiBSdWkgRGFDb3N0YSAmbHQ7cnVpZGNAeWFo
b28uY29tJmd0OyA8YnI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OmJvbGQ7Ij5DYzo8L3Nw
YW4+PC9iPiBBcmphbiB2YW4gZGUgVmVuICZsdDthcmphbkBsaW51eC5pbnRlbC5jb20mZ3Q7OyBD
aHJpcyBGZXJyb24gJmx0O2NocmlzLmUuZmVycm9uQGxpbnV4LmludGVsLmNvbSZndDs7IHBvd2Vy
dG9wQGxpc3RzLjAxLm9yZyA8YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDpib2xkOyI+
U2VudDo8L3NwYW4+PC9iPiBTdW5kYXksIDIwIE1heSAyMDEyLCAxMTozNDxicj4gPGI+PHNwYW4g
c3R5bGU9ImZvbnQtd2VpZ2h0OmJvbGQ7Ij5TdWJqZWN0Ojwvc3Bhbj48L2I+IFJlOiBbUG93ZXJ0
b3BdIHNlZ2ZhdWx0IG9uIFNoZWV2YXBsdWcgKEFSTSBLaXJrd29vZCk8YnI+IDwvZm9udD4gPC9k
aXY+IDxicj5PbiAoMDUvMjAvMTIgMDI6MTkpLCBSdWkgRGFDb3N0YSB3cm90ZTo8YnI+Jmd0OyBT
dXJlIGFuZCB0aGFua3MsPGJyPiZndDsgKHYxLjEzIHdvcmtlZCBmaW5lIGJ0dyk8YnI+Jmd0OyBQ
cm9jZXNzb3ImbmJzcDsmbmJzcDsmbmJzcDsgOiBGZXJvY2VvbiA4OEZSMTMxIHJldiAxICh2NWwp
PGJyPiZndDsgQm9nb01JUFMmbmJzcDsmbmJzcDsmbmJzcDsgOiAxMTkxLjExPGJyPiZndDsgRmVh
dHVyZXMmbmJzcDsmbmJzcDsmbmJzcDsgOiBzd3AgaGFsZiB0aHVtYgogZmFzdG11bHQgZWRzcCA8
YnI+Jmd0OyBDUFUgaW1wbGVtZW50ZXImbmJzcDsmbmJzcDsmbmJzcDsgOiAweDU2PGJyPiZndDsg
Q1BVIGFyY2hpdGVjdHVyZTogNVRFPGJyPiZndDsgQ1BVIHZhcmlhbnQmbmJzcDsmbmJzcDsmbmJz
cDsgOiAweDI8YnI+Jmd0OyBDUFUgcGFydCZuYnNwOyZuYnNwOyZuYnNwOyA6IDB4MTMxPGJyPiZn
dDsgQ1BVIHJldmlzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7IDogMTxicj4mZ3Q7IDxicj4mZ3Q7IEhh
cmR3YXJlJm5ic3A7Jm5ic3A7Jm5ic3A7IDogTWFydmVsbCBTaGVldmFQbHVnIFJlZmVyZW5jZSBC
b2FyZDxicj4mZ3Q7IFJldmlzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7IDogMDAwMDxicj4mZ3Q7IFNl
cmlhbCZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgOiAwMDAwMDAwMDAwMDAw
MDAwPGJyPiZndDsgPGJyPiZndDsgPGJyPjxicj5UaGFua3MsPGJyPjxicj5XZWxsLCB0aGF0J3Mg
dGhlIHByb2JsZW0uIEN1cnJlbnQgY3B1IGluZm8gcGFyc2VyIGRvZXNuJ3QgdW5kZXJzdGFuZCB5
b3VyPGJyPmNwdWluZm8gZm9ybWF0LiBJdCBhd2FpdHMgZm9yIHNhbmUgdmFsdWVzIG9uIHNwZWNp
YWwgcGxhY2VzLiBGb3IgZXhhbXBsZSwgd29yZCA8YnI+InByb2Nlc3NvciIgc2hvdWxkIGJlIGZv
bGxvd2VkIGJ5IGEgbnVtYmVyLCBub3QgbW9kZWwgbmFtZS48YnI+PGJyPiZuYnNwOyZuYnNwOyZu
YnNwOyBwcm9jZXNzb3ImbmJzcDsmbmJzcDsmbmJzcDsgOiAyPGJyPiZuYnNwOyZuYnNwOyZuYnNw
OyB2ZW5kb3JfaWQmbmJzcDsmbmJzcDsmbmJzcDsgOiBHZW51aW5lSW50ZWw8YnI+Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGNwdSBmYW1pbHkmbmJzcDsmbmJzcDsmbmJzcDsgOiA2PGJyPiZuYnNwOyZuYnNw
OyZuYnNwOyBtb2RlbCZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgOiAzNzxi
cj4mbmJzcDsmbmJzcDsmbmJzcDsKIGJvZ29taXBzJm5ic3A7Jm5ic3A7Jm5ic3A7IDogNDUyMi42
Njxicj48YnI+d2hpbGUgY3B1aW5mbyBvbiB5b3VyIHN5c3RlbSBpcyB0b3RhbGx5IGRpZmZlcmVu
dC48YnI+PGJyPnRoZSBmb2xsb3dpbmcgaXMgdW50ZXN0ZWQgcGF0Y2ggKEknbSBhIGJpdCBza2Vw
dGljYWwpIHBsdXMgSSBkb24ndCBoYXZlIDxicj5BUk0gZGV2aWNlIGZvciB0ZXN0aW5nLjxicj48
YnI+LS0tPGJyPjxicj4gc3JjL2NwdS9jcHUuY3BwIHwmbmJzcDsgIDI2ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tPGJyPiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pPGJyPjxicj5kaWZmIC0tZ2l0IGEvc3JjL2NwdS9jcHUuY3BwIGIvc3JjL2NwdS9j
cHUuY3BwPGJyPmluZGV4IDA5ZDRhMmQuLjE0M2UxOGMgMTAwNjQ0PGJyPi0tLSBhL3NyYy9jcHUv
Y3B1LmNwcDxicj4rKysgYi9zcmMvY3B1L2NwdS5jcHA8YnI+QEAgLTIyNSw3ICsyMjUsNyBAQCB2
b2lkIGVudW1lcmF0ZV9jcHVzKHZvaWQpPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgaWZzdHJlYW0g
ZmlsZTs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyBjaGFyIGxpbmVbMTAyNF07PGJyPiA8YnI+LSZu
YnNwOyZuYnNwOyZuYnNwOyBpbnQgbnVtYmVyID0gLTE7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsg
aW50IG51bWJlciA9IDE7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgY2hhciB2ZW5kb3JbMTI4XTs8
YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyBpbnQgZmFtaWx5ID0gMDs8YnI+ICZuYnNwOyZuYnNwOyZu
YnNwOyBpbnQgbW9kZWwgPSAwOzxicj5AQCAtMjM2LDcgKzIzNiw2IEBAIHZvaWQgZW51bWVyYXRl
X2NwdXModm9pZCk8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgcmV0
dXJuOzxicj4gPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgd2hpbGUgKGZpbGUpIHs8YnI+LTxicj4g
Jm5ic3A7Jm5ic3A7Jm5ic3A7CiAmbmJzcDsmbmJzcDsmbmJzcDsgZmlsZS5nZXRsaW5lKGxpbmUs
IHNpemVvZihsaW5lKSk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
IGlmIChzdHJuY21wKGxpbmUsICJ2ZW5kb3JfaWRcdCIsMTApID09IDApIHs8YnI+ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGNoYXIgKmM7
PGJyPkBAIC0yNDcsNDIgKzI0Niw0NSBAQCB2b2lkIGVudW1lcmF0ZV9jcHVzKHZvaWQpPGJyPiAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGMrKzs8YnI+ICZuYnNwOyZuYnNw
OyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNw
OyZuYnNwOyBzdHJuY3B5KHZlbmRvcixjLCAxMjcpOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5i
c3A7ICZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPi0mbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5i
c3A7Jm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJwcm9jZXNzb3JcdCIsMTApID09IDApIHs8YnI+
KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfSBlbHNlIGlmIChzdHJuY21w
KGxpbmUsICJwcm9jZXNzb3JcdCIsMTApID09IDApIHs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGNoYXIgKmM7PGJyPiAmbmJzcDsm
bmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjID0gc3Ry
Y2hyKGxpbmUsICc6Jyk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
CiAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGMpIHs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjKys7
PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgbnVtYmVyID0gc3RydG91bGwoYywgTlVMTCwgMTApOzxi
cj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPi0mbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJjcHUg
ZmFtaWx5XHQiLDExKSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7
Jm5ic3A7IH0gZWxzZSBpZiAoc3RybmNtcChsaW5lLCAiUHJvY2Vzc29yXHQiLDEwKSA9PSAwKSB7
PGJyPismbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyBjaGFyICpjOzxicj4rJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgYyA9IHN0cmNocihsaW5lLCAnOicpOzxicj4rJm5ic3A7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGMpIHs8YnI+
KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
ICZuYnNwOyZuYnNwOyZuYnNwOyBjKys7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5i
c3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCpjID09
ICcgJyk8YnI+KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsKICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGMrKzs8YnI+
KyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
ICZuYnNwOyZuYnNwOyZuYnNwOyBzdHJuY3B5KHZlbmRvciwgYywgMTI3KTs8YnI+KyZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+KyZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfSZuYnNwOyBlbHNlIGlmIChzdHJu
Y21wKGxpbmUsICJjcHUgZmFtaWx5XHQiLDExKSA9PSAwKSB7PGJyPiAmbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBjaGFyICpjOzxicj4gJm5i
c3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgYyA9
IHN0cmNocihsaW5lLCAnOicpOzxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGMpIHs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBj
Kys7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNw
OyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgZmFtaWx5ID0gc3RydG91bGwoYywgTlVMTCwgMTAp
Ozxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsm
bmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPi0m
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJt
b2RlbFx0Iiw2KSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsmbmJzcDsKICZuYnNwOyZuYnNwOyZu
YnNwOyB9IGVsc2UgaWYgKHN0cm5jbXAobGluZSwgIm1vZGVsXHQiLDYpID09IDApIHs8YnI+ICZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGNo
YXIgKmM7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZu
YnNwOyZuYnNwOyBjID0gc3RyY2hyKGxpbmUsICc6Jyk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoYykgezxicj4gJm5ic3A7
Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7IGMrKzs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBtb2RlbCA9IHN0cnRvdWxs
KGMsIE5VTEwsIDEwKTs8YnI+ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsg
Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+LSZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsm
bmJzcDsgfTxicj4tJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoc3Ry
bmNhc2VjbXAobGluZSwgImJvZ29taXBzXHQiLCA5KSA9PSAwKSB7PGJyPismbmJzcDsmbmJzcDsm
bmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH0gZWxzZSBpZiAoc3RybmNhc2VjbXAobGluZSwgImJv
Z29taXBzXHQiLCA5KSA9PSAwKSB7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBoYW5kbGVfb25lX2NwdShudW1iZXIsIHZlbmRvciwg
ZmFtaWx5LCBtb2RlbCk7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
ICZuYnNwOyZuYnNwOyZuYnNwOwogc2V0X21heF9jcHUobnVtYmVyKTs8YnI+ICZuYnNwOyZuYnNw
OyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+
IDxicj4tPGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgZmlsZS5jbG9zZSgpOzxicj4gPGJyPiAmbmJz
cDsmbmJzcDsmbmJzcDsgcGVyZl9ldmVudHMgPSBuZXcgcGVyZl9wb3dlcl9idW5kbGUoKTs8YnI+
LTxicj4gJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmICghcGVyZl9ldmVudHMtJmd0O2FkZF9ldmVudCgi
cG93ZXI6Y3B1X2lkbGUiKSl7PGJyPiAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5i
c3A7IHBlcmZfZXZlbnRzLSZndDthZGRfZXZlbnQoInBvd2VyOnBvd2VyX3N0YXJ0Iik7PGJyPiAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IHBlcmZfZXZlbnRzLSZndDthZGRf
ZXZlbnQoInBvd2VyOnBvd2VyX2VuZCIpOzxicj48YnI+PGJyPjxicj4gPC9kaXY+IDwvZGl2PiAg
PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjxicj4gPC9kaXY+IDwvZGl2PiAgPC9kaXY+PC9ib2R5Pjwv
aHRtbD4=
--===============4888508548367072604==--

