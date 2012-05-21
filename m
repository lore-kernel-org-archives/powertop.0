Content-Type: multipart/mixed; boundary="===============0273230119605579940=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/3] Remove unknown symbol
Date: Mon, 21 May 2012 15:16:31 -0700
Message-ID: <4FBABEBF.3090406@linux.intel.com>
In-Reply-To: 1337631427.2616.0.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0273230119605579940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/21/2012 12:39 PM, Magnus Fromreide wrote:
> Nothing sets the symbol NCURES_LIBS and NCURSES_LIBS is already in the li=
nk
> line, so this patch removes the misspelled version.
>
> Signed-off-by: Magnus Fromreide<magfr(a)lysator.liu.se>
> ---
>   src/Makefile.am |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index b396691..e26c8bc 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -40,7 +40,7 @@ powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_C=
FLAGS) $(PCIUTILS_CFLAGS) $(L
>
>   powertop_LDADD =3D ../pevent/libparseevent.la
>
> -AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(=
LIBZ_LIBS) $(NCURES_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
> +AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $(LIBNL_LIBS) $(=
LIBZ_LIBS) $(PTHREAD_LIBS)  $(RESOLV_LIBS)
>
>   BUILT_SOURCES =3D css.h
>   CLEANFILES =3D css.h
patch applied
Thank You
-Chris

--===============0273230119605579940==--

