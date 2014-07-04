Content-Type: multipart/mixed; boundary="===============4771452019094488375=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] not getting the power consumption numbers
Date: Fri, 04 Jul 2014 21:05:49 +0900
Message-ID: <20140704120549.GA956@swordfish>
In-Reply-To: CAETyQ1Mn25GBQnRq+X7J3V++gQqYZeqrtLMCO74cQpSONYXPfA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4771452019094488375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/04/14 10:19), rahul shrivastava wrote:
> Date: Fri, 4 Jul 2014 10:19:24 +0530
> From: rahul shrivastava <rshrivastava2(a)gmail.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] not getting the power consumption numbers
> =

>    Hi,
>    While installing version 2.6.1, I got the following error -=C2=A0
>    make[2]: Entering directory `/home/rahul/powertop/powertop-2.6.1/src'
>    /bin/bash ./csstoh.sh powertop.css css.h
>    /bin/bash: ./csstoh.sh: No such file or directory

should be fixed by now, not sure if the fix is already included into
tarball, though.

>    So I installed version 2.5 and it compiled correctly. But, I am not
>    getting the power consumption numbers. What I am getting is this
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usage =C2=A0 =
=C2=A0 =C2=A0 Events/s =C2=A0 =C2=A0Category =C2=A0 =C2=A0 =C2=A0 Descripti=
on
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A066.7 us/s =C2=A0 =C2=
=A0 =C2=A026.5 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0 =C2=
=A0[rcu_sched]
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 152.8 us/s =C2=A0 =C2=A0 =C2=
=A018.7 =C2=A0 =C2=A0 =C2=A0 =C2=A0Interrupt =C2=A0 =C2=A0 =C2=A0[3] net_rx=
(softirq)
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A021.7 us/s =C2=A0 =C2=
=A0 =C2=A018.7 =C2=A0 =C2=A0 =C2=A0 =C2=A0kWork =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0od_dbs_timer
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 367.6 us/s =C2=A0 =C2=A0 =C2=
=A011.8 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi=
-daemon:
>    running [Ramanujan.local]
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A033.6 us/s =C2=A0 =C2=
=A0 =C2=A0 9.8 =C2=A0 =C2=A0 =C2=A0 =C2=A0Timer =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tick_sched_timer
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7.0 ms/s =C2=A0 =C2=
=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0 =C2=
=A0powertop
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 299.8 us/s =C2=A0 =C2=A0 =C2=
=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0
>    =C2=A0/usr/sbin/irqbalance
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050.3 us/s =C2=A0 =C2=
=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0
>    =C2=A0/usr/lib/accountsservice/accounts-daemon
>    =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A039.7 us/s =C2=A0 =C2=
=A0 =C2=A0 2.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Process =C2=A0 =C2=A0 =C2=A0 =C2=
=A0nmbd -D
>    I am not getting any "power estimation" field.

please read https://lists.01.org/pipermail/powertop/2014-March/001256.html

	-ss

>    I am using ubuntu 12.04 with linux kernel version 3.11.0-24-generic
>    Could you please let me know what could be wrong.
>    Regards
>    Rahul

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============4771452019094488375==--

