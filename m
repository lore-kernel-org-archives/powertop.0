Content-Type: multipart/mixed; boundary="===============8668973177858662335=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 00/12] various build system and static analysis
 improvement
Date: Sat, 02 Aug 2014 22:58:06 +0900
Message-ID: <20140802135806.GB1018@swordfish>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8668973177858662335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (08/02/14 12:54), Sami Kerola wrote:
> Hello,
> =

> Here is a set of various maintenance patches.  None very important, but I
> am hopeful they are seen as usefull enought to be merged to the project. =

> =

> While working with the patch set I noticed my  Arch linux kernel 3.15.8-1
> with powertop --auto-tune is printing
> =

> $ ./src/powertop --auto                                                  =
        =

> Loaded 242 prior measurements
> RAPL device for cpu 0
> RAPL device for cpu 0
>   unknown op '{'
> =

> An it seems the { is coming

this is well a known warning, in short plugin support needs to be
backported to traceevent.

	-ss

> /sys/kernel/debug/tracing/events/timer/hrtimer_expire_entry/format
> =

> Here's backtrace about about the message printout.
> =

> (gdb) bt
> #0  0x00007fe46e9eed67 in raise () from /usr/lib/libc.so.6
> #1  0x00007fe46e9f0118 in abort () from /usr/lib/libc.so.6
> #2  0x0000000000461c1e in process_op (event=3D0x13eb750, arg=3D0x13ebd30,=
 tok=3D0x7fff6efd8d08)
>     at event-parse.c:1905
> #3  0x000000000046328b in process_paren (event=3D0x13eb750, arg=3D0x13ebd=
30, tok=3D0x7fff6efd8d58)
>     at event-parse.c:2574
> #4  0x0000000000463af3 in process_arg_token (event=3D0x13eb750, arg=3D0x1=
3ebd30, tok=3D0x7fff6efd8df8, =

>     type=3DEVENT_DELIM) at event-parse.c:2833
> #5  0x000000000046103e in process_arg (event=3D0x13eb750, arg=3D0x13ebd30=
, tok=3D0x7fff6efd8df8)
>     at event-parse.c:1590
> #6  0x0000000000463260 in process_paren (event=3D0x13eb750, arg=3D0x13ebd=
30, tok=3D0x7fff6efd8e48)
>     at event-parse.c:2568
> #7  0x0000000000463af3 in process_arg_token (event=3D0x13eb750, arg=3D0x1=
3ebd30, tok=3D0x7fff6efd8ea8, =

>     type=3DEVENT_DELIM) at event-parse.c:2833
> #8  0x00000000004633af in process_paren (event=3D0x13eb750, arg=3D0x13ebc=
d0, tok=3D0x7fff6efd8ef8)
>     at event-parse.c:2609
> #9  0x0000000000463af3 in process_arg_token (event=3D0x13eb750, arg=3D0x1=
3ebcd0, tok=3D0x7fff6efd8f88, =

>     type=3DEVENT_DELIM) at event-parse.c:2833
> #10 0x000000000046103e in process_arg (event=3D0x13eb750, arg=3D0x13ebcd0=
, tok=3D0x7fff6efd8f88)
>     at event-parse.c:1590
> #11 0x0000000000463c12 in event_read_print_args (event=3D0x13eb750, list=
=3D0x13ebc70) at event-parse.c:2879
> #12 0x0000000000463e71 in event_read_print (event=3D0x13eb750) at event-p=
arse.c:2963
> #13 0x0000000000467fb3 in __pevent_parse_format (eventp=3D0x7fff6efd9080,=
 pevent=3D0x1178930, =

>     buf=3D0x13eb500 "name: hrtimer_expire_entry\nID: 128\nformat:\n\tfiel=
d:unsigned short common_type;\toffset:0;\tsize:2;\tsigned:0;\n\tfield:unsig=
ned char common_flags;\toffset:2;\tsize:1;\tsigned:0;\n\tfield:unsigned cha=
r common_pre"..., size=3D578, sys=3D0x13eb130 "timer") at event-parse.c:5014
> #14 0x00000000004681aa in pevent_parse_event (pevent=3D0x1178930, =

>     buf=3D0x13eb500 "name: hrtimer_expire_entry\nID: 128\nformat:\n\tfiel=
d:unsigned short common_type;\toffset:0;\tsize:2;\tsigned:0;\n\tfield:unsig=
ned char common_flags;\toffset:2;\tsize:1;\tsigned:0;\n\tfield:unsigned cha=
r common_pre"..., size=3D578, sys=3D0x13eb130 "timer") at event-parse.c:5099
> #15 0x000000000043db0a in parse_event_format (event_name=3D0x46f0bd "time=
r:hrtimer_expire_entry")
>     at perf/perf_bundle.cpp:147
> #16 0x000000000043dc59 in perf_bundle::add_event (this=3D0x117a2e0, =

>     event_name=3D0x46f0bd "timer:hrtimer_expire_entry") at perf/perf_bund=
le.cpp:173
> #17 0x0000000000443b91 in start_process_measurement () at process/do_proc=
ess.cpp:667
> #18 0x0000000000411a18 in one_measurement (seconds=3D1, workload=3D0x0) a=
t main.cpp:180
> #19 0x0000000000412408 in main (argc=3D2, argv=3D0x7fff6efdb2c8) at main.=
cpp:466
> =

> I do not know how to fix that, so hopefully someone who knows the sysfs
> file format in question notices this message and makes the code not to do
> that.
> =

> =

> Sami Kerola (12):
>   configure: use vertical lists and AS_IF macro
>   update .gitignore
>   clean up Makefile.am files
>   fix clang++ compilation errors
>   remove unnecessary assignments
>   remove unnecessary code reported by cppcheck
>   move options structure to function scope
>   do not use ncurses when --auto-tune is specified
>   improve manual groff syntax
>   fix couple typos
>   wrap lines in README.traceevent
>   clean up .gitignore file
> =

>  .gitignore                      | 110 ++++++++++-------------
>  Makefile.am                     |  14 ++-
>  README.traceevent               |  21 +++--
>  configure.ac                    | 102 ++++++++++++++++-----
>  doc/powertop.8                  | 141 ++++++++++++++---------------
>  src/Makefile.am                 | 193 +++++++++++++++++++++++++++++++---=
------
>  src/cpu/cpu.cpp                 |  18 ++--
>  src/cpu/rapl/rapl_interface.cpp |   4 +-
>  src/devices/ahci.cpp            |   3 +-
>  src/devices/alsa.cpp            |   1 -
>  src/devices/device.cpp          |   6 +-
>  src/devlist.cpp                 |   3 +-
>  src/display.cpp                 |   9 +-
>  src/lib.cpp                     |   8 +-
>  src/main.cpp                    |  50 ++++++-----
>  src/process/do_process.cpp      |  11 ++-
>  src/report/report.cpp           |   3 +-
>  src/tuning/nl80211.h            |   4 +-
>  src/tuning/runtime.cpp          |   4 -
>  src/tuning/tuning.cpp           |  11 +--
>  20 files changed, 445 insertions(+), 271 deletions(-)
> =

> -- =

> 2.0.3
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8668973177858662335==--

