Content-Type: multipart/mixed; boundary="===============8098509580419609302=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 19:26:29 +0900
Message-ID: <20140707102629.GA1135@swordfish>
In-Reply-To: 53BA5898.7050709@nfon.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8098509580419609302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/07/14 10:21), Valentin Hoebel wrote:
> Hi,
> =

> as you already guessed Debian still uses a 2.0 version.
> However, I git cloned 2.6.1 and the "head" versions from GitHub, built th=
em
> both and tried them - still the same result.
> =

> Is it known if this particular CPU model does not support reading out the
> CPU frequency values or could this be another problem?

hm... a *wild* guess. can you check what cpu model is getting passed to
nhm_core::nhm_core(int model)? the problem might be (or might be not) that =
we
don't set any of C-state flags. if none of C-states set, then no MSR work is
getting done, and hence nothing is reported back. (yeah... we could check
documentation, search the web, etc. but let's do it the lazy way).


something like this


NOTE:
NOT TESTED, NOT EVEN COMPILE-TESTED. NOT A PATCH, NOT A FIX.
FOR TESTING PURPOSE ONLY.

---

 src/cpu/intel_cpus.cpp | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index e3cdaf2..ae083cf 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -64,10 +64,13 @@ int is_supported_intel_cpu(int model)
 {
 	int i;
 =

+	fprintf(stderr, "check cpu model 0x%X\n", model);
+
 	for (i =3D 0; intel_cpu_models[i] !=3D 0; i++)
 		if (model =3D=3D intel_cpu_models[i])
 			return 1;
 =

+	printf(stderr, "ERROR: not supported\n");
 	return 0;
 }
 =

@@ -91,6 +94,8 @@ nhm_core::nhm_core(int model)
 {
 	has_c2c7_res =3D 0;
 =

+	fprintf(stderr, "nhm_core model: 0x%X\n", model);
+
 	switch(model) {
 		case 0x2A:	/* SNB */
 		case 0x2D:	/* SNB Xeon */
@@ -260,6 +265,8 @@ nhm_package::nhm_package(int model)
 	has_c8c9c10_res =3D 0;
 	has_c2c7_res =3D 0;
 =

+	fprintf(stderr, "nhm_package model: 0x%X\n", model);
+
 	switch(model) {
 		case 0x2A:	/* SNB */
 		case 0x2D:	/* SNB Xeon */


--===============8098509580419609302==--

