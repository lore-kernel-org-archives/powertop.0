Content-Type: multipart/mixed; boundary="===============0638644496565214469=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Sun, 04 Nov 2012 22:47:57 -0800
Message-ID: <CABsxX9LUDU72h13LEDJ5jezRmgqb-c3cFeJcoLPKxD7EZOHoxw@mail.gmail.com>
In-Reply-To: 596858900.1109759.1352044283776.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0638644496565214469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 4, 2012 at 7:51 AM,  <cshanahan(a)comcast.net> wrote:
> Hello,
>
> I was reading PowerTOP documentation and was curious whether it could hel=
p me better manage power on my HP EliteBook 6930p laptop. I am running Powe=
rTOP v.2.0 on openSUSE 12.2 64-bit. After looking at some of my options fro=
m the Overview and Stats tabs, I elected to run 'powertop --calibrate' as t=
he docs suggest. PowerTOP did not complete the calibration process; it exit=
ed with a seg fault. Now the hardware button for WiFi (small button along t=
he top of the laptop near the screen) flashes constantly. I'm concerned tha=
t PowerTOP caused some sort of hardware problem and damaged my laptop.
>
> Is there a way for me to check what PowerTOP did to my machine?

the calibration file will be instrumental, check if there are any
files under /var/cache/powertop?

> Is there a way for me to completely revert any changes made by PowerTOP?

reboot.

Does the wifi LED still flash after a reboot? If so, I'm wondering if
it was RFKILL'ed. the 'rfkill' tool may be usable to un-rfkill it
again.

None of the changes powertop makes are permanent, and your systemd
should be operational if you reboot.

> uname -a
> Linux 6930p.site 3.4.11-2.16-desktop #1 SMP PREEMPT Wed Sep 26 17:05:00 U=
TC 2012 (259fc87) x86_64 x86_64 x86_64 GNU/Linux
>
> 6930p:~ # powertop --calibrate
> Starting PowerTOP power estimate calibration
> Calibrating idle
> Segmentation fault

If you can, compile powertop from git, enable debug symbols (-g) and
run it under gdb and capture a backtrace, that will help us a lot
already to figure out where the problem may be.

Cheers,


Auke

--===============0638644496565214469==--

