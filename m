Content-Type: multipart/mixed; boundary="===============8049262987134355952=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v2 1/8] Properly cleaning up the display tabs
Date: Wed, 15 Oct 2014 21:58:10 +0900
Message-ID: <20141015125810.GC1189@swordfish>
In-Reply-To: 1413310159-30577-2-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8049262987134355952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/14/14 11:09), Joe Konno wrote:
>  src/display.h   |  1 +
>  2 files changed, 12 insertions(+)
> =

> diff --git a/src/display.cpp b/src/display.cpp
> index 123620a..e227e74 100644
> --- a/src/display.cpp
> +++ b/src/display.cpp
> @@ -87,6 +87,17 @@ void reset_display(void)
>  	resetterm();
>  }
>  =

> +void close_display(void)
> +{
> +	for (unsigned int i =3D 0; i < tab_windows.size(); i++) {
> +		if (tab_windows[tab_names[i]])
> +			delete tab_windows[tab_names[i]];
> +		tab_windows[tab_names[i]] =3D NULL;
> +	}
> +
> +	tab_names.clear();
> +}

here and in other patch -- why does it matter? we are exiting,
memory will be freed anyway, etc. why take that extra effort?

	-ss

>  WINDOW *tab_bar =3D NULL;
>  WINDOW *bottom_line =3D NULL;
> diff --git a/src/display.h b/src/display.h
> index 9af3ec0..c3e8d61 100644
> --- a/src/display.h
> +++ b/src/display.h
> @@ -34,6 +34,7 @@ using namespace std;
>  =

>  extern void init_display(void);
>  extern void reset_display(void);
> +extern void close_display(void);
>  extern int ncurses_initialized(void);
>  extern void show_tab(unsigned int tab);
>  extern void show_next_tab(void);
> -- =

> 2.1.2
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============8049262987134355952==--

