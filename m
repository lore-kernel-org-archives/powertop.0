Content-Type: multipart/mixed; boundary="===============4592183787450780908=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH] remove csstoh.c
Date: Mon, 04 Feb 2013 11:39:05 -0800
Message-ID: <20130204113905.49cdcbd5@bluebird.jf.intel.com>
In-Reply-To: 20130201072634.GA2587@swordfish
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4592183787450780908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Feb 2013 10:26:34 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> Remove csstoh.c since we use csstoh.sh.
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
>  .gitignore   |  1 -
>  src/csstoh.c | 69 ------------------------------------------------------=
------
>  2 files changed, 70 deletions(-)
> =

> diff --git a/.gitignore b/.gitignore
> index 96ffdba..35d41c2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -39,7 +39,6 @@ po/*.gmo
>  po/stamp-po
>  src/powertop
>  src/css.h
> -src/csstoh
>  src/Makefile.in
>  src/.deps/
>  src/Makefile
> diff --git a/src/csstoh.c b/src/csstoh.c
> deleted file mode 100644
> index 28858f5..0000000
> --- a/src/csstoh.c
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -/*
> - * Copyright 2010, Intel Corporation
> - *
> - * This file is part of PowerTOP
> - *
> - * This program file is free software; you can redistribute it and/or mo=
dify it
> - * under the terms of the GNU General Public License as published by the
> - * Free Software Foundation; version 2 of the License.
> - *
> - * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> - * for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program in a file named COPYING; if not, write to the
> - * Free Software Foundation, Inc,
> - * 51 Franklin Street, Fifth Floor,
> - * Boston, MA 02110-1301 USA
> - * or just google for it.
> - *
> - * Authors:
> - *	Arjan van de Ven <arjan(a)linux.intel.com>
> - */
> -
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -#include <string.h>
> -
> -int main(int argc, char **argv)
> -{
> -	FILE *in, *out;
> -	char line[4096];
> -
> -	if (argc < 2) {
> -		printf("Usage:  csstoh cssfile header.h \n");
> -		exit(0);
> -	}
> -	in =3D fopen(argv[1], "rm");
> -	if (!in) {
> -		printf("Failed to open input file %s (%s) \n", argv[1], strerror(errno=
));
> -		return EXIT_FAILURE;
> -	}
> -	out =3D fopen(argv[2], "wm");
> -	if (!out) {
> -		printf("Failed to open output file %s (%s) \n", argv[1], strerror(errn=
o));
> -		return EXIT_FAILURE;
> -	}
> -
> -	fprintf(out, "#ifndef __INCLUDE_GUARD_CCS_H\n");
> -	fprintf(out, "#define __INCLUDE_GUARD_CCS_H\n");
> -	fprintf(out, "\n");
> -	fprintf(out, "const char css[] =3D \n");
> -
> -	while (!feof(in)) {
> -		char *c;
> -		if (fgets(line, 4095, in) =3D=3D NULL)
> -			break;
> -		c =3D strchr(line, '\n');
> -		if (c) *c =3D 0;
> -		fprintf(out, "\t\"%s\\n\"\n", line);
> -	}	=

> -	fprintf(out, ";\n");	=

> -	fprintf(out, "#endif\n");
> -	fclose(out);
> -	fclose(in);
> -	return EXIT_SUCCESS;
> -}
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

Applied.

Kristen

--===============4592183787450780908==--

