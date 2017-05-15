Content-Type: multipart/mixed; boundary="===============5023434677095688436=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH] src/display.h: fix misleading-indentation warning
Date: Mon, 15 May 2017 13:31:29 -0700
Message-ID: <20170515203129.32553-1-joe.konno@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5023434677095688436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Because of how the code blocks are formatted, gcc 6 emits a "misleading
indentation" warning around the cursor_up() and cursor_down() virtual
methods.

Fix the warning by tweaking the code's indentation.

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/display.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/display.h b/src/display.h
index 9af3ec0b6e72..9db87ec85464 100644
--- a/src/display.h
+++ b/src/display.h
@@ -62,10 +62,14 @@ public:
 	}
 =

 	virtual void cursor_down(void) { =

-		if (cursor_pos < cursor_max ) cursor_pos++; repaint(); =

+		if (cursor_pos < cursor_max)
+			cursor_pos++;
+		repaint();
 	} ;
 	virtual void cursor_up(void) { =

-		if (cursor_pos > 0) cursor_pos--; repaint(); =

+		if (cursor_pos > 0)
+			cursor_pos--;
+		repaint();
 	};
 	virtual void cursor_left(void) { };
 	virtual void cursor_right(void) { };
-- =

2.13.0


--===============5023434677095688436==--

