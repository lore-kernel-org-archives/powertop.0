Content-Type: multipart/mixed; boundary="===============0471486546060584058=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 1/3] Suppress compiler warnings on write()
Date: Tue, 04 Dec 2012 00:13:18 +0900
Message-ID: <1354547600-1743-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0471486546060584058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Modern linux distribution forces to check result of write() call.
It emits following warnings:

  CXX    calibrate/powertop-calibrate.o
calibrate/calibrate.cpp: In function =E2=80=98void* burn_disk(void*)=E2=80=
=99:
calibrate/calibrate.cpp:297: warning: ignoring return value of =E2=80=98ssi=
ze_t write(int, const void*, size_t)=E2=80=99, declared with attribute warn=
_unused_result
...
  CXX    measurement/powertop-extech.o
measurement/extech.cpp: In member function =E2=80=98void extech_power_meter=
::measure()=E2=80=99:
measurement/extech.cpp:290: warning: ignoring return value of =E2=80=98ssiz=
e_t write(int, const void*, size_t)=E2=80=99, declared with attribute warn_=
unused_result

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/calibrate/calibrate.cpp |    3 ++-
 src/measurement/extech.cpp  |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/calibrate/calibrate.cpp b/src/calibrate/calibrate.cpp
index 5457cf8..2d4c1af 100644
--- a/src/calibrate/calibrate.cpp
+++ b/src/calibrate/calibrate.cpp
@@ -294,7 +294,8 @@ static void *burn_disk(void *dummy)
 =

 	while (!stop_measurement) {
 		lseek(fd, 0, SEEK_SET);
-		write(fd, buffer, 64*1024);
+		if (write(fd, buffer, 64*1024))
+			/* make gcc silent */;
 		fdatasync(fd);
 	}
 	close(fd);
diff --git a/src/measurement/extech.cpp b/src/measurement/extech.cpp
index 4e8bf8a..b9e95ca 100644
--- a/src/measurement/extech.cpp
+++ b/src/measurement/extech.cpp
@@ -287,7 +287,8 @@ extech_power_meter::extech_power_meter(const char *exte=
ch_name)
 void extech_power_meter::measure(void)
 {
 	/* trigger the extech to send data */
-	write(fd, " ", 1);
+	if (write(fd, " ", 1) < 0)
+		return;
 =

 	rate =3D extech_read(fd);
 =

-- =

1.7.9.2


--===============0471486546060584058==--

