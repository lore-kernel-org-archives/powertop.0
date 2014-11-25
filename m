Content-Type: multipart/mixed; boundary="===============8604334683141352507=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 14/15] add missing include
Date: Tue, 25 Nov 2014 21:16:27 +0000
Message-ID: <1416950188-16616-15-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8604334683141352507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In file included from measurement/sysfs.cpp:27:
In file included from measurement/../lib.h:59:
In file included from /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.1/=
../../../../include/c++/4.9.1/string:52:
In file included from /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.1/=
../../../../include/c++/4.9.1/bits/basic_string.h:2850:
In file included from /usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.1/=
../../../../include/c++/4.9.1/ext/string_conversions.h:41:
/usr/bin/../lib64/gcc/x86_64-unknown-linux-gnu/4.9.1/../../../../include/c+=
+/4.9.1/cstdlib:153:11: error:
      no member named 'realloc' in the global namespace
  using ::realloc;
        ~~^

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/lib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/lib.h b/src/lib.h
index ec50946..5c94271 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -27,6 +27,7 @@
 =

 #include <libintl.h>
 #include <stdint.h>
+#include <stdlib.h>
 =

 /* Include only for Automake builds */
 #ifdef HAVE_CONFIG_H
-- =

2.1.3


--===============8604334683141352507==--

