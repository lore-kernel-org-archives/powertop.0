Content-Type: multipart/mixed; boundary="===============8015004851858732149=="
MIME-Version: 1.0
From: Daniel Leung <daniel.leung at linux.intel.com>
Subject: [Powertop] [PATCH 2/2] Fix segfault for Android
Date: Wed, 25 Feb 2015 16:38:25 -0800
Message-ID: <1424911105-10079-2-git-send-email-daniel.leung@linux.intel.com>
In-Reply-To: 1424911105-10079-1-git-send-email-daniel.leung@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8015004851858732149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The mbsrtowcs() in Android seems to change the content of
source pointer to 0x00. So save a copy of the source
string so we can manipulate it later, preventing segfaults.

Signed-off-by: Daniel Leung <daniel.leung(a)linux.intel.com>
---
 src/lib.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 0dec0b7..6b1bc0a 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -263,6 +263,7 @@ string read_sysfs_string(const char *format, const char=
 *param)
 void align_string(char *buffer, size_t min_sz, size_t max_sz)
 {
 	size_t sz;
+	char *buf =3D buffer;
 =

 	/** mbsrtowcs() allows NULL dst and zero sz,
 	 * comparing to mbstowcs(), which causes undefined
@@ -275,8 +276,9 @@ void align_string(char *buffer, size_t min_sz, size_t m=
ax_sz)
 		buffer[min_sz] =3D 0x00;
 		return;
 	}
+
 	while (sz < min_sz) {
-		strcat(buffer, " ");
+		strcat(buf, " ");
 		sz++;
 	}
 }
-- =

1.8.3.2


--===============8015004851858732149==--

