Content-Type: multipart/mixed; boundary="===============7129617746658834358=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Use PACKAGE_VERSION for POWERTOP_VERSION
Date: Thu, 29 Nov 2012 07:58:57 -0800
Message-ID: <50B78641.8060503@linux.intel.com>
In-Reply-To: 1353166967-24095-1-git-send-email-namhyung@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7129617746658834358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/17/2012 07:42 AM, Namhyung Kim wrote:
> It was missed to update POWERTOP_VERSION macro so that the
> new v2.2 release still shows v2.1 string on the header of
> ncurses window.  Convert to use PACKAGE_VERSION macro which
> set by autotools to the AC_INIT version so that it cannot
> be missed anymore.
>
> Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> ---
>   src/lib.h |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/lib.h b/src/lib.h
> index 8cf4632..209421a 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -35,8 +35,8 @@
>   =

>   #define _(STRING)    gettext(STRING)
>   =

> -#define POWERTOP_VERSION "v2.1"
> -#define POWERTOP_SHORT_VERSION "2.1"
> +#define POWERTOP_VERSION "v"PACKAGE_VERSION
> +#define POWERTOP_SHORT_VERSION PACKAGE_VERSION
>   =

>   =

>   extern int get_max_cpu(void);
Your patch has been applied
-Chris


--===============7129617746658834358==--

