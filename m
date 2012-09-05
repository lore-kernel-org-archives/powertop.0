Content-Type: multipart/mixed; boundary="===============0702551150736041937=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH] Fix timer and work perf events timestamp tracing
Date: Wed, 05 Sep 2012 15:52:34 +0530
Message-ID: <1346840555-18457-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0702551150736041937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Incorrect timer and work perf events timestamp tracing is one
of the reason for reporting usage over 100%. This patch will
resolve the issue by
- rejecting the events for which entry timestamp is not recorded.
Currently these events exit timestamp itself is considered as
usage period resulting in over 100% usage.
- clearing event timestamps from global map at the end of each
measurement to avoid collision with earlier recorded timestamps.

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/process/timer.cpp | 5 ++++-
 src/process/work.cpp  | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/src/process/timer.cpp b/src/process/timer.cpp
index 8917490..db074c4 100644
--- a/src/process/timer.cpp
+++ b/src/process/timer.cpp
@@ -79,7 +79,8 @@ uint64_t timer::done(uint64_t time, uint64_t timer_struct)
 {
 	int64_t delta;
 =

-	if (running_since[timer_struct] > time)
+	if (running_since.find(timer_struct) =3D=3D running_since.end() ||
+			running_since[timer_struct] > time)
 		return 0;
 =

 	delta =3D time - running_since[timer_struct];
@@ -147,6 +148,8 @@ void clear_timers(void)
 		all_timers.erase(it);
 		it =3D all_timers.begin();
 	}
+
+	running_since.clear();
 }
 =

 bool timer::is_deferred(void)
diff --git a/src/process/work.cpp b/src/process/work.cpp
index 82f13a2..e436643 100644
--- a/src/process/work.cpp
+++ b/src/process/work.cpp
@@ -56,7 +56,8 @@ uint64_t work::done(uint64_t time, uint64_t work_struct)
 {
 	int64_t delta;
 =

-	if (running_since[work_struct] > time)
+	if (running_since.find(work_struct) =3D=3D running_since.end() ||
+			running_since[work_struct] > time)
 		return 0;
 =

 	delta =3D time - running_since[work_struct];
@@ -102,6 +103,8 @@ void clear_work(void)
 		all_work.erase(it);
 		it =3D all_work.begin();
 	}
+
+	running_since.clear();
 }
 =

 =

-- =

1.7.11.3


--===============0702551150736041937==--

