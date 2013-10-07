Content-Type: multipart/mixed; boundary="===============1646035542378926840=="
MIME-Version: 1.0
From: Shaojie Sun <shaojie.sun at linaro.org>
Subject: [Powertop] [PATCH POWERTOP V3] resolve the bug that powertop doesn't
 show correct frequency stats
Date: Mon, 07 Oct 2013 17:26:44 +0800
Message-ID: <1381138004-17468-1-git-send-email-shaojie.sun@linaro.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1646035542378926840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jon Medhurst <tixy(a)linaro.org>

For cpu_frequency events, perf_power_bundle::handle_trace_point()
is always being called with the same cpunr. so the parameter of
cpunr is not equal to the cpu which cpu_frequency events happened.
Lucky the trace event themselves have a cpu_id field to say to which
CPU event it relates, we should use this cpu_id field.

Signed-off-by:  Jon Medhurst <tixy(a)linaro.org>
		Shaojie Sun <shaojie.sun(a)linaro.com>
---
 src/cpu/cpu.cpp |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/cpu/cpu.cpp b/src/cpu/cpu.cpp
index 7f3af69..e304bbe 100644
--- a/src/cpu/cpu.cpp
+++ b/src/cpu/cpu.cpp
@@ -781,10 +781,15 @@ void perf_power_bundle::handle_trace_point(void *trac=
e, int cpunr, uint64_t time
 =

 	if (strcmp(event->name, "power_frequency") =3D=3D 0
 	|| strcmp(event->name, "cpu_frequency") =3D=3D 0){
-
+		ret =3D pevent_get_field_val(NULL, event, "cpu_id", &rec, &val, 0);
+		if (ret < 0) {
+			fprintf(stderr, _("power or cpu_frequency event returned no cpu?\n"));
+			exit(-1);
+		}
+		cpu =3D all_cpus[val];
 		ret =3D pevent_get_field_val(NULL, event, "state", &rec, &val, 0);
 		if (ret < 0) {
-			fprintf(stderr, _("power or cpu_frequecny event returned no state?\n"));
+			fprintf(stderr, _("power or cpu_frequency event returned no state?\n"));
 			exit(-1);
 		}
 =

-- =

1.7.9.5


--===============1646035542378926840==--

