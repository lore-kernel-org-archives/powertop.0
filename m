Content-Type: multipart/mixed; boundary="===============9037644963711707774=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [Fwd: [PATCH] Bug-fix:Segmentation fault with powertop
 --html]
Date: Thu, 22 May 2014 16:44:48 -0700
Message-ID: <63793.10.24.1.89.1400802288.squirrel@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9037644963711707774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



---------------------------- Original Message ----------------------------
Subject: [PATCH] Bug-fix:Segmentation fault with powertop --html
From:    "Alexandra Yates" <alexandra.yates(a)linux.intel.com>
Date:    Thu, May 22, 2014 4:19 pm
To:      jwollrath(a)web.de
         powertop-dev(a)linux.intel.com
Cc:      "Alexandra Yates" <alexandra.yates(a)linux.intel.com>
--------------------------------------------------------------------------

Hi Julian,

Please test with this new patch.  I left out one line on my previous
submission which caused the later segfault.

thank you,

Alexandra Yates (1):
  Bug-fix:Seg-fault with powertop --html & --csv

 src/cpu/cpu.cpp |   34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

-- =

1.7.9.5



Thank you,
Alexandra.

--===============9037644963711707774==--

