Content-Type: multipart/mixed; boundary="===============3362271857307877015=="
MIME-Version: 1.0
From: Joe Konno <joe.konno at linux.intel.com>
Subject: [Powertop] [PATCH 1/1 v1] .gitignore: ignore vim swap, cscope, ctags
Date: Fri, 10 Jun 2016 08:27:00 -0700
Message-ID: <20160610152700.6825-2-joe.konno@linux.intel.com>
In-Reply-To: 20160610152700.6825-1-joe.konno@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3362271857307877015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Joe Konno <joe.konno(a)intel.com>

Signed-off-by: Joe Konno <joe.konno(a)intel.com>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index f879840d9057..de3c3b1670cf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,7 +9,9 @@
 *.powertop
 *~
 .deps
+.*.swp
 /po/*.gmo
+cscope.*
 Makefile
 Makefile.in
 =

@@ -84,3 +86,4 @@ Makefile.in
 /src/powertop
 /stamp-h1
 /stamp-po
+tags
-- =

2.8.3


--===============3362271857307877015==--

