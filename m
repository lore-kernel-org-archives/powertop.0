Content-Type: multipart/mixed; boundary="===============7826822377014430335=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky at gmail.com>
Subject: Re: [Powertop] Does PowerTop support MHz numbers for Intel Xeon L5410
 CPUs ?
Date: Mon, 07 Jul 2014 20:24:54 +0900
Message-ID: <20140707112453.GC1135@swordfish>
In-Reply-To: 53BA80F7.5050101@nfon.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7826822377014430335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (07/07/14 13:13), Valentin Hoebel wrote:
> Hi,
> =

> thanks a lot for your efforts, I appreciate it.
> My co-worker applied your patch and sent me the following output:
> =

>   --------------------------------------------------
> /   ./powertop -t 1 --csv
>                                             =E2=8F=8E
>

thanks! ok, so cpu model 0x17 is not listed as a supported one in
src/cpu/intel_cpus.cpp:intel_cpu_models[] to begin with, and no
C-states are initialized as a result. Let's wait for Intel devs
to add cpu/core/package models and corresponding C-states.

Alexandra, will you take care of this?

	-ss

> Loaded 0 prior measurements
> Cannot load from file /var/cache/powertop/saved_parameters.powertop
> check cpu model 0x17
> ERROR: not supported
> RAPL device for cpu 0
> RAPL device for cpu 0
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> check cpu model 0x17
> ERROR: not supported
> Cannot load from file /var/cache/powertop/saved_parameters.powertop
> Preparing to take measurements
>   unknown op '{'
> Taking 1 measurement(s) for a duration of 1 second(s) each.
> PowerTOP outputing using base filename powertop.csv
> =

> \ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
> =

> I hope this helps.
> =

> Best regards
> Valentin
> =

> =

> =

> Am 07.07.2014 12:28, schrieb Sergey Senozhatsky:
> >On (07/07/14 19:26), Sergey Senozhatsky wrote:
> >>On (07/07/14 10:21), Valentin Hoebel wrote:
> >>>Hi,
> >>>
> >>>as you already guessed Debian still uses a 2.0 version.
> >>>However, I git cloned 2.6.1 and the "head" versions from GitHub, built=
 them
> >>>both and tried them - still the same result.
> >>>
> >>>Is it known if this particular CPU model does not support reading out =
the
> >>>CPU frequency values or could this be another problem?
> >>
> >>hm... a *wild* guess. can you check what cpu model is getting passed to
> >>nhm_core::nhm_core(int model)? the problem might be (or might be not) t=
hat we
> >>don't set any of C-state flags. if none of C-states set, then no MSR wo=
rk is
> >>getting done, and hence nothing is reported back. (yeah... we could che=
ck
> >>documentation, search the web, etc. but let's do it the lazy way).
> >>
> >>
> >>something like this
> >>
> >
> >oh. the patch is against the current upstream (iow, git) powertop source=
 code.
> >
> >	-ss
> >
> >>NOTE:
> >>NOT TESTED, NOT EVEN COMPILE-TESTED. NOT A PATCH, NOT A FIX.
> >>FOR TESTING PURPOSE ONLY.
> >>
> >>---
> >>
> >>  src/cpu/intel_cpus.cpp | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >>diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
> >>index e3cdaf2..ae083cf 100644
> >>--- a/src/cpu/intel_cpus.cpp
> >>+++ b/src/cpu/intel_cpus.cpp
> >>@@ -64,10 +64,13 @@ int is_supported_intel_cpu(int model)
> >>  {
> >>  	int i;
> >>
> >>+	fprintf(stderr, "check cpu model 0x%X\n", model);
> >>+
> >>  	for (i =3D 0; intel_cpu_models[i] !=3D 0; i++)
> >>  		if (model =3D=3D intel_cpu_models[i])
> >>  			return 1;
> >>
> >>+	printf(stderr, "ERROR: not supported\n");
> >>  	return 0;
> >>  }
> >>
> >>@@ -91,6 +94,8 @@ nhm_core::nhm_core(int model)
> >>  {
> >>  	has_c2c7_res =3D 0;
> >>
> >>+	fprintf(stderr, "nhm_core model: 0x%X\n", model);
> >>+
> >>  	switch(model) {
> >>  		case 0x2A:	/* SNB */
> >>  		case 0x2D:	/* SNB Xeon */
> >>@@ -260,6 +265,8 @@ nhm_package::nhm_package(int model)
> >>  	has_c8c9c10_res =3D 0;
> >>  	has_c2c7_res =3D 0;
> >>
> >>+	fprintf(stderr, "nhm_package model: 0x%X\n", model);
> >>+
> >>  	switch(model) {
> >>  		case 0x2A:	/* SNB */
> >>  		case 0x2D:	/* SNB Xeon */
> >>
> =

> -- =

> Mit freundlichen Gr=C3=BC=C3=9Fen
> =

> Valentin H=C3=B6bel
> Cloud Architect
> =

> NFON AG
> Leonrodstra=C3=9Fe 68
> D-80636 M=C3=BCnchen
> =

> Telefon +49 89 45300-407
> valentin.hoebel(a)nfon.com
> www.nfon.com
> =

> Support-Hotline der NFON AG
> Telefon 0800 - 6366 555
> =

> Die gesetzlichen Pflichtangaben finden Sie unter
> https://www.nfon.net/pflichtangaben
>=20

--===============7826822377014430335==--

