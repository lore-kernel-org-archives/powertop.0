Content-Type: multipart/mixed; boundary="===============7813010378204270828=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [PATCH] Fix running failure when > 69 CPUs for open
 file limitation
Date: Tue, 04 Jun 2013 13:19:20 +0300
Message-ID: <20130604101920.GA2323@swordfish>
In-Reply-To: 20130604212236.GA14821@linux-youquan.bj.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7813010378204270828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (06/04/13 17:22), Youquan Song wrote:
> > =

> > Hello,
> > I'd like to ask you to try out the following patch. We leak fd in read_=
file().
> > =

> =

> No. below patch does not fix the issue. The issue happen at open too
> many files at beginning.
> =


Well, the patch is a separate issue not addressing the rlimit problem direc=
tly. =

We just leak fd in read_file().

	-ss


> Thanks
> -Youquan
> =

> =

> > =

> > =

> > ------8<--------8<--------
> > =

> > - Do not leak file descriptor in perf_bundle read_file().
> > - Clear perf event (unmap memory and close fd) on event destruction.
> > =

> > =

> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
> > =

> > ---
> > =

> > diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
> > index 35b4017..e919741 100644
> > --- a/src/perf/perf.cpp
> > +++ b/src/perf/perf.cpp
> > @@ -167,6 +167,7 @@ perf_event::~perf_event(void)
> >  	if (perf_event::pevent->ref_count =3D=3D 1) {
> >  		pevent_free(perf_event::pevent);
> >  		perf_event::pevent =3D NULL;
> > +		clear();
> >  	} else
> >  		pevent_unref(perf_event::pevent);
> >  }
> > diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
> > index 38e1e91..8d480e8 100644
> > --- a/src/perf/perf_bundle.cpp
> > +++ b/src/perf/perf_bundle.cpp
> > @@ -123,6 +123,7 @@ static char * read_file(const char *file)
> >  		buffer[len] =3D '\0';
> >  	}
> >  out:
> > +	close(fd);
> >  	return buffer;
> >  }
> >  =

> > =

>=20

--===============7813010378204270828==--

