Content-Type: multipart/mixed; boundary="===============6217303949771425499=="
MIME-Version: 1.0
From: Sami Kerola <kerolasa at iki.fi>
Subject: [Powertop] [PATCH v3 10/15] make --quiet option to suppress various
 info messages
Date: Tue, 25 Nov 2014 21:16:23 +0000
Message-ID: <1416950188-16616-11-git-send-email-kerolasa@iki.fi>
In-Reply-To: 1416950188-16616-1-git-send-email-kerolasa@iki.fi
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6217303949771425499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
index 6fdfd54..b6679f2 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -500,7 +500,7 @@ int main(int argc, char **argv)
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


--===============6217303949771425499==--

