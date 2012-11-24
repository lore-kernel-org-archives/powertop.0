Content-Type: multipart/mixed; boundary="===============6926773272115538667=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Multiple Batteries
Date: Sat, 24 Nov 2012 15:29:13 +0300
Message-ID: <20121124122731.GA7100@swordfish>
In-Reply-To: CAKZK7uy6QP7xHvUpbhzz-Yh+SK2rBdzVNDcsBTgHG+=eiqGp4w@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6926773272115538667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/23/12 22:55), Justin Brown wrote:
>    Hello,
>    I'm using Powertop 2.1, and I've noticed a somewhat minor bug. (I coul=
dn't
>    find a public bug tracker, but would be more than happy to move this
>    discussion to one if someone could send me a URL.)

Hello, Justin
thanks for reporting.

>    I have two batteries in my laptop, but Powertop does not recognize both
>    when calculating battery life remaining. For example Gnome-Shell repor=
ts
>    that my batteries are at 66% and 100% (85% combined) giving me 10 hours
>    and 11 minutes of estimated time remaining. On the other hand, Powertop
>    reports just 3 hours 17 =EF=BF=BDminutes of time. Both programs are re=
porting the
>    proper discharge rate. It just seems like Powertop is only using my
>    smaller battery (the currently active one).

can you please post files

cat /sys/class/power_supply/BAT0/uevent
cat /sys/class/power_supply/BAT1/uevent

while on battery.

thanks,
	-ss

>    I'm not sure if this issue has been reported, or if the developers even
>    have equipment with which to test. I'm more than willing to provide any
>    sort of debugging output or testing as needed. I could also probably
>    create a patch, but that's likely to take a lot longer for me to get s=
etup
>    with development on this project.=EF=BF=BD
>    It may be as simple as iterating over a directory in /sys/ or /proc to
>    gather stats on multiple batteries. An experienced dev might be able to
>    fix it quickly.
>    Cheers,
>    Justin

--===============6926773272115538667==--

