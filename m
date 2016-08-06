Content-Type: multipart/mixed; boundary="===============7530584813634194105=="
MIME-Version: 1.0
From: Chris Samuel <chris at csamuel.org>
Subject: [Powertop] Powertop recently started reporting "glob returned
 GLOB_ABORTED"
Date: Sun, 07 Aug 2016 09:35:06 +1000
Message-ID: <1656195.aRiASJK4c9@quad>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7530584813634194105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi folks,

I'm running powertop from git master on my Toshiba Chromebook (Intel Celero=
n =

N2840) using Crouton to provide an Ubuntu 14.04 chroot.  Probably not a com=
mon =

configuration. :-)

Anyway on startup it has recently starting reporting "glob returned =

GLOB_ABORTED", thus:

RAPL device for cpu 0
RAPL device for cpu 0
RAPL device for cpu 0
Devfreq not enabled
glob returned GLOB_ABORTED

Kernel is 3.10.18 and this ChromeOS does provide the configs.ko kernel modu=
le =

(not loaded by default) so I can provide the kernel config if it's useful.

All the best,
Chris
-- =

 Chris Samuel  :  http://www.csamuel.org/  :  Melbourne, VIC

--===============7530584813634194105==--

