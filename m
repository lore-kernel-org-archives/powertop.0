Content-Type: multipart/mixed; boundary="===============5075092185338586344=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: [Powertop] [PATCH 1/2] Detect all audio cards in the system (not only
 card0)
Date: Mon, 22 Feb 2016 17:27:01 +0300
Message-ID: <CADS+iDU83nRp03q91UTdD2iQaopH4oUbEm3VchDnm4r=dcG_Ew@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5075092185338586344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

 src/devices/alsa.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/devices/alsa.cpp b/src/devices/alsa.cpp
index 425b58a..f7ba2b6 100644
--- a/src/devices/alsa.cpp
+++ b/src/devices/alsa.cpp
@@ -158,11 +158,11 @@ static void create_all_alsa_callback(const char
*d_name)
     if (strncmp(d_name, "hwC", 3) !=3D 0)
         return;

-    snprintf(filename, sizeof(filename),
"/sys/class/sound/card0/%s/power_on_acct", d_name);
+    snprintf(filename, sizeof(filename),
"/sys/class/sound/%s/power_on_acct", d_name);
     if (access(filename, R_OK) !=3D 0)
         return;

-    snprintf(filename, sizeof(filename), "/sys/class/sound/card0/%s",
d_name);
+    snprintf(filename, sizeof(filename), "/sys/class/sound/%s", d_name);
     bl =3D new class alsa(d_name, filename);
     all_devices.push_back(bl);
     register_parameter("alsa-codec-power", 0.5);
@@ -170,7 +170,7 @@ static void create_all_alsa_callback(const char *d_name)

 void create_all_alsa(void)
 {
-    process_directory("/sys/class/sound/card0/", create_all_alsa_callback);
+    process_directory("/sys/class/sound/", create_all_alsa_callback);
 }

 double alsa::power_usage(struct result_bundle *result, struct
parameter_bundle *bundle)

--===============5075092185338586344==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+wqBzcmMvZGV2aWNlcy9hbHNhLmNwcCB8IDYgKysrLS0tPGJyPsKgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSk8YnI+PGJyPmRpZmYg
LS1naXQgYS9zcmMvZGV2aWNlcy9hbHNhLmNwcCBiL3NyYy9kZXZpY2VzL2Fsc2EuY3BwPGJyPmlu
ZGV4IDQyNWI1OGEuLmY3YmEyYjYgMTAwNjQ0PGJyPi0tLSBhL3NyYy9kZXZpY2VzL2Fsc2EuY3Bw
PGJyPisrKyBiL3NyYy9kZXZpY2VzL2Fsc2EuY3BwPGJyPkBAIC0xNTgsMTEgKzE1OCwxMSBAQCBz
dGF0aWMgdm9pZCBjcmVhdGVfYWxsX2Fsc2FfY2FsbGJhY2soY29uc3QgY2hhciAqZF9uYW1lKTxi
cj7CoMKgwqDCoCBpZiAoc3RybmNtcChkX25hbWUsICZxdW90O2h3QyZxdW90OywgMykgIT0gMCk8
YnI+wqDCoMKgwqAgwqDCoMKgIHJldHVybjs8YnI+wqA8YnI+LcKgwqDCoCBzbnByaW50ZihmaWxl
bmFtZSwgc2l6ZW9mKGZpbGVuYW1lKSwgJnF1b3Q7L3N5cy9jbGFzcy9zb3VuZC9jYXJkMC8lcy9w
b3dlcl9vbl9hY2N0JnF1b3Q7LCBkX25hbWUpOzxicj4rwqDCoMKgIHNucHJpbnRmKGZpbGVuYW1l
LCBzaXplb2YoZmlsZW5hbWUpLCAmcXVvdDsvc3lzL2NsYXNzL3NvdW5kLyVzL3Bvd2VyX29uX2Fj
Y3QmcXVvdDssIGRfbmFtZSk7PGJyPsKgwqDCoMKgIGlmIChhY2Nlc3MoZmlsZW5hbWUsIFJfT0sp
ICE9IDApPGJyPsKgwqDCoMKgIMKgwqDCoCByZXR1cm47PGJyPsKgPGJyPi3CoMKgwqAgc25wcmlu
dGYoZmlsZW5hbWUsIHNpemVvZihmaWxlbmFtZSksICZxdW90Oy9zeXMvY2xhc3Mvc291bmQvY2Fy
ZDAvJXMmcXVvdDssIGRfbmFtZSk7PGJyPivCoMKgwqAgc25wcmludGYoZmlsZW5hbWUsIHNpemVv
ZihmaWxlbmFtZSksICZxdW90Oy9zeXMvY2xhc3Mvc291bmQvJXMmcXVvdDssIGRfbmFtZSk7PGJy
PsKgwqDCoMKgIGJsID0gbmV3IGNsYXNzIGFsc2EoZF9uYW1lLCBmaWxlbmFtZSk7PGJyPsKgwqDC
oMKgIGFsbF9kZXZpY2VzLnB1c2hfYmFjayhibCk7PGJyPsKgwqDCoMKgIHJlZ2lzdGVyX3BhcmFt
ZXRlcigmcXVvdDthbHNhLWNvZGVjLXBvd2VyJnF1b3Q7LCAwLjUpOzxicj5AQCAtMTcwLDcgKzE3
MCw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9hbGxfYWxzYV9jYWxsYmFjayhjb25zdCBjaGFyICpk
X25hbWUpPGJyPsKgPGJyPsKgdm9pZCBjcmVhdGVfYWxsX2Fsc2Eodm9pZCk8YnI+wqB7PGJyPi3C
oMKgwqAgcHJvY2Vzc19kaXJlY3RvcnkoJnF1b3Q7L3N5cy9jbGFzcy9zb3VuZC9jYXJkMC8mcXVv
dDssIGNyZWF0ZV9hbGxfYWxzYV9jYWxsYmFjayk7PGJyPivCoMKgwqAgcHJvY2Vzc19kaXJlY3Rv
cnkoJnF1b3Q7L3N5cy9jbGFzcy9zb3VuZC8mcXVvdDssIGNyZWF0ZV9hbGxfYWxzYV9jYWxsYmFj
ayk7PGJyPsKgfTxicj7CoDxicj7CoGRvdWJsZSBhbHNhOjpwb3dlcl91c2FnZShzdHJ1Y3QgcmVz
dWx0X2J1bmRsZSAqcmVzdWx0LCBzdHJ1Y3QgcGFyYW1ldGVyX2J1bmRsZSAqYnVuZGxlKTxicj48
YnI+PC9kaXY+Cg==

--===============5075092185338586344==--

