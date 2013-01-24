Content-Type: multipart/mixed; boundary="===============3769172637038986266=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of logic
Date: Thu, 24 Jan 2013 10:10:59 +0300
Message-ID: <20130124071059.GA2419@swordfish.minsk.epam.com>
In-Reply-To: 1358927592.3289.31.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3769172637038986266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/23/13 08:53), Magnus Fromreide wrote:
> Date: Wed, 23 Jan 2013 08:53:12 +0100
> From: Magnus Fromreide <magfr(a)lysator.liu.se>
> To: Austin Zhang <zhang.austin(a)gmail.com>
> Cc: powertop(a)lists.01.org
> Subject: Re: [Powertop] [PATCH] Using std::max to handle all such kind of
>  logic
> X-Mailer: Evolution 3.4.4-1 =

> =

> On Wed, 2013-01-23 at 11:54 +0800, Austin Zhang wrote:
> > Signed-off-by: Austin Zhang <zhang.austin(a)gmail.com>
> > ---
> >  src/cpu/cpu.cpp |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> > =

> > diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
> > index 7f3af69..38540a5 100644
> > --- a/src/cpu/cpu.cpp
> > +++ b/src/cpu/cpu.cpp
> > @@ -525,8 +525,9 @@ void report_display_cpu_pstates(void)
> >  	unsigned int i, pstates_num;
> >  =

> >  	for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); i++)
> > -		if (all_cpus[i] && all_cpus[i]->pstates.size() > pstates_num)
> > -			pstates_num =3D all_cpus[i]->pstates.size();
> > +		if (all_cpus[i])
> > +			pstates_num =3D std::max<unsigned int>(pstates_num,
> > +								all_cpus[i]->pstates.size());
> =

> There should be no need to specify the template argument if pstates_num
> is declared to the right type.

I personally don't have any objections to specify template arguments (and m=
ay be find it
even more verbal), it never bothered me.


	-ss

> The return type of vector<T>::size() is vector<T>::size_type.
> Thus I think this is a nicer version:
> =

> vector<frequency*>::size_type pstates_num;
> =

> for (i =3D 0, pstates_num =3D 0; i < all_cpus.size(); ++i)
> 	if (all_cpus[i])
> 		pstates_num =3D max(pstates_num, all_cpus[i]->pstates.size());
> =

> What do you think?
> =

> /MF
> =

> _______________________________________________
> PowerTop mailing list
> PowerTop(a)lists.01.org
> https://lists.01.org/mailman/listinfo/powertop
>=20

--===============3769172637038986266==--

