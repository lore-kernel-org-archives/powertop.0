Content-Type: multipart/mixed; boundary="===============2934631926206019180=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH 2/2] stdbool.h is not needed in C++
Date: Sat, 26 May 2012 06:34:19 +0200
Message-ID: <1338014363.2512.1.camel@sara>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2934631926206019180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/lib.cpp |    1 -
 1 file changed, 1 deletion(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 33f835f..ad24eac 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -32,7 +32,6 @@
 #include <string>
 #include <ctype.h>
 #include <stdio.h>
-#include <stdbool.h>
 #include <math.h>
 #include <stdlib.h>
 =

-- =

1.7.10


--===============2934631926206019180==--

