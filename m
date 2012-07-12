Content-Type: multipart/mixed; boundary="===============2432761099670070559=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: [Powertop] [PATCH] Fix handling of /proc/cpuinfo for non x86
 architectures
Date: Thu, 12 Jul 2012 22:37:47 +0200
Message-ID: <1342125467-23241-1-git-send-email-sw@weilnetz.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2432761099670070559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not all architectures include lines with "vendor_id\t" or
"processor\t". ARM Linux without SMP support includes
neither of these two entries. With SMP support, there are
"processor\t" entries for each CPU.

Set vendor to an empty string initially, so there is a default value.

Assume CPU id 0 when no number was set while encountering the first
"bogomips\t" line. If there are more such lines without a correct
number, only the first CPU is handled. This should not be needed
for ARM, but makes the code more robust because it avoids calling
handle_one_cpu twice with number =3D=3D 0.

Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
---

This patch is based on my previous patch (which fixed the crash on ARM).
The final result was tested on a Raspberry PI ARM.

- sw

 src/cpu/cpu.cpp |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index d08bdcd..13015bd 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -233,6 +233,9 @@ void enumerate_cpus(void)
 	if (!file)
 		return;
 =

+	/* Not all /proc/cpuinfo include "vendor_id\t". */
+	vendor[0] =3D '\0';
+
 	while (file) {
 =

 		file.getline(line, sizeof(line));
@@ -271,10 +274,14 @@ void enumerate_cpus(void)
 			}
 		}
 		if (strncasecmp(line, "bogomips\t", 9) =3D=3D 0) {
+			if (number =3D=3D -1) {
+				/* Not all /proc/cpuinfo include "processor\t". */
+				number =3D 0;
+			}
 			if (number >=3D 0) {
 				handle_one_cpu(number, vendor, family, model);
 				set_max_cpu(number);
-				number =3D -1;
+				number =3D -2;
 			}
 		}
 	}
-- =

1.7.10


--===============2432761099670070559==--

