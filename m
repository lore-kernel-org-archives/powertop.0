Content-Type: multipart/mixed; boundary="===============2575212802253319208=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 0/2] tuningsysfs patches
Date: Tue, 26 Nov 2013 22:27:08 +0300
Message-ID: <1385494030-22556-1-git-send-email-sergey.senozhatsky@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2575212802253319208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
two small patches in -next.

tuningsysfs:
- fix tuningsysfs typo
- use process_directory() helper function


please pull from:
https://github.com/sergey-senozhatsky/powertop2-next.git


Sergey Senozhatsky (2):
  tuningsysfs: fix msg typo
  tuningsysfs: use lib process_directory() helper

 src/tuning/tuningsysfs.cpp | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

-- =

1.8.5.rc3.362.gdf10213.dirty


--===============2575212802253319208==--

