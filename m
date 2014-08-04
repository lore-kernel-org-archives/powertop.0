Content-Type: multipart/mixed; boundary="===============7945379463413799579=="
MIME-Version: 1.0
From: Mohammad Merajul Islam Molla <meraj.enigma at gmail.com>
Subject: [Powertop] [PATCH] powertop: remove temporary file
Date: Mon, 04 Aug 2014 19:52:04 +0600
Message-ID: <1407160324-4924-1-git-send-email-meraj.enigma@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7945379463413799579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

powertop creates temporary file in /tmp directory during calibration. Simply
closing the file does not remove it. Using unlink(), instead of close() to
remove temporary file.

Signed-off-by: Mohammad Merajul Islam Molla <meraj.enigma(a)gmail.com>
---
 src/calibrate/calibrate.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index a9a0a7c..98abfe9 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -244,7 +244,7 @@ static void *burn_disk(void *dummy)
 			printf("Error: %s\n", strerror(errno));
 		fdatasync(fd);
 	}
-	close(fd);
+	unlink(filename);
 	return NULL;
 }
 =

-- =

1.9.1


--===============7945379463413799579==--

