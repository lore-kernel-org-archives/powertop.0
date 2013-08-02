Content-Type: multipart/mixed; boundary="===============7058140482067981134=="
MIME-Version: 1.0
From: Yates, Alexandra <alexandra.yates at intel.com>
Subject: Re: [Powertop] ahci-alpm-with-devslp-accounting
Date: Fri, 02 Aug 2013 16:23:00 +0000
Message-ID: <5B3EBE90AD716C428A6F03AC478C54067FB3399F@ORSMSX105.amr.corp.intel.com>
In-Reply-To: 1375292849-11452-1-git-send-email-alexandra.yates@intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7058140482067981134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I suspect it is.  This is a patch Kristen asked me to submit since it was c=
hanged on my box. =


Kristen, can you elaborate? =


Thank you, =


Alexandra. =


-----Original Message-----
From: powertop-bounces(a)lists.01.org [mailto:powertop-bounces(a)lists.01.o=
rg] On Behalf Of ayates1
Sent: Wednesday, July 31, 2013 10:47 AM
To: powertop(a)lists.01.org
Cc: ayates1
Subject: [Powertop] ahci-alpm-with-devslp-accounting

From: ayates1 <alexandra.yates(a)linux.intel.com>

Added AHCI ALPM accounting for Device Sleep to use with PowerTop to output =
AHCI ALPM. =


ayates1 (1):
  linux-3.9.0-ahci-alpm-with-devslp-accounting

 drivers/ata/ahci.h    |  17 ++++
 drivers/ata/libahci.c | 211 ++++++++++++++++++++++++++++++++++++++++++++++=
+++-
 2 files changed, 226 insertions(+), 2 deletions(-)

-- =

1.8.1.2

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============7058140482067981134==--

