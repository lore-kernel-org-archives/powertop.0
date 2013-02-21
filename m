Content-Type: multipart/mixed; boundary="===============6037932332186011678=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Add a more informative error message about MSR
 not found
Date: Thu, 21 Feb 2013 12:37:38 +0300
Message-ID: <20130221093738.GA2325@swordfish.minsk.epam.com>
In-Reply-To: 1361438855-14060-1-git-send-email-jani.nikula@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6037932332186011678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/21/13 11:27), jani.nikula(a)linux.intel.com wrote:
> From: Jani Nikula <jani.nikula(a)intel.com>
> =

> Suggest enabling CONFIG_X86_MSR. Add \n at the end of the error message.
> =

> Signed-off-by: Jani Nikula <jani.nikula(a)intel.com>
> =

> ---
> =

> Note: This breaks translations looking for msgid "msr reg not found". I'm
> unsure how you want this kind of changes handled.
> ---
>  src/cpu/intel_cpus.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> index 2b78d31..30c311f 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -58,7 +58,7 @@ static uint64_t get_msr(int cpu, uint64_t offset)
>  		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
>  =

>  		if (access(msr_path, R_OK) !=3D 0){
> -			fprintf(stderr, _("msr reg not found"));
> +			fprintf(stderr, _("Model-specific registers (MSR) not found (try enab=
ling CONFIG_X86_MSR).\n"));
>  			exit(-2);
>  		}
>  	}
> -- =


I think we're beyond the `string freeze' date, most likely it will not get =
into upcoming release.


	-ss


> 1.7.9.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6037932332186011678==--

