Content-Type: multipart/mixed; boundary="===============6447117591240635974=="
MIME-Version: 1.0
From: Mike Simms <micsim2007 at outlook.com>
Subject: Re: [Powertop] RH Bugzilla [Bug 1482649] Logitech USB Unified
 Receiver+M570 need 'waking' up by click after kernel update
Date: Wed, 13 Sep 2017 08:26:12 +0000
Message-ID: <VI1PR0301MB2510F8832D2F672FD4DA69A7876E0@VI1PR0301MB2510.eurprd03.prod.outlook.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6447117591240635974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Out of courtesy, just a quick message thank you for your help
and pointing me in the right direction with this issue. I'm closing it
after further consultation with linux-usb contributors. Here is the
reason copied from my RH Bugzilla submission:

I've been collaborating the last 6 days with powertop and linux-usb
contributors upstream over this issue. They have been very helpful.
What we've managed to do is establish exactly what has changed and
where using a number of different trace methods.

There's basically not a bug as such, it is a setting that has been
fixed in 4.12 and above that never worked before.

The value for power stored in
the /sys/bus/usb/devices/2.1.3/power/control file for this device was
being ignored when set to auto (Good) by powertop with kernel 4.11 and
instead a non-existent setting of ON is used. ON means no autosuspend
as power saving is 'Bad' in powertop tunable terms.

with 4.12 it is not being ignored. So what I'm going to do now is
investigate masking that setting with powertop by removing it as a
system service and coding a script (found something similar done for
another distribution so I'm going to at least try it) to autostart
powertop at boot ignoring the pointing device. OR using something else
like tlp which I have no experience with. Either way, this is clearly
not a bug after further investigation upstream so I'm closing it. I
will post the powertop solution if I can get it worked but this should
remain closed from here on in.

--===============6447117591240635974==--

