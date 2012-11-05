Content-Type: multipart/mixed; boundary="===============1079293759138548712=="
MIME-Version: 1.0
From: Ivan Shapovalov <intelfx100 at gmail.com>
Subject: [Powertop] [RFC] [PATCH 11/11] Ignore non-P-state-enabled CPUs when
 calculating frequency.
Date: Mon, 05 Nov 2012 15:12:33 +0400
Message-ID: <1352113953-24687-12-git-send-email-intelfx100@gmail.com>
In-Reply-To: 1352113953-24687-1-git-send-email-intelfx100@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1079293759138548712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This fixes bogus reported CPU frequencies (actually, uninitialized
values from i965_core) when i965 monitoring is used.

Signed-off-by: Ivan Shapovalov <intelfx100(a)gmail.com>
---
 src/cpu/abstract_cpu.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index d64cb24..fea377b 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -380,7 +380,7 @@ void abstract_cpu::calculate_freq(uint64_t time)
 =

 	/* calculate the maximum frequency of all children */
 	for (i =3D 0; i < children.size(); i++)
-		if (children[i]) {
+		if (children[i] && children[i]->has_pstates()) {
 			uint64_t f =3D 0;
 			if (!children[i]->idle) {
 				f =3D children[i]->current_frequency;
-- =

1.8.0


--===============1079293759138548712==--

