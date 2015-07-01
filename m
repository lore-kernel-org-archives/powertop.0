Content-Type: multipart/mixed; boundary="===============4502527072412269478=="
MIME-Version: 1.0
From: Zhaoyang Huang <zhaoyang.huang at linaro.org>
Subject: [Powertop] [PATCH 2/2] comment process_cpu_data in the
 one_measurement() for it clears all pstat data
Date: Wed, 01 Jul 2015 19:34:40 +0800
Message-ID: <1435750481-9543-1-git-send-email-zhaoyang.huang@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4502527072412269478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

all children cpu's pstat data will be cleared in process_cpu_data,which
cause the pstat shows abnormal, we have to comment this line of code. Howev=
er,
it looks too rough.

Signed-off-by: Zhaoyang Huang <zhaoyang.huang(a)linaro.org>
---
 src/main.cpp |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/main.cpp b/src/main.cpp
index 1e56af1..9526084 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -221,7 +221,14 @@ void one_measurement(int seconds, char *workload)
 	devices_end_measurement();
 	end_power_measurement();
 =

+	/*
+	FIX ME:all children cpu's pstat data will be cleared in process_cpu_data,=
which
+	cause the pstat shows abnormal, we have to comment this line of code. How=
ever,
+	it looks to rough
+	*/
+	/*
 	process_cpu_data();
+	*/
 	process_process_data();
 =

 	/* output stats */
-- =

1.7.9.5


--===============4502527072412269478==--

