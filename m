Content-Type: multipart/mixed; boundary="===============2407831305706399158=="
MIME-Version: 1.0
From: Peter Jones <pjones at redhat.com>
Subject: [Powertop] powertop accounting for virtual network interfaces
Date: Fri, 06 Jan 2017 10:10:12 -0500
Message-ID: <20170106145832.zmkfjuy6uwmq6jtb@redhat.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2407831305706399158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed something this morning when running powertop on my Dell XPS-13
(skylake).  I've got wifi tethered to my phone, which is also plugged in
the USB port, and the company vpn running on a virtual bridge on top of
that.  Powertop accounts for that like this:

-------------------------
The battery reports a discharge rate of 5.99 W
The estimated remaining time is 8 hours, 32 minutes

Summary: 529.1 wakeups/second,  5.2 GPU ops/seconds, 0.0 VFS ops/sec and 8.=
9% CPU use

Power est.              Usage       Events/s    Category       Description
  3.32 W      0.0 pkts/s                Device         nic:virbr0
  2.71 W    100.0%                      Device         USB device: usb-devi=
ce-8087-0a2a
  739 mW     53.6 ms/s      36.2        Process        /usr/bin/gnome-shell
  477 mW    100.0%                      Device         Display backlight
...
-------------------------

The first line seems almost certainly to just be mis-attribution of the
base power level.  I talked to arjan on IRC, and he suggested that we
should probably just ignore virtual network interfaces.  If it were
ignored, any actual network device power usage or chipset overhead will
be accounted for on the real network device, and any cpu associated with
it will show up on the process doing the work (i.e. openvpn).

The second line is the (disabled) bluetooth device.  No idea what's going on
there; bluetoothctl believes it's powered down.

Thoughts?

-- =

  Peter

--===============2407831305706399158==--

