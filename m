Content-Type: multipart/mixed; boundary="===============0938514088720072331=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [PATCH] cpu: Fix abstract_cpu::calculate_freq
Date: Mon, 15 Oct 2012 23:22:08 +0900
Message-ID: <1350310928.1507.8.camel@leonhard>
In-Reply-To: 20120920144644.GC3237@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0938514088720072331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2012-09-20 (=EB=AA=A9), 17:46 +0300, Sergey Senozhatsky:
> On (09/20/12 23:33), Namhyung Kim wrote:
> > The 'freq' should have the maximun frequency value of all children.
> > But the current code does not update the freq properly.  Fix it.
> > =

> > Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
> =

> looks good to me, thanks.
> =

> 	-ss

Ping.  =


It seems that it's not merged yet.  Chris, could you please merge this?

Thanks,
Namhyung

> =

> > ---
> >  src/cpu/abstract_cpu.cpp |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
> > index 386d981..de55cf2 100644
> > --- a/src/cpu/abstract_cpu.cpp
> > +++ b/src/cpu/abstract_cpu.cpp
> > @@ -341,7 +341,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
> >  				is_idle =3D false;
> >  			}
> >  			if (f > freq)
> > -				f =3D freq;
> > +				freq =3D f;
> >  		}
> >  =

> >  	current_frequency =3D freq;


-- =

Regards,
Namhyung Kim



--===============0938514088720072331==--

