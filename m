Content-Type: multipart/mixed; boundary="===============2331828572634419212=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Use printf, not sprintf,
 to print messages to stdout.
Date: Fri, 22 Jun 2012 09:13:53 -0700
Message-ID: <4FE499C1.3000503@linux.intel.com>
In-Reply-To: 1339918399.3605.1.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2331828572634419212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

patch accepted thank you.

On 06/16/2012 09:14 AM, Magnus Fromreide wrote:
> This undos the last printf->sprintf change from 8fd54ace.
>
> Signed-off-by: Magnus Fromreide<magfr(a)lysator.liu.se>
> ---
>   src/main.cpp |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/main.cpp b/src/main.cpp
> index 880d745..a2d8700 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -229,7 +229,7 @@ void one_measurement(int seconds, char *workload)
>   void out_of_memory()
>   {
>   	reset_display();
> -	sprintf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
> +	printf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
>   	abort();
>   }
>
> @@ -458,7 +458,7 @@ int main(int argc, char **argv)
>   #ifndef DISABLE_NCURSES
>   	endwin();
>   #endif
> -	sprintf("%s\n", _("Leaving PowerTOP"));
> +	printf("%s\n", _("Leaving PowerTOP"));
>
>   	end_process_data();
>   	clear_process_data();


--===============2331828572634419212==--

