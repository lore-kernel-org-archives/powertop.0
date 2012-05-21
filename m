Content-Type: multipart/mixed; boundary="===============0350888059441101342=="
MIME-Version: 1.0
From: Lekensteyn <lekensteyn at gmail.com>
Subject: Re: [Powertop] PowerTop configure fails on BeagleBone/Ubuntu
Date: Mon, 21 May 2012 18:47:08 +0200
Message-ID: <9051790.o9vOvIeput@penguin>
In-Reply-To: 4FBA5794.60107@bouwens.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0350888059441101342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Monday 21 May 2012 16:56:20 Bram Bouwens wrote:
> checking for strtoull... yes
> checking for library containing delwin... -lncurses
> ./configure: line 19020: syntax error near unexpected token `PCIUTILS,'
> ./configure: line 19020: `PKG_CHECK_MODULES(PCIUTILS, libpci,,'
You need to install the pkg-config package.

> though I see something unexpected with the PCI bus:
> =

> root(a)omap:~/powertop-2.0# ls /proc/bus/pci
> ls: cannot access /proc/bus/pci: No such file or directory
Not sure if there is a kernel config missing, does /sys/bus/pci/ exists?

Peter

--===============0350888059441101342==--

