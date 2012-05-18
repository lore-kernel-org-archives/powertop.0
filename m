Content-Type: multipart/mixed; boundary="===============4926412163824632777=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] factor out powertop_init() function [was
 "Segmentation fault occurs with --calibrate"]
Date: Fri, 18 May 2012 13:13:27 +0300
Message-ID: <20120518101327.GA3074@swordfish>
In-Reply-To: 6002814.JjpEWR9aH8@penguin
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4926412163824632777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/18/12 09:49), Lekensteyn wrote:
> =

> On Thursday 17 May 2012 19:44:58 Sergey Senozhatsky wrote:
> > [PATCH] factor out powertop_init() function
> > =

> > Factor out powertop_init() function to perform basic initialization on
> > powertop start up.
> > =

> > Commit 057d6126eb6329c86b29a2e0219c0d0e49a84191 moved init after
> > commandline options parsing. However, in some cases we need it before
> > parsing, e.g. -- calibration.
> > =

> > Reported-by: Lekensteyn <lekensteyn(a)gmail.com>
> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>


Please Cc the list next time.

>
>
> Tested-by: Lekensteyn <lekensteyn(a)gmail.com>
> =


Thank you for testing.

> Now this problem is solved, I hit another problem with --calibrate. The =

> program throws an exception because my =

> /sys/class/power_supply/BAT0/current_now returns -ENODEV when the cable i=
s =

> removed from the laptop (and thus when the battery is being used). This i=
ssue =

> is at least in kernel 3.2, but probably occurs in 3.0 too. 2.6.38 is half =

> unaffected (only shortly after disconnecting the power cable). I saw some=
where =

> that this device is replaced by power_current (cannot remember exact name=
), =

> but I have no power... entries in the BAT0 directory.
> =

> With the 1.97 version from Debian, I do not see ACPI power estimate, but =
it =

> does not crash either. The old powertop 1 (1.13?) showed the ACPI power =

> estimate correctly.
> =

> The backtrace for the error:
> Loaded 0 prior measurements
> Cannot load from file /var/cache/powertop/saved_parameters.powertop
> Starting PowerTOP power estimate calibration =

> Calibrating idle
> terminate called after throwing an instance of 'std::ios_base::failure'
>   what():  basic_filebuf::underflow error reading the file
>

well, from the top of my head, the only sane solution is to catch fstream =

(as fstream cast) exceptions. =


I'll send a patch in a minute.

	-ss

 =

> #10 0x000000000041b0e3 in read_sysfs (filename=3D..., ok=3D0x7fffffffc45d=
) at =

> lib.cpp:190
> #11 0x0000000000441f84 in sysfs_power_meter::get_sysfs_attr (this=3D<opti=
mized =

> out>, attribute=3D<optimized out>, value=3D0x7fffffffd4ac)
>     at measurement/sysfs.cpp:44
> #12 0x00000000004420ff in sysfs_power_meter::set_rate_from_current =

> (this=3D0x83faf0, voltage=3D11.994) at measurement/sysfs.cpp:86
> #13 0x00000000004422c9 in sysfs_power_meter::measure (this=3D0x83faf0) at =

> measurement/sysfs.cpp:143
> #14 0x000000000043ff6d in end_power_measurement () at =

> measurement/measurement.cpp:86
> #15 0x0000000000442e3a in one_measurement (seconds=3D<optimized out>) at =

> main.cpp:190
> #16 0x000000000043f762 in idle_calibration () at calibrate/calibrate.cpp:=
423
> #17 calibrate () at calibrate/calibrate.cpp:466
> #18 0x00000000004066b5 in main (argc=3D2, argv=3D0x7fffffffe728) at main.=
cpp:379
> ... (gdb) up ...
> #10 0x000000000041b0e3 in read_sysfs (filename=3D..., ok=3D0x7fffffffc45d=
) at =

> lib.cpp:190
> 190             file >> i;
> (gdb) print filename.c_str()
> $2 =3D 0x844d78 "/sys/class/power_supply/BAT0/current_now"
> =

> Below is are the contents of the BAT0 directory with connected power cabl=
e:
> > alarm:0
> > charge_full:4231000
> > charge_full_design:5600000
> > charge_now:4231000
> > current_now:0
> > cycle_count:0
> > manufacturer:NOTEBOOK
> > model_name:BAT
> > present:1
> > serial_number:0001
> > status:Full
> > technology:Li-ion
> > type:Battery
> > uevent:POWER_SUPPLY_NAME=3DBAT0
> > uevent:POWER_SUPPLY_STATUS=3DFull
> > uevent:POWER_SUPPLY_PRESENT=3D1
> > uevent:POWER_SUPPLY_TECHNOLOGY=3DLi-ion
> > uevent:POWER_SUPPLY_CYCLE_COUNT=3D0
> > uevent:POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D11100000
> > uevent:POWER_SUPPLY_VOLTAGE_NOW=3D12720000
> > uevent:POWER_SUPPLY_CURRENT_NOW=3D0
> > uevent:POWER_SUPPLY_CHARGE_FULL_DESIGN=3D5600000
> > uevent:POWER_SUPPLY_CHARGE_FULL=3D4231000
> > uevent:POWER_SUPPLY_CHARGE_NOW=3D4231000
> > uevent:POWER_SUPPLY_MODEL_NAME=3DBAT
> > uevent:POWER_SUPPLY_MANUFACTURER=3DNOTEBOOK
> > uevent:POWER_SUPPLY_SERIAL_NUMBER=3D0001
> > voltage_min_design:11100000
> > voltage_now:12720000
> =

> And here with cable disconnected:
> > alarm:0
> > charge_full:4231000
> > charge_full_design:5600000
> > charge_now:4205000
> > grep: current_now: No such device
> > cycle_count:0
> > manufacturer:NOTEBOOK
> > model_name:BAT
> > present:1
> > serial_number:0001
> > status:Discharging
> > technology:Li-ion
> > type:Battery
> > uevent:POWER_SUPPLY_NAME=3DBAT0
> > uevent:POWER_SUPPLY_STATUS=3DDischarging
> > uevent:POWER_SUPPLY_PRESENT=3D1
> > uevent:POWER_SUPPLY_TECHNOLOGY=3DLi-ion
> > uevent:POWER_SUPPLY_CYCLE_COUNT=3D0
> > uevent:POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D11100000
> > uevent:POWER_SUPPLY_VOLTAGE_NOW=3D12263000
> > uevent:POWER_SUPPLY_CHARGE_FULL_DESIGN=3D5600000
> > uevent:POWER_SUPPLY_CHARGE_FULL=3D4231000
> > uevent:POWER_SUPPLY_CHARGE_NOW=3D4205000
> > uevent:POWER_SUPPLY_MODEL_NAME=3DBAT
> > uevent:POWER_SUPPLY_MANUFACTURER=3DNOTEBOOK
> > uevent:POWER_SUPPLY_SERIAL_NUMBER=3D0001
> > voltage_min_design:11100000
> > voltage_now:12263000
> =

> I am trying to find out which commit caused it.
> =

> Regards,
> Peter
>=20

--===============4926412163824632777==--

