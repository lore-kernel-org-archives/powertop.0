Content-Type: multipart/mixed; boundary="===============8757466950438909204=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] Some more NaNs in report when CONFIG_TRACING is not
 enabled
Date: Fri, 17 Aug 2012 09:34:05 -0700
Message-ID: <502E727D.7040306@linux.intel.com>
In-Reply-To: 502E3048.6020401@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8757466950438909204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/17/2012 04:51 AM, Igor Zhbanov wrote:
> Hello!
>
> When you run the PowerTOP on the kernel with CONFIG_TRACING disabled,
> you will get several NaNs (not a number) in the report. PowerTOP =

> doesn't correctly
> handle the situation when /sys/kernel/debug is present but =

> /sys/kernel/debug/tracing is not.
>
> So the PowerTOP will be unable to get information about trace events. =

> And instead of
> arguing about that or skipping some tests, it will run and produce =

> wrong reports.
>
> Since there will be no trace events captured, the measurement_time =

> variable
> in src/process/do_process.c will remain zero. So the functions like =

> total_wakeups(),
> total_gpu_ops(), total_disk_hits(), etc. will happily divide total by =

> zero.
>
> Yes, I know that it is not very useful to run the PowerTOP with =

> tracing disabled (although
> the PowerTOP can still report information about devices), but I =

> suppose that the PowerTOP
> should check whether /sys/kernel/debug/tracing presents and say =

> something if not.
>
> And as I see the PowerTOP almost never check the result of file =

> opening functions.
> If it cannot open a file, the PowerTOP just silently skip it.
>
> Thank you.
>
Great, thanks, I will start look at this.
-Chris


--===============8757466950438909204==--

