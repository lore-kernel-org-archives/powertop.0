Content-Type: multipart/mixed; boundary="===============0799155674935797366=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: Re: [Powertop] v2.5-rc1 testing: accounting still very wrong
Date: Sat, 02 Nov 2013 12:50:15 -0700
Message-ID: <20131102195015.GJ5519@merlins.org>
In-Reply-To: 20131102134802.GG5519@merlins.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0799155674935797366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2013 at 06:48:02AM -0700, Marc MERLIN wrote:
> On Fri, Oct 18, 2013 at 11:09:26AM -0700, Kristen Carlson Accardi wrote:
> > Please test.
> =

> Still the same power counting bugs than previous versions.
> After a few minutes, on battery, it went from 12W to 20W because of an
> rsync in the background, and when that rsync was finished (sigstop), I go=
t this.
> =

> Somehow I very much doubt that e17 was using 1550W.
> =

> Clearly there is at least an assert missing that should ensure that the l=
ist
> of power estimated values clearly exceeds the total power.
> =

> Even if I stop enligthenment, which seems to be most of the wakeups, bad
> accounting is all wrong in many ways, see below:

And note that it's not always broken, after removing enough things,
including unloading alsa, I got this:
----------------------------------------------------------------------------
The battery reports a discharge rate of 13.0 W
The estimated remaining time is 5 hours, 12 minutes

Summary: 639.4 wakeups/second,  105.5 GPU ops/seconds, 0.0 VFS ops/sec and =
8.5%

Power est.              Usage       Events/s    Category       Description
  948 mW      3.9 ms/s     178.2        Process        /usr/bin/enlightenme=
nt
  886 mW    393.4 =C2=B5s/s      40.9        Process        procmeter3
  412 mW      6.4 ms/s     152.9        Process        /usr/local/opt/googl=
e/chr
  334 mW     36.7%                      Device         Display backlight
  323 mW      6.5 ms/s      88.7        Process        /usr/local/opt/googl=
e/chr
 59.2 mW     37.2 ms/s      48.9        Process        /usr/local/opt/googl=
e/chr
 25.7 mW     16.2 ms/s       9.9        Process        /usr/bin/X :0 vt7 -b=
r -no
 10.8 mW    138.1 =C2=B5s/s       1.4        Process        xfce4-terminal =
-T window9
 6.66 mW      4.2 ms/s       6.7        Process        /usr/local/opt/googl=
e/chr
 4.80 mW      3.0 ms/s      66.7        Timer          hrtimer_wakeup
----------------------------------------------------------------------------

The problem is that the only number I can seem to trust is the discharge
rate and likely the number of wakeups per second. The rest, especially
the power estimation value per device or process, seems to be pure
fabrication, and if you add them up, they never add up to the battery
discharge rate.

Am I really the only one to see this?

kernel 3.11.5-amd64 powertop from git synced yesterday.

And just as I'm writing this Email, the next update I get from powertop
(after restarting it because it crashed, trace sent in another email),
is the following. My backlight moved from 334mW to 8.58W (I know both are w=
rong).
----------------------------------------------------------------------------
The battery reports a discharge rate of 13.1 W
The estimated remaining time is 4 hours, 59 minutes

Summary: 735.1 wakeups/second,  83.1 GPU ops/seconds, 0.0 VFS ops/sec and 8=
.5% CPU use       =


Power est.              Usage       Events/s    Category       Description
  8.58 W     40.0%                      Device         Display backlight
  992 mW    100.0%                      Device         USB device: Yubico Y=
ubikey II (Yubico)
  761 mW    303.7 =C2=B5s/s      32.7        Process        procmeter3
  455 mW      2.9 ms/s      86.8        Process        /usr/local/opt/googl=
e/chrome/chrome --
  433 mW      3.7 ms/s      46.5        Process        xfce4-terminal -T wi=
ndow11 --role=3Dwind
  359 mW     11.7 ms/s     151.8        Process        /usr/bin/enlightenme=
nt
  198 mW      5.4 ms/s      98.7        Process        /usr/local/opt/googl=
e/chrome/chrome
  102 mW     27.6 ms/s      39.3        Process        /usr/local/opt/googl=
e/chrome/chrome --
 68.2 mW     18.8 ms/s      20.5        Process        /usr/bin/X :0 vt7 -b=
r -nolisten tcp -a
 29.3 mW      1.6 ms/s      94.5        Interrupt      [42] i915(a)pci:0000=
:00:02.0
----------------------------------------------------------------------------

Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============0799155674935797366==--

