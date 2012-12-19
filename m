Content-Type: multipart/mixed; boundary="===============4681243410777070171=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] tab_window: null members on construction
Date: Wed, 19 Dec 2012 19:06:52 +0300
Message-ID: <20121219160652.GC3200@swordfish.minsk.epam.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4681243410777070171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

introduce tab_window ctor and null memebers during construction. show_tab()=
 may be
called before window_refresh() [which sets ypad_pos and xpad_pos to 0], cau=
sing prefresh()
call with uninit win->ypad_pos, win->xpad_pos args.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/display.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/display.h b/src/display.h
index b450f8b..9af3ec0 100644
--- a/src/display.h
+++ b/src/display.h
@@ -53,6 +53,14 @@ public:
 	short int xpad_pos, ypad_pos; =

 	WINDOW *win;
 =

+	tab_window() {
+		cursor_pos =3D 0;
+		cursor_max =3D 0;
+		xpad_pos =3D0;
+		ypad_pos =3D 0;
+		win =3D NULL;
+	}
+
 	virtual void cursor_down(void) { =

 		if (cursor_pos < cursor_max ) cursor_pos++; repaint(); =

 	} ;


--===============4681243410777070171==--

