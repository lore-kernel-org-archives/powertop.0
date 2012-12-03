Content-Type: multipart/mixed; boundary="===============2023312884642899922=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: Re: [Powertop] [PATCH 1/3] Suppress compiler warnings on write()
Date: Tue, 04 Dec 2012 01:18:14 +0900
Message-ID: <1354551494.1506.1.camel@leonhard>
In-Reply-To: 50BCCFF6.8070608@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2023312884642899922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
> The compiler warning is real, and is a reminder that we need to improve t=
he code
> "just make it shut up" patches are a really bad idea, and this is the per=
fect example of that.
> =


So how can we improve the code then?

-- =

Regards,
Namhyung Kim



--===============2023312884642899922==--

