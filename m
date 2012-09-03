Content-Type: multipart/mixed; boundary="===============2653753975508650708=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Query: Weird Output values: Percentage over 100%
Date: Mon, 03 Sep 2012 20:20:41 +0300
Message-ID: <20120903172041.GA3062@swordfish>
In-Reply-To: CAOh2x=m_tWKcnGzOFpxSpr-+6qOozuJyVZkxpHDDQ3a6oc34hA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2653753975508650708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/03/12 12:24), viresh kumar wrote:
> Ping!!
> =

> On Wed, Aug 29, 2012 at 1:39 PM, viresh kumar <viresh.kumar(a)linaro.org>=
 wrote:
> > Hi,
> >
> > I am noticing something strange in powertop reports.
> > When i run powertop with following parameters:
> >
> > powertop -t 120 --html
> >
> > I see following in summary section
> >
> > Power Consumption Summary
> >
> > 0.1 wakeups/second, 0.0 GPU ops/second, 0.0 VFS ops/sec, 0.0 GFX
> > wakes/sec and 5375.4% CPU use
> >
> > Usage   Events/s        Category        Description
> > 2693%    0.07   Timer   tick_sched_timer
> > 2680%    0.00   Timer   ehci_watchdog
> > 0.6%     0.00   Interrupt       [7] sched(softirq)
> > 0.2%     0.00   Interrupt       [1] timer(softirq)
> > 0.2%     0.00   Interrupt       [29] twd
> > 0.1%     0.00   kWork   pm_runtime_work
> > 0.1%     0.00   Timer   led_heartbeat_function
> > 0.1%     0.00   Interrupt       [9] RCU(softirq)
> > 0.1%     0.00   Interrupt       [57] OMAP DISPC
> > 0.1%     0.00   Process rsyslogd -c5
> >
> >

Hi, sorry, =


well, we've seen this one before. the reasons are still unclear.

	-ss


> > How is percentage over 100 %...
> >
> > System Info:
> >
> > PowerTOP Version        v2.0
> > Kernel Version  Linux version 3.4.0-01820-gcc96f22
> > (viresh(a)blr-linut-001) (gcc version 4.7.1 20120514 (prerelease)
> > (crosstool-NG linaro-1.13.1-2012.05-20120523 - Linaro GCC 2012.05) )
> > #5 SMP PREEMPT Tue Aug 28 12:44:52 IST 2012
> > System Name
> > CPU Information 2x
> > OS Information
> >
> > Running on ARM: Panda Board.
> >
> > --
> > viresh
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============2653753975508650708==--

