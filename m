Content-Type: multipart/mixed; boundary="===============7517171038978792050=="
MIME-Version: 1.0
From: Joerg Mayer <jmpt at loplof.de>
Subject: [Powertop] Fix out of tree builds [Was: PowerTOP v2.6.1 released]
Date: Sun, 01 Jun 2014 09:51:06 +0200
Message-ID: <20140601075106.GL615@rhrk.uni-kl.de>
In-Reply-To: 61252.10.24.1.37.1401294492.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7517171038978792050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2014 at 09:28:12AM -0700, Alexandra Yates wrote:
> > On Tue, May 27, 2014 at 10:24:44AM -0700, Alexandra Yates wrote:
> >> > Also it is not possible to compile it after running:
> >> > $ make clean
> >> >
> >> > It seems csstoh.sh script is missing
> >
> > I've had this patch in my tree for at least some months...
> =

> Can you send the patch to the mailing list?

I verified that I did attach it. For people who prefer inline patches
find a regenerated version below. Btw, to find out about problems with
the source: Please run "make distcheck" before doing a release - which
will currently fail due to the included object files.

Ciao
   J=C3=B6rg

>From 22a76b66041f27017de302ae5650ec973471a01a Mon Sep 17 00:00:00 2001
From: Joerg Mayer <jmpt(a)loplof.de>
Date: Sun, 1 Jun 2014 09:36:17 +0200
Subject: [PATCH] Fix out of tree builds

Signed-off-by: Joerg Mayer <jmpt(a)loplof.de>
---
 src/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index 0fe3c04..605f285 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -50,5 +50,5 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(PCIUTILS_LIBS) $=
(LIBNL_LIBS) $(LIBZ_LIBS)
 BUILT_SOURCES =3D css.h
 CLEANFILES =3D css.h
 css.h: powertop.css
-	$(SHELL) ./csstoh.sh powertop.css css.h
+	$(SHELL) ${srcdir}/csstoh.sh ${srcdir}/powertop.css css.h
 =

-- =

1.8.4.5

-- =

Joerg Mayer                                           <jmayer(a)loplof.de>
We are stuck with technology when what we really want is just stuff that
works. Some say that should read Microsoft instead of technology.

--===============7517171038978792050==--

