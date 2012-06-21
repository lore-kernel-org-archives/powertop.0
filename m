Content-Type: multipart/mixed; boundary="===============4812542592119558616=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Use printf, not sprintf,
 to print messages to stdout.
Date: Thu, 21 Jun 2012 22:14:41 +0300
Message-ID: <20120621191441.GA3476@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 1339918399.3605.1.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4812542592119558616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/16/12 18:14), Magnus Fromreide wrote:
> This undos the last printf->sprintf change from 8fd54ace.
> =

> Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
> ---
>  src/main.cpp |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/src/main.cpp b/src/main.cpp
> index 880d745..a2d8700 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -229,7 +229,7 @@ void one_measurement(int seconds, char *workload)
>  void out_of_memory()
>  {
>  	reset_display();
> -	sprintf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
> +	printf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
>  	abort();
>  }
>  =

> @@ -458,7 +458,7 @@ int main(int argc, char **argv)
>  #ifndef DISABLE_NCURSES
>  	endwin();
>  #endif
> -	sprintf("%s\n", _("Leaving PowerTOP"));
> +	printf("%s\n", _("Leaving PowerTOP"));
>  =

>  	end_process_data();
>  	clear_process_data();
>

Oh, good catch!

Looks like changes were introduced by commit
8fd54ace0a398cd155bf0af620c85d0105778f6a.


	-ss

--===============4812542592119558616==--

