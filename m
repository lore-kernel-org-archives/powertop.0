Content-Type: multipart/mixed; boundary="===============4184608641365278065=="
MIME-Version: 1.0
From: Daniel Leung <daniel.leung at linux.intel.com>
Subject: Re: [Powertop] [PATCH 1/2] prevent segment fault for android built 2
Date: Mon, 06 Jul 2015 14:44:05 -0700
Message-ID: <20150706144405.0eb51c6a9bb96c3835f60a84@linux.intel.com>
In-Reply-To: 1435751544-9622-1-git-send-email-zhaoyang.huang@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4184608641365278065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed,  1 Jul 2015 19:52:24 +0800
Zhaoyang Huang <zhaoyang.huang(a)linaro.org> wrote:

> the buffer will be turn into NULL after invoking the mbsrtowcs function
> of bionic libc. Add a condition judgement for that
> =

> Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
> ---
>  src/lib.cpp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/src/lib.cpp b/src/lib.cpp
> index 88fe5f3..8d1ca9f 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -285,7 +285,7 @@ void align_string(char *buffer, size_t min_sz, size_t=
 max_sz)
>  	/* start with mbsrtowcs() local mbstate_t * and
>  	 * NULL dst pointer*/
>  	sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
> -	if (sz =3D=3D (size_t)-1) {
> +	if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
>  		buffer[min_sz] =3D 0x00;
>  		return;
>  	}
> -- =

> 1.7.9.5
> =


If you are on master branch, there is a patch (patches/android/prevent_segf=
aults.patch) to workaround the NULL pointer.

-- =

Daniel Leung <daniel.leung(a)linux.intel.com>

--===============4184608641365278065==--

