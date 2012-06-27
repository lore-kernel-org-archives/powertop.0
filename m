Content-Type: multipart/mixed; boundary="===============0973438576614578715=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] remove -Werror from AM_INIT_AUTOMAKE
Date: Wed, 27 Jun 2012 07:20:09 +0300
Message-ID: <20120627042009.GA2996@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 1339972214-18301-1-git-send-email-moben@exherbo.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0973438576614578715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/18/12 00:30), Benedikt Morbach wrote:
> While this is nice while developing, it may cause
> various problems with distributed tarballs.
> =

> A new automake version could add a warning, causing errors for distributi=
ons
> and users, who might need to patch configure.ac and thus run autoreconf.
> =

> For example, we hit an error where a third party package (gettext) uses
> functionality (AM_PROG_MKDIR_P) which is deprecated in newer automake ver=
sions(1.12.1),
> causing the powertop build to fail.
> =

> Since the problem lies elsewhere, it is stupid to fail for this while bui=
lding powertop
> ---
>  configure.ac |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/configure.ac b/configure.ac
> index 4da4eea..ff4cdea 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -3,7 +3,7 @@
>  =

>  AC_PREREQ([2.68])
>  AC_INIT([powertop], [2.0], [powertop(a)lists.01.org])
> -AM_INIT_AUTOMAKE([-Wall -Werror foreign ])
> +AM_INIT_AUTOMAKE([-Wall foreign ])
>  AC_LANG([C++])
>  AC_CONFIG_FILES([Makefile src/Makefile pevent/Makefile po/Makefile.in do=
c/Makefile])
>  AC_CONFIG_SRCDIR([src/main.cpp])
> =


Well,
This looks helpful.

I just hit that guy

	automake-1.12: warnings are treated as errors
	configure.ac:14: warning: The 'AM_PROG_MKDIR_P' macro is deprecated, and w=
ill soon be removed.
	configure.ac:14: You should use the Autoconf-provided 'AC_PROG_MKDIR_P' ma=
cro instead,
	configure.ac:14: and use '$(MKDIR_P)' instead of '$(mkdir_p)'in your Makef=
ile.am files.
	make: *** [Makefile.in] Error 1

according to lists, they are aware of this.

So, how about pushing that one?



	Tested-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>


	-ss

--===============0973438576614578715==--

