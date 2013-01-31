Content-Type: multipart/mixed; boundary="===============8105463180687637160=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] main: 'quiet' option does not take an argument
Date: Thu, 31 Jan 2013 15:27:59 -0800
Message-ID: <20130131152759.10cbf73e@bluebird.jf.intel.com>
In-Reply-To: 1358173532-17751-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8105463180687637160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Jan 2013 23:25:32 +0900
Namhyung Kim <namhyung(a)gmail.com> wrote:

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


Applied, thanks.

Kristen

--===============8105463180687637160==--

