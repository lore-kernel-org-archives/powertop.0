Content-Type: multipart/mixed; boundary="===============2921438244766060832=="
MIME-Version: 1.0
From: Koosha Hosseiny <koosha.hosseiny at gmail.com>
Subject: [Powertop] [PATCH POWERTOP] auto tune option to set everything to bad
 state
Date: Sun, 30 Jun 2019 00:19:22 +0430
Message-ID: <CAG1ReXvvqjZjMz4jP5de5xjihp1Urjtg10wR84HjdETJ+dWqrQ@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2921438244766060832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Having the command `tuned-adm profile throughput-performance`, it's also
nice to tell powertop to put everything in bad state.

Also available here: https://github.com/hkoosha/powertop

diff --git a/src/main.cpp b/src/main.cpp
index cbb7a4e..6c23f58 100644
--- a/src/main.cpp
+++ b/src/main.cpp
@@ -75,6 +75,7 @@ void (*ui_notify_user) (const char *frmt, ...);

 enum {
  OPT_AUTO_TUNE =3D CHAR_MAX + 1,
+ OPT_AUTO_UNTUNE,
  OPT_EXTECH,
  OPT_DEBUG
 };
@@ -83,6 +84,7 @@ static const struct option long_options[] =3D
 {
  /* These options set a flag. */
  {"auto-tune", no_argument, NULL, OPT_AUTO_TUNE},
+ {"auto-untune", no_argument, NULL, OPT_AUTO_UNTUNE},
  {"calibrate", no_argument, NULL, 'c'},
  {"csv", optional_argument, NULL, 'C'},
  {"debug", no_argument, &debug_learning, OPT_DEBUG},
@@ -454,6 +456,11 @@ int main(int argc, char **argv)
  leave_powertop =3D 1;
  ui_notify_user =3D ui_notify_user_console;
  break;
+ case OPT_AUTO_UNTUNE:
+ auto_tune =3D 2;
+ leave_powertop =3D 1;
+ ui_notify_user =3D ui_notify_user_console;
+ break;
  case 'c':
  powertop_init(0);
  calibrate();
@@ -545,7 +552,7 @@ int main(int argc, char **argv)
  tuning_update_display();
  show_tab(0);
  } else {
- auto_toggle_tuning();
+ auto_toggle_tuning(auto_tune);
  }

  while (!leave_powertop) {
diff --git a/src/tuning/tuning.cpp b/src/tuning/tuning.cpp
index a54a8ca..4d23ae3 100644
--- a/src/tuning/tuning.cpp
+++ b/src/tuning/tuning.cpp
@@ -316,10 +316,11 @@ void clear_tuning()
  all_untunables.clear();
 }

-void auto_toggle_tuning()
+void auto_toggle_tuning(int auto_tune)
 {
+  int flag =3D auto_tune =3D=3D 1 ? TUNE_BAD : TUNE_GOOD;
  for (unsigned int i =3D 0; i < all_tunables.size(); i++) {
- if (all_tunables[i]->good_bad() =3D=3D TUNE_BAD)
+ if (all_tunables[i]->good_bad() =3D=3D flag)
  all_tunables[i]->toggle();
  }
 }
diff --git a/src/tuning/tuning.h b/src/tuning/tuning.h
index f70001b..fe3da76 100644
--- a/src/tuning/tuning.h
+++ b/src/tuning/tuning.h
@@ -29,5 +29,5 @@ extern void initialize_tuning(void);
 extern void tuning_update_display(void);
 extern void report_show_tunables(void);
 extern void clear_tuning(void);
-extern void auto_toggle_tuning(void);
+extern void auto_toggle_tuning(int);
 #endif

--===============2921438244766060832==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFs
bCI+SGF2aW5nIHRoZSBjb21tYW5kIGB0dW5lZC1hZG0gcHJvZmlsZSB0aHJvdWdocHV0LXBlcmZv
cm1hbmNlYCwgaXQmIzM5O3MgYWxzbyBuaWNlIHRvIHRlbGwgcG93ZXJ0b3AgdG8gcHV0IGV2ZXJ5
dGhpbmcgaW4gYmFkIHN0YXRlLiA8YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1
bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPkFsc28gYXZhaWxhYmxlIGhlcmU6IDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9oa29vc2hhL3Bvd2VydG9wIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9naXRodWIuY29tL2hrb29zaGEvcG93ZXJ0b3A8L2E+PC9kaXY+PGRpdiBjbGFzcz0iZ21h
aWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9
ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNpemU6c21hbGwiPmRpZmYgLS1naXQgYS9zcmMv
bWFpbi5jcHAgYi9zcmMvbWFpbi5jcHA8YnI+aW5kZXggY2JiN2E0ZS4uNmMyM2Y1OCAxMDA2NDQ8
YnI+LS0tIGEvc3JjL21haW4uY3BwPGJyPisrKyBiL3NyYy9tYWluLmNwcDxicj5AQCAtNzUsNiAr
NzUsNyBAQCB2b2lkICgqdWlfbm90aWZ5X3VzZXIpIChjb25zdCBjaGFyICpmcm10LCAuLi4pOzxi
cj7CoDxicj7CoGVudW0gezxicj7CoAlPUFRfQVVUT19UVU5FID0gQ0hBUl9NQVggKyAxLDxicj4r
CU9QVF9BVVRPX1VOVFVORSw8YnI+wqAJT1BUX0VYVEVDSCw8YnI+wqAJT1BUX0RFQlVHPGJyPsKg
fTs8YnI+QEAgLTgzLDYgKzg0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvcHRpb24gbG9uZ19v
cHRpb25zW10gPTxicj7CoHs8YnI+wqAJLyogVGhlc2Ugb3B0aW9ucyBzZXQgYSBmbGFnLiAqLzxi
cj7CoAl7JnF1b3Q7YXV0by10dW5lJnF1b3Q7LAlub19hcmd1bWVudCwJCU5VTEwsCQkgT1BUX0FV
VE9fVFVORX0sPGJyPisJeyZxdW90O2F1dG8tdW50dW5lJnF1b3Q7LAlub19hcmd1bWVudCwJCU5V
TEwsCQkgT1BUX0FVVE9fVU5UVU5FfSw8YnI+wqAJeyZxdW90O2NhbGlicmF0ZSZxdW90OywJbm9f
YXJndW1lbnQsCQlOVUxMLAkJICYjMzk7YyYjMzk7fSw8YnI+wqAJeyZxdW90O2NzdiZxdW90OywJ
CW9wdGlvbmFsX2FyZ3VtZW50LAlOVUxMLAkJICYjMzk7QyYjMzk7fSw8YnI+wqAJeyZxdW90O2Rl
YnVnJnF1b3Q7LAlub19hcmd1bWVudCwJCSZhbXA7ZGVidWdfbGVhcm5pbmcsIE9QVF9ERUJVR30s
PGJyPkBAIC00NTQsNiArNDU2LDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndik8
YnI+wqAJCQlsZWF2ZV9wb3dlcnRvcCA9IDE7PGJyPsKgCQkJdWlfbm90aWZ5X3VzZXIgPSB1aV9u
b3RpZnlfdXNlcl9jb25zb2xlOzxicj7CoAkJCWJyZWFrOzxicj4rCQljYXNlIE9QVF9BVVRPX1VO
VFVORTo8YnI+KwkJCWF1dG9fdHVuZSA9IDI7PGJyPisJCQlsZWF2ZV9wb3dlcnRvcCA9IDE7PGJy
PisJCQl1aV9ub3RpZnlfdXNlciA9IHVpX25vdGlmeV91c2VyX2NvbnNvbGU7PGJyPisJCQlicmVh
azs8YnI+wqAJCWNhc2UgJiMzOTtjJiMzOTs6PGJyPsKgCQkJcG93ZXJ0b3BfaW5pdCgwKTs8YnI+
wqAJCQljYWxpYnJhdGUoKTs8YnI+QEAgLTU0NSw3ICs1NTIsNyBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpPGJyPsKgCQl0dW5pbmdfdXBkYXRlX2Rpc3BsYXkoKTs8YnI+wqAJCXNo
b3dfdGFiKDApOzxicj7CoAl9IGVsc2Ugezxicj4tCQlhdXRvX3RvZ2dsZV90dW5pbmcoKTs8YnI+
KwkJYXV0b190b2dnbGVfdHVuaW5nKGF1dG9fdHVuZSk7PGJyPsKgCX08YnI+wqA8YnI+wqAJd2hp
bGUgKCFsZWF2ZV9wb3dlcnRvcCkgezxicj5kaWZmIC0tZ2l0IGEvc3JjL3R1bmluZy90dW5pbmcu
Y3BwIGIvc3JjL3R1bmluZy90dW5pbmcuY3BwPGJyPmluZGV4IGE1NGE4Y2EuLjRkMjNhZTMgMTAw
NjQ0PGJyPi0tLSBhL3NyYy90dW5pbmcvdHVuaW5nLmNwcDxicj4rKysgYi9zcmMvdHVuaW5nL3R1
bmluZy5jcHA8YnI+QEAgLTMxNiwxMCArMzE2LDExIEBAIHZvaWQgY2xlYXJfdHVuaW5nKCk8YnI+
wqAJYWxsX3VudHVuYWJsZXMuY2xlYXIoKTs8YnI+wqB9PGJyPsKgPGJyPi12b2lkIGF1dG9fdG9n
Z2xlX3R1bmluZygpPGJyPit2b2lkIGF1dG9fdG9nZ2xlX3R1bmluZyhpbnQgYXV0b190dW5lKTxi
cj7CoHs8YnI+KyDCoGludCBmbGFnID0gYXV0b190dW5lID09IDEgPyBUVU5FX0JBRCA6IFRVTkVf
R09PRDs8YnI+wqAJZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7IGkgJmx0OyBhbGxfdHVuYWJsZXMu
c2l6ZSgpOyBpKyspIHs8YnI+LQkJaWYgKGFsbF90dW5hYmxlc1tpXS0mZ3Q7Z29vZF9iYWQoKSA9
PSBUVU5FX0JBRCk8YnI+KwkJaWYgKGFsbF90dW5hYmxlc1tpXS0mZ3Q7Z29vZF9iYWQoKSA9PSBm
bGFnKTxicj7CoAkJCWFsbF90dW5hYmxlc1tpXS0mZ3Q7dG9nZ2xlKCk7PGJyPsKgCX08YnI+wqB9
PGJyPmRpZmYgLS1naXQgYS9zcmMvdHVuaW5nL3R1bmluZy5oIGIvc3JjL3R1bmluZy90dW5pbmcu
aDxicj5pbmRleCBmNzAwMDFiLi5mZTNkYTc2IDEwMDY0NDxicj4tLS0gYS9zcmMvdHVuaW5nL3R1
bmluZy5oPGJyPisrKyBiL3NyYy90dW5pbmcvdHVuaW5nLmg8YnI+QEAgLTI5LDUgKzI5LDUgQEAg
ZXh0ZXJuIHZvaWQgaW5pdGlhbGl6ZV90dW5pbmcodm9pZCk7PGJyPsKgZXh0ZXJuIHZvaWQgdHVu
aW5nX3VwZGF0ZV9kaXNwbGF5KHZvaWQpOzxicj7CoGV4dGVybiB2b2lkIHJlcG9ydF9zaG93X3R1
bmFibGVzKHZvaWQpOzxicj7CoGV4dGVybiB2b2lkIGNsZWFyX3R1bmluZyh2b2lkKTs8YnI+LWV4
dGVybiB2b2lkIGF1dG9fdG9nZ2xlX3R1bmluZyh2b2lkKTs8YnI+K2V4dGVybiB2b2lkIGF1dG9f
dG9nZ2xlX3R1bmluZyhpbnQpOzxicj7CoCNlbmRpZjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============2921438244766060832==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop_auto_untune.diff"

ZGlmZiAtLWdpdCBhL3NyYy9tYWluLmNwcCBiL3NyYy9tYWluLmNwcAppbmRleCBjYmI3YTRlLi42
YzIzZjU4IDEwMDY0NAotLS0gYS9zcmMvbWFpbi5jcHAKKysrIGIvc3JjL21haW4uY3BwCkBAIC03
NSw2ICs3NSw3IEBAIHZvaWQgKCp1aV9ub3RpZnlfdXNlcikgKGNvbnN0IGNoYXIgKmZybXQsIC4u
Lik7CiAKIGVudW0gewogCU9QVF9BVVRPX1RVTkUgPSBDSEFSX01BWCArIDEsCisJT1BUX0FVVE9f
VU5UVU5FLAogCU9QVF9FWFRFQ0gsCiAJT1BUX0RFQlVHCiB9OwpAQCAtODMsNiArODQsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBsb25nX29wdGlvbnNbXSA9CiB7CiAJLyogVGhlc2Ug
b3B0aW9ucyBzZXQgYSBmbGFnLiAqLwogCXsiYXV0by10dW5lIiwJbm9fYXJndW1lbnQsCQlOVUxM
LAkJIE9QVF9BVVRPX1RVTkV9LAorCXsiYXV0by11bnR1bmUiLAlub19hcmd1bWVudCwJCU5VTEws
CQkgT1BUX0FVVE9fVU5UVU5FfSwKIAl7ImNhbGlicmF0ZSIsCW5vX2FyZ3VtZW50LAkJTlVMTCwJ
CSAnYyd9LAogCXsiY3N2IiwJCW9wdGlvbmFsX2FyZ3VtZW50LAlOVUxMLAkJICdDJ30sCiAJeyJk
ZWJ1ZyIsCW5vX2FyZ3VtZW50LAkJJmRlYnVnX2xlYXJuaW5nLCBPUFRfREVCVUd9LApAQCAtNDU0
LDYgKzQ1NiwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCQlsZWF2ZV9w
b3dlcnRvcCA9IDE7CiAJCQl1aV9ub3RpZnlfdXNlciA9IHVpX25vdGlmeV91c2VyX2NvbnNvbGU7
CiAJCQlicmVhazsKKwkJY2FzZSBPUFRfQVVUT19VTlRVTkU6CisJCQlhdXRvX3R1bmUgPSAyOwor
CQkJbGVhdmVfcG93ZXJ0b3AgPSAxOworCQkJdWlfbm90aWZ5X3VzZXIgPSB1aV9ub3RpZnlfdXNl
cl9jb25zb2xlOworCQkJYnJlYWs7CiAJCWNhc2UgJ2MnOgogCQkJcG93ZXJ0b3BfaW5pdCgwKTsK
IAkJCWNhbGlicmF0ZSgpOwpAQCAtNTQ1LDcgKzU1Miw3IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikKIAkJdHVuaW5nX3VwZGF0ZV9kaXNwbGF5KCk7CiAJCXNob3dfdGFiKDApOwog
CX0gZWxzZSB7Ci0JCWF1dG9fdG9nZ2xlX3R1bmluZygpOworCQlhdXRvX3RvZ2dsZV90dW5pbmco
YXV0b190dW5lKTsKIAl9CiAKIAl3aGlsZSAoIWxlYXZlX3Bvd2VydG9wKSB7CmRpZmYgLS1naXQg
YS9zcmMvdHVuaW5nL3R1bmluZy5jcHAgYi9zcmMvdHVuaW5nL3R1bmluZy5jcHAKaW5kZXggYTU0
YThjYS4uNGQyM2FlMyAxMDA2NDQKLS0tIGEvc3JjL3R1bmluZy90dW5pbmcuY3BwCisrKyBiL3Ny
Yy90dW5pbmcvdHVuaW5nLmNwcApAQCAtMzE2LDEwICszMTYsMTEgQEAgdm9pZCBjbGVhcl90dW5p
bmcoKQogCWFsbF91bnR1bmFibGVzLmNsZWFyKCk7CiB9CiAKLXZvaWQgYXV0b190b2dnbGVfdHVu
aW5nKCkKK3ZvaWQgYXV0b190b2dnbGVfdHVuaW5nKGludCBhdXRvX3R1bmUpCiB7CisgIGludCBm
bGFnID0gYXV0b190dW5lID09IDEgPyBUVU5FX0JBRCA6IFRVTkVfR09PRDsKIAlmb3IgKHVuc2ln
bmVkIGludCBpID0gMDsgaSA8IGFsbF90dW5hYmxlcy5zaXplKCk7IGkrKykgewotCQlpZiAoYWxs
X3R1bmFibGVzW2ldLT5nb29kX2JhZCgpID09IFRVTkVfQkFEKQorCQlpZiAoYWxsX3R1bmFibGVz
W2ldLT5nb29kX2JhZCgpID09IGZsYWcpCiAJCQlhbGxfdHVuYWJsZXNbaV0tPnRvZ2dsZSgpOwog
CX0KIH0KZGlmZiAtLWdpdCBhL3NyYy90dW5pbmcvdHVuaW5nLmggYi9zcmMvdHVuaW5nL3R1bmlu
Zy5oCmluZGV4IGY3MDAwMWIuLmZlM2RhNzYgMTAwNjQ0Ci0tLSBhL3NyYy90dW5pbmcvdHVuaW5n
LmgKKysrIGIvc3JjL3R1bmluZy90dW5pbmcuaApAQCAtMjksNSArMjksNSBAQCBleHRlcm4gdm9p
ZCBpbml0aWFsaXplX3R1bmluZyh2b2lkKTsKIGV4dGVybiB2b2lkIHR1bmluZ191cGRhdGVfZGlz
cGxheSh2b2lkKTsKIGV4dGVybiB2b2lkIHJlcG9ydF9zaG93X3R1bmFibGVzKHZvaWQpOwogZXh0
ZXJuIHZvaWQgY2xlYXJfdHVuaW5nKHZvaWQpOwotZXh0ZXJuIHZvaWQgYXV0b190b2dnbGVfdHVu
aW5nKHZvaWQpOworZXh0ZXJuIHZvaWQgYXV0b190b2dnbGVfdHVuaW5nKGludCk7CiAjZW5kaWYK

--===============2921438244766060832==--

