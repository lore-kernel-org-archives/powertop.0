Content-Type: multipart/mixed; boundary="===============4523906428603684578=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH v1] Fix timer and work perf events timestamp
 tracing
Date: Thu, 06 Sep 2012 08:30:39 -0700
Message-ID: <5048C19F.8010507@linux.intel.com>
In-Reply-To: 1346938764-31141-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4523906428603684578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/06/2012 06:39 AM, Rajagopal Venkat wrote:
> Fix timer and work perf events timestamp tracing by
> - considering event exit timestamp relative to measurement first
> timestamp for events which entry timestamp is not recorded.
> Currently these events exit timestamp itself is considered as
> usage period resulting in false usage report.
> - clearing event timestamps from global map at the end of each
> measurement to avoid collision with earlier recorded timestamps.
>
> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> ---
>   src/process/do_process.cpp | 12 ++++++++++++
>   src/process/timer.cpp      |  4 ++++
>   src/process/work.cpp       |  4 ++++
>   3 files changed, 20 insertions(+)
>
> diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
> index cb7c672..eaef7f1 100644
> --- a/src/process/do_process.cpp
> +++ b/src/process/do_process.cpp
> @@ -490,6 +490,10 @@ void perf_process_bundle::handle_trace_point(void *t=
race, int cpu, uint64_t time
>   		}
>   		pop_consumer(cpu);
>   		t =3D timer->done(time, tmr);
> +		if (t =3D=3D ~0ULL) {
> +			timer->fire(first_stamp, tmr);
> +			t =3D timer->done(time, tmr);
> +		}
>   		consumer_child_time(cpu, t);
>   	}
>   	else if (strcmp(event->name, "hrtimer_expire_entry") =3D=3D 0) {
> @@ -532,6 +536,10 @@ void perf_process_bundle::handle_trace_point(void *t=
race, int cpu, uint64_t time
>   =

>   		pop_consumer(cpu);
>   		t =3D timer->done(time, tmr);
> +		if (t =3D=3D ~0ULL) {
> +			timer->fire(first_stamp, tmr);
> +			t =3D timer->done(time, tmr);
> +		}
>   		consumer_child_time(cpu, t);
>   	}
>   	else if (strcmp(event->name, "workqueue_execute_start") =3D=3D 0) {
> @@ -575,6 +583,10 @@ void perf_process_bundle::handle_trace_point(void *t=
race, int cpu, uint64_t time
>   		}
>   		pop_consumer(cpu);
>   		t =3D work->done(time, wk);
> +		if (t =3D=3D ~0ULL) {
> +			work->fire(first_stamp, wk);
> +			t =3D work->done(time, wk);
> +		}
>   		consumer_child_time(cpu, t);
>   	}
>   	else if (strcmp(event->name, "cpu_idle") =3D=3D 0) {
> diff --git a/src/process/timer.cpp b/src/process/timer.cpp
> index 8917490..1ca8c25 100644
> --- a/src/process/timer.cpp
> +++ b/src/process/timer.cpp
> @@ -79,6 +79,9 @@ uint64_t timer::done(uint64_t time, uint64_t timer_stru=
ct)
>   {
>   	int64_t delta;
>   =

> +	if (running_since.find(timer_struct) =3D=3D running_since.end())
> +		return ~0ULL;
> +
>   	if (running_since[timer_struct] > time)
>   		return 0;
>   =

> @@ -147,6 +150,7 @@ void clear_timers(void)
>   		all_timers.erase(it);
>   		it =3D all_timers.begin();
>   	}
> +	running_since.clear();
>   }
>   =

>   bool timer::is_deferred(void)
> diff --git a/src/process/work.cpp b/src/process/work.cpp
> index 82f13a2..e62e5d3 100644
> --- a/src/process/work.cpp
> +++ b/src/process/work.cpp
> @@ -56,6 +56,9 @@ uint64_t work::done(uint64_t time, uint64_t work_struct)
>   {
>   	int64_t delta;
>   =

> +	if (running_since.find(work_struct) =3D=3D running_since.end())
> +		return ~0ULL;
> +
>   	if (running_since[work_struct] > time)
>   		return 0;
>   =

> @@ -102,6 +105,7 @@ void clear_work(void)
>   		all_work.erase(it);
>   		it =3D all_work.begin();
>   	}
> +	running_since.clear();
>   }
>   =

>   =

patched merged
Thank You
-Chris


--===============4523906428603684578==--

