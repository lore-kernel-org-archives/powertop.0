Content-Type: multipart/mixed; boundary="===============8201778534776810786=="
MIME-Version: 1.0
From: Rajagopal Venkat <rajagopal.venkat at linaro.org>
Subject: [Powertop] [PATCH] fix cpuidle state name parsing
Date: Sat, 23 Jun 2012 00:08:46 +0530
Message-ID: <1340390327-2836-1-git-send-email-rajagopal.venkat@linaro.org>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8201778534776810786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

parse cpuidle C state based on sysfs file entry(stateX)
instead of state name/description

Signed-off-by: Rajagopal Venkat <rajagopal.venkat(a)linaro.org>
---
 src/cpu/abstract_cpu.cpp |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index cd4eba0..72969fc 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -147,7 +147,7 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 	strcpy(state->linux_name, linux_name);
 	strcpy(state->human_name, human_name);
 =

-	c =3D human_name;
+	c =3D linux_name;
 	while (*c) {
 		if (strcmp(linux_name, "active")=3D=3D0) {
 			state->line_level =3D LEVEL_C0;
-- =

1.7.9.5


--===============8201778534776810786==--

