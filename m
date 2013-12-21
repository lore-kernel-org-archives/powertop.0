Content-Type: multipart/mixed; boundary="===============0779850538678492709=="
MIME-Version: 1.0
From: Sree Harsha Totakura <sreeharsha at totakura.in>
Subject: [Powertop] Idle power consumption of Intel e1000e kernel module
Date: Sat, 21 Dec 2013 11:57:48 +0100
Message-ID: <52B5742C.90009@totakura.in>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0779850538678492709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On my ThinkPad T440s, PowerTOP-2.5 shows that the e1000e kernel module
is drawing considerable amount of power when not it use (cable unplugged):

> The battery reports a discharge rate of 5.86 W
> The estimated remaining time is 5 hours, 11 minutes
> =

> Summary: 143.9 wakeups/second,  10.9 GPU ops/seconds, 0.0 VFS ops/sec and=
 2.7% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>   3.76 W     49.0%                      Device         Display backlight
>   1.46 W      0.0 pkts/s                Device         Network interface:=
 eth0 (e1000e)

What I observed is that, if I remove the e1000e kernel module with
`rmmod e1000e`, the corresponding entry in PowerTOP is gone, but the
battery discharge rate stays the same.  So, I am guessing there is
either a hardware short-circuit somewhere on the motherboard or a bug in
the underlying power management software or an estimation error.  Any
hints on how I can confirm/debug this?

Thanks,
Sree




--===============0779850538678492709==--

