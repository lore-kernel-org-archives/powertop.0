Content-Type: multipart/mixed; boundary="===============3159114360822989092=="
MIME-Version: 1.0
From: Sanjay Singh Rawat <sanjay.rawat at linaro.org>
Subject: [Powertop] [PATCH] enumerate cpu based on different string on ARM
Date: Wed, 04 Jun 2014 11:27:18 +0530
Message-ID: <1401861438-13612-1-git-send-email-sanjay.rawat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3159114360822989092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

bogomips is removed by timer-backed delay loop (commit 9fc2105a)
in ARM kernel. Using other suitable string to decide to enumerate each
cpu.

Signed-off-by: Sanjay Singh Rawat <sanjay.rawat(a)linaro.org>
---
 src/cpu/cpu.cpp |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index b3b6166..105c066 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -296,6 +296,18 @@ void enumerate_cpus(void)
 				number =3D -2;
 			}
 		}
+		/* bogomips is removed in ARM, using CPU revision to enumerate */
+		if (strncasecmp(line, "CPU revision\t", 13) =3D=3D 0) {
+			if (number =3D=3D -1) {
+				/* Not all /proc/cpuinfo include "processor\t". */
+				number =3D 0;
+			}
+			if (number >=3D 0) {
+				handle_one_cpu(number, vendor, family, model);
+				set_max_cpu(number);
+				number =3D -2;
+			}
+		}
 	}
 =

 =

-- =

1.7.10.4


--===============3159114360822989092==--

