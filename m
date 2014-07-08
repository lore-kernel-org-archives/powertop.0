Content-Type: multipart/mixed; boundary="===============5705992003754973792=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] Simple Question
Date: Mon, 07 Jul 2014 18:24:58 -0700
Message-ID: <53BB486A.5060804@linux.intel.com>
In-Reply-To: COL129-W476C4ACB661CB7F869CA41C60D0@phx.gbl
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5705992003754973792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/7/2014 4:53 PM, Christopher Mansour wrote:
>
> Hello all,
>
> I was wondering if I can use the PowerTop tool in order to observe the po=
wer consumption of a thread. I am doing some experiments which would run on=
 7 threads at the same
> time, I need to know the power consumption of each thread. Is this feasib=
le using the power top tool and how. I would appreciate your help and feedb=
ack.

Powertop, with its internal power model properly trained on the hardware in=
 question, will attribute power consumption to individual processes.

This is not an exact science; the machine learning model needs a whole bunc=
h of samples to learn, and the power attribution logic is slightly rudiment=
ary,
but it's also not unreasonable at the same time.
For example a thread gets accounted for the (modelled) CPU power proportion=
al to the time it consumes, but also for the power of the audio chip if its=
 playing audio
and if you have the right kernel patches, even for the IO it does.



--===============5705992003754973792==--

