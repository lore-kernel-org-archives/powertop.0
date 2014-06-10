Content-Type: multipart/mixed; boundary="===============3548616726612259122=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] Fix out of tree builds [Was: PowerTOP v2.6.1 released]
Date: Tue, 10 Jun 2014 09:41:56 +0200
Message-ID: <20140610074156.GB7132@rhrk.uni-kl.de>
In-Reply-To: 20140610072944.GA7132@rhrk.uni-kl.de
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3548616726612259122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Resend, this time with the script inlined as Intel's virus checker rejected
the .sh attachment]

Hello Alexandra,

On Mon, Jun 09, 2014 at 04:14:50PM -0700, Alexandra Yates wrote:
> > On Wed, Jun 04, 2014 at 02:20:18PM -0700, Alexandra Yates wrote:
> >> Unfortunately the patches you sent don't fix the issue.  Here is how to
> >> reproduced the issue:
...
> >> The error still points that /bin/bash: ./csstoh.sh: No such file or
> >> directory
...
> I still get the error, even after following your steps.  You may have
> other commits I don't.

I don't have any other patches applied (the only differences result from
my patches and some regenerated files):

jmayer(a)egg:~/work/power/powertop/git(master)> git status --ignored
#       modified:   po/ca.po           <=3D=3D=3D=3D Automagically regenera=
ted
#       modified:   po/cs_CZ.po        <=3D=3D=3D=3D (only timestamps and
#       modified:   po/de_DE.po        <=3D=3D=3D=3D line numbers differ. T=
he
#       modified:   po/en_GB.po        <=3D=3D=3D=3D differing line numbers
#       modified:   po/en_US.po        <=3D=3D=3D=3D indicate that these fi=
les
#       modified:   po/es_ES.po        <=3D=3D=3D=3D should be regenerated =
before
#       modified:   po/hu_HU.po        <=3D=3D=3D=3D doing a distribution a=
s well)
#       modified:   po/id_ID.po
#       modified:   po/nl_NL.po
#       modified:   po/powertop.pot
#       modified:   po/zh_TW.po
#       modified:   src/Makefile.am    <=3D=3D=3D=3D My changes

And git diff for src/Makefile.am only shows my two changes.

>From the top of your git directory please run
grep -r \\./csstoh.sh .
If something is found, delete it. Even better (assuming you have no extra
directories in your source tree that are not checked in and not worth
keeping): Please run "git clean -dfX" from the top of your git tree.
Verify that the changes are applied ("git diff src/Makefile.am").
Then rebuild.

I'm very sure that my tree is clean as I do development in branches:
jmayer(a)egg:~/work/power/powertop/git(master)> git branch
* master
  out-of-tree-build-fix
  tuning-packaging-fix
I tested my patches on top of master to make sure I work on a pristine
source tree.

I'm a) quite sure it's something in your setup/workflow and b) quite
determined to find out what it going wrong there if you are willing to
let me :)

OK, I've written a small script that tries to insure that things are build
correctly - please try (note that it will run "git clean -dfX").

Thanks
   J=C3=B6rg
-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D build-release.sh =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/sh

# Terminate script on error
set -e

if [ ! -d .git ]; then
  echo
  echo "Please run from top of git source tree"
  echo
  exit 1
fi

echo
echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Cleaning up source tree =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
echo
git clean -dfX

echo
echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D List of modified files =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
echo
git status --ignored

echo
echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Setting up build environmnet =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
echo
./autogen.sh >/dev/null
./configure >/dev/null

echo
echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Packaging source =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
echo
make dist >/dev/null

echo
echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Checking packaged source =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
echo
make distcheck >/dev/null

echo
echo " All good for release"
echo

exit 0


--===============3548616726612259122==--

