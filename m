Content-Type: multipart/mixed; boundary="===============4331356204876717795=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [FYI][RFC][PATCH 0/2] MALI GPU profiling support
Date: Thu, 01 Nov 2012 16:00:37 +0400
Message-ID: <1351771239-18925-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4331356204876717795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch-set adds the ability of profiling MALI GPU in Powertop.

Disclaimer:
This patch-set is far from perfect and I know it. ;-)
It is just an initial review attempt.

Tha MALI GPU profiling patch is written in C-style because initially
there was a C-program. Yes, it is possible to rewrite is in C++ if needed.

But now I would know whether it fits into the Powertop at all?

And here is some explanation of what inside the box.

	*** MALI GPU profiling with PowerTOP ***

		** MALI GPU **

Mali GPU consists of several Geometry Processor units (GP) and Pixel Proces=
sor
units (PP). For example, MALI 400 MP GPU has one Geometry Processor (GP0) a=
nd
four Pixel Processors (PP0, PP1, PP2 and PP3). Also MALI GPU may contain ot=
her
units such as L2 cache. But now I don't know how to profile them.

			* PseudoWatt definition *

Consumed power approximately can be computed as this [1]:

          2
    P =3D CV f, /* P =3D C*V*V*f */

(where C is capacitance, V is voltage and f is frequency).

We don't need exact Watts so we consider that 1 PW (PseudoWatt) is consumed
running one GPU unit (GPx or PPx) on 266 MHz and 1 Volt. So I consider
capacitance equal to 1 / 266 000 000.

		** Event types **

There are two types of profiling events visible from user-space application=
s:
performance counters and trace events.

			* Performance counters *

There are two performance counter registers per each GPx, PPx or L2 unit in
the MALI GPU. Each register can count events of specified type. One can
specify the type of interesting event by writing a value in the correspondi=
ng
performance counter source register. Event types can be found in technical
reference manual for MALI GPU.

Such events are counted on per GPU basis because GPU has no information what
process runs specified task. So we cannot use these performance counters to
measure per-process activity. Also only two types of events can be counted
simultaneously for any GPU unit because there are only two counter registers
per unit.

			* Trace events *

MALI GPU kernel module provide events information by the means of pseudo-fi=
les
in /sys filesystem (actual for r3p0 driver version). There are two exclusive
ways to get profiling events from kernel module -- Linux trace points and
internal profiling format. The way which will be used is defined at the
compile time. In the file drivers/media/video/samsung/mali_r3p0/Makefile th=
ere
is variable USING_INTERNAL_PROFILING that is set to 1 when internal profili=
ng
mode is used and is set to 0 when trace points are used. By default it is s=
et
to 1 (internal profiling mode).

			* Trace points *

In trace points mode MALI GPU events are available through the standard
mechanism of Linux kernel trace points. To grab MALI trace events one should
write mali_timeline_event string to the file /sys/kernel/debug/tracing/set
event. Then it is possible to read events from the file
/sys/kernel/debug/tracing/trace_pipe.

This trace point is defined in the file
drivers/media/video/samsung/mali_r3p0/linux/mali_linux.trace.h in Linux ker=
nel
source tree [2]. As you may see each event has event identifier (event_id)
meaning the type of event and five event parameters (d0 through d4) contain=
ing
additional information. Not all parameters are required for all types of
events. For that events these parameters are set to zero.

As you may see by the next line only event identifier provided to user space
by the means of trace points:

	TP_printk("event=3D%d", __entry->event_id)

It is not suitable because we need to know more information for proper event
handling.

The other way of getting trace events information is the sys_perf_event_open
system call. But MALI GPU driver doesn't provide all needed events in this
way. In particular such events as voltage and frequency change are available
only by using internal profiling method.

So we have to use internal profiling method in PowerTOP (or we could enhance
MALI GPU driver written by ARM to provide all needed events via trace point=
s).

			* Internal profiling *

Internal profiling is the method provided by MALI GPU kernel module allowing
to collect more information about events (although there are no restrictions
preventing sending this information via trace points). This facility is
controlled by pseudo-files in /sys file-system.

To enable this facility to work one should write character 1 to the file
/sys/kernel/debug/mali/profiling/proc/default/enable. To disable profiling
write character 0.

When profiling is turned on it is possible to enable or disable events
recording by writing characters 1 or 0, respectively, to the file
/sys/kernel/debug/mali/profiling/record.

When event recording is on events information is collected in driver's
internal buffer. And when event recording is off this information is availa=
ble
in the file /sys/kernel/debug/mali/profiling/events. When event recording
is on this file is empty.

			* Event format *

Each event is reported as a text line consisting of seven decimal numbers l=
ike
this:

	1329701288752682877 34013184 0 0 4294967295 0 0

First number is the UNIX time with nanosecond resolution (number of
nanoseconds since Jan 1-st of 1970).

Second number is the event identifier in the following format:

Bit number:	31 - 28		27 - 24		23 - 16		15 - 00
Type of field:	Reserved	Type		Channel		Data

The Type field denotes event type. This field can accept the following valu=
es:

Value	Type		Description
0	SINGLE		Single event
1	START		Start rendering job
2	STOP		Stop rendering job
3	SUSPEND
4	RESUME

The Channel field denotes event channel or source. This field can accept the
following values:

Value	Channel		Description
00	SOFTWARE	Events came from user-space
01	GP0		Geometry Processor
05	PP0		Pixel Processors
06	PP1
07	PP2
08	PP3
09	PP4
10	PP5
11	PP6
12	PP7
21	GPU		GPU Core

The Data field contains event subtype which can be used to concretize
particular event type. The meaning of this field depends on the value of Ty=
pe
field.

For events of type SINGLE from SOFTWARE channel this field can accept the
following values:

Value	Type			Description
0	NONE			(Unused?)
1	EGL_NEW_FRAME		(Unused?)
2	FLUSH			(Unused?)
3	EGL_SWAP_BUFFERS	(Unused?)
4	GPU_FREQ		GPU frequency was changed
5	GPU_VOLTS		GPU voltage was changed
6	GLOBAL_TRY_LOCK
7	GLOBAL_LOCK
8	GLOBAL_UNLOCK
9	VBLANK_VSYNC

For events of type SINGLE from GP0 and PP0 through PP7 channels this field =
can
accept the following values:

Value	Type
0	NONE
1	INTERRUPT
2	FLUSH

And for events of type SINGLE from GPU channel this field can accept follow=
ing
value:

Value	Type			Description
10	FREQ_VOLT_CHANGE	GPU frequency and voltage was changed

Data fields d0 through d4 contains data specific to particular event. If so=
me
fields are not used it's set to zero.

		** Computing the power consumption **

			* Useful events *

There are several types of events that are used to calculate power
consumption. First of all it is rendering job starting and stopping events.
For START event PowerTop records PID of the process started the job, the ti=
me
of start and GPU unit name the job is running on (PP0, PP1,... PP7). PID of
the process can be found in the field d0.

When PowerTOP receives the STOP event, this mean that rendering job was
stopped and it is possible to calculate its duration. This duration will be
used to calculate power consumption.

Also there are three types of events related to GPU core frequency and/or
voltage change. PowerTOP tracks current values of frequency and voltage.

			* Power consumption *

Power consumption of the GPU depends on frequency and voltage the GPU core =
is
operating on. When voltage and/or frequency was changed PowerTOP split curr=
ent
running tasks if any into two (one with old values and another with new
values). So for each rendering task PowerTOP knows its duration, frequency =
and
voltage of the GPU core and the PID of the process started this task. That =
is
power consumed for particular task rendering can be computed using the form=
ula
above. By adding together power consumed by individual tasks PowerTOP can
calculate total power consumption for each process.

The MALI GPU power consumption information can be found in a table named
"Overview of MALI GPU power consumers" in PowerTOP HTML-report.

		** Deficiencies **

			* Process names *

Sometimes PowerTOP cannot properly display process name when it was started
after PowerTOP start and was terminated before PowerTOP finished to work. T=
his
can happen because process could generate only GPU-related events (and none=
 of
scheduler-related events) and GPU-related events contains only PID of proce=
ss
(not the command line or application name). And since the process was
terminated early, PowerTOP cannot resolve process name through the /proc
file-system because at that time there will be no entry for terminated
process.

This happen because of PowerTOP design. After start it asks the kernel to
collect events, then sleeps some seconds and reads events from the kernel a=
nd
process it. Some events (scheduler-related) contains process name and its
command line, and others not (e.g. GPU-related). So if some process doesn't
generated scheduler-related events and terminated before PowerTOP wakes aft=
er
sleep, then the PowerTOP can nowhere get information about process.

To solve this problem I have modified PowerTOP so it constantly monitors
/proc file-system for the new processes. And when it sees the new one it
collects process' information. PowerTOP monitors it once in a second. I thi=
nk
it is a good compromise between CPU load and frequent information collectin=
g.

The probability that some process (living less than a second) escapes
monitoring still exist, but it is much lower than in current version. At the
worst case (when process generate only GPU-related events during its very
short life) PowerTOP will display only PID for that process.

Anyway such an elusive process will not generate enough power consumption
to worry about.

			* Voltage/frequency independent change *

There are three type of events from MALI kernel module related to frequency=
 or
voltage changing:

	the voltage was changed,
	the frequency was changed,
	both of the voltage and the frequency was changed.

It is impossible to change only the frequency or only the voltage of CPU co=
re.
Both parameters are changed at the same time. But the driver can report any
set of these events in any order. Having a table with pairs of allowed
frequency/voltage values it is possible to deduce one value from another. B=
ut
that table will be GPU dependent and we don't have an information about all=
 of
MALI GPU chips.

Now it is possible a situation when PowerTOP sees an event of frequency or
voltage change after some job was started. PowerTOP will split the running
task, and the second half of the task will have slightly incorrect value of
frequency or voltage (old frequency with new voltage or vice verse). This m=
ay
lead to tiny computational errors.

			* Initial voltage and frequency values *

When PowerTOP starts on system with display turned on and some graphical
applications already running, there is a possibility for situation where so=
me
rendering job will be started before PowerTOP grabs the first voltage or
frequency setting event. So PowerTOP will be unaware of current frequency
and/or voltage value. Because of this it is impossible to correctly calcula=
te
power consumption for that task because it is impossible to ask the driver
about current frequency and voltage. And in the current version PowerTOP dr=
ops
jobs before first voltage or frequency change event (such events are freque=
nt
enough, so it's not a problem). It is possible to use some default value but
it will be GPU-dependent and we don't know what value to use.

Links:
	[1] http://en.wikipedia.org/wiki/CPU_power_dissipation
	[2] You can study MALI GPU driver for example in kernel for
	    Galaxy SIII phone found in archive named
	    GT-I9300_JB_Opensource_Update6.zip
	    on the site http://opensource.samsung.com/

Igor Zhbanov (2):
  Introducing process scanner facility
  MALI GPU profiling support

 src/Makefile.am                                   |    2 +
 src/main.cpp                                      |   17 +-
 src/mali-internal-events/mali-events.h            |  143 +++
 src/mali-internal-events/mali-internal-events.cpp | 1279 +++++++++++++++++=
++++
 src/mali-internal-events/proc-scan.cpp            |  316 +++++
 src/mali-internal-events/proc-scan.h              |   59 +
 src/process/process.cpp                           |   43 +
 7 files changed, 1857 insertions(+), 2 deletions(-)
 create mode 100644 src/mali-internal-events/mali-events.h
 create mode 100644 src/mali-internal-events/mali-internal-events.cpp
 create mode 100644 src/mali-internal-events/proc-scan.cpp
 create mode 100644 src/mali-internal-events/proc-scan.h

-- =

1.7.5.4


--===============4331356204876717795==--

