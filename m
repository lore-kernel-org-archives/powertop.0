Content-Type: multipart/mixed; boundary="===============8990952657294825956=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH v3 2/5] Removing a documented memory leak
Date: Fri, 17 Oct 2014 15:58:03 -0700
Message-ID: <1413586686-28602-3-git-send-email-joe.konno@linux.intel.com>
In-Reply-To: 1413586686-28602-1-git-send-email-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8990952657294825956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Dan Kalowsky <daniel.kalowsky(a)intel.com>

A non-elegant solution to it, but it works well enough to remove the
documented memory leak.  Proves to provide a much larger impact on
memory constrained systems.

v2: rebased atop 41c54e8

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 src/parameters/parameters.h   |  1 +
 src/parameters/persistent.cpp | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/src/parameters/parameters.h b/src/parameters/parameters.h
index bd9fee8..72f8d32 100644
--- a/src/parameters/parameters.h
+++ b/src/parameters/parameters.h
@@ -100,6 +100,7 @@ extern void store_results(double duration);
 extern void learn_parameters(int iterations, int do_base_power);
 extern char *get_param_directory(const char *filename);
 extern void save_all_results(const char *filename =3D "saved_results.power=
top");
+extern void close_results(void);
 extern void load_results(const char *filename);
 extern void save_parameters(const char *filename);
 extern void load_parameters(const char *filename);
diff --git a/src/parameters/persistent.cpp b/src/parameters/persistent.cpp
index 483227b..9a5688a 100644
--- a/src/parameters/persistent.cpp
+++ b/src/parameters/persistent.cpp
@@ -61,6 +61,16 @@ void save_all_results(const char *filename)
 =

 }
 =

+void close_results()
+{
+	for (unsigned int i =3D 0; i < past_results.size(); i++) {
+		delete past_results[i];
+	}
+
+	past_results.clear();
+	return;
+}
+
 void load_results(const char *filename)
 {
 	ifstream file;
@@ -70,6 +80,7 @@ void load_results(const char *filename)
 	int first =3D 1;
 	unsigned int count =3D 0;
 	char* pathname;
+	int bundle_saved =3D 0;
 =

 	pathname =3D get_param_directory(filename);
 =

@@ -97,6 +108,7 @@ void load_results(const char *filename)
 		if (strlen(line) < 3) {
 			int overflow_index;
 =

+			bundle_saved =3D 1;
 			overflow_index =3D 50 + (rand() % MAX_KEEP);
 			if (past_results.size() >=3D MAX_PARAM) {
 			/* memory leak, must free old one first */
@@ -118,6 +130,9 @@ void load_results(const char *filename)
 		set_result_value(line, d, bundle);
 	}
 =

+	if (bundle_saved =3D=3D 0)
+		delete bundle;
+
 	file.close();
 	// '%i" is for count, do not translate
 	fprintf(stderr, _("Loaded %i prior measurements\n"), count);
-- =

2.1.2


--===============8990952657294825956==--

