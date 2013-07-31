Content-Type: multipart/mixed; boundary="===============6660525086126236840=="
MIME-Version: 1.0
From: ayates1 <alexandra.yates at intel.com>
Subject: [Powertop] ahci-alpm-with-devslp-accounting
Date: Wed, 31 Jul 2013 10:47:28 -0700
Message-ID: <1375292849-11452-1-git-send-email-alexandra.yates@intel.com>
In-Reply-To: linux-3.9.0-ahci-alpm-with-devslp-accounting
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6660525086126236840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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


--===============6660525086126236840==--

