Content-Type: multipart/mixed; boundary="===============1766446081896991755=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH v3 04/15] clean up Makefile.am files
Date: Wed, 15 Oct 2014 22:03:00 +0900
Message-ID: <20141015130300.GE1189@swordfish>
In-Reply-To: CAG27Bk0_nMryZ2CsF7d6q+y5v8guZwTH5dT1r4m_Gy4F3PX6Zw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1766446081896991755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/15/14 09:25), Sami Kerola wrote:
> >> ---
> >>  Makefile.am     |  14 +++-
> [snip]
> >> +powertop_SOURCES =3D \
> >> +     css.h \
> >> +     devlist.cpp \
> >> +     devlist.h \
> >> +     display.cpp \
> >> +     display.h \
> >> +     lib.cpp \
> >> +     lib.h \
> >> +     main.cpp \
> >> +     powertop.css \
> >> +     \
> >
> > Why the white line here?
> =

> To separate src/*.(cpp|h) file from files in sub-directory targets the
> way one very clearly see the difference. Sorting all the targets in
> simple alphabetical order would make the none-sub-directory objects to
> be here and there in middle of listing, so separating the lists seemed
> like clarity enhancement to me. If the empty line really annoys send a
> patch to remove it, I don't have too strong opinions either in favor
> or against it.
> =


 :-)

guys, this is Makefile.am
nobody goes there.

	-ss

--===============1766446081896991755==--

