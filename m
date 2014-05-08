Content-Type: multipart/mixed; boundary="===============2050259463778601464=="
MIME-Version: 1.0
From: Martin Ziegler <ziegler at email.mathematik.uni-freiburg.de>
Subject: Re: [Powertop] segmentation fault when shutting
Date: Fri, 09 May 2014 00:22:16 +0200
Message-ID: <alpine.DEB.2.10.1405090024520.17228@zertz.mathematik.uni-freiburg.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2050259463778601464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The bisection resulted in

commit 5f5976f8b42e4e4717f2d573cf43cb87ccd88fa2
Author: Dan Kalowsky <daniel.kalowsky(a)intel.com>
Date:   Tue Apr 29 15:55:31 2014 -0700

     Adding a clean_shutdown function

     Function is designed to be a on stop place to clean up
     the entire application at shutdown time.

as the first bad commit.

Regards
Martin

--===============2050259463778601464==--

