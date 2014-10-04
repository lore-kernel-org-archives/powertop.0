Content-Type: multipart/mixed; boundary="===============4030655522003251381=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: Re: [Powertop] [PATCH v3 05/15] fix clang++ compilation errors
Date: Sat, 04 Oct 2014 15:15:34 +0100
Message-ID: <alpine.LNX.2.03.1410041513550.3874@iki.fi>
In-Reply-To: 20141004113550.GA9242@rhlx01.hs-esslingen.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4030655522003251381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Oct 2014, Andreas Mohr wrote:

> On Mon, Sep 29, 2014 at 07:42:28PM -0700, Alexandra Yates wrote:
>>> any appearance of new/delete should automatically make the review fail,
>>> with subsequent manual white-listing needed for the few rare cases
>>> that do really want to have it (think class-internal handling of
>>> resources,
>>> or some such).
>>>
>>>
>>> That said, thank you very much for enabling clang++ compatibility,
>>> and for all the other fixes!
>>> I had wanted to venture into such areas myself, too
>>> (e.g. for C++ diagnosis reasons), but simply haven't found the time yet.
>>>
>>> Andreas Mohr
>>> _______________________________________________
>>> PowerTop mailing list
>>> PowerTop(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/powertop
>>>
>>
>> Andreas, feel free to submit a patch with this fix.
>
> Right, that seems like a good idea
> (although it's quite a bit of effort,
> and all these areas have been committed now unfortunately).
>
> I started to dive into it (did git pull of my existing
> https://github.com/fenrus75/powertop ), but immediately hit a snag:
>
> README said that I should apply the usual UNIX prayer of
>
>    ./configure
>    make
>    make install
>
> which obviously wasn't possible since in this repo-only content
> the automake step was not done (likely rightfully, I think,
> since these things should nicely fit the local environment,
> but then it should still have been explained in the README).
>
> Running automake then failed (again!! Somehow I knew it, since these thin=
gs
> magically have a tendency to fail almost always...):
>
> # ./autogen.sh
> autoreconf: Entering directory `.'
> autoreconf: running: autopoint
> autoreconf: running: aclocal  --output=3Daclocal.m4t
> aclocal: configure.ac: 20: macro `AM_SILENT_RULES' not found in library
> aclocal: macro `AM_PROG_MKDIR_P' required but not defined
> aclocal: macro `AM_PROG_MKDIR_P' required but not defined
> aclocal: macro `_LT_DECL_SED' required but not defined
> aclocal: macro `_LT_FUNC_STRIPNAME_CNF' required but not defined
> autoreconf: aclocal failed with exit status: 1
>
> to which https://forum.videolan.org/viewtopic.php?f=3D13&t=3D84261
> had the following wise words to say: "Use automake 1.11".
>
> Fortunately there's an automake1.11 package on Debian, however there's al=
so of course
> the "standard", "canonical version" "automake" package (oh darnit - which=
 I currently
> don't even have installed, oops... can you tell that I'm a CMake guy alre=
ady? ;)).
> So, since I only had older specific-version automake packages installed
> (a  sufficiently medieval automake1.7),,
> I installed the generic, version-progressing one.
> But it still used the old version prior to an
>    update-alternatives --config automake
> , at which point it worked.
>
> So, now that this is documented for other people to be helped,
> on to documenting README omissions and working on the scoped array handli=
ng commit.

Hi Andreas,

IMHO it would be better to require new enough automake as part of =

autotools configuration, than add notes to README.  Something like this =

could do:

--->8----
From: Sami Kerola <kerolasa(a)iki.fi>
Date: Sat, 4 Oct 2014 14:54:23 +0100
Subject: [PATCH] configure: require the least automake version 1.11.1

Apparently some Debian has rather old automake, version 1.7, which is
causing build from git to fail.

Set the requird automake version to be minimum of 1.11.1, that used to be
the version GNU coreutils requied before they introduced
AM_TESTS_ENVIRONMENT that works in 1.11.2 or later.  As powertop does not
have tests, the earlier GNU coreutils requirement an initial pick for
this project.

p.s. The automake 1.11.1 has been a round since December 2009, so there
really shouldn't be need for support anything older, like 1.7.9 that was
released November 2003.

Reported-by: Andreas Mohr <andi(a)lisas.de>
Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
  configure.ac | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 4991d97..a1dbfb8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -3,7 +3,11 @@

  AC_PREREQ([2.68])
  AC_INIT([powertop], [2.6.1], [powertop(a)lists.01.org], [], [https://01.o=
rg/powertop])
-AM_INIT_AUTOMAKE([-Wall foreign])
+AM_INIT_AUTOMAKE([
+	-Wall
+	1.11.2
+	foreign
+])
  AC_LANG([C++])
  AC_CONFIG_FILES([
  	Makefile
-- =

2.1.2


--===============4030655522003251381==--

