Content-Type: multipart/mixed; boundary="===============7686454462942605954=="
MIME-Version: 1.0
From: Rosen Penev <rosenp at gmail.com>
Subject: [Powertop] [PATCH] src/main: Add missing pthread header
Date: Thu, 28 Mar 2019 21:09:26 -0700
Message-ID: <20190329040926.18563-1-rosenp@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7686454462942605954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Otherwise compilation can fail with:

main.cpp: In function 'void one_measurement(int, int, char*)':
main.cpp:226:3: error: 'pthread_t' was not declared in this scope
   pthread_t thread =3D 0UL;
   ^~~~~~~~~
main.cpp:226:3: note: suggested alternative: 'pread'
   pthread_t thread =3D 0UL;
   ^~~~~~~~~
   pread

et al.

Signed-off-by: Rosen Penev <rosenp(a)gmail.com>
---
 src/main.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/main.cpp b/src/main.cpp
index cbb7a4e..75d4202 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -39,6 +39,7 @@
 #include <locale.h>
 #include <sys/resource.h>
 #include <limits.h>
+#include <pthread.h>
 =

 #include "cpu/cpu.h"
 #include "process/process.h"
-- =

2.17.1


--===============7686454462942605954==--

