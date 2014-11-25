Content-Type: multipart/mixed; boundary="===============2524865869798252181=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 04/15] csstoh.sh: check every single return value
Date: Tue, 25 Nov 2014 21:16:17 +0000
Message-ID: <1416950188-16616-5-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2524865869798252181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Earlier the script continued processing at errors.

$ ./csstoh.sh powertop.css /dev/full
./csstoh.sh: line 36: echo: write error: No space left on device
./csstoh.sh: line 37: echo: write error: No space left on device
[...]

Now the script will fail immediately when an error occurs.

$ ./csstoh.sh powertop.css /dev/full ; echo $?
cat: write error: No space left on device
1

As a minor improvement the script now writes errors to stderr rather than
stdout, that is more appropriate.

>From https://lists.01.org/pipermail/powertop/2014-November/001686.html

Removal of white space error.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/csstoh.sh | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/src/csstoh.sh b/src/csstoh.sh
index 9d4100b..3b46d85 100755
--- a/src/csstoh.sh
+++ b/src/csstoh.sh
@@ -18,27 +18,33 @@
 #
 # Written by Igor Zhbanov <i.zhbanov at samsung.com>
 =

-if [ $# -lt 2 ]; then
-	echo "Usage: csstoh.sh cssfile header.h"
+if [ $# -ne 2 ]; then
+	echo "Usage: csstoh.sh cssfile header.h" >&2
 	exit 1
 fi
-
-if [ ! -r $1 ]; then
-	echo "Can't find file $1"
-	exit 1
-fi
-
-if ! echo -n >$2; then
-	echo "Can't open file $2 for writing."
+if [ ! -f "$1" ]; then
+	echo "$1: no such file or directory" >&2
 	exit 1
 fi
+# redirect stdout to a file
+exec 1> "$2" || exit $?
 =

-echo "#ifndef __INCLUDE_GUARD_CCS_H" >> $2
-echo "#define __INCLUDE_GUARD_CCS_H" >> $2
-echo >> $2
-echo "const char css[] =3D " >> $2
+# header
+cat <<HERE || exit $?
+#ifndef __INCLUDE_GUARD_CCS_H
+#define __INCLUDE_GUARD_CCS_H
 =

-sed -r 's/^(.*)$/\t\"\1\\n\"/' $1 >> $2
+const char css[] =3D
+HERE
+# body
+sed -r 's/^(.*)$/\t\"\1\\n\"/' "$1" || exit $?
+# footer
+cat <<HERE || exit $?
+;
+#endif
+HERE
 =

-echo ";" >> $2
-echo "#endif" >> $2
+# close output file
+exec 1>&-
+# return status of output file write
+exit $?
-- =

2.1.3


--===============2524865869798252181==--

