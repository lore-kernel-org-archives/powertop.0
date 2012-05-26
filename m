Content-Type: multipart/mixed; boundary="===============4237443863432910089=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 1/2] Remove the unused stringless class
Date: Sat, 26 May 2012 06:26:24 +0200
Message-ID: <1338014310.2512.0.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4237443863432910089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/lib.cpp |    7 -------
 src/lib.h   |    6 ------
 2 files changed, 13 deletions(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 0c2c1f1..33f835f 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -158,13 +158,6 @@ void set_max_cpu(int cpu)
 }
 =

 =

-bool stringless::operator()(const char * const & lhs, const char * const &=
 rhs) const
-{
-	if (strcmp(lhs, rhs) < 0)
-		return true;
-	return false;
-}
-
 void write_sysfs(const string &filename, const string &value)
 {
 	ofstream file;
diff --git a/src/lib.h b/src/lib.h
index d555ebd..588c023 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -49,12 +49,6 @@ extern char *hz_to_human(unsigned long hz, char *buffer,=
 int digits =3D 2);
 =

 extern const char *kernel_function(uint64_t address);
 =

-class stringless
-{
-public:
-	bool operator()(const char * const & lhs, const char * const & rhs) const=
 ;
-};
-
 =

 =

 =

-- =

1.7.10


--===============4237443863432910089==--

