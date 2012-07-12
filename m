Content-Type: multipart/mixed; boundary="===============2930596276474324890=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix crash on Linux ARM hosts
Date: Thu, 12 Jul 2012 22:45:45 +0300
Message-ID: <20120712194545.GA2981@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 1342118464-18397-1-git-send-email-sw@weilnetz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2930596276474324890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/12/12 20:41), Stefan Weil wrote:
> /proc/cpuinfo on ARM hosts is different and resulted
> in a call of handle_one_cpu() with number =3D=3D -1
> which finally raised a SIGSEGV crash (noticed on
> Debian Wheezy for ARM).
> =

> Fix this by testing the value of "number".
> =

> After number was used, it is now reset to -1 just to make
> sure that the new test also works for a potential 2nd cpu
> with unexpected information in /proc/cpuinfo.
> =

> Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
> ---
>


Hello,

We had this before. I would rather prefer default CPU number
to be 1, instead of -1.

Discussion:
http://lists.01.org/pipermail/powertop/2012-May/000055.html
http://lists.01.org/pipermail/powertop/2012-May/000073.html


And the patch is:
http://lists.01.org/pipermail/powertop/2012-May/000052.html
 =


Chris, did you have a chance to take a look on this one?


	-ss


> Please note that even with this patch, powertop on ARM will
> only work partially: handle_one_cpu() is never called,
> so there is no cpu information.
> =

> For ARM hosts with a single core cpu (the most common case),
> using a case insensitive compare for 'processor' would work.
> =

> This is my /proc/cpuinfo:
> =

> Processor	: ARMv6-compatible processor rev 7 (v6l)
> BogoMIPS	: 697.95
> Features	: swp half thumb fastmult vfp edsp java tls =

> CPU implementer	: 0x41
> CPU architecture: 7
> CPU variant	: 0x0
> CPU part	: 0xb76
> CPU revision	: 7
> =

> Hardware	: BCM2708
> Revision	: 0002
> Serial		: 00000000e16a63c5
> =

> For multicore cpus, a better 2nd patch is needed.
> If anybody has a /proc/cpuinfo of that kind, please tell me
> the format - otherwise I'll have to look in the Linux source.
> =

> Regards,
> Stefan Weil
> =

>  src/cpu/cpu.cpp |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> =

> diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> index 4096835..d08bdcd 100644
> --- a/src/cpu/cpu.cpp
> +++ b/src/cpu/cpu.cpp
> @@ -271,8 +271,11 @@ void enumerate_cpus(void)
>  			}
>  		}
>  		if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
> -			handle_one_cpu(number, vendor, family, model);
> -			set_max_cpu(number);
> +			if (number >=3D 0) {
> +				handle_one_cpu(number, vendor, family, model);
> +				set_max_cpu(number);
> +				number =3D -1;
> +			}
>  		}
>  	}
>  =

> -- =

> 1.7.10
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============2930596276474324890==--

