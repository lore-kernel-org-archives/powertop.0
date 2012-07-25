Content-Type: multipart/mixed; boundary="===============5213133301155027501=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] hrtimer events are not properly added -- is this bug
 or feature?
Date: Wed, 25 Jul 2012 10:45:47 -0700
Message-ID: <501030CB.20908@linux.intel.com>
In-Reply-To: 500E4D97.5040902@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5213133301155027501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/24/2012 12:24 AM, Igor Zhbanov wrote:
> Hello!
>
> In the function start_process_measurement() in the file =

> src/process/do_process.cpp
> events are added to perf_bundle:
>         perf_events->add_event("irq:softirq_entry");
>         perf_events->add_event("irq:softirq_exit");
>         perf_events->add_event("timer:timer_expire_entry");
>         perf_events->add_event("timer:timer_expire_exit");
>         perf_events->add_event("hrtimer_expire_entry"); /* !!! */
>         perf_events->add_event("hrtimer_expire_exit"); /* !!! */
>         if (!perf_events->add_event("power:cpu_idle")){
>             perf_events->add_event("power:power_start");
>             perf_events->add_event("power:power_end");
>         }
>
> As you may see all events are prefixed with the subsystem name.
> All but hrtimer_expire_entry and hrtimer_expire_exit. And without =

> "timer:" prefix
> these events are never catched.
>
> So I have added this prefix and see that events are intercepted as =

> needed.
> But event parser complains about wrong event format:
>   unknown op '{'
>   failed to read event print fmt for hrtimer_expire_entry
>
> It seems that event parser can't handle square bracket in print format =

> for the event:
> print fmt: "hrtimer=3D%p function=3D%pf now=3D%llu", REC->hrtimer, =

> REC->function, (unsigned long long)(((ktime_t) { .tv64 =3D REC->now =

> }).tv64)
>
> So is the absence of "timer:" prefix a bug or a commenting of =

> non-working case?
>
> Thank you.
>
Im looking into this

--===============5213133301155027501==--

