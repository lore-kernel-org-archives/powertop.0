Content-Type: multipart/mixed; boundary="===============2989128169230041749=="
MIME-Version: 1.0
From: Kristen Carlson Accardi <kristen at linux.intel.com>
Subject: Re: [Powertop] v2.5-rc1 testing: accounting still very wrong
Date: Mon, 04 Nov 2013 10:31:05 -0800
Message-ID: <20131104103105.5bb4711b@bluebird.jf.intel.com>
In-Reply-To: 20131102195015.GJ5519@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2989128169230041749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2 Nov 2013 12:50:15 -0700
Marc MERLIN <marc_powertop(a)merlins.org> wrote:

> On Sat, Nov 02, 2013 at 06:48:02AM -0700, Marc MERLIN wrote:
> > On Fri, Oct 18, 2013 at 11:09:26AM -0700, Kristen Carlson Accardi wrote:
> > > Please test.
> > =

> > Still the same power counting bugs than previous versions.
> > After a few minutes, on battery, it went from 12W to 20W because of an
> > rsync in the background, and when that rsync was finished (sigstop), I =
got this.
> > =

> > Somehow I very much doubt that e17 was using 1550W.
> > =

> > Clearly there is at least an assert missing that should ensure that the=
 list
> > of power estimated values clearly exceeds the total power.
> > =

> > Even if I stop enligthenment, which seems to be most of the wakeups, bad
> > accounting is all wrong in many ways, see below:

Thanks for the detailed report.  I think we aren't going to be able to
address this for the 2.5 release, but I will put it on my list of
things to do to see if we can duplicate this issue on another machine
and start figuring out what is going on.  We'll try to put a test case
for something like this together for the 2.6 release just to confirm
that we are within the realm of possibilities for estimation.


--===============2989128169230041749==--

