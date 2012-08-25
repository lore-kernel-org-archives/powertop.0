Content-Type: multipart/mixed; boundary="===============5530697421990130282=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] [Warning fixes 2/6] Build with -Wno-unused-result for
 now, it seems at least some of these cases are intentional (see ml discussion)
Date: Sat, 25 Aug 2012 09:29:44 +0200
Message-ID: <20120825072944.GD29623@rhrk.uni-kl.de>
In-Reply-To: 5037BFC9.3080305@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5530697421990130282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 10:54:17AM -0700, Chris Ferron wrote:
> On 08/24/2012 10:38 AM, Magnus Fromreide wrote:
> >On Fri, 2012-08-24 at 18:53 +0200, Joerg Mayer wrote:
> >>Note: Is this this flag supported on all compilers?
> >Please don't.
> >
> >If you really mean to ignore the result values then the canonical thing
> >to do is to cast them to (void)
> Agreed. Also really don't want this as some of the results that are
> being ignored should really be fixed. Meaning wrapped in error
> handling.

OK, I expected this part of the patch series to be controversial - so just
skip it.

Thanks
    J=C3=B6rg
-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============5530697421990130282==--

