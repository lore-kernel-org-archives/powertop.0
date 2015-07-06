Content-Type: multipart/mixed; boundary="===============8680205809086944092=="
MIME-Version: 1.0
From: Daniel Leung <daniel.leung at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/2] comment process_cpu_data in the
 one_measurement() for it clears all pstat data
Date: Mon, 06 Jul 2015 14:46:33 -0700
Message-ID: <20150706144633.449afe72d66e578d91e85a0d@linux.intel.com>
In-Reply-To: 1435750481-9543-1-git-send-email-zhaoyang.huang@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8680205809086944092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed,  1 Jul 2015 19:34:40 +0800
Zhaoyang Huang <zhaoyang.huang(a)linaro.org> wrote:

> all children cpu's pstat data will be cleared in process_cpu_data,which
> cause the pstat shows abnormal, we have to comment this line of code. How=
ever,
> it looks too rough.
> =

> Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
> ---
>  src/main.cpp |    7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index 1e56af1..9526084 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -221,7 +221,14 @@ void one_measurement(int seconds, char *workload)
>  	devices_end_measurement();
>  	end_power_measurement();
>  =

> +	/*
> +	FIX ME:all children cpu's pstat data will be cleared in process_cpu_dat=
a,which
> +	cause the pstat shows abnormal, we have to comment this line of code. H=
owever,
> +	it looks to rough
> +	*/
> +	/*
>  	process_cpu_data();
> +	*/
>  	process_process_data();
>  =

>  	/* output stats */
> -- =

> 1.7.9.5
> =


Did you see the issue on Android? Could you give me more details? Maybe I c=
an try to re-produce it on my end.

-- =

Daniel Leung <daniel.leung(a)linux.intel.com>

--===============8680205809086944092==--

