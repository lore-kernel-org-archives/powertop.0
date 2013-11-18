Content-Type: multipart/mixed; boundary="===============3791490296586076898=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH v3 25/31] report: fixed empty SW settings in need
 of tunning
Date: Mon, 18 Nov 2013 12:27:16 -0800
Message-ID: <1384806442-20294-26-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1384806442-20294-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3791490296586076898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

After tunning the sistem the Software Setings in Need of Tunning table
appreared empty. Added a conditional statement to print the table only
when there are software settings  in need of tunning.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/tuning/tuning.cpp |   60 ++++++++++++++++++++++++++++-----------------=
----
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index ad73b2e..67d604f 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -209,39 +209,49 @@ void report_show_tunables(void)
         tag_attr div_attr;
         init_div(&div_attr, "clear_block", "tuning");
 =

+	/* Set Title attributes */
+       	tag_attr title_attr;
+        init_title_attr(&title_attr);
+
 	/* Set Table attributes, rows, and cols */
 	table_attributes tune_table_css;
 	cols=3D2;
 	idx =3D cols;
-	rows=3D all_tunables.size() + 1;
-	init_tune_table_attr(&tune_table_css, rows, cols);
-
-	/* Set Title attributes */
-        tag_attr title_attr;
-        init_title_attr(&title_attr);
-
-	/* Set array of data in row Major order */
-	string tunable_data[cols * rows];
-
-	tunable_data[0]=3D__("Description");
-	tunable_data[1]=3D__("Script");
-
 =

 	for (i =3D 0; i < all_tunables.size(); i++) {
-		int gb;
-		gb =3D all_tunables[i]->good_bad();
-		if (gb !=3D TUNE_BAD)
-			continue;
-		tunable_data[idx]=3Dstring(all_tunables[i]->description());
-		idx+=3D1;
-		tunable_data[idx]=3Dstring(all_tunables[i]->toggle_script());
-		idx+=3D1;
+		int tgb;
+		tgb =3D all_tunables[i]->good_bad();
+		if (tgb =3D=3D TUNE_BAD)
+			rows+=3D1;
 	}
-
-	/* Report Output */
+	/* add section */
 	report.add_div(&div_attr);
-	report.add_title(&title_attr,__("Software Settings in Need of Tuning"));
-	report.add_table(tunable_data, &tune_table_css);
+
+	if (rows > 0){
+		rows=3D rows + 1;
+		init_tune_table_attr(&tune_table_css, rows, cols);
+
+		/* Set array of data in row Major order */
+		string tunable_data[cols * rows];
+
+		tunable_data[0]=3D__("Description");
+		tunable_data[1]=3D__("Script");
+
+		for (i =3D 0; i < all_tunables.size(); i++) {
+			int gb;
+			gb =3D all_tunables[i]->good_bad();
+			if (gb !=3D TUNE_BAD)
+				continue;
+			tunable_data[idx]=3Dstring(all_tunables[i]->description());
+			idx+=3D1;
+			tunable_data[idx]=3Dstring(all_tunables[i]->toggle_script());
+			idx+=3D1;
+		}
+
+		/* Report Output */
+		report.add_title(&title_attr,__("Software Settings in Need of Tuning"));
+		report.add_table(tunable_data, &tune_table_css);
+	}
 =

 	/* Second Table */
 	/* Set Table attributes, rows, and cols */
-- =

1.7.9.5


--===============3791490296586076898==--

