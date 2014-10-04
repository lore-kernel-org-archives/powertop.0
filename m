Content-Type: multipart/mixed; boundary="===============1057003437508198602=="
MIME-Version: 1.0
From: Andreas Mohr <andi at lisas.de>
Subject: Re: [Powertop] [PATCH v3 05/15] fix clang++ compilation errors
Date: Sat, 04 Oct 2014 13:35:50 +0200
Message-ID: <20141004113550.GA9242@rhlx01.hs-esslingen.de>
In-Reply-To: 56378.10.24.5.188.1412044948.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1057003437508198602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 29, 2014 at 07:42:28PM -0700, Alexandra Yates wrote:
> > any appearance of new/delete should automatically make the review fail,
> > with subsequent manual white-listing needed for the few rare cases
> > that do really want to have it (think class-internal handling of
> > resources,
> > or some such).
> >
> >
> > That said, thank you very much for enabling clang++ compatibility,
> > and for all the other fixes!
> > I had wanted to venture into such areas myself, too
> > (e.g. for C++ diagnosis reasons), but simply haven't found the time yet.
> >
> > Andreas Mohr
> > _______________________________________________
> > PowerTop mailing list
> > PowerTop(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/powertop
> >
> =

> Andreas, feel free to submit a patch with this fix.

Right, that seems like a good idea
(although it's quite a bit of effort,
and all these areas have been committed now unfortunately).

I started to dive into it (did git pull of my existing
https://github.com/fenrus75/powertop ), but immediately hit a snag:

README said that I should apply the usual UNIX prayer of

    ./configure
    make
    make install

which obviously wasn't possible since in this repo-only content
the automake step was not done (likely rightfully, I think,
since these things should nicely fit the local environment,
but then it should still have been explained in the README).

Running automake then failed (again!! Somehow I knew it, since these things
magically have a tendency to fail almost always...):

# ./autogen.sh
autoreconf: Entering directory `.'
autoreconf: running: autopoint
autoreconf: running: aclocal  --output=3Daclocal.m4t
aclocal: configure.ac: 20: macro `AM_SILENT_RULES' not found in library
aclocal: macro `AM_PROG_MKDIR_P' required but not defined
aclocal: macro `AM_PROG_MKDIR_P' required but not defined
aclocal: macro `_LT_DECL_SED' required but not defined
aclocal: macro `_LT_FUNC_STRIPNAME_CNF' required but not defined
autoreconf: aclocal failed with exit status: 1

to which https://forum.videolan.org/viewtopic.php?f=3D13&t=3D84261
had the following wise words to say: "Use automake 1.11".

Fortunately there's an automake1.11 package on Debian, however there's also=
 of course
the "standard", "canonical version" "automake" package (oh darnit - which I=
 currently
don't even have installed, oops... can you tell that I'm a CMake guy alread=
y? ;)).
So, since I only had older specific-version automake packages installed
(a  sufficiently medieval automake1.7),,
I installed the generic, version-progressing one.
But it still used the old version prior to an
    update-alternatives --config automake
, at which point it worked.

So, now that this is documented for other people to be helped,
on to documenting README omissions and working on the scoped array handling=
 commit.

Andreas Mohr

--===============1057003437508198602==--

