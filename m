Content-Type: multipart/mixed; boundary="===============2839996385585921736=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 08/12] do not use ncurses when --auto-tune is
 specified
Date: Sat, 02 Aug 2014 12:54:13 +0100
Message-ID: <1406980457-19077-9-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1406980457-19077-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2839996385585921736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 910fe5c..98fee0a 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -459,7 +459,8 @@ int main(int argc, char **argv)
 		end_pci_access();
 		exit(0);
 	}
-	init_display();
+	if (!auto_tune)
+		init_display();
 	initialize_tuning();
 	/* first one is short to not let the user wait too long */
 	one_measurement(1, NULL);
@@ -472,11 +473,13 @@ int main(int argc, char **argv)
 	}
 =

 	while (!leave_powertop) {
-		show_cur_tab();
+		if (!auto_tune)
+			show_cur_tab();
 		one_measurement(time_out, NULL);
 		learn_parameters(15, 0);
 	}
-	endwin();
+	if (!auto_tune)
+		endwin();
 	printf("%s\n", _("Leaving PowerTOP"));
 =

 	end_process_data();
-- =

2.0.3


--===============2839996385585921736==--

