Content-Type: multipart/mixed; boundary="===============4280099233297956666=="
MIME-Version: 1.0
From: Harvey <harv at gmx.de>
Subject: Re: [Powertop] Powertop crashes with 'powertop --auto-tune'
Date: Mon, 22 Dec 2014 15:26:46 +0100
Message-ID: <54982A26.5010506@gmx.de>
In-Reply-To: CAG27Bk1Y+S=yakWkiResNsrSeJf=g9HfsqEP5E---tamhnqH-A@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4280099233297956666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Hi Sami.

thank you for your answer.

>> On Archlinux 64bit as well as 32bit systems powertop 2.7 crashes =

>> reproducible like this when called with the parameter =

>> --auto-tune:
> =

> Rather strange. I have up to date archlinux and the same does not =

> happen when I run --auto-tune.

As of today the crash is gone on my x86_64 system (all testing repos
enabled). I guess you tried on x86_64, but not i686? Don't know why
its gone in x86_64, but anyway, i686 still crashes. And the headless
server I use powertop on to elegantly optimize power settings still
crashes when using powertop --auto-tune. The funny thing is that the
settings get optimized nevertheless as a call of powertop wihout
- --auto-tune parameter shows me.

> I'm just a hobbyist contributor and I haven't cracked out how to =

> know where in code 'double free or corruption (!prev): 0x0975bc20' =

> issue happen. Could you compile the tool with debugging symbols, =

> and recreate issue the way we could see backtrace? That would make =

> fixing a lot easier.
> =

> cd /tmp wget
> =

https://01.org/sites/default/files/downloads/powertop/powertop-2.7.tar.gz
> =

> =

tar xzf powertop-2.7.tar.gz
> cd powertop-2.7 CXXLAGS=3D"-O0 -g -ggdb -fno-omit-frame-pointer" =

> ./configure make -j3 sudo -i cd /tmp/powertop-2.7 ./src/powertop =

> --auto-tune [crash] coredumpctl gdb (gdb) bt full <copy paste this =

> output to reply>

I tried this but there was no useful output due to missing debugging
symbols, I guess what do I have to do to enable those?

Thank you
Harvey


- -- I am root. If you see me laughing, you'd better have a backup!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSYKiYACgkQi5aqmLBUSgmtzwCfXHzmcyZuES5OlqR4oq4eF6TZ
QJQAn32UAso83cAUch03mNW1xWpIE7hc
=3DdV+X
-----END PGP SIGNATURE-----

--===============4280099233297956666==--

