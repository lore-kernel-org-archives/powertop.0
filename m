Content-Type: multipart/mixed; boundary="===============3503548887185887066=="
MIME-Version: 1.0
From: Kok, Auke-jan H <auke-jan.h.kok at intel.com>
Subject: Re: [Powertop] [PATCH] use pkg-config to find ncurses
Date: Mon, 05 May 2014 23:40:47 -0700
Message-ID: <CABsxX9LK5OxR1ZDHfSpGk5nf=AixgQUtd5RAPQx4DCMpX5QTKg@mail.gmail.com>
In-Reply-To: CAO3V83JaYKrJPYT1Zd07dn64voGFdwkRBX+k=nWs18KD7cNNaw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3503548887185887066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2014 at 9:57 PM, Wout Mertens <wout.mertens(a)gmail.com> wro=
te:
> I'm confused, how does requiring a pkgconfig file break the tool?

I'm sure Alexandra means "breaks people's builds".

> If a user somehow finds them in a situation where they need to build a
> recent powertop but can't build a recent ncurses, they can manually add t=
he
> file... Or use an older version of powertop...

The problem is that someone found a simple problem, and made a
somewhat simplified fix that creates a regression for others.
Introducing regressions, especially in something as simple as the
autotools code shouldn't be needed.

Someone just has to come up with a clean way to make both the old
ncurses (that does not have pkgconfig) and the new version work at the
same time, that's all.

BTW, I'm not sure where the 2009 number comes from, but there are
plenty of people still building against ncurses-5.9, and that has no
pkgconfig file, so the proposed patch actually fixes _my_ build of
powertop. (sure, you can complain I run ancient code, I certainly
concede that).

Asking people to create a pkgconfig file out of thin air is... not
appropriate ;^)

I'll send a tentative patch in a second that I think should solve the
problem correctly.

Auke

--===============3503548887185887066==--

