Content-Type: multipart/mixed; boundary="===============5675061447700649771=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [RFC 1/2] build: wrap Makefile.am to a more reasonable
 line length
Date: Mon, 21 May 2012 10:29:52 -0700
Message-ID: <4FBA7B90.7000604@linux.intel.com>
In-Reply-To: 1337140056-4037-1-git-send-email-vcgomes@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5675061447700649771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for this clean up. Sorry for the git failure. Patch 1/2 is accepted.
-Chris

On 05/15/2012 08:47 PM, Vinicius Costa Gomes wrote:
> This was causing git send-email to fail because a line had a length
> superior to 998 characters.
> ---
>
> Just for information, I had to use an undocumented feature of git send-em=
ail
> (--no-validate) to send this patch.
>
>   src/Makefile.am |   28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 0f9e172..935bdab 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -7,8 +7,32 @@ csstoh_SOURCES =3D csstoh.c
>   sbin_PROGRAMS =3D powertop
>   nodist_powertop_SOURCES =3D css.h
>
> -powertop_SOURCES =3D parameters/persistent.cpp parameters/learn.cpp para=
meters/parameters.cpp parameters/parameters.h display.cpp cpu/cpu_core.cpp =
cpu/cpudevice.cpp cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.=
cpp cpu/intel_cpus.h cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp=
 devlist.h devlist.cpp lib.cpp report.cpp process/process.cpp process/inter=
rupt.h process/timer.h process/processdevice.cpp process/powerconsumer.cpp =
process/work.h  process/timer.cpp process/process.h process/work.cpp proces=
s/do_process.cpp process/processdevice.h process/interrupt.cpp process/powe=
rconsumer.h report.h perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_=
bundle.h perf/perf_bundle.cpp display.h devices/rfkill.h devices/i915-gpu.c=
pp devices/device.cpp devices/alsa.cpp devices/runtime_pm.cpp devices/think=
pad-fan.cpp devices/usb.cpp devices/ahci.cpp devices/thinkpad-light.cpp dev=
ices/ahci.h devices/i915-gpu.h devices/network.h devices/rfkill.cpp devices=
/alsa.h devices/thi
>   nkpad-fan.h devices/device.h devices/usb.h devices/backlight.h devices/=
backlight.cpp devices/runtime_pm.h devices/thinkpad-light.h devices/network=
.cpp lib.h tuning tuning/cpufreq.h tuning/bluetooth.cpp tuning/cpufreq.cpp =
tuning/tuning.cpp tuning/tuningusb.cpp tuning/ethernet.cpp tuning/bluetooth=
.h tuning/tuning.h tuning/ethernet.h tuning/tunable.cpp tuning/nl80211.h tu=
ning/iw.c tuning/wifi.cpp tuning/tuningsysfs.h tuning/tuningsysfs.cpp tunin=
g/wifi.h tuning/runtime.cpp tuning/tunable.h tuning/runtime.h tuning/tuning=
usb.h tuning/iw.h calibrate/calibrate.cpp calibrate/calibrate.h measurement=
/measurement.cpp measurement/power_supply.cpp measurement/measurement.h mea=
surement/acpi.cpp measurement/sysfs.h measurement/sysfs.cpp measurement/acp=
i.h measurement/extech.cpp measurement/power_supply.h measurement/extech.h =
main.cpp css.h powertop.css
> -
> +powertop_SOURCES =3D parameters/persistent.cpp parameters/learn.cpp para=
meters/parameters.cpp \
> +		parameters/parameters.h display.cpp cpu/cpu_core.cpp cpu/cpudevice.cpp=
 \
> +		cpu/cpu.cpp cpu/cpu.h cpu/cpu_linux.cpp cpu/abstract_cpu.cpp cpu/intel=
_cpus.h \
> +		cpu/cpu_package.cpp cpu/cpudevice.h cpu/intel_cpus.cpp devlist.h devli=
st.cpp \
> +		lib.cpp report.cpp process/process.cpp process/interrupt.h process/tim=
er.h \
> +		process/processdevice.cpp process/powerconsumer.cpp process/work.h  \
> +		process/timer.cpp process/process.h process/work.cpp process/do_proces=
s.cpp \
> +		process/processdevice.h process/interrupt.cpp process/powerconsumer.h =
report.h \
> +		perf/perf.cpp perf/perf_event.h perf/perf.h perf/perf_bundle.h \
> +		perf/perf_bundle.cpp display.h devices/rfkill.h devices/i915-gpu.cpp \
> +		devices/device.cpp devices/alsa.cpp devices/runtime_pm.cpp \
> +		devices/thinkpad-fan.cpp devices/usb.cpp devices/ahci.cpp \
> +		devices/thinkpad-light.cpp devices/ahci.h devices/i915-gpu.h \
> +		devices/network.h devices/rfkill.cpp devices/alsa.h devices/thinkpad-f=
an.h \
> +		devices/device.h devices/usb.h devices/backlight.h devices/backlight.c=
pp \
> +		devices/runtime_pm.h devices/thinkpad-light.h devices/network.cpp lib.=
h \
> +		tuning tuning/cpufreq.h tuning/bluetooth.cpp tuning/cpufreq.cpp \
> +		tuning/tuning.cpp tuning/tuningusb.cpp tuning/ethernet.cpp tuning/blue=
tooth.h \
> +		tuning/tuning.h tuning/ethernet.h tuning/tunable.cpp tuning/nl80211.h \
> +		tuning/iw.c tuning/wifi.cpp tuning/tuningsysfs.h tuning/tuningsysfs.cp=
p \
> +		tuning/wifi.h tuning/runtime.cpp tuning/tunable.h tuning/runtime.h \
> +		tuning/tuningusb.h tuning/iw.h calibrate/calibrate.cpp \
> +		calibrate/calibrate.h measurement/measurement.cpp measurement/power_su=
pply.cpp \
> +		measurement/measurement.h measurement/acpi.cpp measurement/sysfs.h \
> +		measurement/sysfs.cpp measurement/acpi.h measurement/extech.cpp \
> +		measurement/power_supply.h measurement/extech.h main.cpp css.h powerto=
p.css
>
>   powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector =
-Wall -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS=
) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS)
>
> --
> 1.7.10.2
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>
>



--===============5675061447700649771==--

