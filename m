Content-Type: multipart/mixed; boundary="===============5907084471324795387=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] ccstoh: Don't return success if something went
 wrong
Date: Tue, 17 Jul 2012 15:07:26 -0700
Message-ID: <5005E21E.2040302@linux.intel.com>
In-Reply-To: 1342125703-23323-1-git-send-email-sw@weilnetz.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5907084471324795387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/12/2012 01:41 PM, Stefan Weil wrote:
> exit(0) is the same as returning EXIT_SUCCESS which is a bad
> idea after a severe failure. It will for example result in
> wrong behaviour of make (make won't stop after such failures).
>
> Returning EXIT_FAILURE fixes this.
>
> Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
> ---
>   src/csstoh.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/csstoh.c b/src/csstoh.c
> index e6b1dcf..28858f5 100644
> --- a/src/csstoh.c
> +++ b/src/csstoh.c
> @@ -40,12 +40,12 @@ int main(int argc, char **argv)
>   	in =3D fopen(argv[1], "rm");
>   	if (!in) {
>   		printf("Failed to open input file %s (%s) \n", argv[1], strerror(errn=
o));
> -		exit(0);
> +		return EXIT_FAILURE;
>   	}
>   	out =3D fopen(argv[2], "wm");
>   	if (!out) {
>   		printf("Failed to open output file %s (%s) \n", argv[1], strerror(err=
no));
> -		exit(0);
> +		return EXIT_FAILURE;
>   	}
>   =

>   	fprintf(out, "#ifndef __INCLUDE_GUARD_CCS_H\n");
Your patch has been merged.
Thank you,


--===============5907084471324795387==--

