Content-Type: multipart/mixed; boundary="===============0772397016124324118=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] parameters: fix uninitialized values in
 param/result getters
Date: Thu, 31 Jan 2013 14:44:30 -0800
Message-ID: <20130131144430.4465af00@bluebird.jf.intel.com>
In-Reply-To: 20121219150432.GA3200@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0772397016124324118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Dec 2012 18:04:32 +0300
Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com> wrote:

> -- get_param_index()/get_result_index() may be called for unknown
> parameter, causing new map entry creation via operator[] access. it's
> not safe to check returned pair->second value for newly created map
> entry, since there is no default ctor for int type. use map::find()
> instead.
> =

> -- get_parameter_value(char *) now uses get_parameter_value(uint),
> which performs parameters overflow detection and prevents illegal
> read. this one was affecting power_device_sort(), returning garbage
> to compare function.
> =

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> =

> ---
> =

>  src/parameters/parameters.cpp | 40
> ++++++++++++++++++++++++----------------
> src/parameters/parameters.h   |  2 +- 2 files changed, 25
> insertions(+), 17 deletions(-)
> =

> diff --git a/src/parameters/parameters.cpp
> b/src/parameters/parameters.cpp index 1a89b14..936d789 100644
> --- a/src/parameters/parameters.cpp
> +++ b/src/parameters/parameters.cpp
> @@ -44,11 +44,15 @@ static int maxresindex =3D 1;
>  =

>  int get_param_index(const char *name)
>  {
> -	int index;
> -	index =3D param_index[name];
> -	if (index =3D=3D 0) {
> -		index =3D param_index[name] =3D ++maxindex;
> -	}
> +	std::map<string, int>::iterator it;
> +	int index =3D 0;
> +
> +	it =3D param_index.find(name);
> +	if (it =3D=3D param_index.end()) {
> +		param_index[name] =3D ++maxindex;
> +		index =3D maxindex;
> +	} else
> +		index =3D it->second;
>  =

>  	if (index =3D=3D 0)
>  		printf("OH BLA\n");
> @@ -57,11 +61,15 @@ int get_param_index(const char *name)
>  =

>  int get_result_index(const char *name)
>  {
> -	int index;
> -	index =3D result_index[name];
> -	if (index =3D=3D 0) {
> -		index =3D result_index[name] =3D ++maxresindex;
> -	}
> +	std::map<string, int>::iterator it;
> +	int index =3D 0;
> +
> +	it =3D result_index.find(name);
> +	if (it =3D=3D result_index.end()) {
> +		result_index[name] =3D ++maxresindex;
> +		index =3D maxresindex;
> +	} else
> +		index =3D it->second;
>  =

>  	return index;
>  }
> @@ -101,16 +109,16 @@ void set_parameter_value(const char *name,
> double value, struct parameter_bundle double
> get_parameter_value(const char *name, struct parameter_bundle
> *the_bundle) { unsigned int index;
> -
>  	index =3D get_param_index(name);
> -	if (index >=3D the_bundle->parameters.size()) {
> -		fprintf(stderr, "BUG: requesting unregistered
> parameter %s\n", name);
> -	}
> -	return the_bundle->parameters[index];
> +	return get_parameter_value(index, the_bundle);
>  }
>  =

> -double get_parameter_value(int index, struct parameter_bundle
> *the_bundle) +double get_parameter_value(unsigned int index, struct
> parameter_bundle *the_bundle) {
> +	if (index >=3D the_bundle->parameters.size()) {
> +		fprintf(stderr, "BUG: requesting unregistered
> parameter %d\n", index);
> +		return 0;
> +	}
>  	return the_bundle->parameters[index];
>  }
>  =

> diff --git a/src/parameters/parameters.h b/src/parameters/parameters.h
> index a8c1154..bd9fee8 100644
> --- a/src/parameters/parameters.h
> +++ b/src/parameters/parameters.h
> @@ -60,7 +60,7 @@ extern int get_result_index(const char *param);
>  =

>  extern void register_parameter(const char *name, double
> default_value =3D 0.00, double weight =3D 1.0); extern double
> get_parameter_value(const char *name, struct parameter_bundle *bundle
> =3D &all_parameters); -extern double get_parameter_value(int index,
> struct parameter_bundle *bundle =3D &all_parameters); +extern double
> get_parameter_value(unsigned int index, struct parameter_bundle
> *bundle =3D &all_parameters); extern void set_parameter_value(const
> char *name, double value, struct parameter_bundle *bundle =3D
> &all_parameters); =

> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

applied, thanks.

Kristen

--===============0772397016124324118==--

