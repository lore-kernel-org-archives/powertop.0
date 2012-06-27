Content-Type: multipart/mixed; boundary="===============7201717352571733569=="
MIME-Version: 1.0
From: =?utf-8?q?Jan-Simon_M=C3=B6ller_=3Cdl9pf_at_gmx=2Ede=3E?=
Subject: Re: [Powertop] [bugreport] crash on powertop --debug --html=file.html
Date: Wed, 27 Jun 2012 11:42:20 +0200
Message-ID: <201206271142.20502.dl9pf@gmx.de>
In-Reply-To: 20120627080628.GB2996@swordfish.datadirect.datadirectnet.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7201717352571733569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, 27. Juni 2012, 10:06:28 schrieb Sergey Senozhatsky:
> > (i=3D0x875720, j=3D0x211)
> =

> Hm, it seems pretty unlikely that std::allocator would allocate anything
> on such a low address. It rather expected i and j to be somewhere in
> 	-/+ N * sizeof(struct)
> range.
> =

> So, there is something we don't known about your system, or we have
> memory corruption which I can't find at the moment.

Nothing special, just opensuse 11.4 with all updates. =

It works fine on the same setup with an i586 kernel/userspace.

I'll look into that a bit more.

Best,
JS

--===============7201717352571733569==--

