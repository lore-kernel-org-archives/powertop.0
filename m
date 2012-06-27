Content-Type: multipart/mixed; boundary="===============5586607908753054969=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Wed, 27 Jun 2012 19:37:19 +0300
Message-ID: <20120627163719.GA1028@swordfish.datadirect.datadirectnet.com>
In-Reply-To: 201206271142.20502.dl9pf@gmx.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5586607908753054969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/27/12 11:42), Jan-Simon M=C3=B6ller wrote:
> Am Mittwoch, 27. Juni 2012, 10:06:28 schrieb Sergey Senozhatsky:
> > > (i=3D0x875720, j=3D0x211)
> > =

> > Hm, it seems pretty unlikely that std::allocator would allocate anything
> > on such a low address. It rather expected i and j to be somewhere in
> > 	-/+ N * sizeof(struct)
> > range.
> > =

> > So, there is something we don't known about your system, or we have
> > memory corruption which I can't find at the moment.
> =

> Nothing special, just opensuse 11.4 with all updates. =

> It works fine on the same setup with an i586 kernel/userspace.
>

Ok, speaking on the kernel, I see that you run 3.5-rc2, have you
tried 3.5.0-rc4-01004-gcee4d98?


	-ss

--===============5586607908753054969==--

