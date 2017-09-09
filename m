Content-Type: multipart/mixed; boundary="===============8313737094691710806=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 4/4 v1] tuning: complete tunable result switch
Date: Sat, 09 Sep 2017 09:11:56 +0200
Message-ID: <20170909071156.GB18791@noemi.bahnhof.se>
In-Reply-To: 20170908223651.27979-5-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8313737094691710806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2017 at 03:36:51PM -0700, Joe Konno wrote:
> From: Joe Konno <joe.konno(a)intel.com>
> =

> After implementing the tunable_state enum, compiler warning showed switch
> statement within tunable result code was incomplete. Put another way, not=
 all
> possible enum values were checked for. Fix the code so the compiler warni=
ng
> goes away.

Why do you change it from multiple return statements?
Wouldn't

              switch (good_bad()) {
              case TUNE_GOOD:
                      return good_string;
              case TUNE_BAD:
              case TUNE_UNFIXABLE:
                      return bad_string;
+             case TUNE_NEUTRAL:
+             case TUNE_UNKNOWN:
+                     break;
              }
              return neutral_string;

make for an eqiuivalent but smaller patch?

> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> ---
>  src/tuning/tunable.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> =

> diff --git a/src/tuning/tunable.h b/src/tuning/tunable.h
> index 5ea7cdfb5389..afb789d6f4a7 100644
> --- a/src/tuning/tunable.h
> +++ b/src/tuning/tunable.h
> @@ -59,14 +59,20 @@ public:
>  =

>  	virtual char *result_string(void)
>  	{
> +		char *result =3D NULL;
> +
>  		switch (good_bad()) {
>  		case TUNE_GOOD:
> -			return good_string;
> +			result =3D good_string;
>  		case TUNE_BAD:
>  		case TUNE_UNFIXABLE:
> -			return bad_string;
> +			result =3D bad_string;
> +		case TUNE_NEUTRAL:
> +		case TUNE_UNKNOWN:
> +			result =3D neutral_string;
>  		}
> -		return neutral_string;
> +
> +		return result;
>  	}
>  =

>  =

> -- =

> 2.13.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============8313737094691710806==--

