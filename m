Content-Type: multipart/mixed; boundary="===============3415762806112246382=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix out-of-tree builds
Date: Tue, 17 Jul 2012 15:07:14 -0700
Message-ID: <5005E212.1050306@linux.intel.com>
In-Reply-To: 1342126710-26497-1-git-send-email-sw@weilnetz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3415762806112246382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/12/2012 01:58 PM, Stefan Weil wrote:
> Out-of-tree builds are a very useful feature which should be supported
> by all programs which use GNU automake and the configure / make build.
>
> For powertop, only a very small fix was needed to make it work.
> Without that fix, powertop.css is not found when a build is not
> started from the source tree, so csstoh fails and creates no css.h.
>
> Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
> ---
>   src/Makefile.am |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index c77b2aa..23625a2 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -45,5 +45,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS)=
 $(LIBNL_LIBS) $(LIBZ_LIBS)
>   BUILT_SOURCES =3D css.h
>   CLEANFILES =3D css.h
>   css.h: csstoh powertop.css
> -	./csstoh powertop.css css.h
> +	./csstoh "$(srcdir)"/powertop.css css.h
>   =

Your patch has been merged.
Thank you,


--===============3415762806112246382==--

