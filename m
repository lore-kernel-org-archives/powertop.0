Content-Type: multipart/mixed; boundary="===============5482342426412460690=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Fix hrtimer event names
Date: Thu, 02 Aug 2012 18:50:43 +0400
Message-ID: <1343919043-12954-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5482342426412460690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix hrtimer event names by adding "timer:" prefix.
---
 src/process/do_process.cpp |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index 11e6680..2700230 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -663,8 +663,8 @@ void start_process_measurement(void)
 		perf_events->add_event("irq:softirq_exit");
 		perf_events->add_event("timer:timer_expire_entry");
 		perf_events->add_event("timer:timer_expire_exit");
-		perf_events->add_event("hrtimer_expire_entry");
-		perf_events->add_event("hrtimer_expire_exit");
+		perf_events->add_event("timer:hrtimer_expire_entry");
+		perf_events->add_event("timer:hrtimer_expire_exit");
 		if (!perf_events->add_event("power:cpu_idle")){
 			perf_events->add_event("power:power_start");
 			perf_events->add_event("power:power_end");
-- =

1.7.5.4


--===============5482342426412460690==--

