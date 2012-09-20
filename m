Content-Type: multipart/mixed; boundary="===============9167177702072817363=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH] cpu: Fix abstract_cpu::calculate_freq
Date: Thu, 20 Sep 2012 23:33:19 +0900
Message-ID: <1348151599-2740-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============9167177702072817363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The 'freq' should have the maximun frequency value of all children.
But the current code does not update the freq properly.  Fix it.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index 386d981..de55cf2 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -341,7 +341,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
 				is_idle =3D false;
 			}
 			if (f > freq)
-				f =3D freq;
+				freq =3D f;
 		}
 =

 	current_frequency =3D freq;
-- =

1.7.9.2


--===============9167177702072817363==--

