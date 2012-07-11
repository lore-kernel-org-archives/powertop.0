Content-Type: multipart/mixed; boundary="===============3409585986403697431=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: [Powertop] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 10:17:31 +0400
Message-ID: <4FFD1A7B.2000105@samsung.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============3409585986403697431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

I have tried to build PowerTOP for ARM with a cross-compiler. But PowerTOP
uses internal csstoh utility that converts powertop.css to powertoh.h
for inclusion in *.cpp source files.

When you use the cross-compiler (without making complicated rules
in the Makefile) this utility will be compiled for ARM platform too.
And you cannot run it on x86 build host.

To solve this issue (and because of simplicity of the utility)
I have rewritten it in a shell script.

--8<-----------------------------------------------------------------------=
---
diff -purN powertop/Android.mk powertop-cross/Android.mk
--- powertop/Android.mk	2012-07-05 11:54:25.052141513 +0400
+++ powertop-cross/Android.mk	2012-07-05 11:57:09.328145984 +0400
@@ -2,12 +2,11 @@ LOCAL_PATH :=3D $(call my-dir)
  include $(CLEAR_VARS)

  LOCAL_MODULE_TAGS :=3D optional
-CSSTOH_SOURCE :=3D $(LOCAL_PATH)/csstoh.c
  POWERTOP_CSS_SOURCE :=3D $(LOCAL_PATH)/powertop.css
-GEN_CSSTOH :=3D $(LOCAL_PATH)/csstoh
+GEN_CSSTOH :=3D $(LOCAL_PATH)/csstoh.sh
  GEN_CSS_H :=3D $(LOCAL_PATH)/css.h
  $(GEN_CSS_H):
-	$(CC) -o $(GEN_CSSTOH) $(CSSTOH_SOURCE)
+	chmod +x ./$(GEN_CSSTOH)
  	./$(GEN_CSSTOH) $(POWERTOP_CSS_SOURCE) $@

  LOCAL_GENERATED_SOURCES +=3D $(GEN_CSS_H)
diff -purN powertop/.gitignore powertop-cross/.gitignore
--- powertop/.gitignore	2012-07-05 11:54:25.032141514 +0400
+++ powertop-cross/.gitignore	2012-07-05 11:55:49.028143801 +0400
@@ -39,7 +39,6 @@ po/*.gmo
  po/stamp-po
  src/powertop
  src/css.h
-src/csstoh
  src/Makefile.in
  src/.deps/
  src/Makefile
diff -purN powertop/src/csstoh.sh powertop-cross/src/csstoh.sh
--- powertop/src/csstoh.sh	1970-01-01 03:00:00.000000000 +0300
+++ powertop-cross/src/csstoh.sh	2012-07-05 11:50:22.000000000 +0400
@@ -0,0 +1,45 @@
+#!/bin/bash
+#
+# This program file is free software; you can redistribute it and/or modif=
y it
+# under the terms of the GNU General Public License as published by the
+# Free Software Foundation; version 2 of the License.
+#
+# This program is distributed in the hope that it will be useful, but WITH=
OUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program in a file named COPYING; if not, write to the
+# Free Software Foundation, Inc,
+# 51 Franklin Street, Fifth Floor,
+# Boston, MA 02110-1301 USA
+# or just google for it.
+#
+# Written by Igor Zhbanov<i.zhbanov(a)samsung.com>
+
+
+if [ $# -lt 2 ]; then
+	echo "Usage: csstoh.sh cssfile header.h"
+	exit 1
+fi
+
+if [ ! -r $1 ]; then
+	echo "Can't find file $1"
+	exit 1
+fi
+
+if ! echo -n>$2; then
+	echo "Can't open file $2 for writing."
+	exit 1
+fi
+
+echo "#ifndef __INCLUDE_GUARD_CCS_H">>  $2
+echo "#define __INCLUDE_GUARD_CCS_H">>  $2
+echo>>  $2
+echo "const char css[] =3D ">>  $2
+
+sed -r 's/^(.*)$/\t\"\1\\n\"/' $1>>  $2
+
+echo ";">>  $2
+echo "#endif">>  $2
diff -purN powertop/src/Makefile.am powertop-cross/src/Makefile.am
--- powertop/src/Makefile.am	2012-07-05 11:54:25.040141514 +0400
+++ powertop-cross/src/Makefile.am	2012-07-05 11:56:42.700145262 +0400
@@ -1,9 +1,6 @@
  AUTOMAKE_OPTIONS =3D subdir-objects
  ACLOCAL_AMFLAGS =3D -I ../m4

-noinst_PROGRAMS =3D csstoh
-csstoh_SOURCES =3D csstoh.c
-
  sbin_PROGRAMS =3D powertop
  nodist_powertop_SOURCES =3D css.h

@@ -44,6 +41,7 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(P

  BUILT_SOURCES =3D css.h
  CLEANFILES =3D css.h
-css.h: csstoh powertop.css
-	./csstoh powertop.css css.h
+css.h: powertop.css
+	chmod +x ./csstoh.sh
+	./csstoh.sh powertop.css css.h

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


--===============3409585986403697431==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="02-powertop-cross-csstoh.diff"

ZGlmZiAtcHVyTiBwb3dlcnRvcC9BbmRyb2lkLm1rIHBvd2VydG9wLWNyb3NzL0FuZHJvaWQubWsK
LS0tIHBvd2VydG9wL0FuZHJvaWQubWsJMjAxMi0wNy0wNSAxMTo1NDoyNS4wNTIxNDE1MTMgKzA0
MDAKKysrIHBvd2VydG9wLWNyb3NzL0FuZHJvaWQubWsJMjAxMi0wNy0wNSAxMTo1NzowOS4zMjgx
NDU5ODQgKzA0MDAKQEAgLTIsMTIgKzIsMTEgQEAgTE9DQUxfUEFUSCA6PSAkKGNhbGwgbXktZGly
KQogaW5jbHVkZSAkKENMRUFSX1ZBUlMpCiAKIExPQ0FMX01PRFVMRV9UQUdTIDo9IG9wdGlvbmFs
Ci1DU1NUT0hfU09VUkNFIDo9ICQoTE9DQUxfUEFUSCkvY3NzdG9oLmMKIFBPV0VSVE9QX0NTU19T
T1VSQ0UgOj0gJChMT0NBTF9QQVRIKS9wb3dlcnRvcC5jc3MKLUdFTl9DU1NUT0ggOj0gJChMT0NB
TF9QQVRIKS9jc3N0b2gKK0dFTl9DU1NUT0ggOj0gJChMT0NBTF9QQVRIKS9jc3N0b2guc2gKIEdF
Tl9DU1NfSCA6PSAkKExPQ0FMX1BBVEgpL2Nzcy5oCiAkKEdFTl9DU1NfSCk6Ci0JJChDQykgLW8g
JChHRU5fQ1NTVE9IKSAkKENTU1RPSF9TT1VSQ0UpCisJY2htb2QgK3ggLi8kKEdFTl9DU1NUT0gp
CiAJLi8kKEdFTl9DU1NUT0gpICQoUE9XRVJUT1BfQ1NTX1NPVVJDRSkgJEAKIAogTE9DQUxfR0VO
RVJBVEVEX1NPVVJDRVMgKz0gJChHRU5fQ1NTX0gpCmRpZmYgLXB1ck4gcG93ZXJ0b3AvLmdpdGln
bm9yZSBwb3dlcnRvcC1jcm9zcy8uZ2l0aWdub3JlCi0tLSBwb3dlcnRvcC8uZ2l0aWdub3JlCTIw
MTItMDctMDUgMTE6NTQ6MjUuMDMyMTQxNTE0ICswNDAwCisrKyBwb3dlcnRvcC1jcm9zcy8uZ2l0
aWdub3JlCTIwMTItMDctMDUgMTE6NTU6NDkuMDI4MTQzODAxICswNDAwCkBAIC0zOSw3ICszOSw2
IEBAIHBvLyouZ21vCiBwby9zdGFtcC1wbwogc3JjL3Bvd2VydG9wCiBzcmMvY3NzLmgKLXNyYy9j
c3N0b2gKIHNyYy9NYWtlZmlsZS5pbgogc3JjLy5kZXBzLwogc3JjL01ha2VmaWxlCmRpZmYgLXB1
ck4gcG93ZXJ0b3Avc3JjL2Nzc3RvaC5zaCBwb3dlcnRvcC1jcm9zcy9zcmMvY3NzdG9oLnNoCi0t
LSBwb3dlcnRvcC9zcmMvY3NzdG9oLnNoCTE5NzAtMDEtMDEgMDM6MDA6MDAuMDAwMDAwMDAwICsw
MzAwCisrKyBwb3dlcnRvcC1jcm9zcy9zcmMvY3NzdG9oLnNoCTIwMTItMDctMDUgMTE6NTA6MjIu
MDAwMDAwMDAwICswNDAwCkBAIC0wLDAgKzEsNDUgQEAKKyMhL2Jpbi9iYXNoCisjCisjIFRoaXMg
cHJvZ3JhbSBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkgaXQKKyMgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlCisjIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLgorIworIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJp
YnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwgYnV0IFdJVEhPVVQKKyMg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YgTUVSQ0hB
TlRBQklMSVRZIG9yCisjIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyBmb3IgbW9yZSBkZXRhaWxzLgorIworIyBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZQorIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbSBpbiBhIGZpbGUgbmFtZWQgQ09QWUlO
RzsgaWYgbm90LCB3cml0ZSB0byB0aGUKKyMgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMs
CisjIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsCisjIEJvc3RvbiwgTUEgMDIxMTAt
MTMwMSBVU0EKKyMgb3IganVzdCBnb29nbGUgZm9yIGl0LgorIworIyBXcml0dGVuIGJ5IElnb3Ig
WmhiYW5vdiA8aS56aGJhbm92QHNhbXN1bmcuY29tPgorCisKK2lmIFsgJCMgLWx0IDIgXTsgdGhl
bgorCWVjaG8gIlVzYWdlOiBjc3N0b2guc2ggY3NzZmlsZSBoZWFkZXIuaCIKKwlleGl0IDEKK2Zp
CisKK2lmIFsgISAtciAkMSBdOyB0aGVuCisJZWNobyAiQ2FuJ3QgZmluZCBmaWxlICQxIgorCWV4
aXQgMQorZmkKKworaWYgISBlY2hvIC1uID4kMjsgdGhlbgorCWVjaG8gIkNhbid0IG9wZW4gZmls
ZSAkMiBmb3Igd3JpdGluZy4iCisJZXhpdCAxCitmaQorCitlY2hvICIjaWZuZGVmIF9fSU5DTFVE
RV9HVUFSRF9DQ1NfSCIgPj4gJDIKK2VjaG8gIiNkZWZpbmUgX19JTkNMVURFX0dVQVJEX0NDU19I
IiA+PiAkMgorZWNobyA+PiAkMgorZWNobyAiY29uc3QgY2hhciBjc3NbXSA9ICIgPj4gJDIKKwor
c2VkIC1yICdzL14oLiopJC9cdFwiXDFcXG5cIi8nICQxID4+ICQyCisKK2VjaG8gIjsiID4+ICQy
CitlY2hvICIjZW5kaWYiID4+ICQyCmRpZmYgLXB1ck4gcG93ZXJ0b3Avc3JjL01ha2VmaWxlLmFt
IHBvd2VydG9wLWNyb3NzL3NyYy9NYWtlZmlsZS5hbQotLS0gcG93ZXJ0b3Avc3JjL01ha2VmaWxl
LmFtCTIwMTItMDctMDUgMTE6NTQ6MjUuMDQwMTQxNTE0ICswNDAwCisrKyBwb3dlcnRvcC1jcm9z
cy9zcmMvTWFrZWZpbGUuYW0JMjAxMi0wNy0wNSAxMTo1Njo0Mi43MDAxNDUyNjIgKzA0MDAKQEAg
LTEsOSArMSw2IEBACiBBVVRPTUFLRV9PUFRJT05TID0gc3ViZGlyLW9iamVjdHMKIEFDTE9DQUxf
QU1GTEFHUyA9IC1JIC4uL200IAogCi1ub2luc3RfUFJPR1JBTVMgPSBjc3N0b2gKLWNzc3RvaF9T
T1VSQ0VTID0gY3NzdG9oLmMgCi0KIHNiaW5fUFJPR1JBTVMgPSBwb3dlcnRvcAogbm9kaXN0X3Bv
d2VydG9wX1NPVVJDRVMgPSBjc3MuaAogCkBAIC00NCw2ICs0MSw3IEBAIEFNX0xERkxBR1MgPSAk
KExJQlMpICQoTkNVUlNFU19MSUJTKSAkKFAKIAogQlVJTFRfU09VUkNFUyA9IGNzcy5oCiBDTEVB
TkZJTEVTID0gY3NzLmgKLWNzcy5oOiBjc3N0b2ggcG93ZXJ0b3AuY3NzCi0JLi9jc3N0b2ggcG93
ZXJ0b3AuY3NzIGNzcy5oCitjc3MuaDogcG93ZXJ0b3AuY3NzCisJY2htb2QgK3ggLi9jc3N0b2gu
c2gKKwkuL2Nzc3RvaC5zaCBwb3dlcnRvcC5jc3MgY3NzLmgKIAo=

--===============3409585986403697431==--

