Content-Type: multipart/mixed; boundary="===============1884356446998393317=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH 09/14] do not use ncurses when --auto-tune is
 specified
Date: Tue, 05 Aug 2014 22:31:33 +0100
Message-ID: <1407274298-16404-9-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1407274298-16404-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1884356446998393317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/main.cpp | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index 3b67ef0..4bfd038 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -460,7 +460,8 @@ int main(int argc, char **argv)
 		end_pci_access();
 		exit(0);
 	}
-	init_display();
+	if (!auto_tune)
+		init_display();
 	initialize_tuning();
 	/* first one is short to not let the user wait too long */
 	one_measurement(1, NULL);
@@ -473,11 +474,13 @@ int main(int argc, char **argv)
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

2.0.4


--===============1884356446998393317==--

