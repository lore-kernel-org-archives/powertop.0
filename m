Content-Type: multipart/mixed; boundary="===============4511910295700144086=="
MIME-Version: 1.0
From: Gautam Paranjape <gautam.paranjape at intel.com>
Subject: [Powertop] [PATCH] Modify how line_levels are assigned so c-states
 don't overwrite other c-states
Date: Thu, 20 Jul 2017 14:25:05 -0700
Message-ID: <20170720212505.29922-1-gautam.paranjape@intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4511910295700144086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some c-states exposed by the intel_idle driver are assigned the same
line_level, which means that the most recent one assigned can overwrite
another c-state. For example, the C1-SKL c-state is overwritten by the
C1E-SKL c-state because both have a "1" in the name and are assigned the
same line level. To fix this, check if a "sub c-state" (ex. C1E-SKL) is
being inserted. If so, check the vector of c-states if a c-state with
similar name (ex. C1-SKL) exists, and increment the line level.

Signed-off-by: Gautam Paranjape <gautam.paranjape(a)intel.com>

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index bc323368b71f..c59721cb349a 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -218,6 +218,17 @@ void abstract_cpu::insert_cstate(const char *linux_nam=
e, const char *human_name,
 		}
 		if (*c >=3D '0' && *c <=3D'9') {
 			state->line_level =3D strtoull(c, NULL, 10);
+			if(*(c+1) !=3D '-'){
+				int greater_line_level =3D strtoull(c, NULL, 10);
+				for(unsigned int pos =3D 0; pos < cstates.size(); pos++){
+					if(*c =3D=3D cstates[pos]->human_name[1]){
+						if(*(c+1) !=3D cstates[pos]->human_name[2]){
+							greater_line_level =3D max(greater_line_level, cstates[pos]->line_l=
evel);
+							state->line_level =3D greater_line_level + 1;
+						}
+					}
+				}
+			}
 			break;
 		}
 		c++;
-- =

2.9.3


--===============4511910295700144086==--

