Content-Type: multipart/mixed; boundary="===============0194475859730363741=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 2/8] Use MSR Lib MSR functions
Date: Sat, 13 Apr 2013 13:43:58 +0300
Message-ID: <20130413104358.GC2181@swordfish>
In-Reply-To: 1365781628-11053-3-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0194475859730363741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/12/13 08:47), Srinivas Pandruvada wrote:
> Date: Fri, 12 Apr 2013 08:47:02 -0700
> From: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 2/8] Use MSR Lib MSR functions
> X-Mailer: git-send-email 1.7.11.7
> =

> MSR read is implemented in lib.c. Use this API instead.
>

oh, not again... I missed Cc list. sorry!
resending.




 please merge with the master. this function is a bit ahead since

       commit 4d636301f641855a0bf059928c7a395cecc272b1
       Author: Jani Nikula <jani.nikula intel.com>
       Date:   Thu Feb 21 11:27:34 2013 +0200


        -ss


 =

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> ---
>  src/cpu/intel_cpus.cpp | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> =

> diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> index 2b78d31..8d5f51a 100644
> --- a/src/cpu/intel_cpus.cpp
> +++ b/src/cpu/intel_cpus.cpp
> @@ -49,30 +49,15 @@ static uint64_t get_msr(int cpu, uint64_t offset)
>  {
>  	ssize_t retval;
>  	uint64_t msr;
> -	int fd;
> -	char msr_path[256];
>  =

> -	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
> -
> -	if (access(msr_path, R_OK) !=3D 0){
> -		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
> -
> -		if (access(msr_path, R_OK) !=3D 0){
> -			fprintf(stderr, _("msr reg not found"));
> -			exit(-2);
> -		}
> -	}
> -
> -	fd =3D open(msr_path, O_RDONLY);
> -
> -	retval =3D pread(fd, &msr, sizeof msr, offset);
> -	if (retval !=3D sizeof msr) {
> +	retval =3D read_msr(cpu, offset, &msr);
> +	if (retval < 0) {
>  		reset_display();
> -		fprintf(stderr, _("pread cpu%d 0x%llx : "), cpu, (unsigned long long)o=
ffset);
> +		fprintf(stderr, _("read_msr cpu%d 0x%llx : "), cpu, (unsigned long lon=
g)offset);
>  		fprintf(stderr, "%s\n", strerror(errno));
>  		exit(-2);
>  	}
> -	close(fd);
> +
>  	return msr;
>  }
>  =

> -- =

> 1.7.11.7
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============0194475859730363741==--

