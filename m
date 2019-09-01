Content-Type: multipart/mixed; boundary="===============7511687022883868373=="
MIME-Version: 1.0
From: Chris Murphy <lists at colorremedies.com>
Subject: [Powertop] powertop and upower disagree by order magnitude
Date: Sun, 01 Sep 2019 10:16:39 -0600
Message-ID: <CAJCQCtRahTcEdZU4r9vmNQwBPN1V1tJ-Y-mXuSG-j0ncwnS4Qg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7511687022883868373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Summary: powertop says I've got 43 hours battery left, upower says I've got=
 5.

model name    : Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz

kernel-5.3.0-0.rc6.git1.1.fc32.x86_64
powertop-2.10-2.fc30.x86_64
thermald-1.8-2.fc30.x86_64


$ sudo upower -d
Device: /org/freedesktop/UPower/devices/line_power_ACAD
  native-path:          ACAD
  power supply:         yes
  updated:              Sun 01 Sep 2019 09:42:27 AM MDT (511 seconds ago)
  has history:          no
  has statistics:       no
  line-power
    warning-level:       none
    online:              no
    icon-name:          'ac-adapter-symbolic'

Device: /org/freedesktop/UPower/devices/battery_BAT1
  native-path:          BAT1
  vendor:               Hewlett-Packard
  model:                PABAS0241231
  serial:               41167
  power supply:         yes
  updated:              Sun 01 Sep 2019 09:50:27 AM MDT (31 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               discharging
    warning-level:       none
    energy:              10.8801 Wh
    energy-empty:        0 Wh
    energy-full:         26.642 Wh
    energy-full-design:  38.115 Wh
    energy-rate:         2.112 W
    voltage:             7.26 V
    time to empty:       5.2 hours
    percentage:          40%
    capacity:            67.3939%
    technology:          lithium-ion
    icon-name:          'battery-good-symbolic'
  History (rate):
    1567353027    2.112    discharging

Device: /org/freedesktop/UPower/devices/DisplayDevice
  power supply:         yes
  updated:              Sun 01 Sep 2019 09:50:27 AM MDT (31 seconds ago)
  has history:          no
  has statistics:       no
  battery
    present:             yes
    state:               discharging
    warning-level:       none
    energy:              10.8801 Wh
    energy-full:         26.642 Wh
    energy-rate:         2.112 W
    time to empty:       5.2 hours
    percentage:          40%
    icon-name:          'battery-good-symbolic'

Daemon:
  daemon-version:  0.99.10
  on-battery:      yes
  lid-is-closed:   no
  lid-is-present:  yes
  critical-action: PowerOff
$

PowerTOP v2.10    Overview   Idle stats   Frequency stats   Device
stats   Tunables   WakeUp

The battery reports a discharge rate of 229 mW
The power consumed was 4.76 J
The estimated remaining time is 43 hours, 7 minutes

MUA is going to mess up the powertop paste, so this URL will have a
tidy version for a while
https://pastebin.com/raw/t1yxG0Av

PowerTOP v2.10    Overview   Idle stats   Frequency stats   Device
stats   Tunables   WakeUp

The battery reports a discharge rate of 229 mW
The power consumed was 4.76 J
The estimated remaining time is 43 hours, 7 minutes

Summary: 977.0 wakeups/second,  0.0 GPU ops/seconds, 0.0 VFS ops/sec
and 29.2% CPU use

                Usage       Events/s    Category       Description
             63.7 ms/s       6.9        kWork          intel_atomic_commit_=
work
             57.5 ms/s      52.8        Process        [PID 22591]
/usr/lib64/firefox/firefox -contentproc -childID 4 -isForBrowser
-prefsLen 7781 -prefMapSiz
             37.4 ms/s      59.9        Process        [PID 22336]
/usr/lib64/firefox/firefox --name firefox-wayland
             23.7 ms/s      26.5        Process        [PID 20600]
/usr/bin/gnome-shell
             14.1 ms/s     393.5        Timer          tick_sched_timer
              9.9 ms/s       4.3        Process        [PID 23518]
/usr/lib64/firefox/firefox -contentproc -childID 11 -isForBrowser
-prefsLen 10181 -prefMapS
              8.9 ms/s      53.2        Interrupt      PS/2 Touchpad /
Keyboard / Mouse
              7.0 ms/s      35.7        Process        [PID 22594]
/usr/lib64/firefox/firefox -contentproc -childID 4 -isForBrowser
-prefsLen 7781 -prefMapSiz
              6.3 ms/s      41.8        Process        [PID 22376]
/usr/lib64/firefox/firefox --name firefox-wayland
              5.8 ms/s       2.2        Process        [PID 23528]
/usr/lib64/firefox/firefox -contentproc -childID 12 -isForBrowser
-prefsLen 10181 -prefMapS
              5.1 ms/s      33.1        Interrupt      [7] sched(softirq)
              5.0 ms/s       1.9        Process        [PID 23611]
/usr/lib64/firefox/firefox -contentproc -childID 15 -isForBrowser
-prefsLen 10181 -prefMapS
              4.9 ms/s       2.7        Process        [PID 22439]
/usr/lib64/firefox/firefox -contentproc -childID 1 -isForBrowser
-prefsLen 1 -prefMapSize 1
              3.8 ms/s      27.8        Process        [PID 22427]
/usr/lib64/firefox/firefox --name firefox-wayland
              3.4 ms/s      0.00        Interrupt      [1] timer(softirq)
              2.9 ms/s      18.5        Timer          hrtimer_wakeup
              2.7 ms/s      75.6        Process        [PID 22423]
/usr/lib64/firefox/firefox --name firefox-wayland
              2.6 ms/s      0.20        kWork          delayed_fput
              2.3 ms/s      0.00        Interrupt      [9] RCU(softirq)
              2.2 ms/s       2.8        kWork          gc_worker
              2.1 ms/s       3.1        Process        [PID 23547]
/usr/lib64/firefox/firefox -contentproc -childID 13 -isForBrowser
-prefsLen 10181 -prefMapS
              2.0 ms/s       4.3        Process        [PID 22483]
/usr/lib64/firefox/firefox -contentproc -childID 2 -isForBrowser
-prefsLen 6086 -prefMapSiz
              1.7 ms/s      0.20        kWork          __i915_gem_free_work
              1.5 ms/s      0.20        kWork          btrfs_endio_write_he=
lper
              1.3 ms/s       3.6        Process        [PID 23384] [kworker=
/0:4]

<ESC> Exit | <TAB> / <Shift + TAB> Navigate |


A discharge rate of 229 mW is not likely.

The other problem though is that upower is all over the map, it varies
between 1 hour and 5 hours remaining. So I wonder if they're both
getting spurious data from the battery or from the kernel (not sure
how it works) and are just handling bad data differently?

Thanks,


--
Chris Murphy

--===============7511687022883868373==--

