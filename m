Content-Type: multipart/mixed; boundary="===============3483879338618520570=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: [Powertop] [PATCH -next] intel cpus: add proper C-states init
Date: Thu, 17 Oct 2013 23:37:51 +0300
Message-ID: <20131017203751.GA2280@swordfish>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3483879338618520570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

add missing has_c2c7_res init to nhm_core() .ctor and
has_c8c9c10_res/has_c2c7_res init to nhm_package() .ctor.

uninitialised has_c2c7_res/has_c8c9c10_res/has_c2c7_res
may be used in core/package measurement_start()/measurement_end().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky(a)gmail.com>

---

src/cpu/intel_cpus.cpp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 194dc75..ad80337 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -87,6 +87,8 @@ static uint64_t get_msr(int cpu, uint64_t offset)
 =

 nhm_core::nhm_core(int model)
 {
+	has_c2c7_res =3D 0;
+
 	switch(model) {
 		case 0x2A:	/* SNB */
 		case 0x2D:	/* SNB Xeon */
@@ -252,6 +254,9 @@ char * nhm_core::fill_pstate_line(int line_nr, char *bu=
ffer)
 =

 nhm_package::nhm_package(int model)
 {
+	has_c8c9c10_res =3D 0;
+	has_c2c7_res =3D 0;
+
 	switch(model) {
 		case 0x2A:	/* SNB */
 		case 0x2D:	/* SNB Xeon */
@@ -269,7 +274,6 @@ nhm_package::nhm_package(int model)
 	else
 		has_c3_res =3D 1;
 =

-
 	/* Haswell-ULT has C8/9/10*/
 	if (model =3D=3D 0x45)
 		has_c8c9c10_res =3D 1;


--===============3483879338618520570==--

