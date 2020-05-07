Content-Type: multipart/mixed; boundary="===============8990630686733462526=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] Re: [PATCH 1/3 v1] README.md: rename, add md syntax,
 and major tweaks
Date: Thu, 07 May 2020 08:28:36 -0700
Message-ID: <20200507152017.GA40603@jbkonno-drifter>
In-Reply-To: BYAPR11MB371859EDF83681DE6C5482F0F2A40@BYAPR11MB3718.namprd11.prod.outlook.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8990630686733462526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 06:01:19PM +0000, Kammela, Gayatri wrote:

*** snip ***

> > +
> > +# Building PowerTOP
> > +
> > +The `autogen.sh` script needs to be run only once to generate `configu=
re`.
> > +You need to re-run it only if the build system configuration files
> > +(e.g. `configure.ac`) are modified. The remaining steps are required
> > +whenever source files are modified.
> > +
> > +To build PowerTOP from the cloned source, use the following commands:
> > +
> > +    ./autogen.sh
> > +    ./configure
> > +    make
> > +
> > +**Note:** For Android* (running on Intel=C2=AE architecture) there is a
> > +Android.mk that was provided by community members, and at this time is
> > +supported mostly by community members.
> > +
> > +
> > +## Build PowerTOP for Android Lollipop
> Are these instructions up to date? Just curious as we haven=E2=80=99t had=
 a change to this section in a long time.

No, I did not verify the Android build instructions, I merely converted
the existing instructions to markdown. In a subsequent submission, I
hope to remove the Android build artifacts entirely, as we do not
actively maintain them (and have not received community updates to them
for a long time).

> > +
> > +1. Obtain pciutils and ncurses libraries. Skip this step if they are a=
lready in
> > +   the tree.
> > +
> > +```
> > +pciutils: Clone
> > +    https://github.com/trevd/android_external_pciutils
> > +into external/pciutils
> > +
> > +ncurses: Clone
> > +    https://github.com/cvpcs/android_external_libncurses
> > +into external/ncurses
> > +```
> > +
> > +2. Run the following command to generate the `css.h` header file:
> > +    ./src/csstoh.sh src/powertop.css src/css.h
> > +
> > +3. Apply patches inside patches/Android
> > +
> > +4. PowerTOP can be built with top level make, or by doing `mm`.
> > +
> > +* The resulting binary is under
> > +`$ANDROID_PRODUCT_OUT/system/bin/powertop`
> > +
> > +

*** snip ***
--===============8990630686733462526==--

