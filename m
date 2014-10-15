Content-Type: multipart/mixed; boundary="===============6490646094511857112=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 8/8] Adding a clean_shutdown function
Date: Wed, 15 Oct 2014 21:59:22 +0900
Message-ID: <20141015125922.GD1189@swordfish>
In-Reply-To: 1413310159-30577-9-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6490646094511857112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/14/14 11:09), Joe Konno wrote:
>  src/main.cpp | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index d3963ed..b6ce090 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -368,6 +368,17 @@ static void powertop_init(void)
>  	initialized =3D 1;
>  }
>  =

> +void clean_shutdown()
> +{
> +	close_results();
> +	close_display();
> +	clean_open_devices();
> +	clear_all_devices();
> +	clear_all_cpus();
> +
> +	return;
> +}
> +

I would agree on that refactoring if we would call this function
from several places. otherwise, I see no actual reason.

	-ss

>  int main(int argc, char **argv)
>  {
> @@ -498,9 +509,7 @@ int main(int argc, char **argv)
>  	clear_tuning();
>  	reset_display();
>  =

> -	clean_open_devices();
> -	clear_all_devices();
> -	clear_all_cpus();
> +	clean_shutdown();
>  =

>  	return 0;
>  }
> -- =

> 2.1.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============6490646094511857112==--

