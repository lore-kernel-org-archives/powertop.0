Content-Type: multipart/mixed; boundary="===============8033406887380071041=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] README: add CONFIG_X86_MSR to the list of
 required kernel config options
Date: Thu, 21 Feb 2013 12:40:16 +0300
Message-ID: <20130221094015.GB2325@swordfish.minsk.epam.com>
In-Reply-To: 1361438841-14026-1-git-send-email-jani.nikula@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8033406887380071041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/21/13 11:27), jani.nikula(a)linux.intel.com wrote:
> From: Jani Nikula <jani.nikula(a)intel.com>
> =

> PowerTOP fails on x86 without CONFIG_X86_MSR.
> =

> Signed-off-by: Jani Nikula <jani.nikula(a)intel.com>
> ---
>  README |    1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/README b/README
> index 7e789e0..07bbea0 100644
> --- a/README
> +++ b/README
> @@ -43,6 +43,7 @@ CONFIG_PERF_COUNTERS
>  CONFIG_TRACEPOINTS
>  CONFIG_TRACING
>  CONFIG_EVENT_POWER_TRACING_DEPRECATED
> +CONFIG_X86_MSR
>  ACPI_PROCFS_POWER
>

looks good to me.

	-ss
  =

>  The patches in the patches/ sub-directory are required for PowerTOP to f=
unction
> -- =

> 1.7.9.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8033406887380071041==--

