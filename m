Content-Type: multipart/mixed; boundary="===============1010587622937635996=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] Make libpci dependency optional
Date: Wed, 18 Jul 2012 08:31:15 -0700
Message-ID: <5006D6C3.6040205@linux.intel.com>
In-Reply-To: 1342623237-30526-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1010587622937635996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/18/2012 7:53 AM, Igor Zhbanov wrote:
> +#ifndef DISABLE_PCI
>  	if (strcmp(bus, "pci") =3D=3D 0) {
>  		char filename[4096];
>  		uint16_t vendor =3D 0, device =3D 0;
> @@ -77,6 +79,8 @@ runtime_tunable::runtime_tunable(const char *path, cons=
t char *bus, const char *
>  =

>  =

>  	}
> +#endif /* !DISABLE_PCI */

and this chunk is just silly

if you don't have PCI, this code will never trigger in the first place.



--===============1010587622937635996==--

