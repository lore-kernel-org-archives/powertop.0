Content-Type: multipart/mixed; boundary="===============8235935038920811190=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: Re: [Powertop] [PATCH v3 05/15] fix clang++ compilation errors
Date: Sat, 04 Oct 2014 22:10:58 +0200
Message-ID: <20141004201058.GA26114@rhlx01.hs-esslingen.de>
In-Reply-To: alpine.LNX.2.03.1410041513550.3874@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8235935038920811190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 04, 2014 at 03:15:34PM +0100, Sami Kerola wrote:
> On Sat, 4 Oct 2014, Andreas Mohr wrote:
> >So, now that this is documented for other people to be helped,
> >on to documenting README omissions and working on the scoped array handl=
ing commit.
> =

> Hi Andreas,
> =

> IMHO it would be better to require new enough automake as part of autotoo=
ls
> configuration, than add notes to README.  Something like this could do:

Not quite, people actually need to get to know that they need automake at a=
ll
(to achieve availability of ./configure) ;)

(was mentioned shortly further below, but that's not enough)

> Apparently some Debian has rather old automake, version 1.7, which is
> causing build from git to fail.

That's just my "historic" Debian installation (18 years and counting).
(bo, woody, slink, hamm or some such?)

Oh crap, my 'puter just managed to get its driver's license ;)
Another 3 years and it will be allowed to drink beer...

> Set the requird automake version to be minimum of 1.11.1, that used to be
> the version GNU coreutils requied before they introduced
> AM_TESTS_ENVIRONMENT that works in 1.11.2 or later.  As powertop does not
> have tests, the earlier GNU coreutils requirement an initial pick for
> this project.

Yup, since we *do* seem to use version-specific functionality,
we likely *should* fend off version issues,
by demanding specific version requirements
in this AM_INIT_AUTOMAKE autoconf macro,
otherwise our behaviour is "improper", "weak".

> p.s. The automake 1.11.1 has been a round since December 2009, so there
> really shouldn't be need for support anything older, like 1.7.9 that was
> released November 2003.

Ouch, that old?


In closing: patch seems fine to me (possibly except for the specific
version number, that is).

Thanks,

Andreas Mohr

--===============8235935038920811190==--

