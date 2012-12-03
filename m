Content-Type: multipart/mixed; boundary="===============7737698292549105735=="
MIME-Version: 1.0
From: Ferron, Chris E <chris.e.ferron at intel.com>
Subject: Re: [Powertop] [PATCH 1/3] Suppress compiler warnings on write()
Date: Mon, 03 Dec 2012 16:25:59 +0000
Message-ID: <E351AD52FA1E154C8FFF4F9FCD2CA8431B3C52C2@ORSMSX108.amr.corp.intel.com>
In-Reply-To: 1354551494.1506.1.camel@leonhard
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7737698292549105735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: powertop-bounces(a)lists.01.org [mailto:powertop-bounces(a)lists.01.o=
rg] On Behalf Of Namhyung Kim
Sent: Monday, December 03, 2012 8:18 AM
To: Arjan van de Ven
Cc: powertop(a)lists.01.org
Subject: Re: [Powertop] [PATCH 1/3] Suppress compiler warnings on write()

Hi Arjan,

2012-12-03 (=EC=9B=94), 08:14 -0800, Arjan van de Ven:
> On 12/3/2012 7:13 AM, Namhyung Kim wrote:
> > -		write(fd, buffer, 64*1024);
> > +		if (write(fd, buffer, 64*1024))
> > +			/* make gcc silent */;
> >   		fdatasync(fd);
> =

> I'm sorry, but no.
> This is waaaaaaaaaaay worse than leaving the compiler warning.
> The compiler warning is real, and is a reminder that we need to =

> improve the code "just make it shut up" patches are a really bad idea, an=
d this is the perfect example of that.
> =


So how can we improve the code then?

The code needs to be refactored to handle the error. =

-c

--
Regards,
Namhyung Kim


_______________________________________________
PowerTop mailing list
PowerTop(a)lists.01.org
https://lists.01.org/mailman/listinfo/powertop

--===============7737698292549105735==--

