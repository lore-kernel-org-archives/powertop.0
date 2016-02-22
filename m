Content-Type: multipart/mixed; boundary="===============1442281359186259328=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] Fixed bug when all PCI devices usage is
 shown as 00%
Date: Mon, 22 Feb 2016 17:34:15 +0300
Message-ID: <CADS+iDUdQDE1-6MkQbfchzS6DcxLO3YJQi46Zwzu7mYaVYosNw@mail.gmail.com>
In-Reply-To: CADS+iDVzfppVyeV=SN8H4NfyLV48wxx53SoHneKc+YNc7OUeZA@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1442281359186259328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oops, it seems that I've forgot to use sizeof, here is fixed patch:
 src/devices/runtime_pm.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
index ccfd945..26f9d32 100644
--- a/src/devices/runtime_pm.cpp
+++ b/src/devices/runtime_pm.cpp
@@ -194,6 +194,7 @@ static void do_bus(const char *bus)
         if (entry->d_name[0] =3D=3D '.')
             continue;

+        snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s",
bus, entry->d_name);
         dev =3D new class runtime_pmdevice(entry->d_name, filename);

         if (strcmp(bus, "i2c") =3D=3D 0) {


2016-02-22 17:27 GMT+03:00 Yaroslav Isakov <yaroslav.isakov(a)gmail.com>:

>  src/devices/runtime_pm.cpp | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
> index ccfd945..f387b21 100644
> --- a/src/devices/runtime_pm.cpp
> +++ b/src/devices/runtime_pm.cpp
> @@ -194,6 +194,7 @@ static void do_bus(const char *bus)
>          if (entry->d_name[0] =3D=3D '.')
>              continue;
>
> +        snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s", bus,
> entry->d_name);
>          dev =3D new class runtime_pmdevice(entry->d_name, filename);
>
>          if (strcmp(bus, "i2c") =3D=3D 0) {
>
>

--===============1442281359186259328==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+T29wcywgaXQgc2VlbXMgdGhhdCBJJiMzOTt2ZSBmb3Jnb3QgdG8gdXNl
IHNpemVvZiwgaGVyZSBpcyBmaXhlZCBwYXRjaDo8YnI+wqBzcmMvZGV2aWNlcy9ydW50aW1lX3Bt
LmNwcCB8IDEgKzxicj7CoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKTxicj48YnI+ZGlm
ZiAtLWdpdCBhL3NyYy9kZXZpY2VzL3J1bnRpbWVfcG0uY3BwIGIvc3JjL2RldmljZXMvcnVudGlt
ZV9wbS5jcHA8YnI+aW5kZXggY2NmZDk0NS4uMjZmOWQzMiAxMDA2NDQ8YnI+LS0tIGEvc3JjL2Rl
dmljZXMvcnVudGltZV9wbS5jcHA8YnI+KysrIGIvc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHA8
YnI+QEAgLTE5NCw2ICsxOTQsNyBAQCBzdGF0aWMgdm9pZCBkb19idXMoY29uc3QgY2hhciAqYnVz
KTxicj7CoMKgwqDCoCDCoMKgwqAgaWYgKGVudHJ5LSZndDtkX25hbWVbMF0gPT0gJiMzOTsuJiMz
OTspPGJyPsKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgY29udGludWU7PGJyPsKgPGJyPivCoMKgwqAg
wqDCoMKgIHNucHJpbnRmKGZpbGVuYW1lLCBzaXplb2YoZmlsZW5hbWUpLCAmcXVvdDsvc3lzL2J1
cy8lcy9kZXZpY2VzLyVzJnF1b3Q7LCBidXMsIGVudHJ5LSZndDtkX25hbWUpOzxicj7CoMKgwqDC
oCDCoMKgwqAgZGV2ID0gbmV3IGNsYXNzIHJ1bnRpbWVfcG1kZXZpY2UoZW50cnktJmd0O2RfbmFt
ZSwgZmlsZW5hbWUpOzxicj7CoDxicj7CoMKgwqDCoCDCoMKgwqAgaWYgKHN0cmNtcChidXMsICZx
dW90O2kyYyZxdW90OykgPT0gMCkgezxicj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0
cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+MjAxNi0wMi0yMiAxNzoyNyBHTVQrMDM6
MDAgWWFyb3NsYXYgSXNha292IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnlh
cm9zbGF2LmlzYWtvdkBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj55YXJvc2xhdi5pc2Frb3ZA
Z21haWwuY29tPC9hPiZndDs8L3NwYW4+Ojxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtw
YWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj7CoHNyYy9kZXZpY2VzL3J1bnRpbWVfcG0u
Y3BwIHwgMSArPGJyPsKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspPGJyPjxicj5kaWZm
IC0tZ2l0IGEvc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHAgYi9zcmMvZGV2aWNlcy9ydW50aW1l
X3BtLmNwcDxicj5pbmRleCBjY2ZkOTQ1Li5mMzg3YjIxIDEwMDY0NDxicj4tLS0gYS9zcmMvZGV2
aWNlcy9ydW50aW1lX3BtLmNwcDxicj4rKysgYi9zcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcDxi
cj5AQCAtMTk0LDYgKzE5NCw3IEBAIHN0YXRpYyB2b2lkIGRvX2J1cyhjb25zdCBjaGFyICpidXMp
PGJyPsKgwqDCoMKgIMKgwqDCoCBpZiAoZW50cnktJmd0O2RfbmFtZVswXSA9PSAmIzM5Oy4mIzM5
Oyk8YnI+wqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjb250aW51ZTs8YnI+wqA8YnI+K8KgwqDCoCDC
oMKgwqAgc25wcmludGYoZmlsZW5hbWUsIFBBVEhfTUFYLCAmcXVvdDsvc3lzL2J1cy8lcy9kZXZp
Y2VzLyVzJnF1b3Q7LCBidXMsIGVudHJ5LSZndDtkX25hbWUpOzxicj7CoMKgwqDCoCDCoMKgwqAg
ZGV2ID0gbmV3IGNsYXNzIHJ1bnRpbWVfcG1kZXZpY2UoZW50cnktJmd0O2RfbmFtZSwgZmlsZW5h
bWUpOzxicj7CoDxicj7CoMKgwqDCoCDCoMKgwqAgaWYgKHN0cmNtcChidXMsICZxdW90O2kyYyZx
dW90OykgPT0gMCkgezxicj48YnI+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+
Cg==

--===============1442281359186259328==--

