Content-Type: multipart/mixed; boundary="===============7840507326826135545=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Query: Weird Output values: Percentage over 100%
Date: Mon, 03 Sep 2012 20:57:50 +0300
Message-ID: <20120903175750.GB3062@swordfish>
In-Reply-To: 5044EADC.7040205@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7840507326826135545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (09/03/12 10:37), Arjan van de Ven wrote:
> >> Running on ARM: Panda Board.
> =

> I wonder if the perf data is somehow incorrect on your platform.
> powertop depends on correct timestamps for example.
> =

> =


I was thinking about this. Could it be possible that we lose
some perf samples? E.g. we have start, but no end timestamps.


	-ss

--===============7840507326826135545==--

