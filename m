Content-Type: multipart/mixed; boundary="===============2055966064900891640=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Do not call abstract_cpu::wiggle for GPU
Date: Thu, 31 Jan 2013 15:28:45 -0800
Message-ID: <20130131152845.3fe58c3f@bluebird.jf.intel.com>
In-Reply-To: 1358181718-17761-1-git-send-email-jskarvad@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2055966064900891640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jan 2013 17:41:58 +0100
Jaroslav =C5=A0karvada <jskarvad(a)redhat.com> wrote:

> first_cpu is uninitialized there which results in:
> open("/sys/devices/system/cpu/cpu1330597711/cpufreq/scaling_max_freq",
> O_RDONLY) ---
>  src/cpu/intel_cpus.h | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/src/cpu/intel_cpus.h b/src/cpu/intel_cpus.h
> index 1949af1..752e8d0 100644
> --- a/src/cpu/intel_cpus.h
> +++ b/src/cpu/intel_cpus.h
> @@ -158,5 +158,6 @@ public:
>  	virtual char *  fill_cstate_line(int line_nr, char *buffer,
> const char *separator); virtual int	has_pstate_level(int
> level) { return 0; }; virtual int	has_pstates(void) { return
> 0; };
> +	virtual void	wiggle(void) { };
>  =

>  };


Applied, thanks.

Kristen

--===============2055966064900891640==--

