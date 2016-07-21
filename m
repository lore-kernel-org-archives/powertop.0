Content-Type: multipart/mixed; boundary="===============2099563789342681823=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Makefile.am need reference to m4 directory
Date: Thu, 21 Jul 2016 14:26:41 -0700
Message-ID: <20160721142641.66a33513@jbkonno-lemu6.jf.intel.com>
In-Reply-To: ea5e3f56-3143-4916-5956-880c05a45ee5@au.ibm.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2099563789342681823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

A big sigh about the lag between patch submission and a response.
Apologies for that. That lag is not indicative of your
submission's value. I appreciate your submissions very much. ^_^

There was a whitespace quirk, likely due to the MUA used to submit it,
so I had to pass --ignore-whitespace to git-am for a clean application.
That issue seems to specific to this submission and not subsequent
ones, so I'll use git-send-email to submit a 'v2' to maintain
a strict association between the mailing list and what ultimately
lands in the repository.

Style nit inlined below which will not hinder progress whatsoever...

On Mon, 23 May 2016 12:56:06 +1000
Daniel Black <daniel.black(a)au1.ibm.com> wrote:

> Running autoreconf (autconf-2.69/automake-1.15/libtoolize-2.4.6)
> without the m4 directory specified in the Makefile.am file generates
> the following warning:
> =

>  ./autogen.sh
> autoreconf: Entering directory `.'
> autoreconf: running: autopoint
> autoreconf: running: aclocal
> autoreconf: configure.ac: tracing
> autoreconf: running: libtoolize --copy
> libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
> autoreconf: running: /usr/bin/autoconf
> autoreconf: running: /usr/bin/autoheader
> autoreconf: running: automake --add-missing --copy --no-force
> configure.ac:26: warning: The 'AM_PROG_MKDIR_P' macro is deprecated,
> and its use is discouraged.
> configure.ac:26: You should use the Autoconf-provided
> 'AC_PROG_MKDIR_P' macro instead,
> configure.ac:26: and use '$(MKDIR_P)' instead of '$(mkdir_p)'in your
> Makefile.am files.
> autoreconf: Leaving directory `.'
> ---
>  Makefile.am | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Makefile.am b/Makefile.am
> index c8d0ae2..a9cf9db 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -1,4 +1,5 @@
>  AUTOMAKE_OPTIONS =3D subdir-objects
> +ACLOCAL_AMFLAGS=3D-I m4

v2 will have spaces surrounding '=3D' to maintain style consistency. (PS:
I'm aware of numerous style issues around the codebase).

> =

>  SUBDIRS =3D \
>         traceevent \
> --
> 2.7.4

Cheers, and thanks again for the submission

--===============2099563789342681823==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSlhrVDRSQUFvSkVJMklSOVV2U3FwbTFGWVFBSUwrY2gzVGNtSWJNVi9ybTlVWlgrQUoK
L2VFeU9LYjlyN1pGancvWFJ3N01KdW1MdU50WDQ5YThlb2JuZmVVSHZ4RHdCaS9RYnpwVDhZbkQx
alRNb2pKVwp1eXlITU9mVUlOeWYxWmVBMU1FTWNYdFROVDkwdDNMUjlSQ1B6U1kzd3BLZkVhbG1T
QlZsK2NyQXdBOEhiYXVBCnFVTnZaZ0RqdEYybUpKRFMzSEdRcWdTTVB1dXB3ZTBYakI4VXN2MFVF
NU9VVTEwbE1wYk5kUythYkNnRFFUdnQKVkQrMGVyV2hlblg1ZlBIaW04R1lKSWJBaUtQWjFuWUZm
N1BZQ2ZPcXpyaE5HalYvbU5MendWclY4MXlWSGgyRQpTd2hNRXlUUVRrdHpvVEhiT0JlUnhKUzhQ
NjB2RmlDU3NuelRoTDE5VVIybXIvaS9hV2ZTRHpOa0tqMFVvWHBkCkhLM2xweU84TFVtUWFwYW1o
M0xJcDNpWXAvY2tJRDRuMlFLY3RlM1NVNjZKbVo4Q1BObG9yVlRyekpiY3IrZ1UKdWNCT2RhZzFZ
aks5NjcwUFdiMXJTWVY3KzQwRjRJemtaRExnODZLK3JhMlp0M1JsYUlUNzcrbVArOUQ5cHMxUwpm
dVhQZnJsYVZzek1TZU93ckNXQmFyeCsvS2NNSm1OVXVmSS8yNEduS25WWXNzOFJqZFJUSm9GRld0
eCs4SzhuClNUakw3R2VBcU45MndhcjZFVGc2WFNlZ1E5RlJNRy9KWFNUT2NFdEYvU1M3dS9ORjQr
R1lBU01LTmZZQ1RGVlcKd3NuUzZpbk5yeEllblJYTXlBb1pUaHd2ZTZkMytSN0F6L3FGRnYwVTdI
NWtkcWlIdFRnL3NmcDVYcGNKZUVERgpJdWR4MHMvN3V2R2VQUWdSa0VTNgo9Q3E4TwotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============2099563789342681823==--

