Content-Type: multipart/mixed; boundary="===============4799893996506766178=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Announce] v2.5-rc1
Date: Wed, 23 Oct 2013 19:58:06 +0300
Message-ID: <20131023165805.GB2474@swordfish.minsk.epam.com>
In-Reply-To: 63704.10.24.1.152.1382544759.squirrel@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4799893996506766178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/23/13 09:12), Alexandra Yates wrote:
> >> This change enables the menu links and mouse over, but the font and the
> >> button background are all black, I don't think the css are working her=
e.
> >> I will send you the image to your email that way you get to see it.
> >>
> >
> > thanks. well, that's weird. I found rdesktop-ed win box around and test=
ed
> > generated report on IE (don't know the version - 8 or 9). what IE versi=
on
> > is on the picture?
> >
> >
> =

> You are welcome, what version of IE are you running?
>

ok, last chance. [not tested on IE 8]

could you please try this one?


---
 src/powertop.css | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index 6d43e07..64f8de2 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -17,14 +17,22 @@ var powertop =3D {
  },
  cadd: function(idx, c){
    var el =3D document.getElementById(idx);
-   if (el)
-     el.classList.add(c);
-
+   if (el) {
+      var cn =3D el.className;
+      if (cn.indexOf(c) !=3D -1)
+         return;
+      cn +=3D ' ' + c;
+      el.className =3D cn;
+   }
  },
  crm: function(id, c){
    var el =3D document.getElementById(id);
-   if (el)
-     el.classList.remove(c);
+   if (el) {
+      var cn =3D el.className
+      while (cn.indexOf(' ' + c) !=3D -1)
+         cn =3D cn.replace(' ' + c,'');
+      el.className =3D cn;
+   }
  },
  newbutton: function(id, txt) {
   var x =3D document.createElement('div');


--===============4799893996506766178==--

