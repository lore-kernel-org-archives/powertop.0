Content-Type: multipart/mixed; boundary="===============7821708850042155084=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: Re: [Powertop] Fix out of tree builds [Was: PowerTOP v2.6.1 released]
Date: Tue, 10 Jun 2014 09:29:44 +0200
Message-ID: <20140610072944.GA7132@rhrk.uni-kl.de>
In-Reply-To: 39770.10.7.201.30.1402355690.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7821708850042155084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

--===============7821708850042155084==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="build-release.sh"

IyEvYmluL3NoCgojIFRlcm1pbmF0ZSBzY3JpcHQgb24gZXJyb3IKc2V0IC1lCgppZiBbICEgLWQg
LmdpdCBdOyB0aGVuCiAgZWNobwogIGVjaG8gIlBsZWFzZSBydW4gZnJvbSB0b3Agb2YgZ2l0IHNv
dXJjZSB0cmVlIgogIGVjaG8KICBleGl0IDEKZmkKCmVjaG8KZWNobyAiPT09PT09PT09PT0gQ2xl
YW5pbmcgdXAgc291cmNlIHRyZWUgPT09PT09PT09PT09PT09PT0iCmVjaG8KZ2l0IGNsZWFuIC1k
ZlgKCmVjaG8KZWNobyAiPT09PT09PT09PT0gTGlzdCBvZiBtb2RpZmllZCBmaWxlcyA9PT09PT09
PT09PT09PT09PT0iCmVjaG8KZ2l0IHN0YXR1cyAtLWlnbm9yZWQKCmVjaG8KZWNobyAiPT09PT09
PT09PT0gU2V0dGluZyB1cCBidWlsZCBlbnZpcm9ubW5ldCA9PT09PT09PT09PT0iCmVjaG8KLi9h
dXRvZ2VuLnNoID4vZGV2L251bGwKLi9jb25maWd1cmUgPi9kZXYvbnVsbAoKZWNobwplY2hvICI9
PT09PT09PT09PSBQYWNrYWdpbmcgc291cmNlID09PT09PT09PT09PT09PT09PT09PT09PSIKZWNo
bwptYWtlIGRpc3QgPi9kZXYvbnVsbAoKZWNobwplY2hvICI9PT09PT09PT09PSBDaGVja2luZyBw
YWNrYWdlZCBzb3VyY2UgPT09PT09PT09PT09PT09PSIKZWNobwptYWtlIGRpc3RjaGVjayA+L2Rl
di9udWxsCgplY2hvCmVjaG8gIiBBbGwgZ29vZCBmb3IgcmVsZWFzZSIKZWNobwoKZXhpdCAwCgo=

--===============7821708850042155084==--

