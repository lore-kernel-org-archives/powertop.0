Content-Type: multipart/mixed; boundary="===============3422146192027850688=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH UPDATED] powertop: update build instructions
Date: Sun, 13 Jul 2014 17:55:58 +0900
Message-ID: <20140713085558.GB947@swordfish>
In-Reply-To: 1405238874-16384-1-git-send-email-meraj.enigma@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3422146192027850688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/13/14 14:07), Mohammad Merajul Islam Molla wrote:
> update powertop build instuctions in README file.
> =


thanks.

	-ss

> Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
> ---
>  README | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/README b/README
> index cd38cc5..bc48d3d 100644
> --- a/README
> +++ b/README
> @@ -2,9 +2,10 @@
>  ------------------------------
>  =

>  To build and install PowerTOP type the following commands, =

> +	./autogen.sh
>  	./configure =

> -	./make
> -	./make install
> +	make
> +	sudo make install
>  =

>  Note: For Android (running Intel Architecture ) there is a Android.mk =

>  that was provided by community members, and at this time is supported
> -- =

> 1.9.1
>=20

--===============3422146192027850688==--

