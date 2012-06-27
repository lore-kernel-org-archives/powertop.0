Content-Type: multipart/mixed; boundary="===============8252450365305769438=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Wed, 27 Jun 2012 11:06:28 +0300
Message-ID: <20120627080628.GB2996@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 201206261710.45309.dl9pf@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8252450365305769438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> (i=3D0x875720, j=3D0x211)

Hm, it seems pretty unlikely that std::allocator would allocate anything
on such a low address. It rather expected i and j to be somewhere in
	-/+ N * sizeof(struct)
range.

So, there is something we don't known about your system, or we have
memory corruption which I can't find at the moment.


	-ss

--===============8252450365305769438==--

