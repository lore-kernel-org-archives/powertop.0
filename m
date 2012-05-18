Content-Type: multipart/mixed; boundary="===============4954405129536238886=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH] catch fstream exceptions in lib routines
Date: Fri, 18 May 2012 13:17:39 +0300
Message-ID: <20120518101739.GB3074@swordfish>
In-Reply-To: 6002814.JjpEWR9aH8@penguin
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4954405129536238886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[PATCH] catch fstream exceptions in lib routines

Catch possible fstream and traits_type exceptions in lib.

Reported-by: Lekensteyn <lekensteyn(a)gmail.com>
Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

 src/lib.cpp |   54 +++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 53638dd..bcd809f 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -172,8 +172,13 @@ void write_sysfs(const string &filename, const string =
&value)
 	file.open(filename.c_str(), ios::out);
 	if (!file)
 		return;
-	file << value;
-	file.close();
+	try =

+	{
+		file << value;
+		file.close();
+	} catch (std::exception &exc) {
+		return;
+	}
 }
 =

 int read_sysfs(const string &filename, bool *ok)
@@ -187,10 +192,17 @@ int read_sysfs(const string &filename, bool *ok)
 			*ok =3D false;
 		return 0;
 	}
-	file >> i;
+	try
+	{
+		file >> i;
+		if (ok)
+			*ok =3D true;
+	} catch (std::exception &exc) {
+		if (ok)
+			*ok =3D "false";
+		i =3D 0;
+	}
 	file.close();
-	if (ok)
-		*ok =3D true;
 	return i;
 }
 =

@@ -203,11 +215,17 @@ string read_sysfs_string(const string &filename)
 	file.open(filename.c_str(), ios::in);
 	if (!file)
 		return "";
-	file.getline(content, 4096);
-	file.close();
-	c =3D strchr(content, '\n');
-	if (c)
-		*c =3D 0;
+	try
+	{
+		file.getline(content, 4096);
+		file.close();
+		c =3D strchr(content, '\n');
+		if (c)
+			*c =3D 0;
+	} catch (std::exception &exc) {
+		file.close();
+		return "";
+	}
 	return content;
 }
 =

@@ -224,11 +242,17 @@ string read_sysfs_string(const char *format, const ch=
ar *param)
 	file.open(filename, ios::in);
 	if (!file)
 		return "";
-	file.getline(content, 4096);
-	file.close();
-	c =3D strchr(content, '\n');
-	if (c)
-		*c =3D 0;
+	try
+	{
+		file.getline(content, 4096);
+		file.close();
+		c =3D strchr(content, '\n');
+		if (c)
+			*c =3D 0;
+	} catch (std::exception &exc) {
+		file.close();
+		return "";
+	}
 	return content;
 }
 =



--===============4954405129536238886==--

