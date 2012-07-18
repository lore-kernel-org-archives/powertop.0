Content-Type: multipart/mixed; boundary="===============6102961682804443489=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Get rid of ncurses' TRUE and FALSE
Date: Wed, 18 Jul 2012 13:17:25 +0400
Message-ID: <1342603045-25492-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6102961682804443489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Get rid of TRUE and FALSE ncurses' defines used for boolean variables
initialization. This fix also helps build without ncurses support.
---
 src/main.cpp          |    6 +++---
 src/tuning/tuning.cpp |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 7a1b976..9f53b46 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -354,7 +354,7 @@ int main(int argc, char **argv)
 {
 	int option_index;
 	int c;
-	bool wantreport =3D FALSE;
+	bool wantreport =3D false;
 	char filename[4096];
 	char workload[4096] =3D {0,};
 	int  iterations =3D 1;
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 				break;
 =

 			case 'h': /* html report */
-				wantreport =3D TRUE;
+				wantreport =3D true;
 				reporttype =3D 1;
 				sprintf(filename, "%s", optarg ? optarg : "PowerTOP.html" );
 				break;
@@ -417,7 +417,7 @@ int main(int argc, char **argv)
 				break;
 				=

 			case 'C': /* csv report*/
-				wantreport =3D TRUE;
+				wantreport =3D true;
 				reporttype =3D 0;
 				sprintf(filename, "%s", optarg ? optarg : "PowerTOP.csv");
 				break;
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index 1a90417..865d986 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -43,7 +43,7 @@
 #include "../lib.h"
 =

 static void sort_tunables(void);
-static bool should_clear =3D FALSE;
+static bool should_clear =3D false;
 =

 #ifndef DISABLE_NCURSES
 class tuning_window: public tab_window {
@@ -103,7 +103,7 @@ static void __tuning_update_display(int cursor_pos)
 		return;
 =

 	if (should_clear) {
-		should_clear =3D FALSE;
+		should_clear =3D false;
 		wclear(win);
 	}
 =

@@ -185,7 +185,7 @@ static bool tunables_sort(class tunable * i, class tuna=
ble * j)
 void tuning_window::window_refresh()
 {
 	clear_tuning();
-	should_clear =3D TRUE;
+	should_clear =3D true;
 	init_tuning();
 }
 =

-- =

1.7.5.4


--===============6102961682804443489==--

