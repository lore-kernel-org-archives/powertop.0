Content-Type: multipart/mixed; boundary="===============8031522537795784030=="
MIME-Version: 1.0
From: Srinivas Pandruvada <srinivas.pandruvada at linux.intel.com>
Subject: Re: [Powertop] [PATCH] READER: add CONFIG_DEBUG_FS to Kernel
 Parameters
Date: Tue, 11 Jun 2013 09:51:35 -0700
Message-ID: <51B75597.30605@linux.intel.com>
In-Reply-To: 20130611163108.GA2218@swordfish.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8031522537795784030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


I think most distros turns on CONFIG_DEBUG_FS. But still this patch is good.

Thanks,
Srinivas

On 06/11/2013 09:31 AM, Sergey Senozhatsky wrote:
> Add CONFIG_DEBUG_FS to the Kernel Parameters README section.
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
>
> ---
>
>   README | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/README b/README
> index 07bbea0..2961eba 100644
> --- a/README
> +++ b/README
> @@ -45,6 +45,7 @@ CONFIG_TRACING
>   CONFIG_EVENT_POWER_TRACING_DEPRECATED
>   CONFIG_X86_MSR
>   ACPI_PROCFS_POWER
> +CONFIG_DEBUG_FS
>   =

>   The patches in the patches/ sub-directory are required for PowerTOP to =
function
>   fully.
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>


--===============8031522537795784030==--

