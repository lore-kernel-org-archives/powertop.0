Content-Type: multipart/mixed; boundary="===============1918160746434602943=="
MIME-Version: 1.0
From: Daniel Leung <daniel.leung at linux.intel.com>
Subject: [Powertop] [PATCH 1/1] Baytrail does not have core C7 MSR to read
Date: Wed, 25 Feb 2015 16:36:45 -0800
Message-ID: <1424911005-9961-1-git-send-email-daniel.leung@linux.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1918160746434602943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So do not acquire core C7 from MSR, or else it fails
and stops the program.

Reported-by: Eoff, Ullysses A <ullysses.a.eoff(a)intel.com>
Signed-off-by: Daniel Leung <daniel.leung(a)linux.intel.com>
---
 src/cpu/intel_cpus.cpp | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 167f1a7..e019484 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -131,11 +131,6 @@ nhm_core::nhm_core(int model)
 	if (model =3D=3D 0x37) {
 		has_c3_res =3D 0;
 		has_c1_res =3D 1;
-		this->byt_has_ahci();
-                if ((this->get_byt_ahci_support()) =3D=3D 0)
-                        has_c7_res =3D 1;/*BYT-T PC7 <- S0iX*/
-                else
-                        has_c7_res =3D 0;
 	} else {
 		has_c3_res =3D 1;
 		has_c1_res =3D 0;
-- =

1.8.3.2


--===============1918160746434602943==--

