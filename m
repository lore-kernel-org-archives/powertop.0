Content-Type: multipart/mixed; boundary="===============0116360813220211812=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 5/8] Limit sprintf to buffer size length.
Date: Wed, 15 Oct 2014 21:15:57 +0900
Message-ID: <20141015121557.GA1189@swordfish>
In-Reply-To: 1413310159-30577-6-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0116360813220211812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/14/14 11:09), Joe Konno wrote:
> Not completely needed, but good practice.  Limiting sprintf to the
> length of the buffer size.  This patch not completely necessary as it's
> unlikely to be an issue here.
> =

> v2: rebase atop 41c54e8; adaptated to newer context
> =

> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> ---
>  src/lib.cpp | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/src/lib.cpp b/src/lib.cpp
> index 437803b..9cbf78d 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -474,10 +474,10 @@ int read_msr(int cpu, uint64_t offset, uint64_t *va=
lue)
>  	int fd;
>  	char msr_path[256];
>  =

> -	sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
> +	fd =3D snprintf(msr_path, 256, "/dev/cpu/%d/msr", cpu);

iirc, this `fd =3D' has been removed. it's useless per se.

	-ss

>  	if (access(msr_path, R_OK) !=3D 0){
> -		sprintf(msr_path, "/dev/msr%d", cpu);
> +		fd =3D snprintf(msr_path, 256, "/dev/msr%d", cpu);
>  =

>  		if (access(msr_path, R_OK) !=3D 0){
>  			fprintf(stderr,
> @@ -506,10 +506,10 @@ int write_msr(int cpu, uint64_t offset, uint64_t va=
lue)
>  	int fd;
>  	char msr_path[256];
>  =

> -	sprintf(msr_path, "/dev/cpu/%d/msr", cpu);
> +	fd =3D snprintf(msr_path, 256, "/dev/cpu/%d/msr", cpu);
>  =

>  	if (access(msr_path, R_OK) !=3D 0){
> -		sprintf(msr_path, "/dev/msr%d", cpu);
> +		fd =3D snprintf(msr_path, 256, "/dev/msr%d", cpu);
>  =

>  		if (access(msr_path, R_OK) !=3D 0){
>  			fprintf(stderr,
> -- =

> 2.1.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============0116360813220211812==--

