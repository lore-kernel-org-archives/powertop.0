Content-Type: multipart/mixed; boundary="===============6260076950279778734=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: [Powertop] [PATCH 2/2] Fixed bug when all PCI devices usage is shown
 as 00%
Date: Mon, 22 Feb 2016 17:27:42 +0300
Message-ID: <CADS+iDVzfppVyeV=SN8H4NfyLV48wxx53SoHneKc+YNc7OUeZA@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6260076950279778734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

 src/devices/runtime_pm.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index ccfd945..f387b21 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -194,6 +194,7 @@ static void do_bus(const char *bus)
         if (entry->d_name[0] =3D=3D '.')
             continue;

+        snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s", bus,
entry->d_name);
         dev =3D new class runtime_pmdevice(entry->d_name, filename);

         if (strcmp(bus, "i2c") =3D=3D 0) {

--===============6260076950279778734==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+wqBzcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcCB8IDEgKzxicj7CoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKTxicj48YnI+ZGlmZiAtLWdpdCBhL3NyYy9kZXZp
Y2VzL3J1bnRpbWVfcG0uY3BwIGIvc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHA8YnI+aW5kZXgg
Y2NmZDk0NS4uZjM4N2IyMSAxMDA2NDQ8YnI+LS0tIGEvc3JjL2RldmljZXMvcnVudGltZV9wbS5j
cHA8YnI+KysrIGIvc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHA8YnI+QEAgLTE5NCw2ICsxOTQs
NyBAQCBzdGF0aWMgdm9pZCBkb19idXMoY29uc3QgY2hhciAqYnVzKTxicj7CoMKgwqDCoCDCoMKg
wqAgaWYgKGVudHJ5LSZndDtkX25hbWVbMF0gPT0gJiMzOTsuJiMzOTspPGJyPsKgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgY29udGludWU7PGJyPsKgPGJyPivCoMKgwqAgwqDCoMKgIHNucHJpbnRmKGZp
bGVuYW1lLCBQQVRIX01BWCwgJnF1b3Q7L3N5cy9idXMvJXMvZGV2aWNlcy8lcyZxdW90OywgYnVz
LCBlbnRyeS0mZ3Q7ZF9uYW1lKTs8YnI+wqDCoMKgwqAgwqDCoMKgIGRldiA9IG5ldyBjbGFzcyBy
dW50aW1lX3BtZGV2aWNlKGVudHJ5LSZndDtkX25hbWUsIGZpbGVuYW1lKTs8YnI+wqA8YnI+wqDC
oMKgwqAgwqDCoMKgIGlmIChzdHJjbXAoYnVzLCAmcXVvdDtpMmMmcXVvdDspID09IDApIHs8YnI+
PGJyPjwvZGl2Pgo=

--===============6260076950279778734==--

