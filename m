Content-Type: multipart/mixed; boundary="===============6221940160548289702=="
MIME-Version: 1.0
From: Chris Murphy <lists at colorremedies.com>
Subject: [Powertop] 700+mW for nic:virbr0?
Date: Wed, 30 Aug 2017 15:36:11 -0600
Message-ID: <CAJCQCtRUCK-Aie1tB2wiSfvxZD0cHL-XWKjDhA=TvLBEVB_SHw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6221940160548289702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The #2 power consumer on my laptop according to powertop is
nic:virbr0 which seems unlikely. That's more than Firefox, and a bit
less than the display backlight. And it's nearly 300x more power than
used by the wifi driver.

https://pastebin.com/GuxA4Dsg

  862 mW      0.0 pkts/s                Device         nic:virbr0


If it's wrong, it's a powertop bug. If it's real, then it's a bug
somewhere maybe in libvirt or maybe the kernel? There has been no VM
running during this boot, so nic:virbr0 shouldn't even be in use.

Is this the actual wifi radio, but somehow virb0 is just getting dinged?



-- =

Chris Murphy

--===============6221940160548289702==--

