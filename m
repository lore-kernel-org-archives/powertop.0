Content-Type: multipart/mixed; boundary="===============2130314664193333038=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH 10/10] Fixed cpu_core::has_c1_res initialization
Date: Mon, 14 Oct 2013 11:40:57 +0300
Message-ID: <1381740057-12499-11-git-send-email-sergey.senozhatsky@gmail.com>
In-Reply-To: 1381740057-12499-1-git-send-email-sergey.senozhatsky@gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2130314664193333038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: David Rosca <nowrep(a)gmail.com>

cpu_core::has_c1_res is left uninitialized for anything other than BYT-M,
resulting in error at startup:
	 read_msr cpu0 0x660 : Argument list too long.

Signed-off-by: David Rosca <nowrep(a)gmail.com>
---
 src/cpu/intel_cpus.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 3348dba..194dc75 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
 	if (model =3D=3D 0x37) {
 		has_c3_res =3D 0;
 		has_c1_res =3D 1;
-	} else
+	} else {
 		has_c3_res =3D 1;
+		has_c1_res =3D 0;
+	}
 }
 =

 void nhm_core::measurement_start(void)
-- =

1.8.4.679.g0a1a803


--===============2130314664193333038==--

