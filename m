Content-Type: multipart/mixed; boundary="===============5585327560833934539=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [PATCH] devices: Fix processing /proc/net/dev file
Date: Mon, 15 Oct 2012 23:56:30 +0900
Message-ID: <1350312990.1507.11.camel@leonhard>
In-Reply-To: 20121015144730.GB3140@swordfish.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5585327560833934539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2012-10-15 (=EC=9B=94), 07:47 -0700, Sergey Senozhatsky:
> On (10/15/12 23:33), Namhyung Kim wrote:
> > @@ -114,7 +114,7 @@ static void do_proc_net_dev(void)
> >  			c2 =3D c;
> >  			val =3D strtoull(c, &c, 10);
> >  			i++;
> > -			if (i =3D=3D 1 || i =3D=3D 10)
> > +			if (i =3D=3D 2 || i =3D=3D 10)
> >  				pkt +=3D val;
> >  =

> >  		}
> > -- =

> =

> or `i++' after `if (i =3D=3D 1 || i =3D=3D 10)'.

But if we moved `i++', it should be `if (i =3D=3D 1 || i =3D=3D 9)'.

Thanks,
Namhyung



--===============5585327560833934539==--

