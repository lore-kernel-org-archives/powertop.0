Content-Type: multipart/mixed; boundary="===============8295285299304393590=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH UPDATED] powertop: update build instructions
Date: Sun, 13 Jul 2014 19:41:00 +0200
Message-ID: <20140713174100.GA15447@sara.bahnhof.se>
In-Reply-To: 1405238874-16384-1-git-send-email-meraj.enigma@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8295285299304393590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2014 at 02:07:54PM +0600, Mohammad Merajul Islam Molla wrot=
e:
> update powertop build instuctions in README file.

Should the README file reflect the repository code or the distributed
packages?

Is it not part of distribution package generation to run autogen so that
the old README file was fine, the only change one could imagine is adding
a README.hacking that states that you might need to run autogen.sh
before the commit.

/MF

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
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============8295285299304393590==--

