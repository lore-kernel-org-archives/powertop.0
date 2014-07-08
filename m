Content-Type: multipart/mixed; boundary="===============4830483040790955144=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] not getting the power consumption numbers
Date: Tue, 08 Jul 2014 20:24:42 +0900
Message-ID: <20140708112442.GD947@swordfish>
In-Reply-To: CAETyQ1P9=FosHGecc2=bZEPasBft9m9yyBvT1T6rr8OgGy2sxA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4830483040790955144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/07/14 23:10), rahul shrivastava wrote:
>    Hi Sergey,
> =

>    I am running powertop without any argument. According to your mail,
>    powertop starts estimation after running it 3 times the number of
>    parameters.

parameters are meant as internal powertop data, not user supplied
arguments. start powertop, unplug your laptop (leave it on battery) and
give powertop enough time (it may make sense to decrease powertop
refresh time: press s button and set, say, to 3 sec).

	-ss

>    I have run it almost 6 7 times, but yet I am not getting power
>    figures. Could you please help me out here
> =

>    Regards
>    Rahul
> =

>    On Fri, Jul 4, 2014 at 5:35 PM, Sergey Senozhatsky
>    <[1]sergey.senozhatsky(a)gmail.com> wrote:
> =

>      On (07/04/14 10:19), rahul shrivastava wrote:
>      > Date: Fri, 4 Jul 2014 10:19:24 +0530
>      > From: rahul shrivastava <[2]rshrivastava2(a)gmail.com>
>      > To: [3]powertop(a)lists.01.org
>      > Subject: [Powertop] not getting the power consumption numbers
>      >
>      > =C2=A0 =C2=A0Hi,
>      > =C2=A0 =C2=A0While installing version 2.6.1, I got the following e=
rror -=C2=A0
>      > =C2=A0 =C2=A0make[2]: Entering directory
>      `/home/rahul/powertop/powertop-2.6.1/src'
>      > =C2=A0 =C2=A0/bin/bash ./csstoh.sh powertop.css css.h
>      > =C2=A0 =C2=A0/bin/bash: ./csstoh.sh: No such file or directory
> =

>      should be fixed by now, not sure if the fix is already included into
>      tarball, though.
>      > =C2=A0 =C2=A0So I installed version 2.5 and it compiled correctly.=
 But, I am not
>      > =C2=A0 =C2=A0getting the power consumption numbers. What I am gett=
ing is this
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Usage =C2=A0 =C2=A0 =C2=A0 Events/s =C2=A0 =C2=A0Category =C2=A0 =C2=A0 =
=C2=A0 Description
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A066.7 =
us/s =C2=A0 =C2=A0 =C2=A026.5 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[rcu_sched]
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 152.8 us/s =
=C2=A0 =C2=A0 =C2=A018.7 =C2=A0 =C2=A0 =C2=A0 =C2=A0Interrupt =C2=A0 =C2=A0=
 =C2=A0[3]
>      net_rx(softirq)
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A021.7 =
us/s =C2=A0 =C2=A0 =C2=A018.7 =C2=A0 =C2=A0 =C2=A0 =C2=A0kWork =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0od_dbs_timer
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 367.6 us/s =
=C2=A0 =C2=A0 =C2=A011.8 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =
=C2=A0
>      =C2=A0avahi-daemon:
>      > =C2=A0 =C2=A0running [Ramanujan.local]
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A033.6 =
us/s =C2=A0 =C2=A0 =C2=A0 9.8 =C2=A0 =C2=A0 =C2=A0 =C2=A0Timer =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
>      =C2=A0tick_sched_timer
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7.0 =
ms/s =C2=A0 =C2=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=
=A0 =C2=A0 =C2=A0powertop
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 299.8 us/s =
=C2=A0 =C2=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =
=C2=A0
>      > =C2=A0 =C2=A0=C2=A0/usr/sbin/irqbalance
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050.3 =
us/s =C2=A0 =C2=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=
=A0 =C2=A0
>      > =C2=A0 =C2=A0=C2=A0/usr/lib/accountsservice/accounts-daemon
>      > =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A039.7 =
us/s =C2=A0 =C2=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=
=A0 =C2=A0 =C2=A0nmbd -D
>      > =C2=A0 =C2=A0I am not getting any "power estimation" field.
> =

>      please read
>      [4]https://lists.01.org/pipermail/powertop/2014-March/001256.html
> =

>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss
>      > =C2=A0 =C2=A0I am using ubuntu 12.04 with linux kernel version 3.1=
1.0-24-generic
>      > =C2=A0 =C2=A0Could you please let me know what could be wrong.
>      > =C2=A0 =C2=A0Regards
>      > =C2=A0 =C2=A0Rahul
> =

>      > _______________________________________________
>      > PowerTop mailing list
>      > [5]PowerTop(a)lists.01.org
>      > [6]https://lists.01.org/mailman/listinfo/powertop
> =

> References
> =

>    Visible links
>    1. mailto:sergey.senozhatsky(a)gmail.com
>    2. mailto:rshrivastava2(a)gmail.com
>    3. mailto:powertop(a)lists.01.org
>    4. https://lists.01.org/pipermail/powertop/2014-March/001256.html
>    5. mailto:PowerTop(a)lists.01.org
>    6. https://lists.01.org/mailman/listinfo/powertop

--===============4830483040790955144==--

