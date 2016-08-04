Content-Type: multipart/mixed; boundary="===============6460550451679395063=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: Re: [Powertop] [PATCH v2 02/19] main.cpp: append __TIME__ to
 --version output
Date: Thu, 04 Aug 2016 08:03:31 -0700
Message-ID: <20160804080331.0a580d90@jbkonno-basil.jf.intel.com>
In-Reply-To: CACGkJdtaJAUUURNu72ntQsxT8RhMQ2uvBTU7sZV04XNrEsQqXg@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6460550451679395063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Short answer-- given review, I'll NACK this patch. The --version houseclean=
ing
bits will be handled in a separate series. More discussion below.

On Thu, 4 Aug 2016 14:48:13 +0300
Eugene Syromyatnikov <evgsyr(a)gmail.com> wrote:

> On Thu, Aug 4, 2016 at 3:59 AM, Joe Konno <joe.konno(a)linux.intel.com> w=
rote:
> > From: Joe Konno <joe.konno(a)intel.com>
> > -       printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " =
__DATE__ "\n"));
> > +       printf(_("PowerTOP version " POWERTOP_VERSION ", compiled on " =
__DATE__ " at " __TIME__ "\n"));  =

> By the way, there is a warning regarding reproducibility produced
> during build of Debian package.
> =

> main.cpp:101:78: warning: macro "__DATE__" might prevent reproducible
> builds [-Wdate-time]
>  printf(("PowerTOP version " POWERTOP_VERSION ", compiled on " __DATE_ "\=
n"));
>                                                                          =
    ^
> =

> I'm not aware whether powertop project cares about build
> reproducibility, but in case you are, may be it's better to put
> generation of timestamps in version string under some development
> define (#ifdef DEVEL or something) =E2=80=94
> https://reproducible-builds.org/docs/timestamps/.
> =


Good point! Thanks for the catch and link, Eugene. I wasn't aware of the
reprobuilds initiative, and now that I am, I'm all the more appreciative. T=
his
gives me a good reason to NACK this patch in favor a proper --version fix.

I had been thinking seriously about constructing AC_REVISION from 'git
describe' information, so I'll start there.

Cheers!

--===============6460550451679395063==--

