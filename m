Content-Type: multipart/mixed; boundary="===============5652137150175136999=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] ahci-alpm-with-devslp-accounting
Date: Fri, 02 Aug 2013 13:14:30 +0300
Message-ID: <20130802101430.GA2322@XPBYMINW2233.minsk.epam.com>
In-Reply-To: 1375292849-11452-1-git-send-email-alexandra.yates@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5652137150175136999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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


--===============5652137150175136999==--

