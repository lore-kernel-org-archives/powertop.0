Content-Type: multipart/mixed; boundary="===============3567138775183568866=="
MIME-Version: 1.0
From: Richard Neill <rn214 at richardneill.org>
Subject: Re: [Powertop] Wishlist: print the commands executed by 'toggle
 tunables'
Date: Tue, 17 Jul 2012 20:13:33 +0100
Message-ID: <5005B95D.90007@richardneill.org>
In-Reply-To: mailman.29.1342551681.1280.powertop@lists.01.org
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3567138775183568866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear All,

I wonder if I might make a request for a new feature for powertop.

When I run it, I can toggle various tunable options from within the =

Powertop interface. As I understand it, the effect of these to invoke an =

underlying system command such as:
   echo value > /sys/device/power/something

But powertop never actually tells me what these commands are. This means =

I can't easily append them to my own startup scripts, or make them =

persistent across reboots.

So my wish is as follows:

When powertop actually modifies the system, it should print the =

commands, to stderr, when it exits.

Thanks very much,

Richard



P.S. Powertop 2.0 also has no manpage. May I recommend help2man.

--===============3567138775183568866==--

