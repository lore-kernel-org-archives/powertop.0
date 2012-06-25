Content-Type: multipart/mixed; boundary="===============5360270183456297333=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2] conditionally disable pci if not supported
Date: Mon, 25 Jun 2012 09:04:36 -0700
Message-ID: <4FE88C14.1040005@linux.intel.com>
In-Reply-To: 1340640041-27358-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5360270183456297333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/25/2012 9:00 AM, Rajagopal Venkat wrote:

<no commit message .. why? one sentence is cheap>


>  =

> diff --git a/src/lib.h b/src/lib.h
> index 588c023..d354151 100644
> --- a/src/lib.h
> +++ b/src/lib.h
> @@ -30,6 +30,10 @@
>  #endif
>  #include <stdint.h>
>  =

> +#if HAVE_CONFIG_H
> +#include "config.h"
> +#endif
> +
>  #ifndef DISABLE_I18N
>  #define _(STRING)    gettext(STRING)
>  #else
> =




ok this chunk I do not understand;
the rest of your patch looks very reasonable.
why is config.h inside an if ?

--===============5360270183456297333==--

