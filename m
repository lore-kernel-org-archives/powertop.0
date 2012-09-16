Content-Type: multipart/mixed; boundary="===============0566355082889751475=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung at gmail.com>
Subject: [Powertop] [PATCH 1/2] perf: Pass 0 as a third argument to ioctl on
 perf_fd
Date: Sun, 16 Sep 2012 23:17:30 +0900
Message-ID: <1347805051-2889-1-git-send-email-namhyung@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0566355082889751475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The third argument of PERF_EVENT_IOC_{ENABLE,DISABLE} ioctl is a flag
to determine whether the command should be applied to group members.
Since the powertop doesn't use the event grouping feature, it'd better
passing 0 as a third argument explicitly.

Signed-off-by: Namhyung Kim <namhyung(a)gmail.com>
---
 src/perf/perf.cpp |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/perf/perf.cpp b/src/perf/perf.cpp
index 69f1da3..c8ba7a8 100644
--- a/src/perf/perf.cpp
+++ b/src/perf/perf.cpp
@@ -128,7 +128,7 @@ void perf_event::create_perf_event(char *eventname, int=
 _cpu)
 		return;
 	}
 =

-	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE);
+	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_ENABLE, 0);
 =

 	if (ret < 0) {
 		fprintf(stderr, "failed to enable perf \n");
@@ -210,7 +210,7 @@ void perf_event::start(void)
 void perf_event::stop(void)
 {
 	int ret;
-	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE);
+	ret =3D ioctl(perf_fd, PERF_EVENT_IOC_DISABLE, 0);
 	if (ret)
 		cout << "stop failing\n";
 }
-- =

1.7.9.2


--===============0566355082889751475==--

