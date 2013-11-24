Content-Type: multipart/mixed; boundary="===============5381191077804438572=="
MIME-Version: 1.0
From: Marc MERLIN <marc_powertop at merlins.org>
Subject: [Powertop] Has anyone seen power bugs from kill -STOP process before
 and after S3 sleep?
Date: Sat, 23 Nov 2013 16:53:06 -0800
Message-ID: <20131124005306.GC11389@merlins.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5381191077804438572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm still trying to figure out why my laptop can idle at 12-13W or 20W
with no differences in processes, and why powertop (even latest, 1.25)
can provide very incorrect power values.

One thing I do that likely few people do:
killall -STOP chrome chromium firefox-bin xmms mplayer pidgin procmeter3 pl=
ugin-container

That seems to work with power of course, but I think it later causes
problem when I go to sleep (shut the lid) and come back later.

Have others seen issues with this?
It's happened for me for over a year, all the way to kernel 3.11

Could it also be generating the weird powertop behaviour I get and no
one else does?

Thanks,
Marc
-- =

"A mouse is a device used to point at the xterm you want to type in" - A.S.=
R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet coo=
king
Home page: http://marc.merlins.org/                         | PGP 1024R/763=
BE901

--===============5381191077804438572==--

