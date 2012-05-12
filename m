Content-Type: multipart/mixed; boundary="===============0190747521823392624=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Fix trying to use libnl-2.0 when only
 libnl-3.0 is installed
Date: Sat, 12 May 2012 13:54:29 -0700
Message-ID: <4FAECE05.9080109@linux.intel.com>
In-Reply-To: CABsxX9KTNi9sXTtBGgMo5=HYwwtcEqM=Gc1sFTRwzEMWuNwQvA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0190747521823392624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/12/2012 1:46 PM, Kok, Auke-jan H wrote:
> =

> =

> On Sat, May 12, 2012 at 8:50 AM, Vinicius Costa Gomes <vcgomes(a)gmail.com
> <mailto:vcgomes(a)gmail.com>> wrote:
> =

>     From: Vinicius Costa Gomes <vinicius.gomes(a)openbossa.org
>     <mailto:vinicius.gomes(a)openbossa.org>>
> =

>     When using libnl-3.0 we need to link with libnl-genl also, if not, we
>     get a lot of undefined symbols.
>     ---
>      configure.ac <http://configure.ac> |    2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
> =

>     diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     index 2d56684..3579b6e 100644
>     --- a/configure.ac <http://configure.ac>
>     +++ b/configure.ac <http://configure.ac>
>     @@ -56,7 +56,7 @@ PKG_CHECK_MODULES([LIBZ], [zlib],[],[
> =

>      has_libnl_ver=3D0
>      PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_ver=3D1], [
>     -       AC_SEARCH_LIBS([nl_socket_alloc], [nl], [has_libnl_ver=3D2], [
>     +       AC_SEARCH_LIBS([nl_socket_alloc], [libnl-2.0],
>     [has_libnl_ver=3D2], [
> =

> =

> are you sure you want the linker to check for -llibnl-2.0? that means
> it's going to try to find a "liblibnl-2.0.so <http://liblibnl-2.0.so>"
> (note the double "lib" here).
> =

> Auke

this autoconf stuff is giving me a headache

maybe we should ask the libnl guys if they have some snippet that they
recommend.... after all I doubt we're the only ones dealing with their
library.


--===============0190747521823392624==--

