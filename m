Content-Type: multipart/mixed; boundary="===============4995658596952666853=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v2 10/14] make --quiet option to suppress various
 info messages
Date: Sun, 09 Nov 2014 13:14:27 +0000
Message-ID: <1415538871-11411-11-git-send-email-sami.kerola@lastminute.com>
In-Reply-To: 1415538871-11411-1-git-send-email-sami.kerola@lastminute.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4995658596952666853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sami Kerola <kerolasa(a)iki.fi>

When --quiet is defined messages such as'RAPL device for cpu 0' and
'Leaving PowerTOP' are not expected to be printed.  This change makes
them to be printed to stderr, that the --quiet is redirecting to
/dev/null.

Signed-off-by: Sami Kerola <kerolasa(a)iki.fi>
---
 src/cpu/rapl/rapl_interface.cpp | 5 ++---
 src/main.cpp                    | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/src/cpu/rapl/rapl_interface.cpp b/src/cpu/rapl/rapl_interface.=
cpp
index 2fc55b1..d6bd4c8 100644
--- a/src/cpu/rapl/rapl_interface.cpp
+++ b/src/cpu/rapl/rapl_interface.cpp
@@ -39,7 +39,7 @@
 #define RAPL_DBG_PRINT(...)	((void) 0)
 #define RAPL_ERROR_PRINT(...) ((void) 0)
 #endif
-#define RAPL_INFO_PRINT printf
+#define RAPL_INFO_PRINT(format, m) fprintf(stderr, format, m)
 =

 #define MAX_TEMP_STR_SIZE	20
 =

@@ -134,8 +134,7 @@ c_rapl_interface::c_rapl_interface(const char *dev_name=
, int cpu) :
 			closedir(dir);
 		}
 =

-		RAPL_INFO_PRINT("RAPL Using PowerCap Sysfs : Domain Mask %x\n",
-														rapl_domains);
+		RAPL_INFO_PRINT("RAPL Using PowerCap Sysfs : Domain Mask %x\n", rapl_dom=
ains);
 		return;
 	}
 =

diff --git a/src/main.cpp b/src/main.cpp
index 23725d1..9028acc 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -503,7 +503,7 @@ int main(int argc, char **argv)
 	}
 	if (!auto_tune)
 		endwin();
-	printf("%s\n", _("Leaving PowerTOP"));
+	fprintf(stderr, "%s\n", _("Leaving PowerTOP"));
 =

 	end_process_data();
 	clear_process_data();
-- =

2.1.3


--===============4995658596952666853==--

