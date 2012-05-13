Content-Type: multipart/mixed; boundary="===============1579060817078257860=="
MIME-Version: 1.0
From: Tim Zakharov <tzakharov at gmail.com>
Subject: [Powertop] eth0 using 11 W when not in use
Date: Sat, 12 May 2012 22:53:10 -0500
Message-ID: <4FAF3026.90509@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1579060817078257860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Using version 1.97 from Ubuntu repos (Xubuntu 12.04 LTS).

Powertop reports ~15 W discharge on my Acer Aspire 7736Z, with estimated
battery life of about 2.5 hours.  This is normal battery life for its
current full state of 39.0 Wh.  (Battery is a 48.6 Wh, but has lost
about 20% in the 2 years since bought new).

Under Overview and Device stats, Network interface: eth0 (tg3) is
consistently at the top, with a power estimate of 11.4 W.  I never use a
wired connection on my laptop, and there is no way in the BIOS or via
keyboard Fn to disable it.

The wireless interface, wlan0 (ath9k), typically reports <1 W, sometimes
as high as 6 W.

Is Powertop accurate in reporting my wired network interface at 11.4 W? =

Any troubleshooting tips for checking this or even disabling?  I have
found very little info on Powertop and disabling eth0 in my Googling, so
thought I'd try the mailing list.

Side question:  I don't know what to do under Tunables.  What does
toggling between Bad and Good do?  I tried looking for documentation but
could find none.  There is no man page...

Thanks,
Tim

--===============1579060817078257860==--

