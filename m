Content-Type: multipart/mixed; boundary="===============2844775544697007653=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [FYI][RFC][PATCH 0/2] MALI GPU profiling support
Date: Thu, 01 Nov 2012 15:11:06 -0700
Message-ID: <CAMFVxVjh-QoAeSV6SLnxs9hfxT+4-v9a2ghFk_n58WNgcSuZ4A@mail.gmail.com>
In-Reply-To: 50928DA2.1090403@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2844775544697007653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry about that, the size boundary has been upped so this should stop
happening so often.
-C


On Thu, Nov 1, 2012 at 7:56 AM, Igor Zhbanov <i.zhbanov(a)samsung.com> wrot=
e:
> The second patch is over 40 Kb and waiting for list moderator approval.
>
>
> Igor Zhbanov wrote:
>
>> Igor Zhbanov (2):
>>    Introducing process scanner facility
>>    MALI GPU profiling support
>>
>>   src/Makefile.am                                   |    2 +
>>   src/main.cpp                                      |   17 +-
>>   src/mali-internal-events/mali-events.h            |  143 +++
>>   src/mali-internal-events/mali-internal-events.cpp | 1279
>> +++++++++++++++++++++
>>   src/mali-internal-events/proc-scan.cpp            |  316 +++++
>>   src/mali-internal-events/proc-scan.h              |   59 +
>>   src/process/process.cpp                           |   43 +
>>   7 files changed, 1857 insertions(+), 2 deletions(-)
>>   create mode 100644 src/mali-internal-events/mali-events.h
>>   create mode 100644 src/mali-internal-events/mali-internal-events.cpp
>>   create mode 100644 src/mali-internal-events/proc-scan.cpp
>>   create mode 100644 src/mali-internal-events/proc-scan.h
>
>
> --
> Best regards,
> Igor Zhbanov,
> Technical Leader,
> phone: +7 (495) 797 25 00 ext 3806
> e-mail: i.zhbanov(a)samsung.com
>
> Mobile group, Moscow R&D center, Samsung Electronics
> 12 Dvintsev street, building 1
> 127018, Moscow, Russian Federation
>
>
> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop

--===============2844775544697007653==--

