Content-Type: multipart/mixed; boundary="===============8168321288270318075=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: Re: [Powertop] Idle power consumption of Intel e1000e kernel module
Date: Sun, 22 Dec 2013 16:02:04 +0100
Message-ID: <20131222150203.GA32707@rhlx01.hs-esslingen.de>
In-Reply-To: 52B5742C.90009@totakura.in
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8168321288270318075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 21, 2013 at 12:00:01PM -0800, powertop-request(a)lists.01.org w=
rote:
> From: Sree Harsha Totakura <sreeharsha(a)totakura.in>
> =

> Hi,
> =

> On my ThinkPad T440s, PowerTOP-2.5 shows that the e1000e kernel module
> is drawing considerable amount of power when not it use (cable unplugged):
> =

> > The battery reports a discharge rate of 5.86 W
> > The estimated remaining time is 5 hours, 11 minutes
> > =

> > Summary: 143.9 wakeups/second,  10.9 GPU ops/seconds, 0.0 VFS ops/sec a=
nd 2.7% CPU use
> > =

> > Power est.              Usage       Events/s    Category       Descript=
ion
> >   3.76 W     49.0%                      Device         Display backlight
> >   1.46 W      0.0 pkts/s                Device         Network interfac=
e: eth0 (e1000e)
> =

> What I observed is that, if I remove the e1000e kernel module with
> `rmmod e1000e`, the corresponding entry in PowerTOP is gone, but the
> battery discharge rate stays the same.  So, I am guessing there is
> either a hardware short-circuit somewhere on the motherboard or a bug in
> the underlying power management software or an estimation error.  Any
> hints on how I can confirm/debug this?

Well, it could simply be that it *is* that hardware which does cause the
consumption, but that e1000e does not activate the fullest possible mode
of power management upon unload of the device driver.
What usually consumes a lot of power with network devices is the PHY
area, AFAIK, so it could be that e1000e simply leaves PHY in a less than
optimal state upon unload, thus drawing several (half-)watts too many.

- check which suitable power management parameters the module provides
  (modinfo e1000e)
- try to experiment with that to gain some experience
- check e1000e source to see what it does on unload, and what it does wrong=
 ;)

And if you suspect a problem with improper power management settings on
driver unload, then either fix it or file a bug on kernel.org Bugzilla :)

HTH,

Andreas Mohr

--===============8168321288270318075==--

