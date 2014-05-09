Content-Type: multipart/mixed; boundary="===============1769641175401116795=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] segmentation fault when shutting down
Date: Fri, 09 May 2014 11:27:31 +0300
Message-ID: <20140509082731.GD937@swordfish>
In-Reply-To: 20140509081800.GC937@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1769641175401116795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/09/14 11:18), Sergey Senozhatsky wrote:
> On (05/09/14 08:14), Joerg Mayer wrote:
> > I also get a segfault.
> > =

> > Ciao
> >     J=C3=B6rg
> > =

> > powertop (git describe: v2.6-rc2-1-gb162f5d)
> > =

> > (gdb) bt
> > #0  0x00000010 in ?? ()
> > #1  0x0805339b in close_display () at ../../src/display.cpp:94
> > #2  0x08090c30 in clean_shutdown () at ../../src/main.cpp:365
> > #3  0x0804e575 in main (argc=3D1, argv=3D0xbff65814) at ../../src/main.=
cpp:500
> > (gdb) quit
> > =

> =

> ok... I took a quick look, and I didn't understand some things.
> =

> =

> commit eb08d4480969c8e48347c7621bd96dc248ee2138
> Author: Dan Kalowsky <daniel.kalowsky(a)intel.com>
> Date:   Mon Apr 28 13:52:05 2014 -0700
> =

>     Remove another memory leak

	how did you spot that?

>     =

>     Pointer gets over written without ever being properly cleaned up.  Th=
is
>     should solve that problem.
> =


and my next silly question is -- can someone please explain to me
what pointer is overwritten (in original code) in

	tuning_window::window_refresh() -> clear_tuning(), init_tuning()
	=

chain?

	-ss

> 	+class tuning_window *tune_window;
> 	+
> 	 class tuning_window: public tab_window {
> 	 public:
> 	        virtual void repaint(void);
> 	@@ -80,6 +82,11 @@ void initialize_tuning(void)
> 	        init_tuning();
> 	 =

> 	        w->cursor_max =3D all_tunables.size() - 1;
> 	+
> 	+       if (tune_window)
> 	+               delete tune_window;
> 	+
> 	+       tune_window =3D w;
> 	 }
> 	 =

> 	=

> 	@@ -305,6 +312,10 @@ void clear_tuning()
> 	                delete all_untunables[i];
> 	        }
> 	        all_untunables.clear();
> 	+
> 	+       if (tune_window)
> 	+               delete tune_window;
> 	+       tune_window =3D NULL;
> 		^^^^^^^^^
> 	 }
> 	 =

> 	 void auto_toggle_tuning()
> =

> =

> tuning_window::window_refresh() calls clear_tuning(). which deletes tune_=
window
> and sets it to NULL. then init_tuning() called.
> =

> the fishy part is that it all happens within that `if (w)' in display.cpp=
 window_refresh()
> =

>         if (w) {
>                 w->ypad_pos =3D 0;
>                 w->xpad_pos =3D 0;
>                 w->window_refresh();
> 		^^^^^ here we kill tuning_window
>                 w->repaint();
> 		^^^^^ and here we try to execute its function?
>         }
> =

> can someone check (or prove me wrong) if we actually have problems here?
> if we do -- then was it actually tested?
> =

> 	-ss
> =

> > jmayer(a)egg:~/work/power/powertop/git/build(master)> lsb_release -a
> > LSB Version: core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-i=
a32:core-3.2-ia32:core-4.0-ia32:desktop-4.0-ia32:desktop-4.0-noarch:graphic=
s-2.0-ia32:graphics-2.0-noarch:graphics-3.2-ia32:graphics-3.2-noarch:graphi=
cs-4.0-ia32:graphics-4.0-noarch
> > Distributor ID: openSUSE project
> > Description:    openSUSE 13.1 (Bottle) (i586)
> > Release:        13.1
> > Codename:       Bottle
> > =

> > jmayer(a)egg:~/work/power/powertop/git/build(master)> uname -a
> > Linux egg 3.14.2-1.g1474ea5-desktop #1 SMP PREEMPT Sun Apr 27 14:35:22 =
UTC 2014 (1474ea5) i686 i686 i386 GNU/Linux
> > =

> > =

> > jmayer(a)egg:~/work/power/powertop/git/build(master)> cat /proc/cpuinfo
> > processor       : 0
> > vendor_id       : GenuineIntel
> > cpu family      : 6
> > model           : 23
> > model name      : Intel(R) Core(TM)2 Duo CPU     T8300  @ 2.40GHz
> > stepping        : 6
> > microcode       : 0x60f
> > cpu MHz         : 2400.000
> > cache size      : 3072 KB
> > physical id     : 0
> > siblings        : 2
> > core id         : 0
> > cpu cores       : 2
> > apicid          : 0
> > initial apicid  : 0
> > fdiv_bug        : no
> > f00f_bug        : no
> > coma_bug        : no
> > fpu             : yes
> > fpu_exception   : yes
> > cpuid level     : 10
> > wp              : yes
> > flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge =
mca cmov pat
> > +pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_t=
sc arch_perfmon
> > +pebs bts aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 x=
tpr pdcm sse4_1
> > +lahf_lm ida dtherm tpr_shadow vnmi flexpriority
> > bogomips        : 4788.29
> > clflush size    : 64
> > cache_alignment : 64
> > address sizes   : 36 bits physical, 48 bits virtual
> > power management:
> > [output for processor 1 deleted]
> > =

> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop

--===============1769641175401116795==--

