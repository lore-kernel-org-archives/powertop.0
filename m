Content-Type: multipart/mixed; boundary="===============7225819208661068416=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: Re: [Powertop] powertop accounting for virtual network interfaces
Date: Fri, 06 Jan 2017 11:49:59 -0500
Message-ID: <B3F4F21B-F968-483A-A70F-6DE32A50B068@linuxhacker.ru>
In-Reply-To: 20170106145832.zmkfjuy6uwmq6jtb@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7225819208661068416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Jan 6, 2017, at 10:10 AM, Peter Jones wrote:

> Hi,
> =

> I noticed something this morning when running powertop on my Dell XPS-13
> (skylake).  I've got wifi tethered to my phone, which is also plugged in
> the USB port, and the company vpn running on a virtual bridge on top of
> that.  Powertop accounts for that like this:
> =

> -------------------------
> The battery reports a discharge rate of 5.99 W
> The estimated remaining time is 8 hours, 32 minutes
> =

> Summary: 529.1 wakeups/second,  5.2 GPU ops/seconds, 0.0 VFS ops/sec and =
8.9% CPU use
> =

> Power est.              Usage       Events/s    Category       Description
>  3.32 W      0.0 pkts/s                Device         nic:virbr0
>  2.71 W    100.0%                      Device         USB device: usb-dev=
ice-8087-0a2a
>  739 mW     53.6 ms/s      36.2        Process        /usr/bin/gnome-shell
>  477 mW    100.0%                      Device         Display backlight
> ...
> -------------------------
> =

> The second line is the (disabled) bluetooth device.  No idea what's going=
 on
> there; bluetoothctl believes it's powered down.

Is this Fedora 24/25?
I filed a ticket for this last summer, it's fwupd holding the mouse usbfs d=
evice
open.
If you'd use current master version of powertop, you'd see it correctly att=
ributed to fwupd.

See https://bugzilla.redhat.com/show_bug.cgi?id=3D1340587


--===============7225819208661068416==--

