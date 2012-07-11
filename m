Content-Type: multipart/mixed; boundary="===============7211046999461868022=="
MIME-Version: 1.0
From: Igor Zhbanov <i.zhbanov at samsung.com>
Subject: Re: [Powertop] csstoh shell-script for cross-compiling PowerTOP
Date: Wed, 11 Jul 2012 11:15:58 +0400
Message-ID: <4FFD282E.6080105@samsung.com>
In-Reply-To: 1341989764.2654.2.camel@sara
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7211046999461868022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is the new version:

--8<--Cut-here-------------------------------------------------------------=
---
diff -purN powertop/Android.mk powertop-csstoh/Android.mk
--- powertop/Android.mk	2012-07-11 11:09:18.388958856 +0400
+++ powertop-csstoh/Android.mk	2012-07-11 11:09:56.884957818 +0400
@@ -2,13 +2,11 @@ LOCAL_PATH :=3D $(call my-dir)
  include $(CLEAR_VARS)

  LOCAL_MODULE_TAGS :=3D optional
-CSSTOH_SOURCE :=3D $(LOCAL_PATH)/csstoh.c
  POWERTOP_CSS_SOURCE :=3D $(LOCAL_PATH)/powertop.css
-GEN_CSSTOH :=3D $(LOCAL_PATH)/csstoh
+GEN_CSSTOH :=3D $(LOCAL_PATH)/csstoh.sh
  GEN_CSS_H :=3D $(LOCAL_PATH)/css.h
  $(GEN_CSS_H):
-	$(CC) -o $(GEN_CSSTOH) $(CSSTOH_SOURCE)
-	./$(GEN_CSSTOH) $(POWERTOP_CSS_SOURCE) $@
+	$(SHELL) ./$(GEN_CSSTOH) $(POWERTOP_CSS_SOURCE) $@

  LOCAL_GENERATED_SOURCES +=3D $(GEN_CSS_H)

diff -purN powertop/.gitignore powertop-csstoh/.gitignore
--- powertop/.gitignore	2012-07-11 11:09:18.372958855 +0400
+++ powertop-csstoh/.gitignore	2012-07-11 11:09:34.180958433 +0400
@@ -39,7 +39,6 @@ po/*.gmo
  po/stamp-po
  src/powertop
  src/css.h
-src/csstoh
  src/Makefile.in
  src/.deps/
  src/Makefile
diff -purN powertop/src/csstoh.sh powertop-csstoh/src/csstoh.sh
--- powertop/src/csstoh.sh	1970-01-01 03:00:00.000000000 +0300
+++ powertop-csstoh/src/csstoh.sh	2012-07-11 11:10:54.716956259 +0400
@@ -0,0 +1,44 @@
+#!/bin/sh
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
diff -purN powertop/src/Makefile.am powertop-csstoh/src/Makefile.am
--- powertop/src/Makefile.am	2012-07-11 11:09:18.376958857 +0400
+++ powertop-csstoh/src/Makefile.am	2012-07-11 11:10:13.888957361 +0400
@@ -1,9 +1,6 @@
  AUTOMAKE_OPTIONS =3D subdir-objects
  ACLOCAL_AMFLAGS =3D -I ../m4

-noinst_PROGRAMS =3D csstoh
-csstoh_SOURCES =3D csstoh.c
-
  sbin_PROGRAMS =3D powertop
  nodist_powertop_SOURCES =3D css.h

@@ -44,6 +41,6 @@ AM_LDFLAGS =3D $(LIBS) $(NCURSES_LIBS) $(P

  BUILT_SOURCES =3D css.h
  CLEANFILES =3D css.h
-css.h: csstoh powertop.css
-	./csstoh powertop.css css.h
+css.h: powertop.css
+	$(SHELL) ./csstoh.sh powertop.css css.h


--8<-----------------------------------------------------------------------=
---


Magnus Fromreide wrote:
> On Wed, 2012-07-11 at 10:17 +0400, Igor Zhbanov wrote:
>> Hello!
>>
>> I have tried to build PowerTOP for ARM with a cross-compiler. But PowerT=
OP
>> uses internal csstoh utility that converts powertop.css to powertoh.h
>> for inclusion in *.cpp source files.
>>
>> When you use the cross-compiler (without making complicated rules
>> in the Makefile) this utility will be compiled for ARM platform too.
>> And you cannot run it on x86 build host.
>>
>> To solve this issue (and because of simplicity of the utility)
>> I have rewritten it in a shell script.
> Why /bin/bash?
>
> The script doesn't depend on any bashisms so /bin/sh should be enough,
> right?
>
> Why all the games with chmod?
> $(SHELL) csstoh.sh powertop.css css.h
> should also run the script correctly, shouldn't it?
>
> /MF
>
>
-- =

Best regards,
Igor Zhbanov,
Expert Software Engineer,
phone: +7 (495) 797 25 00 ext 3806
e-mail: i.zhbanov(a)samsung.com

ASWG, Moscow R&D center, Samsung Electronics
12 Dvintsev street, building 1
127018, Moscow, Russian Federation


--===============7211046999461868022==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="02-powertop-cross-csstoh.diff"

ZGlmZiAtcHVyTiBwb3dlcnRvcC9BbmRyb2lkLm1rIHBvd2VydG9wLWNzc3RvaC9BbmRyb2lkLm1r
Ci0tLSBwb3dlcnRvcC9BbmRyb2lkLm1rCTIwMTItMDctMTEgMTE6MDk6MTguMzg4OTU4ODU2ICsw
NDAwCisrKyBwb3dlcnRvcC1jc3N0b2gvQW5kcm9pZC5tawkyMDEyLTA3LTExIDExOjA5OjU2Ljg4
NDk1NzgxOCArMDQwMApAQCAtMiwxMyArMiwxMSBAQCBMT0NBTF9QQVRIIDo9ICQoY2FsbCBteS1k
aXIpCiBpbmNsdWRlICQoQ0xFQVJfVkFSUykKIAogTE9DQUxfTU9EVUxFX1RBR1MgOj0gb3B0aW9u
YWwKLUNTU1RPSF9TT1VSQ0UgOj0gJChMT0NBTF9QQVRIKS9jc3N0b2guYwogUE9XRVJUT1BfQ1NT
X1NPVVJDRSA6PSAkKExPQ0FMX1BBVEgpL3Bvd2VydG9wLmNzcwotR0VOX0NTU1RPSCA6PSAkKExP
Q0FMX1BBVEgpL2Nzc3RvaAorR0VOX0NTU1RPSCA6PSAkKExPQ0FMX1BBVEgpL2Nzc3RvaC5zaAog
R0VOX0NTU19IIDo9ICQoTE9DQUxfUEFUSCkvY3NzLmgKICQoR0VOX0NTU19IKToKLQkkKENDKSAt
byAkKEdFTl9DU1NUT0gpICQoQ1NTVE9IX1NPVVJDRSkKLQkuLyQoR0VOX0NTU1RPSCkgJChQT1dF
UlRPUF9DU1NfU09VUkNFKSAkQAorCSQoU0hFTEwpIC4vJChHRU5fQ1NTVE9IKSAkKFBPV0VSVE9Q
X0NTU19TT1VSQ0UpICRACiAKIExPQ0FMX0dFTkVSQVRFRF9TT1VSQ0VTICs9ICQoR0VOX0NTU19I
KQogCmRpZmYgLXB1ck4gcG93ZXJ0b3AvLmdpdGlnbm9yZSBwb3dlcnRvcC1jc3N0b2gvLmdpdGln
bm9yZQotLS0gcG93ZXJ0b3AvLmdpdGlnbm9yZQkyMDEyLTA3LTExIDExOjA5OjE4LjM3Mjk1ODg1
NSArMDQwMAorKysgcG93ZXJ0b3AtY3NzdG9oLy5naXRpZ25vcmUJMjAxMi0wNy0xMSAxMTowOToz
NC4xODA5NTg0MzMgKzA0MDAKQEAgLTM5LDcgKzM5LDYgQEAgcG8vKi5nbW8KIHBvL3N0YW1wLXBv
CiBzcmMvcG93ZXJ0b3AKIHNyYy9jc3MuaAotc3JjL2Nzc3RvaAogc3JjL01ha2VmaWxlLmluCiBz
cmMvLmRlcHMvCiBzcmMvTWFrZWZpbGUKZGlmZiAtcHVyTiBwb3dlcnRvcC9zcmMvY3NzdG9oLnNo
IHBvd2VydG9wLWNzc3RvaC9zcmMvY3NzdG9oLnNoCi0tLSBwb3dlcnRvcC9zcmMvY3NzdG9oLnNo
CTE5NzAtMDEtMDEgMDM6MDA6MDAuMDAwMDAwMDAwICswMzAwCisrKyBwb3dlcnRvcC1jc3N0b2gv
c3JjL2Nzc3RvaC5zaAkyMDEyLTA3LTExIDExOjEwOjU0LjcxNjk1NjI1OSArMDQwMApAQCAtMCww
ICsxLDQ0IEBACisjIS9iaW4vc2gKKyMKKyMgVGhpcyBwcm9ncmFtIGZpbGUgaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdAorIyB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBi
eSB0aGUKKyMgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vu
c2UuCisjCisjIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLCBidXQgV0lUSE9VVAorIyBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZiBNRVJDSEFOVEFCSUxJVFkgb3IKKyMgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlCisjIGZvciBtb3JlIGRldGFpbHMuCisjCisjIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBh
IGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjIGFsb25nIHdpdGggdGhp
cyBwcm9ncmFtIGluIGEgZmlsZSBuYW1lZCBDT1BZSU5HOyBpZiBub3QsIHdyaXRlIHRvIHRoZQor
IyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYywKKyMgNTEgRnJhbmtsaW4gU3RyZWV0LCBG
aWZ0aCBGbG9vciwKKyMgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyBvciBqdXN0IGdvb2ds
ZSBmb3IgaXQuCisjCisjIFdyaXR0ZW4gYnkgSWdvciBaaGJhbm92IDxpLnpoYmFub3ZAc2Ftc3Vu
Zy5jb20+CisKK2lmIFsgJCMgLWx0IDIgXTsgdGhlbgorCWVjaG8gIlVzYWdlOiBjc3N0b2guc2gg
Y3NzZmlsZSBoZWFkZXIuaCIKKwlleGl0IDEKK2ZpCisKK2lmIFsgISAtciAkMSBdOyB0aGVuCisJ
ZWNobyAiQ2FuJ3QgZmluZCBmaWxlICQxIgorCWV4aXQgMQorZmkKKworaWYgISBlY2hvIC1uID4k
MjsgdGhlbgorCWVjaG8gIkNhbid0IG9wZW4gZmlsZSAkMiBmb3Igd3JpdGluZy4iCisJZXhpdCAx
CitmaQorCitlY2hvICIjaWZuZGVmIF9fSU5DTFVERV9HVUFSRF9DQ1NfSCIgPj4gJDIKK2VjaG8g
IiNkZWZpbmUgX19JTkNMVURFX0dVQVJEX0NDU19IIiA+PiAkMgorZWNobyA+PiAkMgorZWNobyAi
Y29uc3QgY2hhciBjc3NbXSA9ICIgPj4gJDIKKworc2VkIC1yICdzL14oLiopJC9cdFwiXDFcXG5c
Ii8nICQxID4+ICQyCisKK2VjaG8gIjsiID4+ICQyCitlY2hvICIjZW5kaWYiID4+ICQyCmRpZmYg
LXB1ck4gcG93ZXJ0b3Avc3JjL01ha2VmaWxlLmFtIHBvd2VydG9wLWNzc3RvaC9zcmMvTWFrZWZp
bGUuYW0KLS0tIHBvd2VydG9wL3NyYy9NYWtlZmlsZS5hbQkyMDEyLTA3LTExIDExOjA5OjE4LjM3
Njk1ODg1NyArMDQwMAorKysgcG93ZXJ0b3AtY3NzdG9oL3NyYy9NYWtlZmlsZS5hbQkyMDEyLTA3
LTExIDExOjEwOjEzLjg4ODk1NzM2MSArMDQwMApAQCAtMSw5ICsxLDYgQEAKIEFVVE9NQUtFX09Q
VElPTlMgPSBzdWJkaXItb2JqZWN0cwogQUNMT0NBTF9BTUZMQUdTID0gLUkgLi4vbTQgCiAKLW5v
aW5zdF9QUk9HUkFNUyA9IGNzc3RvaAotY3NzdG9oX1NPVVJDRVMgPSBjc3N0b2guYyAKLQogc2Jp
bl9QUk9HUkFNUyA9IHBvd2VydG9wCiBub2Rpc3RfcG93ZXJ0b3BfU09VUkNFUyA9IGNzcy5oCiAK
QEAgLTQ0LDYgKzQxLDYgQEAgQU1fTERGTEFHUyA9ICQoTElCUykgJChOQ1VSU0VTX0xJQlMpICQo
UAogCiBCVUlMVF9TT1VSQ0VTID0gY3NzLmgKIENMRUFORklMRVMgPSBjc3MuaAotY3NzLmg6IGNz
c3RvaCBwb3dlcnRvcC5jc3MKLQkuL2Nzc3RvaCBwb3dlcnRvcC5jc3MgY3NzLmgKK2Nzcy5oOiBw
b3dlcnRvcC5jc3MKKwkkKFNIRUxMKSAuL2Nzc3RvaC5zaCBwb3dlcnRvcC5jc3MgY3NzLmgKIAo=

--===============7211046999461868022==--

