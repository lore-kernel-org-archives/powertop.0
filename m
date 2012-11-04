Content-Type: multipart/mixed; boundary="===============8638333524650741328=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Sun, 04 Nov 2012 15:51:23 +0000
Message-ID: <596858900.1109759.1352044283776.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: 182829271.1109641.1352044001375.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8638333524650741328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I was reading PowerTOP documentation and was curious whether it could help =
me better manage power on my HP EliteBook 6930p laptop. I am running PowerT=
OP v.2.0 on openSUSE 12.2 64-bit. After looking at some of my options from =
the Overview and Stats tabs, I elected to run 'powertop --calibrate' as the=
 docs suggest. PowerTOP did not complete the calibration process; it exited=
 with a seg fault. Now the hardware button for WiFi (small button along the=
 top of the laptop near the screen) flashes constantly. I'm concerned that =
PowerTOP caused some sort of hardware problem and damaged my laptop.

Is there a way for me to check what PowerTOP did to my machine?
Is there a way for me to completely revert any changes made by PowerTOP?

uname -a
Linux 6930p.site 3.4.11-2.16-desktop #1 SMP PREEMPT Wed Sep 26 17:05:00 UTC=
 2012 (259fc87) x86_64 x86_64 x86_64 GNU/Linux

6930p:~ # powertop --calibrate
Starting PowerTOP power estimate calibration =

Calibrating idle
Segmentation fault


Any help would be greatly appreciated.

--
Chris

--===============8638333524650741328==--

