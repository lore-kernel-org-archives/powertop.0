Content-Type: multipart/mixed; boundary="===============8574741589021970811=="
MIME-Version: 1.0
From: David Rosca <nowrep at gmail.com>
Subject: [Powertop] [PATCH] Fixed cpu_core::has_c1_res initialization.
Date: Sun, 13 Oct 2013 12:45:05 +0200
Message-ID: <CAM7PDoj+Hskmnje+chjYn6jM2D_zwqhLx-7LcQ5NE2UP8wyexg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8574741589021970811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is regression from 8d6e716

cpu_core::has_c1_res is left uninitialized for anything other than BYT-M,
resulting in error at startup:

  unknown op '{'
                read_msr cpu0 0x660 : Argument list too long.


Signed-off-by: David Rosca <nowrep(a)gmail.com>

---
 src/cpu/intel_cpus.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/cpu/intel_cpus.cpp b/src/cpu/intel_cpus.cpp
index 3348dba..6330b6f 100644
--- a/src/cpu/intel_cpus.cpp
+++ b/src/cpu/intel_cpus.cpp
@@ -101,8 +101,10 @@ nhm_core::nhm_core(int model)
     if (model =3D=3D 0x37) {
         has_c3_res =3D 0;
         has_c1_res =3D 1;
-    } else
+    } else {
         has_c3_res =3D 1;
+                has_c1_res =3D 0;
+        }
 }

 void nhm_core::measurement_start(void)
--
1.8.4.rc3

--===============8574741589021970811==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhpcyBpcyByZWdyZXNzaW9uIGZyb20gOGQ2ZTcxNjxicj48YnI+Y3B1
X2NvcmU6Omhhc19jMV9yZXMgaXMgbGVmdCB1bmluaXRpYWxpemVkIGZvciBhbnl0aGluZyBvdGhl
ciB0aGFuIEJZVC1NLDxicj5yZXN1bHRpbmcgaW4gZXJyb3IgYXQgc3RhcnR1cDo8YnI+PGJyPsKg
IHVua25vd24gb3AgJiMzOTt7JiMzOTs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVhZF9t
c3IgY3B1MCAweDY2MCA6IEFyZ3VtZW50IGxpc3QgdG9vIGxvbmcuPGJyPgo8YnI+PGJyPlNpZ25l
ZC1vZmYtYnk6IERhdmlkIFJvc2NhICZsdDs8YSBocmVmPSJtYWlsdG86bm93cmVwQGdtYWlsLmNv
bSI+bm93cmVwQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPjxicj4tLS08YnI+wqBzcmMvY3B1L2ludGVs
X2NwdXMuY3BwIHwgNCArKystPGJyPsKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKTxicj48YnI+ZGlmZiAtLWdpdCBhL3NyYy9jcHUvaW50ZWxfY3B1cy5jcHAg
Yi9zcmMvY3B1L2ludGVsX2NwdXMuY3BwPGJyPgppbmRleCAzMzQ4ZGJhLi42MzMwYjZmIDEwMDY0
NDxicj4tLS0gYS9zcmMvY3B1L2ludGVsX2NwdXMuY3BwPGJyPisrKyBiL3NyYy9jcHUvaW50ZWxf
Y3B1cy5jcHA8YnI+QEAgLTEwMSw4ICsxMDEsMTAgQEAgbmhtX2NvcmU6Om5obV9jb3JlKGludCBt
b2RlbCk8YnI+wqAgwqAgwqBpZiAobW9kZWwgPT0gMHgzNykgezxicj7CoCDCoCDCoCDCoCDCoGhh
c19jM19yZXMgPSAwOzxicj7CoCDCoCDCoCDCoCDCoGhhc19jMV9yZXMgPSAxOzxicj4KLSDCoCDC
oH0gZWxzZTxicj4rIMKgIMKgfSBlbHNlIHs8YnI+wqAgwqAgwqAgwqAgwqBoYXNfYzNfcmVzID0g
MTs8YnI+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhhc19jMV9yZXMgPSAwOzxicj4rIMKgIMKg
IMKgIMKgfTxicj7CoH08YnI+wqA8YnI+wqB2b2lkIG5obV9jb3JlOjptZWFzdXJlbWVudF9zdGFy
dCh2b2lkKTxicj4tLTxicj4xLjguNC5yYzM8YnI+PC9kaXY+Cg==

--===============8574741589021970811==--

