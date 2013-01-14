Content-Type: multipart/mixed; boundary="===============1746918872950229079=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] main: 'quiet' option does not take an argument
Date: Mon, 14 Jan 2013 18:49:55 +0300
Message-ID: <20130114154955.GB2402@swordfish.minsk.epam.com>
In-Reply-To: 1358173532-17751-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1746918872950229079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/14/13 23:25), Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>  src/main.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index e6036ae..b22d11d 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -77,7 +77,7 @@ static const struct option long_options[] =3D
>  	{"time", optional_argument, NULL, 't'},
>  	{"iteration", optional_argument, NULL, 'i'},
>  	{"workload", optional_argument, NULL, 'w'},
> -	{"quiet", optional_argument, NULL, 'q'},
> +	{"quiet", no_argument, NULL, 'q'},
>  	{NULL, 0, NULL, 0}
>  };
>  =


looks good to me

	-ss

--===============1746918872950229079==--

