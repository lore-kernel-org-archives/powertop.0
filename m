Content-Type: multipart/mixed; boundary="===============5206031635401647050=="
MIME-Version: 1.0
From: Stefan Weil <sw at weilnetz.de>
Subject: [Powertop] [PATCH] Fix gcc compiler warning on 32 bit hosts
Date: Thu, 12 Jul 2012 22:53:21 +0200
Message-ID: <1342126401-26411-1-git-send-email-sw@weilnetz.de>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5206031635401647050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Pointers must only be casted to intptr_t or uintptr_t.
Both types are defined in stdint.h.

Signed-off-by: Stefan Weil <sw(a)weilnetz.de>
---
 pevent/parse-filter.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pevent/parse-filter.c b/pevent/parse-filter.c
index 0ce0122..3d2288b 100644
--- a/pevent/parse-filter.c
+++ b/pevent/parse-filter.c
@@ -22,6 +22,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
  */
 #include <stdio.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdarg.h>
@@ -1588,7 +1589,7 @@ get_value(struct event_format *event,
 		const char *name;
 =

 		name =3D get_comm(event, record);
-		return (unsigned long long)name;
+		return (uintptr_t)name;
 	}
 =

 	pevent_read_number_field(field, record->data, &val);
-- =

1.7.10


--===============5206031635401647050==--

