Content-Type: multipart/mixed; boundary="===============0774072556584107712=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] powertop: update build instructions
Date: Sun, 13 Jul 2014 16:26:47 +0900
Message-ID: <20140713072647.GA947@swordfish>
In-Reply-To: 1405231562-24175-1-git-send-email-meraj.enigma@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0774072556584107712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/13/14 12:06), Mohammad Merajul Islam Molla wrote:
> update powertop build instuctions in README file.
> =

> Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
> ---
>  README | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/README b/README
> index cd38cc5..efe95c3 100644
> --- a/README
> +++ b/README
> @@ -2,9 +2,10 @@
>  ------------------------------
>  =

>  To build and install PowerTOP type the following commands, =

> -	./configure =

> -	./make
> -	./make install
> +       autoreconf -sfi

we have autogen.sh to deal with autoreconf. let's recommend to use
it instead of direct autoreconf.

	-ss

> +       ./configure
> +       make
> +       sudo make install
>  =

>  Note: For Android (running Intel Architecture ) there is a Android.mk =

>  that was provided by community members, and at this time is supported
> -- =

> 1.9.1
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============0774072556584107712==--

