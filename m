Content-Type: multipart/mixed; boundary="===============9121016454803491738=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH] Bug-fix:Segmentation fault with powertop --html
Date: Wed, 21 May 2014 16:51:14 -0700
Message-ID: <1400716276-26453-1-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: Re: [Powertop] Segmentation fault with powertop --html
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9121016454803491738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch fixes the segmentation fault erros seen in powertop --html.  =


Reported by: Julian Wollrath" <jwollrath(a)web.de>

Julian can you test the patch please. thank you. AY. =


Alexandra Yates (1):
  Bug-fix: html & csv report core indexes

 src/cpu/cpu.cpp |   30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

-- =

1.7.9.5


--===============9121016454803491738==--

