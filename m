Content-Type: multipart/mixed; boundary="===============7180429218964106520=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3 5/5] Adding a clean_shutdown function
Date: Fri, 17 Oct 2014 15:58:06 -0700
Message-ID: <1413586686-28602-6-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413586686-28602-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7180429218964106520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

Function is designed to be a on stop place to clean up the entire
application at shutdown time.

v2: rebased atop 41c54e8

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/main.cpp | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/src/main.cpp b/src/main.cpp
index d3963ed..b6ce090 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -368,6 +368,17 @@ static void powertop_init(void)
 	initialized =3D 1;
 }
 =

+void clean_shutdown()
+{
+	close_results();
+	close_display();
+	clean_open_devices();
+	clear_all_devices();
+	clear_all_cpus();
+
+	return;
+}
+
 =

 int main(int argc, char **argv)
 {
@@ -498,9 +509,7 @@ int main(int argc, char **argv)
 	clear_tuning();
 	reset_display();
 =

-	clean_open_devices();
-	clear_all_devices();
-	clear_all_cpus();
+	clean_shutdown();
 =

 	return 0;
 }
-- =

2.1.2


--===============7180429218964106520==--

