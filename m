Content-Type: multipart/mixed; boundary="===============4127720865036525455=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Power Est. is missing
Date: Sat, 22 Mar 2014 01:22:32 +0300
Message-ID: <20140321222232.GA395@swordfish>
In-Reply-To: CADy9ZNC9eoAhQYdOpyH=qBdcTQ-dgiW141aJNwtzUhXrJfK3cA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4127720865036525455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (03/21/14 20:00), Bill Vyzas wrote:
>    Hello all,
> =

>    Two days ago my laptop crashed and I had to reinstall ubuntu and power=
top
>    again. Now whenever I am running powertop the power estimate column fr=
om
>    the overview and the device stats interfaces is missing.
> =

>    I am running Ubuntu 13.10 with the 3.12 kernel. Do I miss any librarie=
s or
>    there is something else going on?

powertop needs a number of measurements (3 times the number of parameters)
in order to begin estimate. give it some time (running on battery).

	-ss

>    Thanks
>    Vasileios

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop


--===============4127720865036525455==--

