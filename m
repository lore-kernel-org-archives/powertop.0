Content-Type: multipart/mixed; boundary="===============7426662194465651065=="
MIME-Version: 1.0
From: Alexandra Yates <alexandra.yates at linux.intel.com>
Subject: [Powertop] [PATCH 3/3] fix-warnings: Ignoring return value
Date: Fri, 13 Jun 2014 15:18:29 -0700
Message-ID: <1402697910-29154-4-git-send-email-alexandra.yates@linux.intel.com>
In-Reply-To: 1402697910-29154-1-git-send-email-alexandra.yates@linux.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7426662194465651065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Added error handling to write() calls.

Signed-off-by: Alexandra Yates <alexandra.yates(a)linux.intel.com>
---
 src/measurement/extech.cpp |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/src/measurement/extech.cpp b/src/measurement/extech.cpp
index 4e8bf8a..e014a5d 100644
--- a/src/measurement/extech.cpp
+++ b/src/measurement/extech.cpp
@@ -287,13 +287,14 @@ extech_power_meter::extech_power_meter(const char *ex=
tech_name)
 void extech_power_meter::measure(void)
 {
 	/* trigger the extech to send data */
-	write(fd, " ", 1);
+	if(write(fd, " ", 1) =3D=3D -1)
+		 printf("Error: %s\n", strerror(errno));
 =

 	rate =3D extech_read(fd);
 =

 }
 =

-void extech_power_meter::sample(void) =

+void extech_power_meter::sample(void)
 {
 	ssize_t ret;
 	struct timespec tv;
@@ -306,16 +307,16 @@ void extech_power_meter::sample(void)
 		ret =3D write(fd, " ", 1);
 		if (ret < 0)
 			continue;
-		=

+
 		sum +=3D extech_read(fd);
 		samples++;
-	=

+
 	}
 }
 =

 extern "C"
 {
-	void* thread_proc(void *arg) =

+	void* thread_proc(void *arg)
 	{
 		class extech_power_meter *parent;
 		parent =3D (class extech_power_meter*)arg;
@@ -339,7 +340,7 @@ void extech_power_meter::start_measurement(void)
 {
 	end_thread =3D 0;
 	sum =3D samples =3D 0;
-	=

+
 	if (pthread_create(&thread, NULL, thread_proc, this))
 		fprintf(stderr, "ERROR: extech measurement thread creation failed\n");
 =

-- =

1.7.9.5


--===============7426662194465651065==--

