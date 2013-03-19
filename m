Content-Type: multipart/mixed; boundary="===============7387269889867516975=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: Re: [Powertop] [powertop] ::wiggle() - what does that do?
Date: Wed, 20 Mar 2013 00:00:08 +0400
Message-ID: <2252008.4yp4TNWOLD@intelfx-laptop>
In-Reply-To: 5148C379.7000002@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7387269889867516975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19 March 2013 12:58:49 Arjan van de Ven wrote:
> On 3/19/2013 12:57 PM, Ivan Shapovalov wrote:
> > On 19 March 2013 12:53:26 Arjan van de Ven wrote:
> >> On 3/19/2013 12:51 PM, Ivan Shapovalov wrote:
> >>> Hello all,
> >>> =

> >>> I've been wondering on what does the abstract_cpu::wiggle() function
> >>> does
> >>> and why it is needed?.. All the code says is that it is needed to "ha=
ve
> >>> a
> >>> record of CPU at the start and end of the perf trace".
> >>> =

> >>> I'm asking just because I feel somewhat uncomfortable to have powertop
> >>> changing my scaling frequency back and forth each N seconds. :)
> >> =

> >> the reason this exists is that powertop wants to track what frequency =
the
> >> cpu is at for the duration... ... and there's no way to ask for
> >> "current",
> >> only to get change notifications
> >> =

> >> so wiggle() forces a change... and from then on we know what it's at.
> > =

> > ...And why isn't it possible to keep the value from last notification?
> =

> there may not have been one...
> =

> > Because time can pass between measurement end and new measurement start?
> =

> yep

Thanks. It's clear to me now.

--===============7387269889867516975==--

