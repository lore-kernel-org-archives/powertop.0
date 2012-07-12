Content-Type: multipart/mixed; boundary="===============8543035603859613858=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: Re: [Powertop] [PATCH] Fix crash on Linux ARM hosts
Date: Thu, 12 Jul 2012 22:24:36 +0200
Message-ID: <4FFF3284.6030209@weilnetz.de>
In-Reply-To: 1342124295.4283.16.camel@mattotaupa
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8543035603859613858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 12.07.2012 22:18, schrieb Paul Menzel:
> Am Donnerstag, den 12.07.2012, 22:05 +0200 schrieb Stefan Weil:
>
> [=E2=80=A6]
>
>> It takes a while until0it is built, because my new Raspberry PI is so
>> terribly slow.
>
> Cross-compiling should solve that. ;-) OpenEmbedded or even some Debian
> tools should do the trick.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.openembedded.org/

Well, it's finished now and it works better than before:

PowerTOP 2.0      Overview   Idle stats   Frequency stats   Device =

stats   Tunables

Summary: 0,0 wakeups/second,  0,0 GPU ops/seconds, 0,0 VFS ops/sec and =

22,4% CPU use

                 Usage       Events/s    Category       Description
              62,5 ms/s      0,00        Process        make all
              56,8 ms/s      0,00        Process        bash
              18,5 ms/s      0,00        Process        -bash
...

Obviously the wakeup rate is wrong, but the CPU use value is good.

- sw

PS. Patch follows.

--===============8543035603859613858==--

