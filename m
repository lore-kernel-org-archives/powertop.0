Content-Type: multipart/mixed; boundary="===============7803366529383089126=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 0/3] Fix all warnings
Date: Fri, 13 Jun 2014 15:18:26 -0700
Message-ID: <1402697910-29154-1-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: Fix all warnings
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7803366529383089126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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


--===============7803366529383089126==--

