Content-Type: multipart/mixed; boundary="===============4729650204496926736=="
MIME-Version: 1.0
From: Prigent, Christophe <christophe.prigent at intel.com>
Subject: Re: [Powertop] [PATCH 0/3] Fix all warnings
Date: Tue, 17 Jun 2014 15:26:06 +0000
Message-ID: <AC81B6AA7676DD448250A85A459C1F4142B29A61@IRSMSX101.ger.corp.intel.com>
In-Reply-To: 1402697910-29154-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4729650204496926736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I confirm there are no warning when building PowerTop with the 3 patches ap=
plied.
Tested with PowerTOP versionv2.6.1 commit dfc2ba97ffba44b51379fd3617a4f6fea=
d40037d

-----Original Message-----
From: PowerTop [mailto:powertop-bounces(a)lists.01.org] On Behalf Of Alexan=
dra Yates
Sent: Saturday, June 14, 2014 12:18 AM
To: powertop(a)lists.01.org
Subject: [Powertop] [PATCH 0/3] Fix all warnings

This patch fixes all warning encountered when building PowerTOP. =


Alexandra Yates (3):
  fix-warnings: Ignoring return value of system()
  fix-warnings: Ignoring return value
  fix-warnings: Ignoring return value

 src/calibrate/calibrate.cpp |   16 +++++++++++-----
 src/measurement/extech.cpp  |   13 +++++++------
 src/tuning/bluetooth.cpp    |    6 ++++--
 3 files changed, 22 insertions(+), 13 deletions(-)

-- =

1.7.9.5

_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop
---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, =

92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


--===============4729650204496926736==--

