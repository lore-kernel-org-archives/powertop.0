Content-Type: multipart/mixed; boundary="===============4402473728890713945=="
MIME-Version: 1.0
From: Kai-Heng Feng <kai.heng.feng at canonical.com>
Subject: [Powertop] [RESEND] [PATCH] Enable support for Intel ICL
Date: Fri, 21 Jun 2019 14:43:00 +0800
Message-ID: <20190621064300.4384-1-kai.heng.feng@canonical.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============4402473728890713945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This commit adds support for Intel ICL platforms

Signed-off-by: Kai-Heng Feng <kai.heng.feng(a)canonical.com>
---
 src/cpu/intel_cpus.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 0030dba..27c70fb 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -70,6 +70,7 @@ static int intel_cpu_models[] =3D {
 	0x5c,   /* BXT-P */
 	0x66,   /* CNL-U/Y */
 	0x7A,   /* GLK */
+	0x7E,   /* ICL */
 	0x8E,	/* KBL */
 	0x9E,	/* KBL */
 	0	/* last entry must be zero */
@@ -171,6 +172,7 @@ nhm_core::nhm_core(int model)
 		case 0x5c:      /* BXT-P */
 		case 0x66:	/* CNL-U/Y */
 		case 0x7A:	/* GLK */
+		case 0x7E:	/* ICL */
 		case 0x8E:	/* KBL */
 		case 0x9E:	/* KBL */
 			has_c7_res =3D 1;
@@ -353,6 +355,7 @@ nhm_package::nhm_package(int model)
 		case 0x5c:      /* BXT-P */
 		case 0x66:	/* CNL-U/Y */
 		case 0x7A:	/* GLK */
+		case 0x7E:	/* ICL */
 		case 0x8E:	/* KBL */
 		case 0x9E:	/* KBL */
 			has_c2c6_res=3D1;
@@ -387,6 +390,7 @@ nhm_package::nhm_package(int model)
 		case 0x5c:	/* BXT-P */ =

 		case 0x66:	/* CNL-U/Y */
 		case 0x7A:	/* GLK */
+		case 0x7E:	/* ICL */
 		case 0x8E:	/* KBL */
 		case 0x9E:	/* KBL */
 			has_c8c9c10_res =3D 1;
-- =

2.17.1


--===============4402473728890713945==--

