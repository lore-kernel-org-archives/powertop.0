Content-Type: multipart/mixed; boundary="===============0095637672823622574=="
MIME-Version: 1.0
From: Kammela, Gayatri <gayatri.kammela at intel.com>
Subject: [Powertop] Re: [PATCH 1/3 v1] README.md: rename, add md syntax,
 and major tweaks
Date: Wed, 06 May 2020 18:01:19 +0000
Message-ID: <BYAPR11MB371859EDF83681DE6C5482F0F2A40@BYAPR11MB3718.namprd11.prod.outlook.com>
In-Reply-To: 20200504165014.6409-2-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0095637672823622574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Joe Konno <joe.konno(a)linux.intel.com>
> Sent: Monday, May 4, 2020 9:50 AM
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 1/3 v1] README.md: rename, add md syntax,
> and major tweaks
> =

> From: Joe Konno <joe.konno(a)intel.com>
> =

> Make the README file a markdown document and rename accordingly. Add
> markdown syntax where needed. Rewrite the clunkiest bits, and add
> additional documentation where appropriate.
> =

> While in the file, made the project name (PowerTOP) consistent. Also
> removed some trailing spaces, hard-wrapped lines to 80 characters, and a
> few other low-hanging changes that made sense with markdown.
> =

> Note that a "Copyright and License" section was added. No changes to
> existing terms, but that section is needed for completeness.
> =

> Reviewed-by: Doug Martin <doug.martin(a)intel.com>
> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> ---
>  README    | 157 -----------------------------------------
>  README.md | 204
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 204 insertions(+), 157 deletions(-)  delete mode 100644
> README  create mode 100644 README.md
> =

> diff --git a/README b/README
> deleted file mode 100644
> index a2c32ca79d9e..000000000000
> --- a/README
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -=EF=BB=BFBuild dependencies
> -------------------
> -PowerTOP uses C++, and expects g++ and libstdc++ to be functional -along
> with a glibc/pthreadsi, autoconf, automake, and libtool in the -developme=
nt
> environment.
> -
> -In addition to that, PowerTOP requires the following components:
> -
> -pciutils-devel (is only required if you have PCI) -ncurses-devel  (requi=
red)
> -libnl-devel    (required)
> -kernel version =3D> 2.6.38
> -
> -Example packages to install in Ubuntu:
> -
> -sudo apt install libpci-dev libnl-3-dev libnl-genl-3-dev gettext \ -libg=
ettextpo-
> dev autopoint gettext libncurses5-dev libncursesw5-dev libtool-bin \ -dh-
> autoreconf autoconf-archive pkg-config
> -
> -Building & Installing PowerTOP
> -------------------------------
> -
> -The autogen script is required to run only once to generate the configur=
e for
> -the build. Rest of the steps are required to run everytime there is a ch=
ange -
> made to the PowerTop.
> -
> -To build and install PowerTOP type the following commands,
> -       ./autogen.sh
> -       ./configure
> -       make
> -       sudo make install
> -
> -Note: For Android (running Intel Architecture ) there is a Android.mk -t=
hat
> was provided by community members, and at this time is supported -mostly
> by community members.
> -
> -Build PowerTop for Android LollyPop
> -------------------------------------
> -
> -1. Obtain pciutils and ncurses libraries.
> -   Skip this step if they are already in the tree.
> -
> -   pciutils: Clone
> -       https://github.com/trevd/android_external_pciutils
> -   into external/pciutils
> -
> -   ncurses: Clone
> -       https://github.com/cvpcs/android_external_libncurses
> -   into external/ncurses
> -
> -2. Run
> -       ./src/csstoh.sh src/powertop.css src/css.h
> -   to generate the css.h header file.
> -
> -3. Apply patches inside patches/Android
> -
> -4. PowerTop can be built with top level make,
> -   or by doing "mm".
> -
> -   The resulting binary is under
> $ANDROID_PRODUCT_OUT/system/bin/powertop
> -
> -
> -Kernel Parameters:
> -------------------
> -
> -PowerTOP needs some kernel config options enabled in order function
> properly.
> -As of linux-3.3.0 these are (list probably incomplete):
> -
> -CONFIG_NO_HZ
> -CONFIG_HIGH_RES_TIMERS
> -CONFIG_HPET_TIMER
> -CONFIG_CPU_FREQ_GOV_ONDEMAND
> -CONFIG_USB_SUSPEND
> -CONFIG_SND_AC97_POWER_SAVE
> -CONFIG_TIMER_STATS
> -CONFIG_PERF_EVENTS
> -CONFIG_PERF_COUNTERS
> -CONFIG_TRACEPOINTS
> -CONFIG_TRACING
> -CONFIG_EVENT_POWER_TRACING_DEPRECATED
> -CONFIG_X86_MSR
> -ACPI_PROCFS_POWER
> -CONFIG_DEBUG_FS
> -
> -Use these configs from linux-3.13.rc1
> -CONFIG_POWERCAP
> -CONFIG_INTEL_RAPL
> -
> -The patches in the patches/ sub-directory are required for PowerTOP to
> function -fully.
> -
> -
> -
> -Outputting a report
> --------------------
> -When invoking PowerTOP without arguments, PowerTOP starts in
> interactive mode.
> -However, for reporting bugs etc there is a special reporting modes:
> -
> -For an HTML formatted report simply execute PowerTOP with the following,
> -
> -powertop --html
> -
> -which will create a "powertop.html" file which is static and can be sent=
 to -
> others to help diagnose power issues. Additionally has the feature of
> showing -the tunables executions within the report as a reference.
> -
> -Note for the developers: If you make changes on the report format please=
 -
> make sure that the output can be cleanly validated by the W3C Markup -
> Validation Service and W3C CSS Validation Service:
> - * http://validator.w3.org/#validate_by_upload
> - * http://jigsaw.w3.org/css-validator/#validate_by_upload
> -
> -For a CSV formatted report, simply execute PowerTOP with the following,
> -
> -Powertop --csv
> -
> -which will create a =E2=80=9Cpowertop.csv=E2=80=9D file which is static =
and can be used in -
> reporting, diagnoses, and analytical data analysis.
> -
> -Also you can set the number of iterations, and duration of test, in which
> case -all reports will time stamp for you.
> -
> -Calibrating & Power Numbers
> ----------------------------
> -PowerTOP will, when running on battery, track your power consumption as
> well -as your activity on the system. Once there are sufficient such
> measurements, -PowerTOP can start to report power estimates for various
> activities.
> -You can help get this estimation more accurate by running a calibration
> -cycle:
> -
> -powertop --calibrate
> -
> -at least once; this will cycle through various display brightness levels=
 -
> (including "off") as well as USB device activities and some other workloa=
ds.
> -
> -
> -Code from other open source projects
> -------------------------------------
> -PowerTOP contains some code from other open source projects; we'd like
> to -thank the authors of those projects for their work.
> -Specifically PowerTOP contains code from
> -
> -Parse Event Library - Copyright 2009, 2010 Red Hat Inc  Steven Rosted
> <srostedt(a)redhat.com>
> -nl80211 userspace tool - Copyright 2007, 2008	Johannes Berg
> <johannes(a)sipsolutions.net>
> -
> -
> -Extech Power Analyzer / Datalogger support
> -------------------------------------------
> -I use, and our analysis teams use, the Extech Power Analyzer/Datalogger -
> (model number 380803) quite a lot, and PowerTOP supports using this -
> device over the serial cable. Just pass the device node on the command li=
ne -
> like this
> -
> -powertop --extech=3D/dev/ttyUSB0
> -
> -(where ttyUSB0 is the devicenode of the serial-to-usb adapter on my
> system)
> -
> diff --git a/README.md b/README.md
> new file mode 100644
> index 000000000000..600cb545cbbf
> --- /dev/null
> +++ b/README.md
> @@ -0,0 +1,204 @@
> +=EF=BB=BF# PowerTOP
> +
> +PowerTOP is a Linux* tool used to diagnose issues with power
> +consumption and power management. In addition to being a diagnostic
> +tool, PowerTOP also has an interactive mode you can use to experiment
> +with various power management settings, for cases where the Linux
> +distribution has not enabled those settings.
> +
> +
> +# Build dependencies
> +
> +PowerTOP is coded in C++. It was written for Linux-based operating
> systems.
> +GNU* libc (`glibc`) and Linux `pthreads` are needed for PowerTOP to
> +function properly. The GNU build system (`autoconf`, `automake`,
> +`make`, `libtool`), as well as `gettext`, are required to build PowerTOP.
> +
> +In addition, PowerTOP requires the following:
> +
> +* kernel version =3D> 2.6.38
> +* `ncurses-devel` (required)
> +* `libnl-devel` (required)
> +* `pciutils-devel` (is only required if you have PCI)
> +
> +Example packages to install in Ubuntu*:
> +
> +    sudo apt install libpci-dev libnl-3-dev libnl-genl-3-dev gettext \
> +    libgettextpo-dev autopoint gettext libncurses5-dev libncursesw5-dev
> libtool-bin \
> +    dh-autoreconf autoconf-archive pkg-config
> +
> +
> +# Building PowerTOP
> +
> +The `autogen.sh` script needs to be run only once to generate `configure=
`.
> +You need to re-run it only if the build system configuration files
> +(e.g. `configure.ac`) are modified. The remaining steps are required
> +whenever source files are modified.
> +
> +To build PowerTOP from the cloned source, use the following commands:
> +
> +    ./autogen.sh
> +    ./configure
> +    make
> +
> +**Note:** For Android* (running on Intel=C2=AE architecture) there is a
> +Android.mk that was provided by community members, and at this time is
> +supported mostly by community members.
> +
> +
> +## Build PowerTOP for Android Lollipop
Are these instructions up to date? Just curious as we haven=E2=80=99t had a=
 change to this section in a long time.
> +
> +1. Obtain pciutils and ncurses libraries. Skip this step if they are alr=
eady in
> +   the tree.
> +
> +```
> +pciutils: Clone
> +    https://github.com/trevd/android_external_pciutils
> +into external/pciutils
> +
> +ncurses: Clone
> +    https://github.com/cvpcs/android_external_libncurses
> +into external/ncurses
> +```
> +
> +2. Run the following command to generate the `css.h` header file:
> +    ./src/csstoh.sh src/powertop.css src/css.h
> +
> +3. Apply patches inside patches/Android
> +
> +4. PowerTOP can be built with top level make, or by doing `mm`.
> +
> +* The resulting binary is under
> +`$ANDROID_PRODUCT_OUT/system/bin/powertop`
> +
> +
> +# Kernel parameters
> +
> +PowerTOP needs some kernel config options enabled to function properly.
> +As of linux-3.3.0, these are (the list probably is incomplete):
> +
> +    CONFIG_NO_HZ
> +    CONFIG_HIGH_RES_TIMERS
> +    CONFIG_HPET_TIMER
> +    CONFIG_CPU_FREQ_GOV_ONDEMAND
> +    CONFIG_USB_SUSPEND
> +    CONFIG_SND_AC97_POWER_SAVE
> +    CONFIG_TIMER_STATS
> +    CONFIG_PERF_EVENTS
> +    CONFIG_PERF_COUNTERS
> +    CONFIG_TRACEPOINTS
> +    CONFIG_TRACING
> +    CONFIG_EVENT_POWER_TRACING_DEPRECATED
> +    CONFIG_X86_MSR
> +    ACPI_PROCFS_POWER
> +    CONFIG_DEBUG_FS
> +
> +Use these configs from linux-3.13.rc1:
> +
> +    CONFIG_POWERCAP
> +    CONFIG_INTEL_RAPL
> +
> +The patches in the `patches/` sub-directory are required for *full*
> +PowerTOP functionality.
> +
> +
> +# Outputting a report
> +
> +When PowerTOP is executed as root and without arguments, it runs in
> +interactive mode. In this mode, PowerTOP most resembles `top`.
> +
> +For generating reports, or for filing functional bug reports, there are
> +two output modes: CSV and HTML. You can set sample times, the number
> of
> +iterations, a workload over which to run PowerTOP, and whether to
> +include `debug`-level output.
> +
> +For an HTML report, execute PowerTOP with this option:
> +
> +    powertop --html=3Dreport.html
> +
> +This creates a static `report.html` file, suitable for sharing.
> +
> +For a CSV report, execute PowerTOP with this option:
> +
> +    powertop --csv=3Dreport.csv
> +
> +This creates a static `powertop.csv` file, also suitable for sharing.
> +
> +If you wish to file a functional bug report, generate and share a
> +`debug`-mode HTML report and share it, using the following command:
> +
> +    powertop --debug --html=3Dreport.html
> +
> +**Important Note:** As PowerTOP is intended for privileged (`root`)
> +use, your
> +reports-- especially when run with `--debug`-- will contain verbose
> +system information. PowerTOP **does not** sanitize, scrub, or otherwise
> +anonymize its reports. Be mindful of this when sharing reports.
> +
> +**Developers:** If you make changes to the HTML reporting code,
> +validate HTML output by using the W3C* Markup Validation Service and
> +the W3C CSS Validation
> +Service:
> +* http://validator.w3.org/#validate_by_upload
> +* http://jigsaw.w3.org/css-validator/#validate_by_upload
> +
> +
> +# Calibrating and power numbers
> +
> +PowerTOP, when running on battery, tracks power consumption and
> +activity on the system. Once there are sufficient measurements,
> +PowerTOP can start to report power estimates for various activities.
> +You can help increase the accuracy of the estimation by running a calibr=
ation
> cycle at least once:
> +
> +    powertop --calibrate
> +
> +*Calibration* entails cycling through various display brightness levels
> +(including "off"), USB device activities, and other workloads.
> +
> +
> +# Extech Power Analyzer / Datalogger support
> +
> +Our analysis teams use the Extech* Power Analyzer/Datalogger (model
> +number 380803). PowerTOP supports this device over the serial cable by
> +passing the device node on the command line using this command:
> +
> +    powertop --extech=3D/dev/ttyUSB0
> +
> +(where ttyUSB0 is the devicenode of the serial-to-usb adapter on our
> +system)
> +
> +
> +# Code from other open source projects
> +
> +PowerTOP contains some code from other open source projects; we'd like
> +to thank the authors of those projects for their work. Specifically,
> +PowerTOP contains code from
> +
> +```
> +Parse Event Library - Copyright 2009, 2010 Red Hat Inc  Steven Rosted
> <srostedt(a)redhat.com>
> +nl80211 userspace tool - Copyright 2007, 2008	Johannes Berg
> <johannes(a)sipsolutions.net>
> +```
> +
> +
> +# Copyright and License
> +
> +    PowerTOP
> +    Copyright (C) 2020  Intel Corporation
> +
> +    This program is free software; you can redistribute it and/or modify
> +    it under the terms of the GNU General Public License as published by
> +    the Free Software Foundation; version 2.
> +
> +    This program is distributed in the hope that it will be useful,
> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +    GNU General Public License for more details.
> +
> +    You should have received a copy of the GNU General Public License
> +    along with this program; if not, write to the Free Software
> +    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
> + 02110-1301  USA
> +
> +See `COPYING` file for a copy of the aforementioned (GPLv2) license.
> +
> +
> +## SPDX Tag
> +
> +    /* SPDX-License-Identifier: GPL-2.0-only */
> +
> +From: https://spdx.org/licenses/GPL-2.0-only.html
> --
> 2.26.2
> _______________________________________________
> PowerTop mailing list -- powertop(a)lists.01.org To unsubscribe send an e=
mail
> to powertop-leave(a)lists.01.org

--===============0095637672823622574==--

