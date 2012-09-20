Content-Type: multipart/mixed; boundary="===============2272214020013777961=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] cpu: Fix typo on freq_class
Date: Fri, 21 Sep 2012 00:35:05 +0900
Message-ID: <1348155305-3313-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2272214020013777961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

s/cpu_even_req/cpu_even_freq/

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/cpu/cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index cc37748..96e3888 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -385,7 +385,7 @@ static const char *freq_class(int line)
 	if (line & 1) {
 		return "cpu_odd_freq";
 	}
-	return "cpu_even_req";
+	return "cpu_even_freq";
 }
 =

 static int has_state_level(class abstract_cpu *acpu, int state, int line)
-- =

1.7.9.2


--===============2272214020013777961==--

