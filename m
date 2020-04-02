Content-Type: multipart/mixed; boundary="===============3702958505827003147=="
MIME-Version: 1.0
From: Anthony Wong <yp at anthonywong.net>
Subject: [Powertop] [PATCH] README: suggest to install autoconf-archive
Date: Thu, 02 Apr 2020 15:58:35 +0800
Message-ID: <20200402075835.24819-1-yp@anthonywong.net>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3702958505827003147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

After autoconf version bumped to 2.69, autoconf-archive is needed for
AX_PTHREAD macro to work.

Signed-off-by: Anthony Wong <anthony.wong(a)ubuntu.com>
---
 README | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 347e865..a2c32ca 100644
--- a/README
+++ b/README
@@ -11,11 +11,11 @@ ncurses-devel  (required)
 libnl-devel    (required)
 kernel version =3D> 2.6.38
 =

-Example packages to install in Ubuntu
+Example packages to install in Ubuntu:
 =

-sudo apt-get install libpci-dev libnl-3-dev libnl-genl-3-dev gettext \
+sudo apt install libpci-dev libnl-3-dev libnl-genl-3-dev gettext \
 libgettextpo-dev autopoint gettext libncurses5-dev libncursesw5-dev libtoo=
l-bin \
-dh-autoreconf
+dh-autoreconf autoconf-archive pkg-config
 =

 Building & Installing PowerTOP
 ------------------------------
-- =

2.25.1

--===============3702958505827003147==--

