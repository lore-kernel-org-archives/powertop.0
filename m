Content-Type: multipart/mixed; boundary="===============6334840591929531399=="
MIME-Version: 1.0
From: Zhaoyang Huang <zhaoyang.huang at linaro.org>
Subject: [Powertop] (no subject)
Date: Wed, 01 Jul 2015 19:31:56 +0800
Message-ID: <1435750316-9488-1-git-send-email-zhaoyang.huang@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6334840591929531399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>From 761b5c604568ef9b5db4eb3d73ba3053ef3f6d17 Mon Sep 17 00:00:00 2001
From: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
Date: Wed, 1 Jul 2015 15:22:01 +0800
Subject: [PATCH 1/2] prevent segment fault for android built 2
Hi powertop guys,
The bellowing patch is generated as the buffer within the function will
turn to be null in Android enviroment. I think maybe the reason should be
related to bionic libc.

the buffer will be turn into NULL after invoking the mbsrtowcs function
of bionic libc. Add a condition judgement for that

Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
---
 src/lib.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/lib.cpp b/src/lib.cpp
index 88fe5f3..8d1ca9f 100644
--- a/src/lib.cpp
+++ b/src/lib.cpp
@@ -285,7 +285,7 @@ void align_string(char *buffer, size_t min_sz, size_t m=
ax_sz)
 	/* start with mbsrtowcs() local mbstate_t * and
 	 * NULL dst pointer*/
 	sz =3D mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);
-	if (sz =3D=3D (size_t)-1) {
+	if ((sz =3D=3D (size_t)-1) && (NULL !=3D buffer)) {
 		buffer[min_sz] =3D 0x00;
 		return;
 	}
-- =

1.7.9.5


--===============6334840591929531399==--

