Content-Type: multipart/mixed; boundary="===============0030431125325261745=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Do not call abstract_cpu::wiggle for GPU
Date: Mon, 14 Jan 2013 22:58:06 +0300
Message-ID: <20130114195806.GA3255@swordfish>
In-Reply-To: 1358181718-17761-1-git-send-email-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0030431125325261745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/14/13 17:41), Jaroslav =C5=A0karvada wrote:
> first_cpu is uninitialized there which results in:
> open("/sys/devices/system/cpu/cpu1330597711/cpufreq/scaling_max_freq", O_=
RDONLY)
> ---
>  src/cpu/intel_cpus.h | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> index 1949af1..752e8d0 100644
> --- a/src/cpu/intel_cpus.h
> +++ b/src/cpu/intel_cpus.h
> @@ -158,5 +158,6 @@ public:
>  	virtual char *  fill_cstate_line(int line_nr, char *buffer, const char =
*separator);
>  	virtual int	has_pstate_level(int level) { return 0; };
>  	virtual int	has_pstates(void) { return 0; };
> +	virtual void	wiggle(void) { };
>  =

>  };
>

good catch. thanks.


	-ss

--===============0030431125325261745==--

