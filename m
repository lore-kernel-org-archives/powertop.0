Content-Type: multipart/mixed; boundary="===============7696502687847612650=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] [PATCH] Add __NR_perf_event_open system call number for
 ARM platform
Date: Wed, 18 Jul 2012 18:52:32 +0400
Message-ID: <1342623152-30390-1-git-send-email-i.zhbanov@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7696502687847612650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add __NR_perf_event_open system call number for ARM platform.
---
 src/perf/perf_event.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/src/perf/perf_event.h b/src/perf/perf_event.h
index 01fd065..c2113eb 100644
--- a/src/perf/perf_event.h
+++ b/src/perf/perf_event.h
@@ -51,6 +51,9 @@
 #if __x86_64__
 #define __NR_perf_event_open	298
 #endif
+#if __arm__
+#define __NR_perf_event_open	364
+#endif
 #endif
 =

 =

-- =

1.7.5.4


--===============7696502687847612650==--

