Content-Type: multipart/mixed; boundary="===============1626149599510246287=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [RFC/PATCH] devices: Use new(std::nothrow) for
 creating devices
Date: Fri, 19 Oct 2012 00:44:57 +0900
Message-ID: <1350575097.1610.12.camel@leonhard>
In-Reply-To: 508021E5.8070209@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1626149599510246287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2012-10-18 (=EB=AA=A9), 08:36 -0700, Arjan van de Ven:
> On 10/18/2012 8:32 AM, Namhyung Kim wrote:
> > When allocation fails, just skip the device and proceed if possible.
> > This is also for consistency with others.
> =

> hmm...
> if we're that low on memory something is so seriously wrong, exiting is t=
he right answer really.
> =

> I'm getting strong advice from other userspace coders that checking alloc=
ations like this is actually
> pointless...
> based on that, I'd say we need to go for better code readability, not mor=
e complexity for no actual gain.
> =


Understood.  Thanks for the quick reply!

Namhyung



--===============1626149599510246287==--

