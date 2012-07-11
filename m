Content-Type: multipart/mixed; boundary="===============6052217743875255670=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Wrong common field name in GFX Wakeups event
Date: Wed, 11 Jul 2012 10:15:40 +0400
Message-ID: <4FFD1A0C.90704@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6052217743875255670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

I have found that PowerTOP doesn't displays values in "GFX Wakeups/s" colum=
n.
It is because of wrong event field name the handle_trace_point() method
expects to find in a trace event.

Here is the patch:
--8<--Cut-here-------------------------------------------------------------=
---
diff -purN powertop/src/process/do_process.cpp powertop-new/src/process/do_=
process.cpp
--- powertop/src/process/do_process.cpp	2012-07-05 13:06:16.080258858 +0400
+++ powertop-new/src/process/do_process.cpp	2012-07-06 13:31:14.382651388 +=
0400
@@ -340,7 +340,7 @@ void perf_process_bundle::handle_trace_p
  		int flags;
  		int pid;

-		ret =3D pevent_get_common_field_val(NULL, event, "flags",&rec,&val, 0);
+		ret =3D pevent_get_common_field_val(NULL, event, "common_flags",&rec,&va=
l, 0);
  		if (ret<  0)
  			return;
  		flags =3D (int)val;
@@ -625,7 +625,7 @@ void perf_process_bundle::handle_trace_p
  		class power_consumer *consumer =3D NULL;
  		int flags;

-		ret =3D pevent_get_common_field_val(NULL, event, "flags",&rec,&val, 0);
+		ret =3D pevent_get_common_field_val(NULL, event, "common_flags",&rec,&va=
l, 0);
  		if (ret<  0)
  			return;
  		flags =3D (int)val;
--8<-----------------------------------------------------------------------=
---

Thank you.

-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============6052217743875255670==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="05-powertop-fix03.diff"

ZGlmZiAtcHVyTiBwb3dlcnRvcC9zcmMvcHJvY2Vzcy9kb19wcm9jZXNzLmNwcCBwb3dlcnRvcC1u
ZXcvc3JjL3Byb2Nlc3MvZG9fcHJvY2Vzcy5jcHAKLS0tIHBvd2VydG9wL3NyYy9wcm9jZXNzL2Rv
X3Byb2Nlc3MuY3BwCTIwMTItMDctMDUgMTM6MDY6MTYuMDgwMjU4ODU4ICswNDAwCisrKyBwb3dl
cnRvcC1uZXcvc3JjL3Byb2Nlc3MvZG9fcHJvY2Vzcy5jcHAJMjAxMi0wNy0wNiAxMzozMToxNC4z
ODI2NTEzODggKzA0MDAKQEAgLTM0MCw3ICszNDAsNyBAQCB2b2lkIHBlcmZfcHJvY2Vzc19idW5k
bGU6OmhhbmRsZV90cmFjZV9wCiAJCWludCBmbGFnczsKIAkJaW50IHBpZDsKIAotCQlyZXQgPSBw
ZXZlbnRfZ2V0X2NvbW1vbl9maWVsZF92YWwoTlVMTCwgZXZlbnQsICJmbGFncyIsICZyZWMsICZ2
YWwsIDApOworCQlyZXQgPSBwZXZlbnRfZ2V0X2NvbW1vbl9maWVsZF92YWwoTlVMTCwgZXZlbnQs
ICJjb21tb25fZmxhZ3MiLCAmcmVjLCAmdmFsLCAwKTsKIAkJaWYgKHJldCA8IDApCiAJCQlyZXR1
cm47CiAJCWZsYWdzID0gKGludCl2YWw7CkBAIC02MjUsNyArNjI1LDcgQEAgdm9pZCBwZXJmX3By
b2Nlc3NfYnVuZGxlOjpoYW5kbGVfdHJhY2VfcAogCQljbGFzcyBwb3dlcl9jb25zdW1lciAqY29u
c3VtZXIgPSBOVUxMOwogCQlpbnQgZmxhZ3M7CiAKLQkJcmV0ID0gcGV2ZW50X2dldF9jb21tb25f
ZmllbGRfdmFsKE5VTEwsIGV2ZW50LCAiZmxhZ3MiLCAmcmVjLCAmdmFsLCAwKTsKKwkJcmV0ID0g
cGV2ZW50X2dldF9jb21tb25fZmllbGRfdmFsKE5VTEwsIGV2ZW50LCAiY29tbW9uX2ZsYWdzIiwg
JnJlYywgJnZhbCwgMCk7CiAJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJuOwogCQlmbGFncyA9IChp
bnQpdmFsOwo=

--===============6052217743875255670==--

