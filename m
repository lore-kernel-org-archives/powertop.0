Content-Type: multipart/mixed; boundary="===============6049308639334777986=="
MIME-Version: 1.0
From: Auke Kok <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] RH Bugzilla [Bug 1482649] Logitech USB Unified
 Receiver+M570 need 'waking' up by click after kernel update
Date: Thu, 07 Sep 2017 13:11:29 -0700
Message-ID: <b92fbbf0-72c3-d380-8f99-5d4ee96f129d@intel.com>
In-Reply-To: VI1PR0301MB2510765FF1A9FBAE0EDEFDFD87940@VI1PR0301MB2510.eurprd03.prod.outlook.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6049308639334777986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/07/2017 11:09 AM, Mike Simms wrote:
> Then explain why it was never an issue before kernel 4.12 please

I can only take a guess, based on the info you provided, most
importantly I lack the hardware that you have.

Joe's comments are obviously important - there may be several points of
failure. The one that I spotted, is this one:

>>> powertop is using the autotune profile and the usb autosuspend
>>> entry is Good.

Turn it to "Bad" and see if it resolves the problem.

I am wondering if powertop autotuning was recently turned on in your
distro, and the trackpoint isn't properly blacklisted as a device that
shouldn't be put into usb autosuspend (if that is actually a thing in
code, it's been a while since I last worked on it).

Auke

--===============6049308639334777986==--

