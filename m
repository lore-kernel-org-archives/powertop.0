Content-Type: multipart/mixed; boundary="===============2080896237662395102=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/3] Remove redundant inclusion of -O2 -g in
 powertop_CXXFLAGS
Date: Mon, 21 May 2012 15:16:21 -0700
Message-ID: <4FBABEB5.9090502@linux.intel.com>
In-Reply-To: 1337631481.2616.1.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2080896237662395102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/21/2012 12:46 PM, Magnus Fromreide wrote:
> When building a program then program_CXXFLAGS replaces AM_CXXFLAGS and
> CXXFLAGS is appended to it, this is the reason for the double -O2 -g opti=
ons
> when building the powertop binary.
>
> This patch removes the extra -O2 -g and returns the control of the optimi=
zation
> and debug flags to CXXFLAGS as one would expect.
>
> Please note that the default value of CXXFLAGS is -O2 -g if the compiler
> supports it.
>
> Signed-off-by: Magnus Fromreide<magfr(a)lysator.liu.se>
> ---
>   src/Makefile.am |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/Makefile.am b/src/Makefile.am
> index e26c8bc..3e8294a 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -33,7 +33,7 @@ powertop_SOURCES =3D parameters/persistent.cpp paramete=
rs/learn.cpp parameters/par
>   		main.cpp css.h powertop.css
>
>
> -powertop_CXXFLAGS =3D -O2 -g -fno-omit-frame-pointer -fstack-protector -=
Wall -Wshadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS)=
 $(LIBNL_CFLAGS) $(GLIB2_CFLAGS)
> +powertop_CXXFLAGS =3D -fno-omit-frame-pointer -fstack-protector -Wall -W=
shadow -Wformat -I/usr/include/ $(NCURSES_CFLAGS) $(PCIUTILS_CFLAGS) $(LIBN=
L_CFLAGS) $(GLIB2_CFLAGS)
>
>
>   powertop_CPPFLAGS =3D -D_FORTIFY_SOURCE=3D2 $(NCURSES_CFLAGS) $(PCIUTIL=
S_CFLAGS) $(LIBNL_CFLAGS) $(GLIB2_CFLAGS) $(LIBZ_CFLAGS)
patch applied
Thank You
-Chris

--===============2080896237662395102==--

