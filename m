Content-Type: multipart/mixed; boundary="===============2033036667810999488=="
MIME-Version: 1.0
From: Rui DaCosta <ruidc at yahoo.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Tue, 22 May 2012 12:19:43 -0700
Message-ID: <1337714383.41026.YahooMailNeo@web160301.mail.bf1.yahoo.com>
In-Reply-To: 4FBACB28.7040203@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2033036667810999488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'd love to help, but development in low-level languages=C2=A0 is far from =
my "forte", =C2=A0but I can try to submituser-level bugs and perform some t=
esting, ( I'm merely a user of powertop and an enthusiast for low-power com=
puting).


I understand ARM support in Linux is a mess, but nevertheless it is Linux's=
 most successful platform (taking mobile devices into account), and there's=
 lots of effort being put in to cleaning it up, though i can also understan=
d a reluctance on Intel's part to commit much in that direction ;)


I don't know enough about the issues here to comment on *where* the bug is,=
 but am happy to chase things upstream to get it fixed, if, after review, y=
ou think it is a bug there. =



>From my understanding, this Kirkwood platform is also a reasonably popular =
ARM device, particularly with the power-conscious users, and has been incor=
porated in many mass-market devices, so i'd think patching until things are=
 fixed upstream would be in many people's interest - and particularly as th=
is appears as a regression from powertop 1.13.


I could also perhaps, on arrangement, organize root access to this device f=
or any devs wishing to test support - so long as I don't have to go too wil=
d with kernel changes (I still rely upon this device as a home NAS).


But i look forward to your conclusion and respect your decision regardless.

... Great tool by the way - doing it's own massive bit to keep the world a =
greener place.

Kind Regards,
Rui

________________________________
 From: Chris Ferron <chris.e.ferron(a)linux.intel.com>
To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> =

Cc: Rui DaCosta <ruidc(a)yahoo.com>; Arjan van de Ven <arjan(a)linux.intel.=
com>; "powertop(a)lists.01.org" <powertop(a)lists.01.org> =

Sent: Tuesday, 22 May 2012, 1:09
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
 =

On 05/20/2012 02:57 PM, Sergey Senozhatsky wrote:
> On (05/20/12 04:01), Rui DaCosta wrote:
>>=C2=A0 =C2=A0  Thanks,
>>=C2=A0 =C2=A0  this has gotten past the issue. I now get:
>>=C2=A0 =C2=A0  PowerTOP v2.0 needs the kernel to support the 'perf' subsy=
stem
>>=C2=A0 =C2=A0  as well as support for trace points in the kernel:
>>
>>=C2=A0 =C2=A0  CONFIG_PERF_EVENTS=3Dy
>>=C2=A0 =C2=A0  CONFIG_PERF_COUNTERS=3Dy
>>=C2=A0 =C2=A0  CONFIG_TRACEPOINTS=3Dy
>>=C2=A0 =C2=A0  CONFIG_TRACING=3Dy
>>
>>=C2=A0 =C2=A0  all these except CONFIG_PERF_COUNTERS are already set, so =
i'll need to see
>>=C2=A0 =C2=A0  if i can get a kernel built with that option on.
>>
>>=C2=A0 =C2=A0  Will this patch make it into trunk?
>>
> Well, it depends. The patch itself is quite innocent -- assuming default
> number of processors being 1 instead of -1 will not do any harm. Of cours=
e,
> such default value could be considered as debugging friendly, yet segfault
> is still no good.
>
> We'll see what project owners think about that.
*In GENERAL*
Well that is an interesting question. I personally will not be spending =

any time on arm.
That said, i am also not opposed to somewhat blindly accepting patches =

for ARM, especially from trusted and active members.
*As long as ARM work isn't effecting PowerTOP.*

Now if you find a bug, then that is a different story, as long as the =

bug is not purely ARM specific it will get attention.

*this instance*
I will pull this patch and take a good look at it, since it looks to me =

to be a bug as well. Thanks Sergey


-Chris



>
> =C2=A0=C2=A0=C2=A0 -ss
>
>>=C2=A0 =C2=A0  Many thanks.
>>
>>=C2=A0 =C2=A0  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80
>>
>>=C2=A0 =C2=A0  From: Sergey Senozhatsky<sergey.senozhatsky(a)gmail.com>
>>=C2=A0 =C2=A0  To: Rui DaCosta<ruidc(a)yahoo.com>
>>=C2=A0 =C2=A0  Cc: Arjan van de Ven<arjan(a)linux.intel.com>; Chris Ferron
>>=C2=A0 =C2=A0  <chris.e.ferron(a)linux.intel.com>; powertop(a)lists.01.org
>>=C2=A0 =C2=A0  Sent: Sunday, 20 May 2012, 11:34
>>=C2=A0 =C2=A0  Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwo=
od)
>>=C2=A0 =C2=A0  On (05/20/12 02:19), Rui DaCosta wrote:
>>=C2=A0 =C2=A0  >=C2=A0 Sure and thanks,
>>=C2=A0 =C2=A0  >=C2=A0 (v1.13 worked fine btw)
>>=C2=A0 =C2=A0  >=C2=A0 Processor=C2=A0 =C2=A0 : Feroceon 88FR131 rev 1 (v=
5l)
>>=C2=A0 =C2=A0  >=C2=A0 BogoMIPS=C2=A0 =C2=A0 : 1191.11
>>=C2=A0 =C2=A0  >=C2=A0 Features=C2=A0 =C2=A0 : swp half thumb fastmult ed=
sp
>>=C2=A0 =C2=A0  >=C2=A0 CPU implementer=C2=A0 =C2=A0 : 0x56
>>=C2=A0 =C2=A0  >=C2=A0 CPU architecture: 5TE
>>=C2=A0 =C2=A0  >=C2=A0 CPU variant=C2=A0 =C2=A0 : 0x2
>>=C2=A0 =C2=A0  >=C2=A0 CPU part=C2=A0 =C2=A0 : 0x131
>>=C2=A0 =C2=A0  >=C2=A0 CPU revision=C2=A0 =C2=A0 : 1
>>=C2=A0 =C2=A0  >
>>=C2=A0 =C2=A0  >=C2=A0 Hardware=C2=A0 =C2=A0 : Marvell SheevaPlug Referen=
ce Board
>>=C2=A0 =C2=A0  >=C2=A0 Revision=C2=A0 =C2=A0 : 0000
>>=C2=A0 =C2=A0  >=C2=A0 Serial=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 00000000000000=
00
>>=C2=A0 =C2=A0  >
>>=C2=A0 =C2=A0  >
>>
>>=C2=A0 =C2=A0  Thanks,
>>
>>=C2=A0 =C2=A0  Well, that's the problem. Current cpu info parser doesn't =
understand your
>>=C2=A0 =C2=A0  cpuinfo format. It awaits for sane values on special place=
s. For example,
>>=C2=A0 =C2=A0  word
>>=C2=A0 =C2=A0  "processor" should be followed by a number, not model name.
>>
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  processor=C2=A0 =C2=A0 : 2
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  vendor_id=C2=A0 =C2=A0 : GenuineIntel
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  cpu family=C2=A0 =C2=A0 : 6
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  model=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 37
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  bogomips=C2=A0 =C2=A0 : 4522.66
>>
>>=C2=A0 =C2=A0  while cpuinfo on your system is totally different.
>>
>>=C2=A0 =C2=A0  the following is untested patch (I'm a bit skeptical) plus=
 I don't have
>>=C2=A0 =C2=A0  ARM device for testing.
>>
>>=C2=A0 =C2=A0  ---
>>
>>=C2=A0 =C2=A0  src/cpu/cpu.cpp |=C2=A0 26 ++++++++++++++------------
>>=C2=A0 =C2=A0  1 file changed, 14 insertions(+), 12 deletions(-)
>>
>>=C2=A0 =C2=A0  diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>>=C2=A0 =C2=A0  index 09d4a2d..143e18c 100644
>>=C2=A0 =C2=A0  --- a/src/cpu/cpu.cpp
>>=C2=A0 =C2=A0  +++ b/src/cpu/cpu.cpp
>>=C2=A0 =C2=A0  @@ -225,7 +225,7 @@ void enumerate_cpus(void)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  ifstream file;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  char line[1024];
>>
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 int number =3D -1;
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 int number =3D 1;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  char vendor[128];
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  int family =3D 0;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  int model =3D 0;
>>=C2=A0 =C2=A0  @@ -236,7 +236,6 @@ void enumerate_cpus(void)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  return;
>>
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  while (file) {
>>=C2=A0 =C2=A0  -
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  file.getline(line, sizeof(line=
));
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  if (strncmp(line, "vendor_id\t=
",10) =3D=3D 0) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  char *c;
>>=C2=A0 =C2=A0  @@ -247,42 +246,45 @@ void enumerate_cpus(void)
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0  c++;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  st=
rncpy(vendor,c, 127);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(line, "processor\=
t",10) =3D=3D 0) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (strncmp(line, "pro=
cessor\t",10) =3D=3D 0) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  char *c;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c =3D strchr(lin=
e, ':');
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  if (c) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c+=
+;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  nu=
mber =3D strtoull(c, NULL, 10);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(line, "cpu family=
\t",11) =3D=3D 0) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (strncmp(line, "Pro=
cessor\t",10) =3D=3D 0) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *c;
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D strchr(li=
ne, ':');
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (c) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
++;
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (*c =3D=3D ' ')
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c++;
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
trncpy(vendor, c, 127);
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 else if (strncmp(line=
, "cpu family\t",11) =3D=3D 0) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  char *c;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c =3D strchr(lin=
e, ':');
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  if (c) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c+=
+;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  fa=
mily =3D strtoull(c, NULL, 10);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(line, "model\t",6=
) =3D=3D 0) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (strncmp(line, "mod=
el\t",6) =3D=3D 0) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  char *c;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c =3D strchr(lin=
e, ':');
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  if (c) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  c+=
+;
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  mo=
del =3D strtoull(c, NULL, 10);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>=C2=A0 =C2=A0  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncasecmp(line, "bogomi=
ps\t", 9) =3D=3D 0) {
>>=C2=A0 =C2=A0  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (strncasecmp(line, =
"bogomips\t", 9) =3D=3D 0) {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  handle_one_cpu(n=
umber, vendor, family, model);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  set_max_cpu(numb=
er);
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  }
>>
>>=C2=A0 =C2=A0  -
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  file.close();
>>
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  perf_events =3D new perf_power_bundle();
>>=C2=A0 =C2=A0  -
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0  if (!perf_events->add_event("power:cpu_idle"=
)){
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  perf_events->add_event("power:=
power_start");
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  perf_events->add_event("power:=
power_end");

--===============2033036667810999488==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGJvZHk+PGRpdiBzdHlsZT0iY29sb3I6IzAwMDsgYmFja2dyb3VuZC1jb2xvcjojZmZm
OyBmb250LWZhbWlseTp0aW1lcyBuZXcgcm9tYW4sIG5ldyB5b3JrLCB0aW1lcywgc2VyaWY7Zm9u
dC1zaXplOjEycHQiPjxkaXY+PHNwYW4+SSdkIGxvdmUgdG8gaGVscCwgYnV0IGRldmVsb3BtZW50
IGluIGxvdy1sZXZlbCBsYW5ndWFnZXMmbmJzcDsgaXMgZmFyIGZyb20gbXkgImZvcnRlIiwgJm5i
c3A7PC9zcGFuPmJ1dCBJIGNhbiB0cnkgdG8gc3VibWl0PHNwYW4+IHVzZXItbGV2ZWwgYnVncyBh
bmQgcGVyZm9ybSBzb21lIHRlc3RpbmcsPC9zcGFuPiAoIDxzcGFuPkknbSBtZXJlbHkgYSB1c2Vy
IG9mIHBvd2VydG9wIGFuZCBhbiBlbnRodXNpYXN0IGZvciBsb3ctcG93ZXIgY29tcHV0aW5nKS48
YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPkkg
dW5kZXJzdGFuZCBBUk0gc3VwcG9ydCBpbiBMaW51eCBpcyBhIG1lc3MsIGJ1dCBuZXZlcnRoZWxl
c3MgaXQgaXMgTGludXgncyBtb3N0IHN1Y2Nlc3NmdWwgcGxhdGZvcm0gKHRha2luZyBtb2JpbGUg
ZGV2aWNlcyBpbnRvIGFjY291bnQpLCBhbmQgdGhlcmUncyBsb3RzIG9mIGVmZm9ydCBiZWluZyBw
dXQgaW4gdG8gY2xlYW5pbmcgaXQgdXAsIHRob3VnaCBpIGNhbiBhbHNvIHVuZGVyc3RhbmQgYSBy
ZWx1Y3RhbmNlIG9uIEludGVsJ3MgcGFydCB0byBjb21taXQgbXVjaCBpbiB0aGF0IGRpcmVjdGlv
biA7KTxicj48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+Cjxz
cGFuPkkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIGlzc3VlcyBoZXJlIHRvIGNvbW1lbnQg
b24gKndoZXJlKiB0aGUgYnVnIGlzLCBidXQgYW0gaGFwcHkgdG8gY2hhc2UgdGhpbmdzIHVwc3Ry
ZWFtIHRvIGdldCBpdCBmaXhlZCwgaWYsIGFmdGVyIHJldmlldywgeW91IHRoaW5rIGl0IGlzIGEg
YnVnIHRoZXJlLjwvc3Bhbj4KPHNwYW4+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPjxicj48
L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5Gcm9tIG15IHVuZGVyc3RhbmRpbmcsIHRoaXMgS2lya3dv
b2QgcGxhdGZvcm0gaXMgYWxzbyBhIHJlYXNvbmFibHkgcG9wdWxhciBBUk0gZGV2aWNlLCBwYXJ0
aWN1bGFybHkgd2l0aCB0aGUgcG93ZXItY29uc2Npb3VzIHVzZXJzLCBhbmQgaGFzIGJlZW4gaW5j
b3Jwb3JhdGVkIGluIG1hbnkgbWFzcy1tYXJrZXQgZGV2aWNlcywgc28gaSdkIHRoaW5rIHBhdGNo
aW5nIHVudGlsIHRoaW5ncyBhcmUgZml4ZWQgdXBzdHJlYW0gd291bGQgYmUgaW4gbWFueSBwZW9w
bGUncyBpbnRlcmVzdCAtIGFuZCBwYXJ0aWN1bGFybHkgYXMgdGhpcyBhcHBlYXJzIGFzIGEgcmVn
cmVzc2lvbiBmcm9tIHBvd2VydG9wIDEuMTMuPGJyPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPjxi
cj48L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5JIGNvdWxkIGFsc28gcGVyaGFwcywgb24gYXJyYW5n
ZW1lbnQsIG9yZ2FuaXplIHJvb3QgYWNjZXNzIHRvIHRoaXMgZGV2aWNlIGZvciBhbnkgZGV2cyB3
aXNoaW5nIHRvIHRlc3Qgc3VwcG9ydCAtIHNvIGxvbmcgYXMgSSBkb24ndCBoYXZlIHRvIGdvIHRv
byB3aWxkIHdpdGgga2VybmVsIGNoYW5nZXMgKEkgc3RpbGwgcmVseSB1cG9uIHRoaXMgZGV2aWNl
IGFzIGEgaG9tZSBOQVMpLjwvc3Bhbj48c3Bhbj48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QnV0IGkgbG9vayBmb3J3YXJkIHRvIHlvdXIgY29uY2x1c2lvbiBhbmQgcmVzcGVj
dCB5b3VyIGRlY2lzaW9uIHJlZ2FyZGxlc3MuPGJyPjwvZGl2PjxkaXY+Li4uIEdyZWF0IHRvb2wg
YnkgdGhlIHdheSAtIGRvaW5nIGl0J3Mgb3duIG1hc3NpdmUgYml0IHRvIGtlZXAgdGhlIHdvcmxk
IGEgZ3JlZW5lciBwbGFjZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PktpbmQKIFJlZ2FyZHMs
PC9kaXY+PGRpdj5SdWk8L2Rpdj4gIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgZm9udC1m
YW1pbHk6ICZxdW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsmcXVvdDss
ICZxdW90O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsg
Zm9udC1mYW1pbHk6ICZxdW90O3RpbWVzIG5ldyByb21hbiZxdW90OywgJnF1b3Q7bmV3IHlvcmsm
cXVvdDssICZxdW90O3RpbWVzJnF1b3Q7LCBzZXJpZiI+IDxkaXYgZGlyPSJsdHIiPiA8Zm9udCBz
aXplPSIyIiBmYWNlPSJBcmlhbCI+IDxociBzaXplPSIxIj4gIDxiPjxzcGFuIHN0eWxlPSJmb250
LXdlaWdodDpib2xkOyI+RnJvbTo8L3NwYW4+PC9iPiBDaHJpcyBGZXJyb24gJmx0O2NocmlzLmUu
ZmVycm9uQGxpbnV4LmludGVsLmNvbSZndDs8YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdo
dDogYm9sZDsiPlRvOjwvc3Bhbj48L2I+IFNlcmdleSBTZW5vemhhdHNreSAmbHQ7c2VyZ2V5LnNl
bm96aGF0c2t5QGdtYWlsLmNvbSZndDsgPGJyPjxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDog
Ym9sZDsiPkNjOjwvc3Bhbj48L2I+IFJ1aSBEYUNvc3RhICZsdDtydWlkY0B5YWhvby5jb20mZ3Q7
OyBBcmphbiB2YW4gZGUgVmVuICZsdDthcmphbkBsaW51eC5pbnRlbC5jb20mZ3Q7OyAicG93ZXJ0
b3BAbGlzdHMuMDEub3JnIiAmbHQ7cG93ZXJ0b3BAbGlzdHMuMDEub3JnJmd0OyA8YnI+IDxiPjxz
cGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsiPlNlbnQ6PC9zcGFuPjwvYj4gVHVlc2RheSwg
MjIgTWF5IDIwMTIsIDE6MDk8YnI+IDxiPjxzcGFuIHN0eWxlPSJmb250LXdlaWdodDogYm9sZDsi
PlN1YmplY3Q6PC9zcGFuPjwvYj4gUmU6IFtQb3dlcnRvcF0gc2VnZmF1bHQgb24gU2hlZXZhcGx1
ZyAoQVJNIEtpcmt3b29kKTxicj4gPC9mb250PiA8L2Rpdj4gPGJyPk9uCiAwNS8yMC8yMDEyIDAy
OjU3IFBNLCBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6PGJyPiZndDsgT24gKDA1LzIwLzEyIDA0
OjAxKSwgUnVpIERhQ29zdGEgd3JvdGU6PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgVGhhbmtz
LDxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIHRoaXMgaGFzIGdvdHRlbiBwYXN0IHRoZSBpc3N1
ZS4gSSBub3cgZ2V0Ojxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIFBvd2VyVE9QIHYyLjAgbmVl
ZHMgdGhlIGtlcm5lbCB0byBzdXBwb3J0IHRoZSAncGVyZicgc3Vic3lzdGVtPGJyPiZndDsmZ3Q7
Jm5ic3A7ICZuYnNwOyAgYXMgd2VsbCBhcyBzdXBwb3J0IGZvciB0cmFjZSBwb2ludHMgaW4gdGhl
IGtlcm5lbDo8YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICBDT05GSUdfUEVS
Rl9FVkVOVFM9eTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIENPTkZJR19QRVJGX0NPVU5URVJT
PXk8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICBDT05GSUdfVFJBQ0VQT0lOVFM9eTxicj4mZ3Q7
Jmd0OyZuYnNwOyAmbmJzcDsgIENPTkZJR19UUkFDSU5HPXk8YnI+Jmd0OyZndDs8YnI+Jmd0OyZn
dDsmbmJzcDsgJm5ic3A7ICBhbGwgdGhlc2UgZXhjZXB0IENPTkZJR19QRVJGX0NPVU5URVJTIGFy
ZSBhbHJlYWR5IHNldCwgc28gaSdsbCBuZWVkIHRvIHNlZTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJz
cDsgIGlmIGkgY2FuIGdldCBhIGtlcm5lbCBidWlsdCB3aXRoIHRoYXQgb3B0aW9uIG9uLjxicj4m
Z3Q7Jmd0Ozxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIFdpbGwgdGhpcyBwYXRjaCBtYWtlIGl0
IGludG8gdHJ1bms/PGJyPiZndDsmZ3Q7PGJyPiZndDsgV2VsbCwgaXQgZGVwZW5kcy4gVGhlIHBh
dGNoIGl0c2VsZiBpcyBxdWl0ZSBpbm5vY2VudCAtLSBhc3N1bWluZyBkZWZhdWx0PGJyPiZndDsg
bnVtYmVyIG9mIHByb2Nlc3NvcnMgYmVpbmcgMSBpbnN0ZWFkIG9mIC0xCiB3aWxsIG5vdCBkbyBh
bnkgaGFybS4gT2YgY291cnNlLDxicj4mZ3Q7IHN1Y2ggZGVmYXVsdCB2YWx1ZSBjb3VsZCBiZSBj
b25zaWRlcmVkIGFzIGRlYnVnZ2luZyBmcmllbmRseSwgeWV0IHNlZ2ZhdWx0PGJyPiZndDsgaXMg
c3RpbGwgbm8gZ29vZC48YnI+Jmd0Ozxicj4mZ3Q7IFdlJ2xsIHNlZSB3aGF0IHByb2plY3Qgb3du
ZXJzIHRoaW5rIGFib3V0IHRoYXQuPGJyPipJbiBHRU5FUkFMKjxicj5XZWxsIHRoYXQgaXMgYW4g
aW50ZXJlc3RpbmcgcXVlc3Rpb24uIEkgcGVyc29uYWxseSB3aWxsIG5vdCBiZSBzcGVuZGluZyA8
YnI+YW55IHRpbWUgb24gYXJtLjxicj5UaGF0IHNhaWQsIGkgYW0gYWxzbyBub3Qgb3Bwb3NlZCB0
byBzb21ld2hhdCBibGluZGx5IGFjY2VwdGluZyBwYXRjaGVzIDxicj5mb3IgQVJNLCBlc3BlY2lh
bGx5IGZyb20gdHJ1c3RlZCBhbmQgYWN0aXZlIG1lbWJlcnMuPGJyPipBcyBsb25nIGFzIEFSTSB3
b3JrIGlzbid0IGVmZmVjdGluZyBQb3dlclRPUC4qPGJyPjxicj5Ob3cgaWYgeW91IGZpbmQgYSBi
dWcsIHRoZW4gdGhhdCBpcyBhIGRpZmZlcmVudCBzdG9yeSwgYXMgbG9uZyBhcyB0aGUgPGJyPmJ1
ZyBpcyBub3QgcHVyZWx5IEFSTSBzcGVjaWZpYyBpdCB3aWxsIGdldCBhdHRlbnRpb24uPGJyPjxi
cj4qdGhpcyBpbnN0YW5jZSo8YnI+SSB3aWxsIHB1bGwgdGhpcyBwYXRjaCBhbmQgdGFrZSBhIGdv
b2QgbG9vayBhdCBpdCwgc2luY2UgaXQgbG9va3MgdG8gbWUgPGJyPnRvIGJlIGEgYnVnIGFzIHdl
bGwuIFRoYW5rcyBTZXJnZXk8YnI+PGJyPjxicj4tQ2hyaXM8YnI+PGJyPjxicj48YnI+Jmd0Ozxi
cj4mZ3Q7ICZuYnNwOyZuYnNwOyZuYnNwOyAtc3M8YnI+Jmd0Ozxicj4mZ3Q7Jmd0OyZuYnNwOyAm
bmJzcDsgIE1hbnkgdGhhbmtzLjxicj4mZ3Q7Jmd0Ozxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsg
CiDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIA8YnI+
Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICBGcm9tOiBTZXJnZXkgU2Vub3poYXRz
a3kmbHQ7PGEgeW1haWx0bz0ibWFpbHRvOnNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20iIGhy
ZWY9Im1haWx0bzpzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tIj5zZXJnZXkuc2Vub3poYXRz
a3lAZ21haWwuY29tPC9hPiZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICBUbzogUnVpIERh
Q29zdGEmbHQ7PGEgeW1haWx0bz0ibWFpbHRvOnJ1aWRjQHlhaG9vLmNvbSIgaHJlZj0ibWFpbHRv
OnJ1aWRjQHlhaG9vLmNvbSI+cnVpZGNAeWFob28uY29tPC9hPiZndDs8YnI+Jmd0OyZndDsmbmJz
cDsgJm5ic3A7ICBDYzogQXJqYW4gdmFuIGRlIFZlbiZsdDs8YSB5bWFpbHRvPSJtYWlsdG86YXJq
YW5AbGludXguaW50ZWwuY29tIiBocmVmPSJtYWlsdG86YXJqYW5AbGludXguaW50ZWwuY29tIj5h
cmphbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0OzsgQ2hyaXMgRmVycm9uPGJyPiZndDsmZ3Q7Jm5i
c3A7ICZuYnNwOyAgJmx0OzxhIHltYWlsdG89Im1haWx0bzpjaHJpcy5lLmZlcnJvbkBsaW51eC5p
bnRlbC5jb20iIGhyZWY9Im1haWx0bzpjaHJpcy5lLmZlcnJvbkBsaW51eC5pbnRlbC5jb20iPmNo
cmlzLmUuZmVycm9uQGxpbnV4LmludGVsLmNvbTwvYT4mZ3Q7OyA8YSB5bWFpbHRvPSJtYWlsdG86
cG93ZXJ0b3BAbGlzdHMuMDEub3JnIgogaHJlZj0ibWFpbHRvOnBvd2VydG9wQGxpc3RzLjAxLm9y
ZyI+cG93ZXJ0b3BAbGlzdHMuMDEub3JnPC9hPjxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIFNl
bnQ6IFN1bmRheSwgMjAgTWF5IDIwMTIsIDExOjM0PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAg
U3ViamVjdDogUmU6IFtQb3dlcnRvcF0gc2VnZmF1bHQgb24gU2hlZXZhcGx1ZyAoQVJNIEtpcmt3
b29kKTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIE9uICgwNS8yMC8xMiAwMjoxOSksIFJ1aSBE
YUNvc3RhIHdyb3RlOjxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgICZndDsmbmJzcDsgU3VyZSBh
bmQgdGhhbmtzLDxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgICZndDsmbmJzcDsgKHYxLjEzIHdv
cmtlZCBmaW5lIGJ0dyk8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAmZ3Q7Jm5ic3A7IFByb2Nl
c3NvciZuYnNwOyAmbmJzcDsgOiBGZXJvY2VvbiA4OEZSMTMxIHJldiAxICh2NWwpPGJyPiZndDsm
Z3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBCb2dvTUlQUyZuYnNwOyAmbmJzcDsgOiAxMTkx
LjExPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBGZWF0dXJlcyZuYnNwOyAm
bmJzcDsgOiBzd3AgaGFsZiB0aHVtYiBmYXN0bXVsdCBlZHNwPGJyPiZndDsmZ3Q7Jm5ic3A7ICZu
YnNwOyAgJmd0OyZuYnNwOyBDUFUgaW1wbGVtZW50ZXImbmJzcDsgJm5ic3A7IDogMHg1Njxicj4m
Z3Q7Jmd0OyZuYnNwOyAmbmJzcDsgICZndDsmbmJzcDsgQ1BVIGFyY2hpdGVjdHVyZTogNVRFPGJy
PiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBDUFUgdmFyaWFudCZuYnNwOyAmbmJz
cDsgOiAweDI8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAmZ3Q7Jm5ic3A7IENQVSBwYXJ0Jm5i
c3A7ICZuYnNwOyA6IDB4MTMxPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBD
UFUgcmV2aXNpb24mbmJzcDsKICZuYnNwOyA6IDE8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAm
Z3Q7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBIYXJkd2FyZSZuYnNwOyAm
bmJzcDsgOiBNYXJ2ZWxsIFNoZWV2YVBsdWcgUmVmZXJlbmNlIEJvYXJkPGJyPiZndDsmZ3Q7Jm5i
c3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBSZXZpc2lvbiZuYnNwOyAmbmJzcDsgOiAwMDAwPGJyPiZn
dDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0OyZuYnNwOyBTZXJpYWwmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgOiAwMDAwMDAwMDAwMDAwMDAwPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgJmd0
Ozxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgICZndDs8YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsm
bmJzcDsgJm5ic3A7ICBUaGFua3MsPGJyPiZndDsmZ3Q7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNw
OyAgV2VsbCwgdGhhdCdzIHRoZSBwcm9ibGVtLiBDdXJyZW50IGNwdSBpbmZvIHBhcnNlciBkb2Vz
bid0IHVuZGVyc3RhbmQgeW91cjxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIGNwdWluZm8gZm9y
bWF0LiBJdCBhd2FpdHMgZm9yIHNhbmUgdmFsdWVzIG9uIHNwZWNpYWwgcGxhY2VzLiBGb3IgZXhh
bXBsZSw8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICB3b3JkPGJyPiZndDsmZ3Q7Jm5ic3A7ICZu
YnNwOyAgInByb2Nlc3NvciIgc2hvdWxkIGJlIGZvbGxvd2VkIGJ5IGEgbnVtYmVyLCBub3QgbW9k
ZWwgbmFtZS48YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgIHByb2Nlc3NvciZuYnNwOyAmbmJzcDsgOiAyPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICB2ZW5kb3JfaWQmbmJzcDsgJm5ic3A7IDogR2VudWluZUludGVsPGJyPiZn
dDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBjcHUgZmFtaWx5Jm5ic3A7ICZuYnNw
OyA6CiA2PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBtb2RlbCZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA6IDM3PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICBib2dvbWlwcyZuYnNwOyAmbmJzcDsgOiA0NTIyLjY2PGJyPiZndDsmZ3Q7PGJy
PiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgd2hpbGUgY3B1aW5mbyBvbiB5b3VyIHN5c3RlbSBpcyB0
b3RhbGx5IGRpZmZlcmVudC48YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICB0
aGUgZm9sbG93aW5nIGlzIHVudGVzdGVkIHBhdGNoIChJJ20gYSBiaXQgc2tlcHRpY2FsKSBwbHVz
IEkgZG9uJ3QgaGF2ZTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIEFSTSBkZXZpY2UgZm9yIHRl
c3RpbmcuPGJyPiZndDsmZ3Q7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgLS0tPGJyPiZndDsm
Z3Q7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgc3JjL2NwdS9jcHUuY3BwIHwmbmJzcDsgMjYg
KysrKysrKysrKysrKystLS0tLS0tLS0tLS08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pPGJyPiZndDsmZ3Q7
PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgZGlmZiAtLWdpdCBhL3NyYy9jcHUvY3B1LmNwcCBi
L3NyYy9jcHUvY3B1LmNwcDxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIGluZGV4IDA5ZDRhMmQu
LjE0M2UxOGMgMTAwNjQ0PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgLS0tIGEvc3JjL2NwdS9j
cHUuY3BwPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgKysrIGIvc3JjL2NwdS9jcHUuY3BwPGJy
PiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgQEAgLTIyNSw3ICsyMjUsNyBAQCB2b2lkIGVudW1lcmF0
ZV9jcHVzKHZvaWQpPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IAogaWZz
dHJlYW0gZmlsZTs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIGNoYXIg
bGluZVsxMDI0XTs8YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAtJm5ic3A7
ICZuYnNwOyBpbnQgbnVtYmVyID0gLTE7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgKyZuYnNw
OyAmbmJzcDsgaW50IG51bWJlciA9IDE7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICBjaGFyIHZlbmRvclsxMjhdOzxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAgaW50IGZhbWlseSA9IDA7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICBpbnQgbW9kZWwgPSAwOzxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIEBAIC0yMzYs
NyArMjM2LDYgQEAgdm9pZCBlbnVtZXJhdGVfY3B1cyh2b2lkKTxicj4mZ3Q7Jmd0OyZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICByZXR1cm47PGJyPiZndDsmZ3Q7PGJy
PiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICB3aGlsZSAoZmlsZSkgezxicj4m
Z3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIC08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAgZmlsZS5nZXRsaW5lKGxpbmUsIHNpemVvZihsaW5lKSk7PGJy
PiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIGlmIChz
dHJuY21wKGxpbmUsICJ2ZW5kb3JfaWRcdCIsMTApID09IDApIHs8YnI+Jmd0OyZndDsmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBjaGFyICpj
Ozxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIEBAIC0yNDcsNDIgKzI0Niw0NSBAQCB2b2lkIGVu
dW1lcmF0ZV9jcHVzKHZvaWQpPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsKICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICBjKys7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBzdHJuY3B5KHZlbmRvcixjLCAxMjcpOzxi
cj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgIH08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAtJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IH08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICAtJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IGlmIChzdHJuY21wKGxpbmUsICJwcm9jZXNzb3JcdCIsMTApID09IDApIHs8YnI+
Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IH0gZWxz
ZSBpZiAoc3RybmNtcChsaW5lLCAicHJvY2Vzc29yXHQiLDEwKSA9PSAwKSB7PGJyPiZndDsmZ3Q7
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAg
Y2hhciAqYzs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICBjID0gc3RyY2hyKGxpbmUsICc6Jyk7PGJyPiZndDsmZ3Q7Jm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAgaWYg
KGMpIHs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIGMrKzs8YnI+Jmd0OyZndDsmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgIG51bWJlciA9IHN0cnRvdWxsKGMsIE5VTEwsCiAxMCk7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAgfTxicj4mZ3Q7
Jmd0OyZuYnNwOyAmbmJzcDsgIC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfTxicj4mZ3Q7
Jmd0OyZuYnNwOyAmbmJzcDsgIC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKHN0cm5j
bXAobGluZSwgImNwdSBmYW1pbHlcdCIsMTEpID09IDApIHs8YnI+Jmd0OyZndDsmbmJzcDsgJm5i
c3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IH0gZWxzZSBpZiAoc3RybmNtcChsaW5l
LCAiUHJvY2Vzc29yXHQiLDEwKSA9PSAwKSB7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgKyZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IGNoYXIgKmM7PGJyPiZndDsm
Z3Q7Jm5ic3A7ICZuYnNwOyAgKyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7IGMgPSBzdHJjaHIobGluZSwgJzonKTs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICArJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKGMpIHs8YnI+Jmd0OyZn
dDsmbmJzcDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyBjKys7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAgKyZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKCpjID09
ICcgJyk8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IGMrKzs8YnI+Jmd0
OyZndDsmbmJzcDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOwogc3RybmNweSh2ZW5kb3IsIGMsIDEyNyk7PGJyPiZndDsmZ3Q7
Jm5ic3A7ICZuYnNwOyAgKyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IH08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
IH0mbmJzcDsgZWxzZSBpZiAoc3RybmNtcChsaW5lLCAiY3B1IGZhbWlseVx0IiwxMSkgPT0gMCkg
ezxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgIGNoYXIgKmM7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAgYyA9IHN0cmNocihsaW5lLCAnOicpOzxi
cj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgIGlmIChjKSB7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBjKys7PGJyPiZndDsm
Z3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICBmYW1pbHkgPSBzdHJ0b3VsbChjLCBOVUxMLCAxMCk7PGJyPiZndDsm
Z3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAgfTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgfTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgIC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgaWYgKHN0cm5jbXAobGluZSwgIm1vZGVsXHQiLDYpID09IDApIHs8YnI+Jmd0OyZndDsmbmJz
cDsgJm5ic3A7ICArJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IH0gZWxzZSBpZiAoc3RybmNt
cChsaW5lLAogIm1vZGVsXHQiLDYpID09IDApIHs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBjaGFyICpjOzxicj4mZ3Q7
Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgIGMgPSBzdHJjaHIobGluZSwgJzonKTs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBpZiAoYykgezxicj4mZ3Q7Jmd0
OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAgYysrOzxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAgbW9kZWwgPSBzdHJ0
b3VsbChjLCBOVUxMLCAxMCk7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAgfTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsg
IC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfTxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsg
IC0mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaWYgKHN0cm5jYXNlY21wKGxpbmUsICJib2dv
bWlwc1x0IiwgOSkgPT0gMCkgezxicj4mZ3Q7Jmd0OyZuYnNwOyAmbmJzcDsgICsmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgfSBlbHNlIGlmIChzdHJuY2FzZWNtcChsaW5lLCAiYm9nb21pcHNc
dCIsIDkpID09IDApIHs8YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBoYW5kbGVfb25lX2NwdShudW1iZXIsIHZlbmRvciwg
ZmFtaWx5LCBtb2RlbCk7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOwogJm5ic3A7ICZuYnNwOyAmbmJzcDsgIHNldF9tYXhfY3B1KG51bWJlcik7PGJyPiZndDsm
Z3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIH08YnI+Jmd0OyZn
dDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIH08YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsm
bmJzcDsgJm5ic3A7ICAtPGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICBm
aWxlLmNsb3NlKCk7PGJyPiZndDsmZ3Q7PGJyPiZndDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICBwZXJmX2V2ZW50cyA9IG5ldyBwZXJmX3Bvd2VyX2J1bmRsZSgpOzxicj4mZ3Q7Jmd0
OyZuYnNwOyAmbmJzcDsgIC08YnI+Jmd0OyZndDsmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
IGlmICghcGVyZl9ldmVudHMtJmd0O2FkZF9ldmVudCgicG93ZXI6Y3B1X2lkbGUiKSl7PGJyPiZn
dDsmZ3Q7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIHBlcmZfZXZl
bnRzLSZndDthZGRfZXZlbnQoInBvd2VyOnBvd2VyX3N0YXJ0Iik7PGJyPiZndDsmZ3Q7Jm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgIHBlcmZfZXZlbnRzLSZndDthZGRf
ZXZlbnQoInBvd2VyOnBvd2VyX2VuZCIpOzxicj48YnI+PGJyPjxicj4gPC9kaXY+IDwvZGl2PiAg
PC9kaXY+PC9ib2R5PjwvaHRtbD4=
--===============2033036667810999488==--

