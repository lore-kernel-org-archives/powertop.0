Content-Type: multipart/mixed; boundary="===============3902276362932591149=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 1/8] Common read/write MSR API
Date: Fri, 12 Apr 2013 13:12:32 +0300
Message-ID: <20130412101231.GA10502@swordfish.minsk.epam.com>
In-Reply-To: 1365724736-411-2-git-send-email-srinivas.pandruvada@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3902276362932591149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sorry, missed Cc list in original email. re-sent.

Hello,

On (04/11/13 16:58), Srinivas Pandruvada wrote:
> Date: Thu, 11 Apr 2013 16:58:49 -0700
> From: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> To: powertop(a)lists.01.org
> Subject: [Powertop] [PATCH 1/8] Common read/write MSR API
> X-Mailer: git-send-email 1.7.11.7
> =

> Added two new interfaces:
> extern int read_msr(int cpu, uint64_t offset, uint64_t *value);
> extern int write_msr(int cpu, uint64_t offset, uint64_t value);
> =

> This way all MSR interface can use this instead of reimplementing.
> =

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada(a)linux.intel.com>
> ---
>  src/lib.cpp | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  src/lib.h   |  3 ++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
> =

> diff --git a/src/lib.cpp b/src/lib.cpp
> index 723517a..98d9aac 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -56,6 +56,7 @@ extern "C" {
>  #include <limits>
>  #include <math.h>
>  #include <ncurses.h>
> +#include <fcntl.h>
>  =

>  static int kallsyms_read =3D 0;
>  =

> @@ -450,3 +451,63 @@ int get_user_input(char *buf, unsigned sz)
>  	/* to distinguish between getnstr error and empty line */
>  	return ret || strlen(buf);
>  }
> +
> +int read_msr(int cpu, uint64_t offset, uint64_t *value)
> +{
> +	ssize_t retval;
> +	uint64_t msr;
> +	int fd;
> +	char msr_path[256];
> +
> +	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
> +
> +	if (access(msr_path, R_OK) !=3D 0){
> +		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
> +
> +		if (access(msr_path, R_OK) !=3D 0){
> +			fprintf(stderr, _("msr reg not found"));
> +			return -1;
> +		}
> +	}
> +
> +	fd =3D open(msr_path, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +	retval =3D pread(fd, &msr, sizeof msr, offset);
> +	if (retval !=3D sizeof msr) {
> +		return -1;

	we leak opened fd here

> +	}
> +	close(fd);
> +	*value =3D msr;
> +
> +	return retval;
> +}
> +
> +int write_msr(int cpu, uint64_t offset, uint64_t value)
> +{
> +	ssize_t retval;
> +	int fd;
> +	char msr_path[256];
> +
> +	fd =3D sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
> +
> +	if (access(msr_path, R_OK) !=3D 0){
> +		fd =3D sprintf(msr_path, "/dev/msr%d", cpu);
> +
> +		if (access(msr_path, R_OK) !=3D 0){
> +			fprintf(stderr, _("msr reg not found"));
> +			return -1;
> +		}
> +	}
> +
> +	fd =3D open(msr_path, O_WRONLY);
> +	if (fd < 0)
> +		return -1;
> +	retval =3D pwrite(fd, &value, sizeof value, offset);
> +	if (retval !=3D sizeof value) {
> +		return -1;

	same here

> +	}
> +	close(fd);
> +
> +	return retval;
> +}
> diff --git a/src/lib.h b/src/lib.h
> index de2de5a..2b0e5f5 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -74,5 +74,6 @@ typedef void (*callback)(const char*);
>  extern void process_directory(const char *d_name, callback fn);
>  extern int utf_ok;
>  extern int get_user_input(char *buf, unsigned sz);
> -
> +extern int read_msr(int cpu, uint64_t offset, uint64_t *value);
> +extern int write_msr(int cpu, uint64_t offset, uint64_t value);
>  #endif
> -- =

> 1.7.11.7
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3902276362932591149==--

