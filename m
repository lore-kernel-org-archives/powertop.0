Content-Type: multipart/mixed; boundary="===============1117335285963605175=="
MIME-Version: 1.0
From: Magnus Fromreide <magfr at lysator.liu.se>
Subject: [Powertop] [PATCH] Allow compilation with C++11
Date: Thu, 08 May 2014 08:45:48 +0200
Message-ID: <20140508064548.GA19338@sara.home>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1117335285963605175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In C++11 "string"Identifier is seen as a user-defined literal. Add a space =
to
make it clear that this isn't what is meant here.

Signed-off-by: Magnus Fromreide <magfr(a)lysator.liu.se>
---
 src/lib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/lib.h b/src/lib.h
index adcc4a2..1777a36 100644
--- a/src/lib.h
+++ b/src/lib.h
@@ -35,7 +35,7 @@
 =

 #define _(STRING)    gettext(STRING)
 =

-#define POWERTOP_VERSION "v"PACKAGE_VERSION
+#define POWERTOP_VERSION "v" PACKAGE_VERSION
 #define POWERTOP_SHORT_VERSION PACKAGE_VERSION
 =

 extern int is_turbo(uint64_t freq, uint64_t max, uint64_t maxmo);
-- =

2.0.0.rc0

--===============1117335285963605175==--

