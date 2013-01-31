Content-Type: multipart/mixed; boundary="===============4040757497403702002=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] main: Fix output when running workload
Date: Thu, 31 Jan 2013 15:28:26 -0800
Message-ID: <20130131152826.0238be9b@bluebird.jf.intel.com>
In-Reply-To: 1358174972-18163-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4040757497403702002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jan 2013 23:49:32 +0900
Namhyung Kim <namhyung(a)gmail.com> wrote:

> Currently one_measurement() function prints following message after
> a successful run of the workload.
> =

>   $ sudo powertop --html --workload=3D"sleep 1"
>   Loaded 1 prior measurements
>   Preparing to take measurements
>   Measuring workload sleep 1.
>   Unknown issue running workload!                         <-- here
>   PowerTOP outputing using base filename powertop.html
> =

> It seems this was because it wrongly checks return value of system.
> The return value of the system() call is the status of wait() call
> so that it should be zero if things went well.
> =

> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/main.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index b22d11d..0883424 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -191,7 +191,7 @@ void one_measurement(int seconds, char *workload)
>  	start_cpu_measurement();
>  =

>  	if (workload && workload[0]) {
> -		if (!system(workload))
> +		if (system(workload))
>  			fprintf(stderr, _("Unknown issue running
> workload!\n")); } else {
>  		do_sleep(seconds);

applied, thanks.

Kristen

--===============4040757497403702002==--

