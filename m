Content-Type: multipart/mixed; boundary="===============0473041903888114840=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] [Announce] v2.5-rc1
Date: Tue, 22 Oct 2013 11:56:32 +0300
Message-ID: <20131022085631.GB2286@swordfish>
In-Reply-To: 5B3EBE90AD716C428A6F03AC478C54067FB7D737@ORSMSX105.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0473041903888114840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (10/21/13 17:21), Yates, Alexandra wrote:
> IE 8.0 up to 10 doesn't display the menu bar nor any of the links.  =


please test the following patch.

------8<-----8<--------

IE up to v10 does not support object classList. workaround
by manual className manipulation.

Reported-by: Alexandra Yates <alexandra.yates(a)intel.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/powertop.css | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/src/powertop.css b/src/powertop.css
index 6d43e07..c58d757 100644
--- a/src/powertop.css
+++ b/src/powertop.css
@@ -17,14 +17,20 @@ var powertop =3D {
  },
  cadd: function(idx, c){
    var el =3D document.getElementById(idx);
-   if (el)
-     el.classList.add(c);
-
+   if (el) {
+      var cn =3D el.className;
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


--===============0473041903888114840==--

