Content-Type: multipart/mixed; boundary="===============3290756322583697884=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] Document key bindings in man page
Date: Mon, 20 May 2013 16:26:00 +0300
Message-ID: <20130520132600.GB2238@swordfish>
In-Reply-To: 1368979243-3175-3-git-send-email-hpdeifel@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3290756322583697884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (05/19/13 18:00), Hans-Peter Deifel wrote:
> Signed-off-by: Hans-Peter Deifel <hpdeifel(a)gmx.de>
> ---

looks good.

	-ss

>  doc/powertop.8 | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> =

> diff --git a/doc/powertop.8 b/doc/powertop.8
> index 8a70076..e6ec199 100644
> --- a/doc/powertop.8
> +++ b/doc/powertop.8
> @@ -54,6 +54,38 @@ generate a report for a specified number of seconds.
>  .TP
>  \fB\-\-version
>  print version information and exit.
> +.SH COMMANDS
> +In interactive mode, the following key bindings are available:
> +.TP
> +\fBTab
> +Show next tab
> +.TP
> +\fBBackTab
> +Show previous tab
> +.TP
> +\fBRight Arrow
> +Scroll to the right
> +.TP
> +\fBLeft Arrow
> +Scroll to the left
> +.TP
> +\fBUp Arrow, PageUp
> +Scroll up or select previous item
> +.TP
> +\fBDown Arrow, PageDown
> +Scroll down or select next item
> +.TP
> +\fBSpace, Return
> +Activate current item
> +.TP
> +\fBs
> +Set refresh timeout
> +.TP
> +\fBr
> +Refresh window
> +.TP
> +\fBq, Ctrl-C, Escape
> +Exit powertop
>  .SH BUGS
>  Send bug reports to <powertop(a)lists.01.org>
>  .SH SEE ALSO
> -- =

> 1.8.1.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3290756322583697884==--

