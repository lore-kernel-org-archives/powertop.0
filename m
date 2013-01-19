Content-Type: multipart/mixed; boundary="===============1762764811920492643=="
MIME-Version: 1.0
From: Pascal Fontaine <Pascal.Fontaine at inria.fr>
Subject: [Powertop] Powertop usage
Date: Sat, 19 Jan 2013 15:12:38 +0100
Message-ID: <50FAA9D6.4050200@inria.fr>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1762764811920492643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have trouble understanding the output of powertop on my macbook air:

Power est.              Usage       Events/s    Category Description
   5.34 W    100.0%                      Device         USB device: =

Apple Internal Keyboard / Trackpad (Apple Inc.)
   889 mW     15.8 ms/s     168.2        Process /usr/bin/X :0 -auth =

/var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
   729 mW      2.9 pkts/s                Device Network interface: eth0 (wl)

despite tweaking everything possible about the Apple keyboard.  My =

global consumption is 8 Watts, so I find really strange 2/3 of it is in =

the keyboard.

Is, for some reason, powertop attributing to the apple keyboard the =

consumption overhead of the computer?

Thanks in advance for answers, and thanks to the powertop developers for =

their tool,

   Pascal


--===============1762764811920492643==--

