Content-Type: multipart/mixed; boundary="===============0778145200680606302=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
Date: Mon, 21 May 2012 16:09:28 -0700
Message-ID: <4FBACB28.7040203@linux.intel.com>
In-Reply-To: 20120520215746.GA3585@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0778145200680606302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/20/2012 02:57 PM, Sergey Senozhatsky wrote:
> On (05/20/12 04:01), Rui DaCosta wrote:
>>     Thanks,
>>     this has gotten past the issue. I now get:
>>     PowerTOP v2.0 needs the kernel to support the 'perf' subsystem
>>     as well as support for trace points in the kernel:
>>
>>     CONFIG_PERF_EVENTS=3Dy
>>     CONFIG_PERF_COUNTERS=3Dy
>>     CONFIG_TRACEPOINTS=3Dy
>>     CONFIG_TRACING=3Dy
>>
>>     all these except CONFIG_PERF_COUNTERS are already set, so i'll need =
to see
>>     if i can get a kernel built with that option on.
>>
>>     Will this patch make it into trunk?
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
> 	-ss
>
>>     Many thanks.
>>
>>     =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>>
>>     From: Sergey Senozhatsky<sergey.senozhatsky(a)gmail.com>
>>     To: Rui DaCosta<ruidc(a)yahoo.com>
>>     Cc: Arjan van de Ven<arjan(a)linux.intel.com>; Chris Ferron
>>     <chris.e.ferron(a)linux.intel.com>; powertop(a)lists.01.org
>>     Sent: Sunday, 20 May 2012, 11:34
>>     Subject: Re: [Powertop] segfault on Sheevaplug (ARM Kirkwood)
>>     On (05/20/12 02:19), Rui DaCosta wrote:
>>     >  Sure and thanks,
>>     >  (v1.13 worked fine btw)
>>     >  Processor    : Feroceon 88FR131 rev 1 (v5l)
>>     >  BogoMIPS    : 1191.11
>>     >  Features    : swp half thumb fastmult edsp
>>     >  CPU implementer    : 0x56
>>     >  CPU architecture: 5TE
>>     >  CPU variant    : 0x2
>>     >  CPU part    : 0x131
>>     >  CPU revision    : 1
>>     >
>>     >  Hardware    : Marvell SheevaPlug Reference Board
>>     >  Revision    : 0000
>>     >  Serial        : 0000000000000000
>>     >
>>     >
>>
>>     Thanks,
>>
>>     Well, that's the problem. Current cpu info parser doesn't understand=
 your
>>     cpuinfo format. It awaits for sane values on special places. For exa=
mple,
>>     word
>>     "processor" should be followed by a number, not model name.
>>
>>         processor    : 2
>>         vendor_id    : GenuineIntel
>>         cpu family    : 6
>>         model        : 37
>>         bogomips    : 4522.66
>>
>>     while cpuinfo on your system is totally different.
>>
>>     the following is untested patch (I'm a bit skeptical) plus I don't h=
ave
>>     ARM device for testing.
>>
>>     ---
>>
>>     src/cpu/cpu.cpp |  26 ++++++++++++++------------
>>     1 file changed, 14 insertions(+), 12 deletions(-)
>>
>>     diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
>>     index 09d4a2d..143e18c 100644
>>     --- a/src/cpu/cpu.cpp
>>     +++ b/src/cpu/cpu.cpp
>>     @@ -225,7 +225,7 @@ void enumerate_cpus(void)
>>         ifstream file;
>>         char line[1024];
>>
>>     -    int number =3D -1;
>>     +    int number =3D 1;
>>         char vendor[128];
>>         int family =3D 0;
>>         int model =3D 0;
>>     @@ -236,7 +236,6 @@ void enumerate_cpus(void)
>>             return;
>>
>>         while (file) {
>>     -
>>             file.getline(line, sizeof(line));
>>             if (strncmp(line, "vendor_id\t",10) =3D=3D 0) {
>>                 char *c;
>>     @@ -247,42 +246,45 @@ void enumerate_cpus(void)
>>                         c++;
>>                     strncpy(vendor,c, 127);
>>                 }
>>     -        }
>>     -        if (strncmp(line, "processor\t",10) =3D=3D 0) {
>>     +        } else if (strncmp(line, "processor\t",10) =3D=3D 0) {
>>                 char *c;
>>                 c =3D strchr(line, ':');
>>                 if (c) {
>>                     c++;
>>                     number =3D strtoull(c, NULL, 10);
>>                 }
>>     -        }
>>     -        if (strncmp(line, "cpu family\t",11) =3D=3D 0) {
>>     +        } else if (strncmp(line, "Processor\t",10) =3D=3D 0) {
>>     +            char *c;
>>     +            c =3D strchr(line, ':');
>>     +            if (c) {
>>     +                c++;
>>     +                if (*c =3D=3D ' ')
>>     +                    c++;
>>     +                strncpy(vendor, c, 127);
>>     +            }
>>     +        }  else if (strncmp(line, "cpu family\t",11) =3D=3D 0) {
>>                 char *c;
>>                 c =3D strchr(line, ':');
>>                 if (c) {
>>                     c++;
>>                     family =3D strtoull(c, NULL, 10);
>>                 }
>>     -        }
>>     -        if (strncmp(line, "model\t",6) =3D=3D 0) {
>>     +        } else if (strncmp(line, "model\t",6) =3D=3D 0) {
>>                 char *c;
>>                 c =3D strchr(line, ':');
>>                 if (c) {
>>                     c++;
>>                     model =3D strtoull(c, NULL, 10);
>>                 }
>>     -        }
>>     -        if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
>>     +        } else if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
>>                 handle_one_cpu(number, vendor, family, model);
>>                 set_max_cpu(number);
>>             }
>>         }
>>
>>     -
>>         file.close();
>>
>>         perf_events =3D new perf_power_bundle();
>>     -
>>         if (!perf_events->add_event("power:cpu_idle")){
>>             perf_events->add_event("power:power_start");
>>             perf_events->add_event("power:power_end");


--===============0778145200680606302==--

