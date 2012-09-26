Content-Type: multipart/mixed; boundary="===============7192294377538015370=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH v2 2/2] Add stubs to support Android platform
Date: Thu, 27 Sep 2012 00:09:05 +0200
Message-ID: <20120926220905.GB8841@bacon.lysator.liu.se>
In-Reply-To: 1348493284-9375-2-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7192294377538015370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 06:58:04PM +0530, Rajagopal Venkat wrote:
> This patch adds stubs for features that are not supported
> by Andriod. An header file which defines all stubs is
> included only for Android builds.
> =

> Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
> diff --git a/src/android_stubs.h b/src/android_stubs.h
> new file mode 100644
> index 0000000..ed37c0e
> --- /dev/null
> +++ b/src/android_stubs.h
> +
> +/* Android C++ new operator does not throw exception on failure */
> +#define set_new_handler(x)

That they fail to throw exceptions from new is no reason to disable
set_new_handler, the newhandler is called by the runtime on out of memory
and is intended to allow the user to try fixing the issue. This is true for
the noexcept version as well. Is this yet another incompatibility?

> +/* define stubs for C++ exception handling */
> +#define try     	if (true)
> +#define catch(x) 	if (false)

If you should do this then I think it should be spelled

#define try if (true)
#define catch else if (false)

in order to not break

if (condition)
    try {
    } catch(type variable) {
    }

but it still breaks the syntax for it which can be shown by simply adding an
else clause to the if statement.

Oh, and furthermore I consider that Android needs a C++ compiler.

> +
> +/* Define __NR_perf_event_open if not already defined */
> +#if __arm__
> +#ifndef __NR_perf_event_open
> +#define __NR_perf_event_open    364
> +#endif
> +#endif
> +
> +/*
> + * bionic libc mbstowcs version returns zero when max parameter
> + * is zero, resulting infinite loops in powertop source. Add
> + * mbstowcs wrapper to fix it.
> + */
> +namespace pandroid {
> +	extern "C" inline size_t mbstowcs(wchar_t *dst,
> +			const char *src, size_t len)
> +	{
> +		return ::mbstowcs(dst, src, ::strlen(src));
> +	}
> +}
> +
> +#define mbstowcs(dst, src, len)		pandroid::mbstowcs(dst, src, len)

Still broken.
If dst isn't a NULL pointer then len is the limit on the length of the
destination buffer. In throwing away this you open up for stack smashing
attacks.

/MF

--===============7192294377538015370==--

