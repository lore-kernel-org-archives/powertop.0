Content-Type: multipart/mixed; boundary="===============3502207203345455476=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: Re: [Powertop] PowerTop configure fails on BeagleBone/Ubuntu
Date: Mon, 21 May 2012 23:18:38 +0200
Message-ID: <2542186.R8oUcZDn0B@penguin>
In-Reply-To: 4FBA9ED9.9000903@bouwens.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3502207203345455476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Monday 21 May 2012 22:00:25 Bram Bouwens wrote:
> On 05/21/2012 06:47 PM, Lekensteyn wrote:
> > On Monday 21 May 2012 16:56:20 Bram Bouwens wrote:
> >> checking for strtoull... yes
> >> checking for library containing delwin... -lncurses
> >> ./configure: line 19020: syntax error near unexpected token `PCIUTILS,'
> >> ./configure: line 19020: `PKG_CHECK_MODULES(PCIUTILS, libpci,,'
> > =

> > You need to install the pkg-config package.
> =

> No, that's present.
Have you re-executed autogen.sh after installing pkg-config?

> >> though I see something unexpected with the PCI bus:
> >> =

> >> root(a)omap:~/powertop-2.0# ls /proc/bus/pci
> >> ls: cannot access /proc/bus/pci: No such file or directory
> > =

> > Not sure if there is a kernel config missing, does /sys/bus/pci/ exists?
> =

> That isn't there either. Just checked under Angstrom too, it simply isn't
> there; the message is slightly different though:
> =

> checking for PCIUTILS... no
> checking for library containing pci_get_dev... no
> configure: error: libpci is required but was not found
> =

> And opkg can't find a package for it....
No idea on this, sorry. Perhaps you can crosscompile it? (no experience on =

doing it with powertop though)

Regards,
Peter

--===============3502207203345455476==--

