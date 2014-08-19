Content-Type: multipart/mixed; boundary="===============2653207386621777188=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 09/14] do not use ncurses when --auto-tune is
 specified
Date: Tue, 19 Aug 2014 20:41:48 +0900
Message-ID: <20140819114148.GB2484@swordfish>
In-Reply-To: 1407274298-16404-9-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2653207386621777188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (08/05/14 22:31), Sami Kerola wrote:
> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
> ---
>  src/main.cpp | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> =

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

tuning use ui_notify_user(), which requires ncurses. yes, there
is only one place where we notify user via ui_notify_user(), but,
in general, we can (and should) use this function for error
reporting back to user as well, since fprintf to stderr is less
correct/nice way to yell about something important/critical.

	-ss

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

--===============2653207386621777188==--

