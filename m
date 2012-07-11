Content-Type: multipart/mixed; boundary="===============7114116058116685888=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] Display all P-states in HTML-report
Date: Wed, 11 Jul 2012 10:13:46 +0400
Message-ID: <4FFD199A.2020409@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7114116058116685888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

On Arm processors there are more than 10 P-states. On my device there are 12
p-states with different frequency. But PowerTOP displays only 10. And it
doesn't display states (11 and 12) where the phone spends most of the time.

I suppose that was because of console mode of PowerTOP, when there are limi=
ted
number of lines on the console. But in the case of HTML-report this should
not be a problem.

Here is the patch that counts the number of found P-states and displays all
of them.

--8<--Cut here-------------------------------------------------------------=
---
diff -purN -X dontdiff-powertop powertop-intel/config.h powertop/config.h
diff -purN -X dontdiff-powertop powertop-intel/src/cpu/cpu.cpp powertop/src=
/cpu/cpu.cpp
--- powertop-intel/src/cpu/cpu.cpp	2012-07-05 13:06:16.000000000 +0400
+++ powertop/src/cpu/cpu.cpp	2012-07-05 18:43:19.704809327 +0400
@@ -618,6 +618,11 @@ void report_display_cpu_pstates(void)
  	unsigned int package, core, cpu;
  	int line;
  	class abstract_cpu *_package, * _core, * _cpu;
+	unsigned int i, pstates_num;
+
+	for (i =3D 0, pstates_num =3D 0; i<  all_cpus.size(); i++)
+		if (all_cpus[i]&&  all_cpus[i]->pstates.size()>  pstates_num)
+			pstates_num =3D all_cpus[i]->pstates.size();

  	if ((!reportout.csv_report)&&(!reportout.http_report))
  		return;
@@ -644,7 +649,7 @@ void report_display_cpu_pstates(void)
  			if (!_core)
  				continue;

-			for (line =3D LEVEL_HEADER; line<  10; line++) {
+			for (line =3D LEVEL_HEADER; line<  (int)pstates_num; line++) {
  				int first =3D 1;

  				if (!_package->has_pstate_level(line))
--8<-----------------------------------------------------------------------=
---

The same issue may affect the function report_display_cpu_cstates()
but I'm not sure that CPUs with more than 10 C-states exists.

The same code is in the function impl_w_display_cpu_states(), but that
function is used in console mode only.

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


--===============7114116058116685888==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="04-powertop-fix02.diff"

ZGlmZiAtcHVyTiAtWCBkb250ZGlmZi1wb3dlcnRvcCBwb3dlcnRvcC1pbnRlbC9jb25maWcuaCBw
b3dlcnRvcC9jb25maWcuaApkaWZmIC1wdXJOIC1YIGRvbnRkaWZmLXBvd2VydG9wIHBvd2VydG9w
LWludGVsL3NyYy9jcHUvY3B1LmNwcCBwb3dlcnRvcC9zcmMvY3B1L2NwdS5jcHAKLS0tIHBvd2Vy
dG9wLWludGVsL3NyYy9jcHUvY3B1LmNwcAkyMDEyLTA3LTA1IDEzOjA2OjE2LjAwMDAwMDAwMCAr
MDQwMAorKysgcG93ZXJ0b3Avc3JjL2NwdS9jcHUuY3BwCTIwMTItMDctMDUgMTg6NDM6MTkuNzA0
ODA5MzI3ICswNDAwCkBAIC02MTgsNiArNjE4LDExIEBAIHZvaWQgcmVwb3J0X2Rpc3BsYXlfY3B1
X3BzdGF0ZXModm9pZCkKIAl1bnNpZ25lZCBpbnQgcGFja2FnZSwgY29yZSwgY3B1OwogCWludCBs
aW5lOwogCWNsYXNzIGFic3RyYWN0X2NwdSAqX3BhY2thZ2UsICogX2NvcmUsICogX2NwdTsKKwl1
bnNpZ25lZCBpbnQgaSwgcHN0YXRlc19udW07CisKKwlmb3IgKGkgPSAwLCBwc3RhdGVzX251bSA9
IDA7IGkgPCBhbGxfY3B1cy5zaXplKCk7IGkrKykKKwkJaWYgKGFsbF9jcHVzW2ldICYmIGFsbF9j
cHVzW2ldLT5wc3RhdGVzLnNpemUoKSA+IHBzdGF0ZXNfbnVtKQorCQkJcHN0YXRlc19udW0gPSBh
bGxfY3B1c1tpXS0+cHN0YXRlcy5zaXplKCk7CiAKIAlpZiAoKCFyZXBvcnRvdXQuY3N2X3JlcG9y
dCkmJighcmVwb3J0b3V0Lmh0dHBfcmVwb3J0KSkKIAkJcmV0dXJuOwpAQCAtNjQ0LDcgKzY0OSw3
IEBAIHZvaWQgcmVwb3J0X2Rpc3BsYXlfY3B1X3BzdGF0ZXModm9pZCkKIAkJCWlmICghX2NvcmUp
CiAJCQkJY29udGludWU7CiAKLQkJCWZvciAobGluZSA9IExFVkVMX0hFQURFUjsgbGluZSA8IDEw
OyBsaW5lKyspIHsKKwkJCWZvciAobGluZSA9IExFVkVMX0hFQURFUjsgbGluZSA8IChpbnQpcHN0
YXRlc19udW07IGxpbmUrKykgewogCQkJCWludCBmaXJzdCA9IDE7CiAKIAkJCQlpZiAoIV9wYWNr
YWdlLT5oYXNfcHN0YXRlX2xldmVsKGxpbmUpKQo=

--===============7114116058116685888==--

