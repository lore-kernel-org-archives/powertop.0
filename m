Content-Type: multipart/mixed; boundary="===============4897184252867058862=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH 2/2] runtime_pm: register parameters
Date: Thu, 31 Jan 2013 14:44:52 -0800
Message-ID: <20130131144452.028c8ed8@bluebird.jf.intel.com>
In-Reply-To: 20121219151323.GB3200@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4897184252867058862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Dec 2012 18:13:23 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> register parameter during runtime_pmdevice() construction, making =

> call to get_parameter_value() in power_usage() valid.
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
> =

>  src/devices/runtime_pm.cpp | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
> index 0d13cab..bbc3bf0 100644
> --- a/src/devices/runtime_pm.cpp
> +++ b/src/devices/runtime_pm.cpp
> @@ -49,11 +49,11 @@ runtime_pmdevice::runtime_pmdevice(const char
> *_name, const char *path) : device =

>  	before_suspended_time =3D 0;
>  	before_active_time =3D 0;
> -        after_suspended_time =3D 0;
> +	after_suspended_time =3D 0;
>  	after_active_time =3D 0;
> -}
> -
>  =

> +	register_parameter(humanname);
> +}
>  =

>  void runtime_pmdevice::start_measurement(void)
>  {
> @@ -237,4 +237,4 @@ void create_all_runtime_pm_devices(void)
>  	do_bus("spi");
>  	do_bus("platform");
>  	do_bus("i2c");
> -}
> \ No newline at end of file
> +}
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

Applied, thanks.

Kristen

--===============4897184252867058862==--

