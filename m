Content-Type: multipart/mixed; boundary="===============5821688174977981242=="
MIME-Version: 1.0
From: Peter Jones <pjones at redhat.com>
Subject: Re: [Powertop] powertop accounting for virtual network interfaces
Date: Fri, 06 Jan 2017 11:14:23 -0500
Message-ID: <20170106161420.wx5tdwtralazgdpx@redhat.com>
In-Reply-To: 029eb44b-398b-020d-a479-76383372cc07@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5821688174977981242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 07:43:47AM -0800, Arjan van de Ven wrote:
> On 1/6/2017 7:10 AM, Peter Jones wrote:
> > Hi,
> > =

> > I noticed something this morning when running powertop on my Dell XPS-13
> > (skylake).  I've got wifi tethered to my phone, which is also plugged in
> > the USB port, and the company vpn running on a virtual bridge on top of
> > that.  Powertop accounts for that like this:
> > =

> > -------------------------
> > The battery reports a discharge rate of 5.99 W
> > The estimated remaining time is 8 hours, 32 minutes
> > =

> > Summary: 529.1 wakeups/second,  5.2 GPU ops/seconds, 0.0 VFS ops/sec an=
d 8.9% CPU use
> > =

> > Power est.              Usage       Events/s    Category       Descript=
ion
> >   3.32 W      0.0 pkts/s                Device         nic:virbr0
> >   2.71 W    100.0%                      Device         USB device: usb-=
device-8087-0a2a
> =

> > =

> > The second line is the (disabled) bluetooth device.  No idea what's goi=
ng on
> > there; bluetoothctl believes it's powered down.
> =

> but it's not in USB autosuspend, which then has lots of nasty power
> impacts on CPU C states and the like.  it's the USB device that's
> getting blamed, not the bluetooth view of that device

I think (without looking at the code) you're using time based weights like =
load
averages do, and once I actually powered it off with bluetoothctl it still =
took
considerably less power, but it took a while to amortize away?  Anyway, the
gnome control didn't seem to do anything, but the manual way did, and after=
 a
couple of hours (and turning the backlight down) powertop now looks like:

------------------------
The battery reports a discharge rate of 4.40 W
The estimated remaining time is 10 hours, 12 minutes

Summary: 629.2 wakeups/second,  6.4 GPU ops/seconds, 0.0 VFS ops/sec and 14=
.3% CPU use

Power est.              Usage       Events/s    Category       Description
  1.97 W      0.0 pkts/s                Device         nic:virbr0
  855 mW    642.1 =C2=B5s/s     179.5        Interrupt      [17] idma64.1
  701 mW     60.0 ms/s      38.3        Process        /usr/bin/gnome-shell
  459 mW      2.6 pkts/s                Device         Network interface: w=
lp58s0 (iwlwifi)
  363 mW    100.0%                      Device         Radio device: btusb
...
------------------------

The btusb radio device did show up before, but much lower on the list since=
 the
top was dominated by big things, and I think it's where the lack of autosus=
pend
is showing up.

Obviously you can still see the nic:virbr0 mis-attribution here.

-- =

  Peter

--===============5821688174977981242==--

