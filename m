Content-Type: multipart/mixed; boundary="===============1611801895305972527=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 09/14] do not use ncurses when --auto-tune is
 specified
Date: Wed, 20 Aug 2014 21:28:59 +0900
Message-ID: <20140820122859.GA981@swordfish>
In-Reply-To: 1407274298-16404-9-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1611801895305972527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/05/14 22:31), Sami Kerola wrote:
> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
> ---
>  src/main.cpp | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> =


I think it makes sense to extend ui_notify_user() so it can cover
both cases: initialised ncurses -- calling mvprintw(), and
uninitialised ncurses -- printf (to stdout).

this will change a bit 'powertop --auto-tune' behaviour, since by
default user will now see a 'list' of commands executed by powertop,
but it's really easy to silent powertop via stdout redirection.


what do you think?

	-ss


> diff --git a/src/main.cpp b/src/main.cpp
> index 3b67ef0..4bfd038 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -460,7 +460,8 @@ int main(int argc, char **argv)
>  		end_pci_access();
>  		exit(0);
>  	}
> -	init_display();
> +	if (!auto_tune)
> +		init_display();
>  	initialize_tuning();
>  	/* first one is short to not let the user wait too long */
>  	one_measurement(1, NULL);
> @@ -473,11 +474,13 @@ int main(int argc, char **argv)
>  	}
>  =

>  	while (!leave_powertop) {
> -		show_cur_tab();
> +		if (!auto_tune)
> +			show_cur_tab();
>  		one_measurement(time_out, NULL);
>  		learn_parameters(15, 0);
>  	}
> -	endwin();
> +	if (!auto_tune)
> +		endwin();
>  	printf("%s\n", _("Leaving PowerTOP"));
>  =

>  	end_process_data();
> -- =

> 2.0.4
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============1611801895305972527==--

