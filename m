Content-Type: multipart/mixed; boundary="===============0536372703777798681=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] powertop accounting for virtual network interfaces
Date: Fri, 06 Jan 2017 07:43:47 -0800
Message-ID: <029eb44b-398b-020d-a479-76383372cc07@linux.intel.com>
In-Reply-To: 20170106145832.zmkfjuy6uwmq6jtb@redhat.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0536372703777798681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/6/2017 7:10 AM, Peter Jones wrote:
> Hi,
>
> I noticed something this morning when running powertop on my Dell XPS-13
> (skylake).  I've got wifi tethered to my phone, which is also plugged in
> the USB port, and the company vpn running on a virtual bridge on top of
> that.  Powertop accounts for that like this:
>
> -------------------------
> The battery reports a discharge rate of 5.99 W
> The estimated remaining time is 8 hours, 32 minutes
>
> Summary: 529.1 wakeups/second,  5.2 GPU ops/seconds, 0.0 VFS ops/sec and =
8.9% CPU use
>
> Power est.              Usage       Events/s    Category       Description
>   3.32 W      0.0 pkts/s                Device         nic:virbr0
>   2.71 W    100.0%                      Device         USB device: usb-de=
vice-8087-0a2a

>
> The second line is the (disabled) bluetooth device.  No idea what's going=
 on
> there; bluetoothctl believes it's powered down.

but it's not in USB autosuspend, which then has lots of nasty power impacts=
 on CPU C states and the like.
it's the USB device that's getting blamed, not the bluetooth view of that d=
evice


--===============0536372703777798681==--

