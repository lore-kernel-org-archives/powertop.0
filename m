Content-Type: multipart/mixed; boundary="===============3682940782231420845=="
MIME-Version: 1.0
From: Tyler Hall <tylerwhall at gmail.com>
Subject: [Powertop] [PATCH] cpu: prevent buffer overflow in cstate name
Date: Tue, 21 Apr 2015 18:03:51 -0400
Message-ID: <1429653831-6491-1-git-send-email-tylerwhall@gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3682940782231420845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

strcpy to a fixed-length field should have bounds checking. ARM
platforms may have longer names for these states than the 16 byte
buffer. Currently powertop crashes on the Marvell MVEBU platform with
cpuidle enabled.

On this platform, the "linux_name" is
"MV CPU DEEP IDLECPU and L2 Fabric power down"

Use snprintf instead of strncpy so the buffer is always null-terminated.

Signed-off-by: Tyler Hall <tylerwhall(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index a3a9ffa..18d3ec1 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -204,8 +204,8 @@ void abstract_cpu::insert_cstate(const char *linux_name=
, const char *human_name,
 =

 	cstates.push_back(state);
 =

-	strcpy(state->linux_name, linux_name);
-	strcpy(state->human_name, human_name);
+	snprintf(state->linux_name, sizeof(state->linux_name), "%s", linux_name);
+	snprintf(state->human_name, sizeof(state->human_name), "%s", human_name);
 =

 	state->line_level =3D -1;
 =

-- =

2.3.5


--===============3682940782231420845==--

