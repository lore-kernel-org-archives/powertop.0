Content-Type: multipart/mixed; boundary="===============8244799779791537749=="
MIME-Version: 1.0
From: eSyr <evgsyr at gmail.com>
Subject: [Powertop] [PATCH] Adding PID to process description.
Date: Tue, 02 Aug 2016 06:39:31 +0300
Message-ID: <20160802033927.GA22138@obsidian>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8244799779791537749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently, multiple processes shown in overview and consumers list are
indistinguishable in case they have the same command line. This commit
prepends PID enclosed in square brackets to the beginning of description
line, similarly to the interrupt ID in interrupt description.

* src/process/process.cpp (process::process): printing PID to desc,
  adding process description after it.
---
 src/process/process.cpp |   17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/src/process/process.cpp b/src/process/process.cpp
index caeccec..e244c5d 100644
--- a/src/process/process.cpp
+++ b/src/process/process.cpp
@@ -89,6 +89,7 @@ process::process(const char *_comm, int _pid, int _tid) :=
 power_consumer()
 {
 	char line[4097];
 	ifstream file;
+	ssize_t pos;
 =

 	pt_strcpy(comm, _comm);
 	pid =3D _pid;
@@ -121,7 +122,15 @@ process::process(const char *_comm, int _pid, int _tid=
) : power_consumer()
 	if (strncmp(_comm, "kondemand/", 10) =3D=3D 0)
 		is_idle =3D 1;
 =

-	pt_strcpy(desc, comm);
+	pos =3D snprintf(desc, sizeof(desc), "[PID %d] ", pid);
+
+	if (pos < 0)
+		pos =3D 0;
+	if ((size_t)pos > sizeof(desc))
+		return;
+
+	strncpy(desc + pos, comm, sizeof(desc) - pos - 1);
+	desc[sizeof(desc) - 1] =3D '\0';
 =

 	sprintf(line, "/proc/%i/cmdline", _pid);
 	file.open(line, ios::binary);
@@ -131,11 +140,11 @@ process::process(const char *_comm, int _pid, int _ti=
d) : power_consumer()
 		file.close();
 		if (strlen(line) < 1) {
 			is_kernel =3D 1;
-			snprintf(desc, sizeof(desc), "[%s]", comm);
+			snprintf(desc + pos, sizeof(desc) - pos, "[%s]", comm);
 		} else {
-			int sz =3D sizeof(desc) - 1;
+			int sz =3D sizeof(desc) - pos - 1;
 			cmdline_to_string(line);
-			strncpy(desc, line, sz);
+			strncpy(desc + pos, line, sz);
 			desc[sz] =3D 0x00;
 		}
 	}
-- =

1.7.10.4


--===============8244799779791537749==--

