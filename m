Content-Type: multipart/mixed; boundary="===============8548431950212353071=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 0/2] pull request
Date: Wed, 23 Oct 2013 22:27:01 +0300
Message-ID: <cover.1382555988.git.sergey.senozhatsky@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8548431950212353071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
two patches are in -next, fixing Android build errors and IE
html report rendering.

thanks to Sanjay Singh Rawat and Alexandra Yates.

please pull from -next
	git(a)github.com:sergey-senozhatsky/powertop2-next.git


Sanjay Singh Rawat (1):
  resolve android build errors

Sergey Senozhatsky (1):
  html report: fix IE compatibility errors

 Android.mk                      |  4 ++++
 src/cpu/rapl/rapl_interface.cpp |  6 +++---
 src/powertop.css                | 19 ++++++++++++++-----
 3 files changed, 21 insertions(+), 8 deletions(-)

-- =

1.8.4.1.780.ga09e2a8


--===============8548431950212353071==--

