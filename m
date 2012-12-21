Content-Type: multipart/mixed; boundary="===============3564235712058011910=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [FYI][RFC][PATCH 0/2] MALI GPU profiling support
Date: Fri, 21 Dec 2012 12:58:06 +0300
Message-ID: <20121221095806.GA2914@swordfish.minsk.epam.com>
In-Reply-To: 50D4269D.7020500@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3564235712058011910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (12/21/12 13:06), Igor Zhbanov wrote:
> Hi all,
> =

> It is just a ping. :-)
> The list is quiet about these patches. Will you integrate it or not?
> What should be changed before it?
>

Hello, Igor
sorry, didn't have much free time.
are there any updates scheduled?

I'll take a look during holidays.


	-ss
 =

> Igor Zhbanov wrote:
> >This patch-set adds the ability of profiling MALI GPU in Powertop.
> ...
> >
> >Igor Zhbanov (2):
> >   Introducing process scanner facility
> >   MALI GPU profiling support
> >
> >  src/Makefile.am                                   |    2 +
> >  src/main.cpp                                      |   17 +-
> >  src/mali-internal-events/mali-events.h            |  143 +++
> >  src/mali-internal-events/mali-internal-events.cpp | 1279 +++++++++++++=
++++++++
> >  src/mali-internal-events/proc-scan.cpp            |  316 +++++
> >  src/mali-internal-events/proc-scan.h              |   59 +
> >  src/process/process.cpp                           |   43 +
> >  7 files changed, 1857 insertions(+), 2 deletions(-)
> >  create mode 100644 src/mali-internal-events/mali-events.h
> >  create mode 100644 src/mali-internal-events/mali-internal-events.cpp
> >  create mode 100644 src/mali-internal-events/proc-scan.cpp
> >  create mode 100644 src/mali-internal-events/proc-scan.h
> =

> -- =

> Best regards,
> Igor Zhbanov,
> Technical Leader,
> phone: +7 (495) 797 25 00 ext 3806
> e-mail: i.zhbanov(a)samsung.com
> =

> Mobile group, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3564235712058011910==--

