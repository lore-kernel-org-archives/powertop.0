Content-Type: multipart/mixed; boundary="===============2230888493313176417=="
MIME-Version: 1.0
From: Paranjape, Gautam <gautam.paranjape at intel.com>
Subject: [Powertop] [PATCH] Modify how line_levels are assigned so c-states
 won't overwrite other c-states
Date: Mon, 17 Jul 2017 22:39:52 +0000
Message-ID: <55056A404D4AA94785E70767BB51D122173E12@ORSMSX111.amr.corp.intel.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2230888493313176417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some c-states exposed by the intel_idle driver are assigned the same line_l=
evel, which
means that the most recent one assigned can overwrite another c-state. For
example, the C1-SKL c-state is overwriten by the C1E-SKL c-state because bo=
th
are assigned line_level 1. To fix this, check if a "sub c-state" (ex. C1E-S=
KL)
is being inserted. If so, check the vector of c-states if a c-state with si=
milar name
(ex. C1-SKL, compared to C1E-SKL), and modify the line level so there is no
overwriting.

Signed-off-by: Gautam Paranjape <gautam.paranjape(a)intel.com>
---
 src/cpu/abstract_cpu.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/cpu/abstract_cpu.cpp b/src/cpu/abstract_cpu.cpp
index bc323368b71f..c59721cb349a 100644
--- a/src/cpu/abstract_cpu.cpp
+++ b/src/cpu/abstract_cpu.cpp
@@ -218,6 +218,17 @@ void abstract_cpu::insert_cstate(const char *linux_nam=
e, const char *human_name,
         }
         if (*c >=3D '0' && *c <=3D'9') {
             state->line_level =3D strtoull(c, NULL, 10);
+            if(*(c+1) !=3D '-'){
+                int greater_line_level =3D strtoull(c, NULL, 10);
+                for(unsigned int pos =3D 0; pos < cstates.size(); pos++){
+                    if(*c =3D=3D cstates[pos]->human_name[1]){
+                        if(*(c+1) !=3D cstates[pos]->human_name[2]){
+                            greater_line_level =3D max(greater_line_level,=
 cstates[pos]->line_level);
+                            state->line_level =3D greater_line_level + 1;
+                        }
+                    }
+                }
+            }
             break;
         }
         c++;
--
2.9.3

--===============2230888493313176417==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij5Tb21lIGMtc3RhdGVzIGV4cG9zZWQgYnkgdGhlIGludGVsX2lkbGUgZHJpdmVy
IGFyZSBhc3NpZ25lZCB0aGUgc2FtZSBsaW5lX2xldmVsLCB3aGljaDxicj4KbWVhbnMgdGhhdCB0
aGUgbW9zdCByZWNlbnQgb25lIGFzc2lnbmVkIGNhbiBvdmVyd3JpdGUgYW5vdGhlciBjLXN0YXRl
LiBGb3I8YnI+CmV4YW1wbGUsIHRoZSBDMS1TS0wgYy1zdGF0ZSBpcyBvdmVyd3JpdGVuIGJ5IHRo
ZSBDMUUtU0tMIGMtc3RhdGUgYmVjYXVzZSBib3RoPGJyPgphcmUgYXNzaWduZWQgbGluZV9sZXZl
bCAxLiBUbyBmaXggdGhpcywgY2hlY2sgaWYgYSAmcXVvdDtzdWIgYy1zdGF0ZSZxdW90OyAoZXgu
IEMxRS1TS0wpPGJyPgppcyBiZWluZyBpbnNlcnRlZC4gSWYgc28sIGNoZWNrIHRoZSB2ZWN0b3Ig
b2YgYy1zdGF0ZXMgaWYgYSBjLXN0YXRlIHdpdGggc2ltaWxhciBuYW1lPGJyPgooZXguIEMxLVNL
TCwgY29tcGFyZWQgdG8gQzFFLVNLTCksIGFuZCBtb2RpZnkgdGhlIGxpbmUgbGV2ZWwgc28gdGhl
cmUgaXMgbm88YnI+Cm92ZXJ3cml0aW5nLjxicj4KPGJyPgpTaWduZWQtb2ZmLWJ5OiBHYXV0YW0g
UGFyYW5qYXBlICZsdDtnYXV0YW0ucGFyYW5qYXBlQGludGVsLmNvbSZndDs8YnI+Ci0tLTxicj4K
Jm5ic3A7c3JjL2NwdS9hYnN0cmFjdF9jcHUuY3BwIHwgMTEgJiM0MzsmIzQzOyYjNDM7JiM0Mzsm
IzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOzxicj4KJm5ic3A7MSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoJiM0MzspPGJyPgo8YnI+CmRpZmYgLS1naXQgYS9zcmMvY3B1L2Fi
c3RyYWN0X2NwdS5jcHAgYi9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+CmluZGV4IGJjMzIz
MzY4YjcxZi4uYzU5NzIxY2IzNDlhIDEwMDY0NDxicj4KLS0tIGEvc3JjL2NwdS9hYnN0cmFjdF9j
cHUuY3BwPGJyPgomIzQzOyYjNDM7JiM0MzsgYi9zcmMvY3B1L2Fic3RyYWN0X2NwdS5jcHA8YnI+
CkBAIC0yMTgsNiAmIzQzOzIxOCwxNyBAQCB2b2lkIGFic3RyYWN0X2NwdTo6aW5zZXJ0X2NzdGF0
ZShjb25zdCBjaGFyICpsaW51eF9uYW1lLCBjb25zdCBjaGFyICpodW1hbl9uYW1lLDxicj4KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmICgqYyAmZ3Q7PSAnMCcgJmFtcDsm
YW1wOyAqYyAmbHQ7PSc5Jykgezxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZu
YnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgc3RhdGUtJmd0O2xpbmVfbGV2ZWwgPSBzdHJ0
b3VsbChjLCBOVUxMLCAxMCk7PGJyPgomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJz
cDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGlmKCooYyYjNDM7MSkgIT0gJy0nKXs8YnI+CiYj
NDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IGludCBncmVhdGVyX2xpbmVfbGV2ZWwgPSBzdHJ0b3VsbChj
LCBOVUxMLCAxMCk7PGJyPgomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBmb3IodW5zaWduZWQgaW50
IHBvcyA9IDA7IHBvcyAmbHQ7IGNzdGF0ZXMuc2l6ZSgpOyBwb3MmIzQzOyYjNDM7KXs8YnI+CiYj
NDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBpZigqYyA9PSBjc3RhdGVz
W3Bvc10tJmd0O2h1bWFuX25hbWVbMV0pezxicj4KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsgJm5i
c3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5i
c3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBpZigqKGMmIzQzOzEpICE9IGNzdGF0
ZXNbcG9zXS0mZ3Q7aHVtYW5fbmFtZVsyXSl7PGJyPgomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyBn
cmVhdGVyX2xpbmVfbGV2ZWwgPSBtYXgoZ3JlYXRlcl9saW5lX2xldmVsLCBjc3RhdGVzW3Bvc10t
Jmd0O2xpbmVfbGV2ZWwpOzxicj4KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7
Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgc3RhdGUtJmd0O2xp
bmVfbGV2ZWwgPSBncmVhdGVyX2xpbmVfbGV2ZWwgJiM0MzsgMTs8YnI+CiYjNDM7Jm5ic3A7Jm5i
c3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5i
c3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4KJiM0
MzsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNw
OyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+CiYjNDM7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7
Jm5ic3A7Jm5ic3A7IH08YnI+CiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZuYnNwOyZuYnNwOyZu
YnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZu
YnNwOyZuYnNwOyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgYnJlYWs7PGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+CiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyAmbmJzcDsmbmJzcDsmbmJzcDsgYyYjNDM7JiM0Mzs7PGJyPgotLSA8YnI+CjIuOS4z
PGJyPgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============2230888493313176417==--

