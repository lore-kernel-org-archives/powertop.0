Content-Type: multipart/mixed; boundary="===============2807257260558046647=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix hrtimer event names
Date: Thu, 02 Aug 2012 11:03:57 -0700
Message-ID: <501AC10D.1070004@linux.intel.com>
In-Reply-To: 1343919043-12954-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2807257260558046647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/02/2012 07:50 AM, Igor Zhbanov wrote:
> Fix hrtimer event names by adding "timer:" prefix.
> ---
>   src/process/do_process.cpp |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index 11e6680..2700230 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -663,8 +663,8 @@ void start_process_measurement(void)
>   		perf_events->add_event("irq:softirq_exit");
>   		perf_events->add_event("timer:timer_expire_entry");
>   		perf_events->add_event("timer:timer_expire_exit");
> -		perf_events->add_event("hrtimer_expire_entry");
> -		perf_events->add_event("hrtimer_expire_exit");
> +		perf_events->add_event("timer:hrtimer_expire_entry");
> +		perf_events->add_event("timer:hrtimer_expire_exit");
>   		if (!perf_events->add_event("power:cpu_idle")){
>   			perf_events->add_event("power:power_start");
>   			perf_events->add_event("power:power_end");
patch accepted
Thank You


--===============2807257260558046647==--

