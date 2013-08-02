Content-Type: multipart/mixed; boundary="===============2057531570929478643=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: Re: [Powertop] [PATCH] Add support for device hierarchy. Preserves
 backward compatibility with flat list of devices
Date: Fri, 02 Aug 2013 21:36:22 +0200
Message-ID: <1375472182.12505.2.camel@sara>
In-Reply-To: 20130802110553.GB2322@XPBYMINW2233.minsk.epam.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2057531570929478643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-08-02 at 14:05 +0300, Sergey Senozhatsky wrote:
> > +std::vector<class alsa*> create_alsa_interface(const char *name,
> const char *path) {
> >       struct dirent *entry;
> >       DIR *dir;
> >       char filename[4096];
> > +     char full_path[512];
> > +     vector<class alsa*> result;
> =

> I would prefer to return a pointer to allocated vector or pass vector
> as a function
> parameter. otherwise we copy existing one upon the return (yes, it's
> just N * sizeof(pointer), but still).
> =

I think it would be nicer to go for C++11.
Using that this would be a move from result to the return value.

/MF


--===============2057531570929478643==--

