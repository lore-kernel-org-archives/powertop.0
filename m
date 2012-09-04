Content-Type: multipart/mixed; boundary="===============1609336556731696675=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Query: Weird Output values: Percentage over 100%
Date: Tue, 04 Sep 2012 15:37:45 +0300
Message-ID: <20120904123745.GA2993@swordfish>
In-Reply-To: 5045AE2A.7000302@samsung.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1609336556731696675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/04/12 11:30), Igor Zhbanov wrote:
> Arjan van de Ven wrote:
> =

> >shouldn't... the buffers are quite large....
> =

> By the way, I just curious, why events processing are limited to 5000?
> I mean the PowerTOP has f half-megabyte buffer for each type of events
> but wishes to process only 5000 even if data is there?
> =

> void perf_event::process(void *cookie)
> {
> ...
> 	while (pc->data_tail !=3D pc->data_head && i++ < 5000) {
> ...
> =

> In the case of many cores sched:switch will be fired at least CONFIG_HZ *=
 nr_cpus
> times per second (as I understand), and that could easily be larger than =
5000.
> Especially when we measuring for several seconds.
> =


good spot.
Also interested if we will fit all perf samples on (e.g.) loaded 64 core sy=
stem.

	-ss

--===============1609336556731696675==--

