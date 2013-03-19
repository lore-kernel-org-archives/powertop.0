Content-Type: multipart/mixed; boundary="===============0644180219155565602=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: Re: [Powertop] [powertop] ::wiggle() - what does that do?
Date: Tue, 19 Mar 2013 23:57:36 +0400
Message-ID: <1756753.dFRy6JGU15@intelfx-laptop>
In-Reply-To: 5148C236.8080200@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0644180219155565602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19 March 2013 12:53:26 Arjan van de Ven wrote:
> On 3/19/2013 12:51 PM, Ivan Shapovalov wrote:
> > Hello all,
> > =

> > I've been wondering on what does the abstract_cpu::wiggle() function do=
es
> > and why it is needed?.. All the code says is that it is needed to "have=
 a
> > record of CPU at the start and end of the perf trace".
> > =

> > I'm asking just because I feel somewhat uncomfortable to have powertop
> > changing my scaling frequency back and forth each N seconds. :)
> =

> the reason this exists is that powertop wants to track what frequency the
> cpu is at for the duration... ... and there's no way to ask for "current",
> only to get change notifications
> =

> so wiggle() forces a change... and from then on we know what it's at.

...And why isn't it possible to keep the value from last notification?
Because time can pass between measurement end and new measurement start?

Sorry for stupid questions.

--===============0644180219155565602==--

