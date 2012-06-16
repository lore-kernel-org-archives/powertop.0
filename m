Content-Type: multipart/mixed; boundary="===============8698888599643502854=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH] Use printf, not sprintf,
 to print messages to stdout.
Date: Sat, 16 Jun 2012 18:14:54 +0200
Message-ID: <1339918399.3605.1.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8698888599643502854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This undos the last printf->sprintf change from 8fd54ace.

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/main.cpp |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 880d745..a2d8700 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -229,7 +229,7 @@ void one_measurement(int seconds, char *workload)
 void out_of_memory()
 {
 	reset_display();
-	sprintf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
+	printf("%s...\n",_("PowerTOP is out of memory. PowerTOP is Aborting"));
 	abort();
 }
 =

@@ -458,7 +458,7 @@ int main(int argc, char **argv)
 #ifndef DISABLE_NCURSES
 	endwin();
 #endif
-	sprintf("%s\n", _("Leaving PowerTOP"));
+	printf("%s\n", _("Leaving PowerTOP"));
 =

 	end_process_data();
 	clear_process_data();
-- =

1.7.10


--===============8698888599643502854==--

