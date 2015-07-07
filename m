Content-Type: multipart/mixed; boundary="===============1450483272271208059=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi at arm.com>
Subject: Re: [Powertop] [RESEND PATCH] powertop: fix erroneous C state
 detection on ARM
Date: Tue, 07 Jul 2015 16:04:33 +0100
Message-ID: <20150707150433.GA4935@red-moon>
In-Reply-To: 1434362249-21007-1-git-send-email-lorenzo.pieralisi@arm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1450483272271208059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 10:57:29AM +0100, Lorenzo Pieralisi wrote:
> When the kernel is configured with CONFIG_CPU_IDLE_MULTIPLE_DRIVERS,
> the cpuidle directory contains a "driver" subdirectory that confuses
> the current code parsing the C states on ARM platforms, ending up
> with a C state entry corresponding to the actual driver name instead
> of a proper C state entry.
> =

> This patch fixes the code by stopping the parsing if the files that
> characterise the C states (ie usage) are not found in the respective:
> =

> /sys/devices/system/cpu/cpuX/cpuidle
> =

> subdirectory containing C states information.
> =

> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi(a)arm.com>
> Tested-by: Kevin Hilman <khilman(a)linaro.org>
> ---
> Alexandra, Arjan,
> =

> previous posting here:
> =

> https://lists.01.org/pipermail/powertop/2014-December/001724.html
> =

> Please consider pulling this patch.

Gentle ping.

Thanks,
Lorenzo

> Thanks,
> Lorenzo
> =

>  src/cpu/cpu_linux.cpp | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/src/cpu/cpu_linux.cpp b/src/cpu/cpu_linux.cpp
> index e1ff165..78fd2d3 100644
> --- a/src/cpu/cpu_linux.cpp
> +++ b/src/cpu/cpu_linux.cpp
> @@ -83,7 +83,8 @@ void cpu_linux::parse_cstates_start(void)
>  		if (file) {
>  			file >> usage;
>  			file.close();
> -		}
> +		} else
> +			continue;
>  =

>  		sprintf(filename + len, "/%s/time", entry->d_name);
>  =

> @@ -172,7 +173,8 @@ void cpu_linux::parse_cstates_end(void)
>  		if (file) {
>  			file >> usage;
>  			file.close();
> -		}
> +		} else
> +			continue;
>  =

>  		sprintf(filename + len, "/%s/time", entry->d_name);
>  =

> -- =

> 1.9.1
>=20

--===============1450483272271208059==--

