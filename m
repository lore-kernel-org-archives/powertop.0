Content-Type: multipart/mixed; boundary="===============4526899621064703593=="
MIME-Version: 1.0
From: cshanahan at comcast.net
Subject: Re: [Powertop] Strange Behavior - PowerTOP 2.0 Seg Fault
Date: Fri, 09 Nov 2012 01:29:25 +0000
Message-ID: <756769513.1331735.1352424565819.JavaMail.root@sz0055a.westchester.pa.mail.comcast.net>
In-Reply-To: CABsxX9LUDU72h13LEDJ5jezRmgqb-c3cFeJcoLPKxD7EZOHoxw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4526899621064703593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> I was reading PowerTOP documentation and was curious whether it could he=
lp me
>> better manage power on my HP EliteBook 6930p laptop. I am running PowerT=
OP
>> v.2.0 on openSUSE 12.2 64-bit. After looking at some of my options from =
the
>> Overview and Stats tabs, I elected to run 'powertop --calibrate' as the =
docs
>> suggest. PowerTOP did not complete the calibration process; it exited wi=
th a
>> seg fault. Now the hardware button for WiFi (small button along the top =
of
>> the laptop near the screen) flashes constantly. I'm concerned that Power=
TOP
>> caused some sort of hardware problem and damaged my laptop.
>>
>> Is there a way for me to check what PowerTOP did to my machine?
>
>
> the calibration file will be instrumental, check if there are any
> files under /var/cache/powertop?


Yes, there are two files in /var/cache/powertop/ though they are empty.

cms(a)6930p:~> ll /var/cache/powertop/
total 8
drwxr-xr-x  2 root root 4096 Nov  4 10:10 ./
drwxr-xr-x 15 root root 4096 Nov  4 10:10 ../
-rw-r--r--  1 root root    0 Nov  4 10:48 saved_parameters.powertop
-rw-r--r--  1 root root    0 Nov  4 10:48 saved_results.powertop


>> Is there a way for me to completely revert any changes made by PowerTOP?
>
> reboot.


The problem persists after many reboots.


> Does the wifi LED still flash after a reboot? If so, I'm wondering if
> it was RFKILL'ed. the 'rfkill' tool may be usable to un-rfkill it
> again.


I'm not sure about this one, but rfkill in not installed on my machine.
Are you suggesting I install rfkill and use it to fix the problem?


> None of the changes powertop makes are permanent, and your systemd
> should be operational if you reboot.
>
> If you can, compile powertop from git, enable debug symbols (-g) and
> run it under gdb and capture a backtrace, that will help us a lot
> already to figure out where the problem may be.


I may try the newer version (v2.1) from RPM before compiling. I'll report
back.

Thank you for your suggestions.


--
Chris

--===============4526899621064703593==--

