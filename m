Content-Type: multipart/mixed; boundary="===============0237603880408948887=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v3 03/15] add src/cpu/rapl/.deps to .gitignore
Date: Tue, 14 Oct 2014 16:32:00 -0700
Message-ID: <543DB270.6080501@linux.intel.com>
In-Reply-To: 1410125238-29600-4-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0237603880408948887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

LGTM.

Reviewed-By: Joe Konno <joe.konno(a)intel.com>

On 09/07/2014 02:27 PM, Sami Kerola wrote:
> Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/.gitignore b/.gitignore
> index 35d41c2..d00973f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -44,6 +44,7 @@ src/.deps/
>  src/Makefile
>  src/calibrate/.deps/
>  src/cpu/.deps/
> +src/cpu/rapl/.deps
>  src/devices/.deps/
>  src/measurement/.deps/
>  src/parameters/.deps/
>=20

--===============0237603880408948887==--

