Content-Type: multipart/mixed; boundary="===============1060999962166551670=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [PATCH] Move report.cpp and report.h to report/
 directory.
Date: Thu, 11 Oct 2012 15:03:10 +0400
Message-ID: <5076A76E.4020001@samsung.com>
In-Reply-To: 1349953169-17112-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1060999962166551670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Igor Zhbanov wrote:
> Move report.cpp and report.h to report/ directory to other report-related
> files.
> ---
>   src/Makefile.am            |    4 +-
>   src/cpu/cpu.cpp            |    2 +-
>   src/devices/device.cpp     |    2 +-
>   src/devlist.cpp            |    2 +-
>   src/main.cpp               |    2 +-
>   src/process/do_process.cpp |    2 +-
>   src/report.cpp             |  195 -------------------------------------=
-------
>   src/report.h               |   46 ----------
>   src/tuning/tuning.cpp      |    2 +-
>   9 files changed, 8 insertions(+), 249 deletions(-)
>   delete mode 100644 src/report.cpp
>   delete mode 100644 src/report.h
Oops... Forget to tell the git about new file. Please wait for the new =

version of the patch.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============1060999962166551670==--

