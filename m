Content-Type: multipart/mixed; boundary="===============1985503468525266610=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: Re: [Powertop] powertop hci tools bug report
Date: Sat, 19 Mar 2016 11:13:44 +0100
Message-ID: <20160319101344.GA28156@rhlx01.hs-esslingen.de>
In-Reply-To: CA+z5DszTAPK48juHex0kxgMcjQu4upfKO9yKFK1oU7T0hmR2=Q@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1985503468525266610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 18, 2016 at 12:00:02PM -0700, powertop-request(a)lists.01.org w=
rote:
> Date: Fri, 18 Mar 2016 10:42:26 +1100
> From: Blair Bethwaite <blair.bethwaite(a)gmail.com>


> Anyhoo, bug report here from an Ubuntu Wily machine. Powertop is
> currently hard-coding the location of hciconfig and friends in
> src/tuning/bluetooth.cpp to /usr/sbin/hciconfig. On my platform
> hciconfig lives in /bin.
> =

> This should probably be discovered via configure. Only other
> questionable hard-coding seems to be for xset.

Or, possibly better (or maybe not?), try using
"/usr/bin/env hciconfig",
since that is what scripts often use in their shebang line
to be a lot more universal about location of the required interpreter.

https://en.wikipedia.org/wiki/Shebang_%28Unix%29

Andreas Mohr

--===============1985503468525266610==--

