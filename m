Content-Type: multipart/mixed; boundary="===============6087412345869824626=="
MIME-Version: 1.0
From: Chris Ferron <chris.e.ferron at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] Fix build with C++11 support enabled
Date: Mon, 14 May 2012 10:29:08 -0700
Message-ID: <4FB140E4.2040600@linux.intel.com>
In-Reply-To: 3068026.LgSXzsabzU@intelfx-laptop
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6087412345869824626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for the patch.
-Chris

On 05/13/2012 02:49 AM, Ivan Shapovalov wrote:
> In particular, usage of __DATE__ in main.cpp is now recognized as a
> user-defined literal, so an additional whitespace is required separating
> the string and __DATE__.
>
> Also, typeof (which was a GNU extension) is now replaced by decltype,
> so perf/perf_bundle.cpp has been modified.
> The preprocessor is used to tell whether we are compiling in C++11 mode
> or not and select the keyword accordingly.
> ---
>   src/main.cpp             |    2 +-
>   src/perf/perf_bundle.cpp |    8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/src/main.cpp b/src/main.cpp
> index e168fa4..433fea6 100644
> --- a/src/main.cpp
> +++ b/src/main.cpp
> @@ -80,7 +80,7 @@ static const struct option long_options[] =3D
>
>   static void print_version()
>   {
> -	printf(_("Powertop version" POWERTOP_VERSION ", compiled on "__DATE__ "=
\n"));
> +	printf(_("Powertop version" POWERTOP_VERSION ", compiled on " __DATE__ =
"\n"));
>   }
>
>   static bool set_refresh_timeout()
> diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> index fc677f5..38e1e91 100644
> --- a/src/perf/perf_bundle.cpp
> +++ b/src/perf/perf_bundle.cpp
> @@ -38,6 +38,10 @@
>
>   #include "../cpu/cpu.h"
>
> +#if defined(__GXX_EXPERIMENTAL_CXX0X__) || (__cplusplus>=3D 201103L)
> +# define USE_DECLTYPE
> +#endif
> +
>   class perf_bundle_event: public perf_event
>   {
>   public:
> @@ -58,7 +62,11 @@ void perf_bundle_event::handle_event(struct perf_event=
_header *header, void *coo
>   	buffer =3D (unsigned char *)malloc(header->size);
>   	memcpy(buffer, header, header->size);
>
> +#ifdef USE_DECLTYPE
> +	vector =3D (decltype(vector))cookie;
> +#else
>   	vector =3D (typeof(vector))cookie;
> +#endif
>   	vector->push_back(buffer);
>   }
>


--===============6087412345869824626==--

