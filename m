Content-Type: multipart/mixed; boundary="===============2838794404026899939=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] [FYI][RFC][PATCH 0/2] MALI GPU profiling support
Date: Thu, 01 Nov 2012 18:56:34 +0400
Message-ID: <50928DA2.1090403@samsung.com>
In-Reply-To: 1351771239-18925-1-git-send-email-i.zhbanov@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2838794404026899939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The second patch is over 40 Kb and waiting for list moderator approval.

Igor Zhbanov wrote:

> Igor Zhbanov (2):
>    Introducing process scanner facility
>    MALI GPU profiling support
>
>   src/Makefile.am                                   |    2 +
>   src/main.cpp                                      |   17 +-
>   src/mali-internal-events/mali-events.h            |  143 +++
>   src/mali-internal-events/mali-internal-events.cpp | 1279 ++++++++++++++=
+++++++
>   src/mali-internal-events/proc-scan.cpp            |  316 +++++
>   src/mali-internal-events/proc-scan.h              |   59 +
>   src/process/process.cpp                           |   43 +
>   7 files changed, 1857 insertions(+), 2 deletions(-)
>   create mode 100644 src/mali-internal-events/mali-events.h
>   create mode 100644 src/mali-internal-events/mali-internal-events.cpp
>   create mode 100644 src/mali-internal-events/proc-scan.cpp
>   create mode 100644 src/mali-internal-events/proc-scan.h

-- =

Best regards,
Igor Zhbanov,
Technical Leader,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

Mobile group, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============2838794404026899939==--

