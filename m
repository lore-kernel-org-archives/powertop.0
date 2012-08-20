Content-Type: multipart/mixed; boundary="===============2592861564690290053=="
MIME-Version: 1.0
From: Arjan van de Ven <arjan at linux.intel.com>
Subject: Re: [Powertop] [PATCH] do not implement get_user_input() in
 DISABLE_NCURSES builds
Date: Mon, 20 Aug 2012 08:21:23 -0700
Message-ID: <503255F3.8010304@linux.intel.com>
In-Reply-To: 50325563.6040605@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2592861564690290053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/20/2012 8:18 AM, Chris Ferron wrote:

>>     -ss
> The only reason we allowed DISABLE_NCURSES in the first place, was to sup=
port android. If we don't want to support android out of the box, we can st=
art removing the crude
> and android can patch PowerTOP within their distro if they wanted.


..or for an android build one adds ncurses to the local android.. like libp=
ci and libnl are anyway


--===============2592861564690290053==--

