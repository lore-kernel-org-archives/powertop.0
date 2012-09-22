Content-Type: multipart/mixed; boundary="===============5598058750607580166=="
MIME-Version: 1.0
From: Colin King <colin.king at canonical.com>
Subject: [Powertop] [PATCH 3/4] process: do_process: Fix typo in
 handle_trace_point
Date: Sat, 22 Sep 2012 19:33:08 +0100
Message-ID: <1348338789-16252-4-git-send-email-colin.king@canonical.com>
In-Reply-To: 1348338789-16252-1-git-send-email-colin.king@canonical.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5598058750607580166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Colin Ian King <colin.king(a)canonical.com>

fucntion =3D=3D> function

Signed-off-by: Colin Ian King <colin.king(a)canonical.com>
---
 src/process/do_process.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/process/do_process.cpp b/src/process/do_process.cpp
index eaef7f1..238ae59 100644
--- a/src/process/do_process.cpp
+++ b/src/process/do_process.cpp
@@ -451,7 +451,7 @@ void perf_process_bundle::handle_trace_point(void *trac=
e, int cpu, uint64_t time
 =

 		ret =3D pevent_get_field_val(NULL, event, "function", &rec, &val, 0);
 		if (ret < 0) {
-			fprintf(stderr, "timer_expire_entry event returned no fucntion value?\n=
");
+			fprintf(stderr, "timer_expire_entry event returned no function value?\n=
");
 			return;
 		}
 		function =3D (uint64_t)val;
-- =

1.7.10.4


--===============5598058750607580166==--

