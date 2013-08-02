Content-Type: multipart/mixed; boundary="===============3357675911330271548=="
MIME-Version: 1.0
From: Yates, Alexandra <alexandra.yates at intel.com>
Subject: [Powertop] FW:  ahci-alpm-with-devslp-accounting
Date: Fri, 02 Aug 2013 17:03:47 +0000
Message-ID: <5B3EBE90AD716C428A6F03AC478C54067FB339FA@ORSMSX105.amr.corp.intel.com>
In-Reply-To: 465B9F67AFD9BE48A38A1BAB9A5CD4E622A760DC@FMSMSX109.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3357675911330271548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding powertop list. =



Thank you, =


Alexandra. =


-----Original Message-----
From: Accardi, Kristen C =

Sent: Friday, August 02, 2013 9:51 AM
To: Yates, Alexandra
Subject: RE: [Powertop] ahci-alpm-with-devslp-accounting

It's a replacement for that patch - just so that people only have to apply =
the one patch and not worry about doing a series of patches.

-----Original Message-----
From: Yates, Alexandra =

Sent: Friday, August 02, 2013 9:22 AM
To: Accardi, Kristen C
Subject: FW: [Powertop] ahci-alpm-with-devslp-accounting

Could you give me a hand here,  I'm not quite sure what you changed with re=
spect to 3.9.0. =



Thank you, =


Alexandra. =


-----Original Message-----
From: Sergey Senozhatsky [mailto:sergey.senozhatsky(a)gmail.com] =

Sent: Friday, August 02, 2013 3:15 AM
To: Yates, Alexandra
Cc: powertop(a)lists.01.org; ayates1
Subject: Re: [Powertop] ahci-alpm-with-devslp-accounting

On (07/31/13 10:47), ayates1 wrote:
> Date: Wed, 31 Jul 2013 10:47:28 -0700
> From: ayates1 <alexandra.yates(a)intel.com>
> To: powertop(a)lists.01.org
> Cc: ayates1 <alexandra.yates(a)linux.intel.com>
> Subject: [Powertop] ahci-alpm-with-devslp-accounting
> X-Mailer: git-send-email 1.7.9.5
> =

> From: ayates1 <alexandra.yates(a)linux.intel.com>
> =

> Added AHCI ALPM accounting for Device Sleep to use with PowerTop to outpu=
t AHCI ALPM. =

> =

> ayates1 (1):
>   linux-3.9.0-ahci-alpm-with-devslp-accounting
> =

>  drivers/ata/ahci.h    |  17 ++++
>  drivers/ata/libahci.c | 211 ++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 226 insertions(+), 2 deletions(-)
>

Hello,
is this on top of existing patches/linux-3.9.0-ahci-alpm-with-devslp-accoun=
ting.patch ?


	-ss


--===============3357675911330271548==--

