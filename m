Content-Type: multipart/mixed; boundary="===============7640408128702774175=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 2/2] html report: fix IE compatibility errors
Date: Wed, 23 Oct 2013 22:27:03 +0300
Message-ID: <5590a52f716d1512617386bedd2f159b4a6cb4ef.1382555988.git.sergey.senozhatsky@gmail.com>
In-Reply-To: cover.1382555988.git.sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7640408128702774175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alexandra Yates reported that c8a9e53854ad672529bee73a31c9c25382089ec8
broke IE (v8 - v10) compatibility.

the following issues were addressed:
-- IE up to v10 does not support object classList. workaround
by manual className manipulation.
-- IE has issues with textContent in some versions. workaround
by setting innerText.

Reported-and-tested-by: Alexandra Yates <alexandra.yates(a)intel.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>
---
 src/powertop.css | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index 6d43e07..ce7dbb2 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -17,20 +17,29 @@ var powertop =3D {
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
   x.id =3D id + '_button';
   x.className =3D 'nav_button';
   x.textContent =3D txt;
+  x.innerText =3D txt;
   x.onclick =3D function() { powertop.toggle(id); };
   return x;
  },
-- =

1.8.4.1.780.ga09e2a8


--===============7640408128702774175==--

