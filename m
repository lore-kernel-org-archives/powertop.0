Content-Type: multipart/mixed; boundary="===============3603809068535195672=="
MIME-Version: 1.0
From: Bram Bouwens <bram at bouwens.org>
Subject: Re: [Powertop] PowerTop configure fails on BeagleBone/Ubuntu
Date: Mon, 21 May 2012 22:00:25 +0200
Message-ID: <4FBA9ED9.9000903@bouwens.org>
In-Reply-To: 9051790.o9vOvIeput@penguin
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3603809068535195672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/21/2012 06:47 PM, Lekensteyn wrote:
> On Monday 21 May 2012 16:56:20 Bram Bouwens wrote:
>> checking for strtoull... yes
>> checking for library containing delwin... -lncurses
>> ./configure: line 19020: syntax error near unexpected token `PCIUTILS,'
>> ./configure: line 19020: `PKG_CHECK_MODULES(PCIUTILS, libpci,,'
> You need to install the pkg-config package.

No, that's present.
>
>> though I see something unexpected with the PCI bus:
>>
>> root(a)omap:~/powertop-2.0# ls /proc/bus/pci
>> ls: cannot access /proc/bus/pci: No such file or directory
> Not sure if there is a kernel config missing, does /sys/bus/pci/ exists?

That isn't there either. Just checked under Angstrom too, it simply isn't t=
here;
the message is slightly different though:

checking for PCIUTILS... no
checking for library containing pci_get_dev... no
configure: error: libpci is required but was not found

And opkg can't find a package for it....

Bram

--===============3603809068535195672==--

