Content-Type: multipart/mixed; boundary="===============3786624500463148279=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] conditionally disable pci support on ARM
 platforms
Date: Fri, 22 Jun 2012 13:01:10 -0700
Message-ID: <4FE4CF06.9050903@linux.intel.com>
In-Reply-To: 1340390567-2994-1-git-send-email-rajagopal.venkat@linaro.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3786624500463148279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/22/2012 11:42 AM, Rajagopal Venkat wrote:
> +case "$host" in
> +arm*)
> +	AC_DEFINE([HAVE_NO_PCI],[1],[Define if host platform is ARM])
> +	;;
> +*)
> +	PKG_CHECK_MODULES([PCIUTILS], [libpci],[],[
> +		AC_SEARCH_LIBS([pci_get_dev], [pci], [], AC_MSG_ERROR([libpci is requi=
red but was not found]), [])
> +	])
> +	;;
> +esac
> +

I don't like this part.

if libpci is option, it is optional.

being arm or not is completely irrelevant in this regard.
(and there will undoubtedly ARM systems at some point that will have PCI
in them)



--===============3786624500463148279==--

