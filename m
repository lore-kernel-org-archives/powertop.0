Content-Type: multipart/mixed; boundary="===============7988560981175769494=="
MIME-Version: 1.0
From: Mingye Wang (Artoria2e5) <arthur2e5 at aosc.io>
Subject: [Powertop] [PATCH 1/2] Stop using strlen() on C++ strings
Date: Sat, 03 Mar 2018 14:53:20 -0500
Message-ID: <08177305-54b3-a686-7dfd-4a1c9ef4cdba@aosc.io>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7988560981175769494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

C++'s strings have a quicker length operation. There's no need to
convert those strings to null-terminated C strings and run strlen()
on it.
---
  src/devices/ahci.cpp | 2 +-
  src/display.cpp      | 7 +++----
  src/lib.cpp          | 2 +-
  3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/src/devices/ahci.cpp b/src/devices/ahci.cpp
index 2fa2f52..31a42d3 100644
--- a/src/devices/ahci.cpp
+++ b/src/devices/ahci.cpp
@@ -150,7 +150,7 @@ ahci::ahci(char *_name, char *path): device()
   	diskname =3D model_name(path, _name);
  -	if (strlen(diskname.c_str()) =3D=3D 0)
+	if (diskname.length() =3D=3D 0)
  		snprintf(humanname, sizeof(humanname), _("SATA link: %s"), _name);
  	else
  		snprintf(humanname, sizeof(humanname), _("SATA disk: %s"), =

diskname.c_str());
diff --git a/src/display.cpp b/src/display.cpp
index 10ee48a..8484683 100644
--- a/src/display.cpp
+++ b/src/display.cpp
@@ -98,7 +98,7 @@ void show_tab(unsigned int tab)
  	class tab_window *win;
  	unsigned int i;
  	int tab_pos =3D 17;
-	const char *c;
+	string& s =3D bottom_lines[tab_names[tab]];
   	if (!display)
  		return;
@@ -123,9 +123,8 @@ void show_tab(unsigned int tab)
  	wattrset(bottom_line, A_REVERSE);
  	mvwprintw(bottom_line, 0,0, "%120s", "");
  -	c =3D bottom_lines[tab_names[tab]].c_str();
-	if (c && strlen(c) > 0)
-		mvwprintw(bottom_line, 0,0, c);
+	if (s.length() > 0)
+		mvwprintw(bottom_line, 0,0, s.c_str());
  	else
  		mvwprintw(bottom_line, 0, 0,
  			"<ESC> %s | <TAB> / <Shift + TAB> %s | ", _("Exit"),
diff --git a/src/lib.cpp b/src/lib.cpp
index 5e48f37..b80ad36 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -424,7 +424,7 @@ char *pretty_print(const char *str, char *buf, int len)
   	p =3D pretty_prints[str].c_str();
  -	if (strlen(p) =3D=3D 0)
+	if (pretty_prints[str].length() =3D=3D 0)
  		p =3D str;
   	snprintf(buf, len,  "%s", p);
-- =

2.16.1.windows.4


--===============7988560981175769494==--

