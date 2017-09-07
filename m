Content-Type: multipart/mixed; boundary="===============4793738232630427400=="
MIME-Version: 1.0
From: Mike Simms <micsim2007 at outlook.com>
Subject: Re: [Powertop] RH Bugzilla [Bug 1482649] Logitech USB Unified
 Receiver+M570 need 'waking' up by click after kernel update
Date: Thu, 07 Sep 2017 22:51:49 +0000
Message-ID: <VI1PR0301MB25109F61A556DE2CF5E58EED87940@VI1PR0301MB2510.eurprd03.prod.outlook.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4793738232630427400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Auke, no that autotune has always been set to good. It's been discussed
already in the RH bug thread I linked to in my 1st post here. I didn't
want to duplicate everything already gone through because it's quite
lengthy. I'm asking here in case someone has any better suggestions
because it should still work the same in theory. No settings have been
changed in powertop. It autodetects and sets good for both kernel
versions with regards the Logitech unified receiver.

To summarise for people who don't want to read the RH bugzilla thread:

Autotune service for both kernels tunes the same devices to Good.
Nothing is set to Bad.

With kernel 4.11.11-300 there is no wake up lag when the receiver and
connected device has entered low power state

With kernel 4.12.x and 4.13 release candidate there is lag you can
measure in seconds and it's extremely frustrating. It causes missed
clicks, keyboard characters,  duplicate form submissions on websites.

Setting the autosuspend for the receiver to Bad is an obvious
workaround but it isn't the solution we're looking for. There is a
regression here that needs addressing. Hopefully the HID driver contact
I found thanks to Joe will be able to advise further on this.

--===============4793738232630427400==--

