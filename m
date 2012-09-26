Content-Type: multipart/mixed; boundary="===============3716073793254216266=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2] Fix string null termination and SIGABRT
 from glibc
Date: Wed, 26 Sep 2012 07:19:40 -0700
Message-ID: <20120926141939.GB3014@swordfish>
In-Reply-To: 1348668750-15870-1-git-send-email-mikko.rapeli@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3716073793254216266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/26/12 16:12), Mikko Rapeli wrote:
> According to http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D682388
> the string is not null terminated when too much data is read.
> =

> This patch fixes the crashes on my system.
> ---
>  src/process/process.cpp |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

LGTM, thanks!

	-ss
 =

> diff --git a/src/process/process.cpp b/src/process/process.cpp
> index 71f81b6..34dc68d 100644
> --- a/src/process/process.cpp
> +++ b/src/process/process.cpp
> @@ -86,7 +86,7 @@ static void cmdline_to_string(char *str)
>  =

>  process::process(const char *_comm, int _pid, int _tid) : power_consumer=
()
>  {
> -	char line[4096];
> +	char line[4097];
>  	ifstream file;
>  =

>  	strcpy(comm, _comm);
> @@ -103,6 +103,7 @@ process::process(const char *_comm, int _pid, int _ti=
d) : power_consumer()
>  		file.open(line);
>  		while (file) {
>  			file.getline(line, 4096);
> +			line[4096] =3D '\0';
>  			if (strstr(line, "Tgid")) {
>  				char *c;
>  				c =3D strchr(line, ':');
> -- =

> 1.7.10.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3716073793254216266==--

