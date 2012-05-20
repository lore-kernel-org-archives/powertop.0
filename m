Content-Type: multipart/mixed; boundary="===============3885474422511816801=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Mon, 21 May 2012 01:05:54 +0300
Message-ID: <20120520220554.GB3585@swordfish>
In-Reply-To: 1337542376.55788.YahooMailNeo@web160303.mail.bf1.yahoo.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3885474422511816801==
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
>

Does perf tool work for you?

	-ss

 =

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

>    From: Rui DaCosta <ruidc(a)yahoo.com>
>    To: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>    Cc: Arjan van de Ven <arjan(a)linux.intel.com>; Chris Ferron
>    <chris.e.ferron(a)linux.intel.com>; "powertop(a)lists.01.org"
>    <powertop(a)lists.01.org>
>    Sent: Sunday, 20 May 2012, 13:01
>    Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
>    Thanks,
>    this has gotten past the issue. I now get:
>    PowerTOP v2.0 needs the kernel to support the 'perf' subsystem
>    as well as support for trace points in the kernel:
> =

>    CONFIG_PERF_EVENTS=3Dy
>    CONFIG_PERF_COUNTERS=3Dy
>    CONFIG_TRACEPOINTS=3Dy
>    CONFIG_TRACING=3Dy
> =

>    all these except CONFIG_PERF_COUNTERS are already set, so i'll need to=
 see
>    if i can get a kernel built with that option on.
>    Will this patch make it into trunk?
>    Many thanks.
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
>    <chris.e.ferron(a)linux.intel.com>; powertop(a)lists.01.org
>    Sent: Sunday, 20 May 2012, 11:34
>    Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
>    On (05/20/12 02:19), Rui DaCosta wrote:
>    > Sure and thanks,
>    > (v1.13 worked fine btw)
>    > Processor=C2=A0=C2=A0=C2=A0 : Feroceon 88FR131 rev 1 (v5l)
>    > BogoMIPS=C2=A0=C2=A0=C2=A0 : 1191.11
>    > Features=C2=A0=C2=A0=C2=A0 : swp half thumb fastmult edsp
>    > CPU implementer=C2=A0=C2=A0=C2=A0 : 0x56
>    > CPU architecture: 5TE
>    > CPU variant=C2=A0=C2=A0=C2=A0 : 0x2
>    > CPU part=C2=A0=C2=A0=C2=A0 : 0x131
>    > CPU revision=C2=A0=C2=A0=C2=A0 : 1
>    >
>    > Hardware=C2=A0=C2=A0=C2=A0 : Marvell SheevaPlug Reference Board
>    > Revision=C2=A0=C2=A0=C2=A0 : 0000
>    > Serial=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 0000000000000000
>    >
>    >
> =

>    Thanks,
> =

>    Well, that's the problem. Current cpu info parser doesn't understand y=
our
>    cpuinfo format. It awaits for sane values on special places. For examp=
le,
>    word
>    "processor" should be followed by a number, not model name.
> =

>    =C2=A0=C2=A0=C2=A0 processor=C2=A0=C2=A0=C2=A0 : 2
>    =C2=A0=C2=A0=C2=A0 vendor_id=C2=A0=C2=A0=C2=A0 : GenuineIntel
>    =C2=A0=C2=A0=C2=A0 cpu family=C2=A0=C2=A0=C2=A0 : 6
>    =C2=A0=C2=A0=C2=A0 model=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 : 37
>    =C2=A0=C2=A0=C2=A0 bogomips=C2=A0=C2=A0=C2=A0 : 4522.66
> =

>    while cpuinfo on your system is totally different.
> =

>    the following is untested patch (I'm a bit skeptical) plus I don't have
>    ARM device for testing.
> =

>    ---
> =

>    src/cpu/cpu.cpp |=C2=A0 26 ++++++++++++++------------
>    1 file changed, 14 insertions(+), 12 deletions(-)
> =

>    diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>    index 09d4a2d..143e18c 100644
>    --- a/src/cpu/cpu.cpp
>    +++ b/src/cpu/cpu.cpp
>    @@ -225,7 +225,7 @@ void enumerate_cpus(void)
>    =C2=A0=C2=A0=C2=A0 ifstream file;
>    =C2=A0=C2=A0=C2=A0 char line[1024];
> =

>    -=C2=A0=C2=A0=C2=A0 int number =3D -1;
>    +=C2=A0=C2=A0=C2=A0 int number =3D 1;
>    =C2=A0=C2=A0=C2=A0 char vendor[128];
>    =C2=A0=C2=A0=C2=A0 int family =3D 0;
>    =C2=A0=C2=A0=C2=A0 int model =3D 0;
>    @@ -236,7 +236,6 @@ void enumerate_cpus(void)
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;
> =

>    =C2=A0=C2=A0=C2=A0 while (file) {
>    -
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 file.getline(line, sizeof(line));
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "vendor_id\t",=
10) =3D=3D 0) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
>    @@ -247,42 +246,45 @@ void enumerate_cpus(void)
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 c++;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 strncpy(vendor,c, 127);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "processor\t"=
,10) =3D=3D 0) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "proce=
ssor\t",10) =3D=3D 0) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(=
line, ':');
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 c++;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 number =3D strtoull(c, NULL, 10);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "cpu family\t=
",11) =3D=3D 0) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "Proce=
ssor\t",10) =3D=3D 0) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr=
(line, ':');
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 c++;
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 if (*c =3D=3D ' ')
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 c++;
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 strncpy(vendor, c, 127);
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }=C2=A0 else if (strncmp(line, =
"cpu family\t",11) =3D=3D 0) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(=
line, ':');
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 c++;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 family =3D strtoull(c, NULL, 10);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncmp(line, "model\t",6) =
=3D=3D 0) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncmp(line, "model=
\t",6) =3D=3D 0) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char *c;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 c =3D strchr(=
line, ':');
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (c) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 c++;
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 model =3D strtoull(c, NULL, 10);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (strncasecmp(line, "bogomips=
\t", 9) =3D=3D 0) {
>    +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 } else if (strncasecmp(line, "b=
ogomips\t", 9) =3D=3D 0) {
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 handle_one_cp=
u(number, vendor, family, model);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 set_max_cpu(n=
umber);
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>    =C2=A0=C2=A0=C2=A0 }
> =

>    -
>    =C2=A0=C2=A0=C2=A0 file.close();
> =

>    =C2=A0=C2=A0=C2=A0 perf_events =3D new perf_power_bundle();
>    -
>    =C2=A0=C2=A0=C2=A0 if (!perf_events->add_event("power:cpu_idle")){
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 perf_events->add_event("power:po=
wer_start");
>    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 perf_events->add_event("power:po=
wer_end");

--===============3885474422511816801==--

