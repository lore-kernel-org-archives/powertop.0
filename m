Content-Type: multipart/mixed; boundary="===============6536136670671188592=="
MIME-Version: 1.0
From: Oleg Drokin <green at linuxhacker.ru>
Subject: Re: [Powertop] powertop accounting for virtual network interfaces
Date: Fri, 06 Jan 2017 12:41:39 -0500
Message-ID: <7BC14323-F682-460B-B088-0F3EDAD97AEA@linuxhacker.ru>
In-Reply-To: 20170106172925.hliuc27ifi4pim4o@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6536136670671188592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On Jan 6, 2017, at 12:29 PM, Peter Jones wrote:

> On Fri, Jan 06, 2017 at 11:49:59AM -0500, Oleg Drokin wrote:
>> =

>> On Jan 6, 2017, at 10:10 AM, Peter Jones wrote:
>> =

>>> Hi,
>>> =

>>> I noticed something this morning when running powertop on my Dell XPS-13
>>> (skylake).  I've got wifi tethered to my phone, which is also plugged in
>>> the USB port, and the company vpn running on a virtual bridge on top of
>>> that.  Powertop accounts for that like this:
>>> =

>>> -------------------------
>>> The battery reports a discharge rate of 5.99 W
>>> The estimated remaining time is 8 hours, 32 minutes
>>> =

>>> Summary: 529.1 wakeups/second,  5.2 GPU ops/seconds, 0.0 VFS ops/sec an=
d 8.9% CPU use
>>> =

>>> Power est.              Usage       Events/s    Category       Descript=
ion
>>> 3.32 W      0.0 pkts/s                Device         nic:virbr0
>>> 2.71 W    100.0%                      Device         USB device: usb-de=
vice-8087-0a2a
>>> 739 mW     53.6 ms/s      36.2        Process        /usr/bin/gnome-she=
ll
>>> 477 mW    100.0%                      Device         Display backlight
>>> ...
>>> -------------------------
>>> =

>>> The second line is the (disabled) bluetooth device.  No idea what's goi=
ng on
>>> there; bluetoothctl believes it's powered down.
>> =

>> Is this Fedora 24/25?
>> I filed a ticket for this last summer, it's fwupd holding the mouse
>> usbfs device open.
> =

> Yeah, it's f25.  So that's interesting, but it's not the mouse device
> (because I don't have one).  I suspect you're right about the cause,
> though.  I'll poke hughsie about it, thanks.

Right, mouse is BT, so you can only get to btusb locally, that's what I see
too, just a bit misworded since it was awhile ago and my memory is a bit ha=
zy.

>> If you'd use current master version of powertop, you'd see it
>> correctly attributed to fwupd.
> =

> I'm not sure how to take to this statement.  Are you really chiding me
> for using the version that's in the distro I'm using?

Oh, no. Just a comment that current powertop handles this better and
once Fedora catches up you'll see the benefits too.
--===============6536136670671188592==--

