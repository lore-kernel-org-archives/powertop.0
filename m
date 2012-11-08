Content-Type: multipart/mixed; boundary="===============3664990930898769081=="
MIME-Version: 1.0
From: Paul Menzel <paulepanter at users.sourceforge.net>
Subject: [Powertop] Successful building using Clang
Date: Thu, 08 Nov 2012 11:15:27 +0100
Message-ID: <1352369727.4238.5.camel@mattotaupa>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3664990930898769081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear PowerTOP folks,


I do not know if anyone of you has tried it already, so I just share my
result.

Using Debian Sid/unstable with Clang 3.1-8 [1], PowerTOP built without
problems. Here is the log.

    $ git describe
    v2.1.1-33-g3c71131
    $ CC=3Dclang CXX=3Dclang++ ./configure
    $ make
    make  all-recursive
    make[1]: Entering directory `~/src/powertop'
    Making all in traceevent
    make[2]: Entering directory `~/src/powertop/traceevent'
      CC     event-parse.lo
    event-parse.c:5030:12: warning: comparison of unsigned enum expression =
< 0 is always false [-Wtautological-compare]
                    if (type < 0 || type >=3D PEVENT_FUNC_ARG_MAX_TYPES) {
                        ~~~~ ^ ~
    1 warning generated.
      CC     parse-filter.lo
    parse-filter.c:392:17: warning: implicit conversion from enumeration ty=
pe 'enum filter_exp_type' to different enumeration type
          'enum filter_op_type' [-Wconversion]
            arg->op.type =3D etype;
                         ~ ^~~~~
    parse-filter.c:405:17: warning: implicit conversion from enumeration ty=
pe 'enum filter_exp_type' to different enumeration type
          'enum filter_op_type' [-Wconversion]
            arg->op.type =3D etype;
                         ~ ^~~~~
    parse-filter.c:1042:27: warning: implicit conversion from enumeration t=
ype 'enum filter_cmp_type' to different enumeration type
          'enum filter_exp_type' [-Wconversion]
                                            arg =3D create_arg_cmp(ctype);
                                                  ~~~~~~~~~~~~~~ ^~~~~
    3 warnings generated.
      CC     parse-utils.lo
      CC     trace-seq.lo
      CCLD   libtraceevnet.la
    make[2]: Leaving directory `~/src/powertop/traceevent'
    Making all in src
    make[2]: Entering directory `~/src/powertop/src'
      CC     csstoh.o
      CCLD   csstoh
    ./csstoh "."/powertop.css css.h
    make  all-am
    make[3]: Entering directory `~/src/powertop/src'
      CXX    parameters/powertop-persistent.o
      CXX    parameters/powertop-learn.o
      CXX    parameters/powertop-parameters.o
      CXX    powertop-display.o
      CXX    cpu/powertop-cpu_core.o
      CXX    cpu/powertop-cpudevice.o
      CXX    cpu/powertop-cpu.o
      CXX    cpu/powertop-cpu_linux.o
      CXX    cpu/powertop-abstract_cpu.o
      CXX    cpu/powertop-cpu_package.o
      CXX    cpu/powertop-intel_cpus.o
      CXX    powertop-devlist.o
      CXX    powertop-lib.o
      CXX    report/powertop-report.o
      CXX    process/powertop-process.o
      CXX    process/powertop-processdevice.o
      CXX    process/powertop-powerconsumer.o
      CXX    process/powertop-timer.o
      CXX    process/powertop-work.o
      CXX    process/powertop-do_process.o
    process/do_process.cpp:190:13: warning: unused function 'dbg_printf_pev=
ent_info' [-Wunused-function]
    static void dbg_printf_pevent_info(struct event_format *event, struct p=
event_record *rec)
                ^
    1 warning generated.
      CXX    process/powertop-interrupt.o
      CXX    perf/powertop-perf.o
      CXX    perf/powertop-perf_bundle.o
      CXX    devices/powertop-i915-gpu.o
      CXX    devices/powertop-device.o
      CXX    devices/powertop-alsa.o
      CXX    devices/powertop-runtime_pm.o
      CXX    devices/powertop-thinkpad-fan.o
      CXX    devices/powertop-usb.o
      CXX    devices/powertop-ahci.o
      CXX    devices/powertop-thinkpad-light.o
      CXX    devices/powertop-rfkill.o
      CXX    devices/powertop-backlight.o
      CXX    devices/powertop-network.o
      CXX    tuning/powertop-bluetooth.o
    tuning/bluetooth.cpp:179:3: warning: ignoring return value of function =
declared with warn_unused_result attribute [-Wunused-result]
                    system("/usr/sbin/hciconfig hci0 up &> /dev/null &");
                    ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    tuning/bluetooth.cpp:182:2: warning: ignoring return value of function =
declared with warn_unused_result attribute [-Wunused-result]
            system("/usr/sbin/hciconfig hci0 down &> /dev/null");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2 warnings generated.
      CXX    tuning/powertop-cpufreq.o
    tuning/cpufreq.cpp:118:2: warning: ignoring return value of function de=
clared with warn_unused_result attribute [-Wunused-result]
            system("/sbin/modprobe cpufreq_ondemand > /dev/null 2>&1");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1 warning generated.
      CXX    tuning/powertop-tuning.o
      CXX    tuning/powertop-tuningusb.o
      CXX    tuning/powertop-ethernet.o
      CXX    tuning/powertop-tunable.o
      CC     tuning/powertop-iw.o
      CXX    tuning/powertop-wifi.o
      CXX    tuning/powertop-tuningsysfs.o
      CXX    tuning/powertop-runtime.o
      CXX    calibrate/powertop-calibrate.o
    calibrate/calibrate.cpp:297:3: warning: ignoring return value of functi=
on declared with warn_unused_result attribute [-Wunused-result]
                    write(fd, buffer, 64*1024);
                    ^~~~~ ~~~~~~~~~~~~~~~~~~~
    calibrate/calibrate.cpp:408:2: warning: ignoring return value of functi=
on declared with warn_unused_result attribute [-Wunused-result]
            system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    calibrate/calibrate.cpp:410:2: warning: ignoring return value of functi=
on declared with warn_unused_result attribute [-Wunused-result]
            system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    calibrate/calibrate.cpp:416:2: warning: ignoring return value of functi=
on declared with warn_unused_result attribute [-Wunused-result]
            system("DISPLAY=3D:0 /usr/bin/xset dpms force off");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    calibrate/calibrate.cpp:418:2: warning: ignoring return value of functi=
on declared with warn_unused_result attribute [-Wunused-result]
            system("DISPLAY=3D:0 /usr/bin/xset dpms force on");
            ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5 warnings generated.
      CXX    measurement/powertop-measurement.o
      CXX    measurement/powertop-power_supply.o
      CXX    measurement/powertop-acpi.o
      CXX    measurement/powertop-sysfs.o
      CXX    measurement/powertop-extech.o
    measurement/extech.cpp:290:2: warning: ignoring return value of functio=
n declared with warn_unused_result attribute [-Wunused-result]
            write(fd, " ", 1);
            ^~~~~ ~~~~~~~~~~
    1 warning generated.
      CXX    report/powertop-report-maker.o
      CXX    report/powertop-report-formatter-base.o
      CXX    report/powertop-report-formatter-csv.o
      CXX    report/powertop-report-formatter-html.o
      CXX    powertop-main.o
      CXX    cpu/powertop-intel_gpu.o
      CXXLD  powertop
    make[3]: Leaving directory `~/src/powertop/src'
    make[2]: Leaving directory `~/src/powertop/src'
    Making all in po
    make[2]: Entering directory `~/src/powertop/po'
    make[2]: Leaving directory `~/src/powertop/po'
    Making all in doc
    make[2]: Entering directory `~/src/powertop/doc'
    make[2]: F=C3=BCr das Ziel =C2=BBall=C2=AB ist nichts zu tun.
    make[2]: Leaving directory `~/src/powertop/doc'
    make[2]: Entering directory `~/src/powertop'
    make[2]: Leaving directory `~/src/powertop'
    make[1]: Leaving directory `~/src/powertop'

I did not do any other tests like comparing size and speed differences
of the generated code. Maybe somebody else has time to do that.


Thanks,

Paul


[1] http://packages.debian.org/changelogs/pool/main/c/clang/clang_3.1-8/cha=
ngelog#version3.1-8

--===============3664990930898769081==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaUVZRUFCRUNBQVlGQWxDYmhqOEFDZ2tRUFgxYUsyd09IVmk4T3dDZmM3NDNYQXNI
MHgyRXMxdnVBS2ZHSmtTbgo0WUFBbjE2TXdNd1pjRCt0cUlKZ0JRd3h0SzgyYm16cwo9K01DNQot
LS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============3664990930898769081==--

