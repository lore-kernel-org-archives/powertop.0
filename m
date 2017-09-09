Content-Type: multipart/mixed; boundary="===============2525281724501252411=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH 1/4 v1] lib: refactor pci_access checks
Date: Sat, 09 Sep 2017 09:18:18 +0200
Message-ID: <20170909071818.GD18791@noemi.bahnhof.se>
In-Reply-To: 20170908223651.27979-2-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2525281724501252411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2017 at 03:36:48PM -0700, Joe Konno wrote:
> From: Joe Konno <joe.konno(a)intel.com>
> =

> Pull the libpci initialization bits out and into its own dedicated functi=
on.

I think the name you choose for the function is odd since what it does is
that it creates the pci_access object if it doesn't exist. It certainly ain=
't
checking anything.

Maybe something along the lines of create_pci_access or initialize_pci_acce=
ss
would be a better name?

> Signed-off-by: Joe Konno <joe.konno(a)intel.com>
> ---
>  src/lib.cpp | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> =

> diff --git a/src/lib.cpp b/src/lib.cpp
> index 5e48f375d087..2b95e64f427b 100644
> --- a/src/lib.cpp
> +++ b/src/lib.cpp
> @@ -296,16 +296,21 @@ void format_watts(double W, char *buffer, unsigned =
int len)
>  #ifndef HAVE_NO_PCI
>  static struct pci_access *pci_access;
>  =

> +static void check_pci_access(void)
> +{
> +	if (!pci_access) {
> +		pci_access =3D pci_alloc();
> +		pci_init(pci_access);
> +	}
> +}
> +
>  char *pci_id_to_name(uint16_t vendor, uint16_t device, char *buffer, int=
 len)
>  {
>  	char *ret;
>  =

>  	buffer[0] =3D 0;
>  =

> -	if (!pci_access) {
> -		pci_access =3D pci_alloc();
> -		pci_init(pci_access);
> -	}
> +	check_pci_access();
>  =

>  	ret =3D pci_lookup_name(pci_access, buffer, len, PCI_LOOKUP_VENDOR | PC=
I_LOOKUP_DEVICE, vendor, device);
>  =

> -- =

> 2.13.5
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============2525281724501252411==--

