Content-Type: multipart/mixed; boundary="===============9178813225109082935=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [PATCH] Change library/pkg search condition for
 libnl2/3
Date: Fri, 02 Nov 2012 07:32:49 -0700
Message-ID: <CAMFVxVjb4p0u8WxhKS+o-FE_1B21m5O35_ui19PHg1mPhad_WA@mail.gmail.com>
In-Reply-To: 1351859446-9074-1-git-send-email-zhang.austin@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9178813225109082935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the testing data. As soon as I can verify or get
confirmation for this patch on Suse and Fedora at a minimum i will
merge.
That chunk of auto config has been a historical pain, so I want to
make sure it works on several distros.
-C


On Fri, Nov 2, 2012 at 5:30 AM,  <zhang.austin(a)gmail.com> wrote:
> From: Austin Zhang <zhang.austin(a)gmail.com>
>
> So that we can configure in system with libnl2 or/and libnl3.
>
> Without/With this patch, the './configure' result as:
> -------------------------------------------------------------------------=
-------
>                    |        ubuntu 11-10         ||          ubuntu 12.04
> -------------------------------------------------------------------------=
-------
>                    | libnl-1 | libnl-2 | libnl-3 || libnl-1 | libnl-2 | l=
ibnl-3
> -------------------------------------------------------------------------=
-------
> without this patch | Pass    | Fail    | Fail    || Pass    | Fail    | P=
ass
> with    this patch | Pass    | Pass    | Pass    || Pass    | Pass    | P=
ass
> -------------------------------------------------------------------------=
-------
>
> Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> ---
>  configure.ac |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index b8c183f..ccc0ec5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -54,11 +54,11 @@ PKG_CHECK_MODULES([PCIUTILS], [libpci],[has_libpci=3D=
1],[
>
>
>  has_libnl_ver=3D0
> -PKG_CHECK_MODULES([LIBNL], [libnl-3.0 libnl-genl-3.0], [
> +PKG_CHECK_MODULES([LIBNL], [libnl-3.0], [
>         has_libnl_ver=3D3], [
>         AC_SEARCH_LIBS([nl_socket_alloc], [nl-3 nl-genl-3], [
>                 has_libnl_ver=3D3], [
> -               AC_SEARCH_LIBS([nl_socket_alloc], [nl], [
> +               PKG_CHECK_MODULES([LIBNL], [libnl-2.0], [
>                         has_libnl_ver=3D2], [
>                         PKG_CHECK_MODULES([LIBNL], [libnl-1], [has_libnl_=
ver=3D1], [])])])])
>  if (test "$has_libnl_ver" -eq 0); then
> --
> 1.7.5.4
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============9178813225109082935==--

