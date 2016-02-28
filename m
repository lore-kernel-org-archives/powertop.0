Content-Type: multipart/mixed; boundary="===============0530694756147986494=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: Re: [Powertop] [PATCH 2/2] Fixed bug when all PCI devices usage is
 shown as 00%
Date: Sun, 28 Feb 2016 08:47:37 +0300
Message-ID: <CADS+iDXynQ=O1PZfomVMNLh796Dscn_DZuFjhuw8hB_h4j0Tfg@mail.gmail.com>
In-Reply-To: CADS+iDUdQDE1-6MkQbfchzS6DcxLO3YJQi46Zwzu7mYaVYosNw@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0530694756147986494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It seems that my mailer wraps the patch, so I'm attaching it to this e-mail

2016-02-22 17:34 GMT+03:00 Yaroslav Isakov <yaroslav.isakov(a)gmail.com>:

> Oops, it seems that I've forgot to use sizeof, here is fixed patch:
>  src/devices/runtime_pm.cpp | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
> index ccfd945..26f9d32 100644
> --- a/src/devices/runtime_pm.cpp
> +++ b/src/devices/runtime_pm.cpp
> @@ -194,6 +194,7 @@ static void do_bus(const char *bus)
>          if (entry->d_name[0] =3D=3D '.')
>              continue;
>
> +        snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s",
> bus, entry->d_name);
>          dev =3D new class runtime_pmdevice(entry->d_name, filename);
>
>          if (strcmp(bus, "i2c") =3D=3D 0) {
>
>
> 2016-02-22 17:27 GMT+03:00 Yaroslav Isakov <yaroslav.isakov(a)gmail.com>:
>
>>  src/devices/runtime_pm.cpp | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/src/devices/runtime_pm.cpp b/src/devices/runtime_pm.cpp
>> index ccfd945..f387b21 100644
>> --- a/src/devices/runtime_pm.cpp
>> +++ b/src/devices/runtime_pm.cpp
>> @@ -194,6 +194,7 @@ static void do_bus(const char *bus)
>>          if (entry->d_name[0] =3D=3D '.')
>>              continue;
>>
>> +        snprintf(filename, PATH_MAX, "/sys/bus/%s/devices/%s", bus,
>> entry->d_name);
>>          dev =3D new class runtime_pmdevice(entry->d_name, filename);
>>
>>          if (strcmp(bus, "i2c") =3D=3D 0) {
>>
>>
>

--===============0530694756147986494==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SXQgc2VlbXMgdGhhdCBteSBtYWlsZXIgd3JhcHMgdGhlIHBhdGNoLCBz
byBJJiMzOTttIGF0dGFjaGluZyBpdCB0byB0aGlzIGUtbWFpbDxicj48L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4yMDE2LTAyLTIyIDE3
OjM0IEdNVCswMzowMCBZYXJvc2xhdiBJc2Frb3YgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVm
PSJtYWlsdG86eWFyb3NsYXYuaXNha292QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnlhcm9z
bGF2LmlzYWtvdkBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj46PGJyPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAj
Y2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPk9vcHMsIGl0IHNlZW1z
IHRoYXQgSSYjMzk7dmUgZm9yZ290IHRvIHVzZSBzaXplb2YsIGhlcmUgaXMgZml4ZWQgcGF0Y2g6
PHNwYW4gY2xhc3M9IiI+PGJyPsKgc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHAgfCAxICs8YnI+
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyk8YnI+PGJyPmRpZmYgLS1naXQgYS9zcmMv
ZGV2aWNlcy9ydW50aW1lX3BtLmNwcCBiL3NyYy9kZXZpY2VzL3J1bnRpbWVfcG0uY3BwPGJyPjwv
c3Bhbj5pbmRleCBjY2ZkOTQ1Li4yNmY5ZDMyIDEwMDY0NDxzcGFuIGNsYXNzPSIiPjxicj4tLS0g
YS9zcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcDxicj4rKysgYi9zcmMvZGV2aWNlcy9ydW50aW1l
X3BtLmNwcDxicj5AQCAtMTk0LDYgKzE5NCw3IEBAIHN0YXRpYyB2b2lkIGRvX2J1cyhjb25zdCBj
aGFyICpidXMpPGJyPsKgwqDCoMKgIMKgwqDCoCBpZiAoZW50cnktJmd0O2RfbmFtZVswXSA9PSAm
IzM5Oy4mIzM5Oyk8YnI+wqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjb250aW51ZTs8YnI+wqA8YnI+
PC9zcGFuPivCoMKgwqAgwqDCoMKgIHNucHJpbnRmKGZpbGVuYW1lLCBzaXplb2YoZmlsZW5hbWUp
LCAmcXVvdDsvc3lzL2J1cy8lcy9kZXZpY2VzLyVzJnF1b3Q7LCBidXMsIGVudHJ5LSZndDtkX25h
bWUpOzxzcGFuIGNsYXNzPSIiPjxicj7CoMKgwqDCoCDCoMKgwqAgZGV2ID0gbmV3IGNsYXNzIHJ1
bnRpbWVfcG1kZXZpY2UoZW50cnktJmd0O2RfbmFtZSwgZmlsZW5hbWUpOzxicj7CoDxicj7CoMKg
wqDCoCDCoMKgwqAgaWYgKHN0cmNtcChidXMsICZxdW90O2kyYyZxdW90OykgPT0gMCkgezxicj48
YnI+PC9zcGFuPjwvZGl2PjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjIwMTYtMDIt
MjIgMTc6MjcgR01UKzAzOjAwIFlhcm9zbGF2IElzYWtvdiA8c3BhbiBkaXI9Imx0ciI+Jmx0Ozxh
IGhyZWY9Im1haWx0bzp5YXJvc2xhdi5pc2Frb3ZAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
eWFyb3NsYXYuaXNha292QGdtYWlsLmNvbTwvYT4mZ3Q7PC9zcGFuPjo8YnI+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+wqBzcmMvZGV2
aWNlcy9ydW50aW1lX3BtLmNwcCB8IDEgKzxicj7CoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKTxicj48YnI+ZGlmZiAtLWdpdCBhL3NyYy9kZXZpY2VzL3J1bnRpbWVfcG0uY3BwIGIvc3Jj
L2RldmljZXMvcnVudGltZV9wbS5jcHA8YnI+aW5kZXggY2NmZDk0NS4uZjM4N2IyMSAxMDA2NDQ8
YnI+LS0tIGEvc3JjL2RldmljZXMvcnVudGltZV9wbS5jcHA8YnI+KysrIGIvc3JjL2RldmljZXMv
cnVudGltZV9wbS5jcHA8YnI+QEAgLTE5NCw2ICsxOTQsNyBAQCBzdGF0aWMgdm9pZCBkb19idXMo
Y29uc3QgY2hhciAqYnVzKTxicj7CoMKgwqDCoCDCoMKgwqAgaWYgKGVudHJ5LSZndDtkX25hbWVb
MF0gPT0gJiMzOTsuJiMzOTspPGJyPsKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgY29udGludWU7PGJy
PsKgPGJyPivCoMKgwqAgwqDCoMKgIHNucHJpbnRmKGZpbGVuYW1lLCBQQVRIX01BWCwgJnF1b3Q7
L3N5cy9idXMvJXMvZGV2aWNlcy8lcyZxdW90OywgYnVzLCBlbnRyeS0mZ3Q7ZF9uYW1lKTs8YnI+
wqDCoMKgwqAgwqDCoMKgIGRldiA9IG5ldyBjbGFzcyBydW50aW1lX3BtZGV2aWNlKGVudHJ5LSZn
dDtkX25hbWUsIGZpbGVuYW1lKTs8YnI+wqA8YnI+wqDCoMKgwqAgwqDCoMKgIGlmIChzdHJjbXAo
YnVzLCAmcXVvdDtpMmMmcXVvdDspID09IDApIHs8YnI+PGJyPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+
PC9kaXY+PGJyPjwvZGl2Pgo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2
Pgo=

--===============0530694756147986494==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0002-Fixed-bug-when-all-PCI-devices-usage-is-shown-as-00.patch"

RnJvbSAyNWJhYjBiNTIxMjc3N2RjYmQzZWZhYzhiZjJkZDJmMjEzMDVjZThjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYXJvc2xhdiBJc2Frb3YgPHlhcm9zbGF2LmlzYWtvdkBnbWFp
bC5jb20+CkRhdGU6IE1vbiwgMjIgRmViIDIwMTYgMTc6MTc6NTcgKzAzMDAKU3ViamVjdDogW1BB
VENIIDIvMl0gRml4ZWQgYnVnIHdoZW4gYWxsIFBDSSBkZXZpY2VzIHVzYWdlIGlzIHNob3duIGFz
IDAwJQoKLS0tCiBzcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcCB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc3JjL2RldmljZXMvcnVudGltZV9wbS5j
cHAgYi9zcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcAppbmRleCBjY2ZkOTQ1Li4yNmY5ZDMyIDEw
MDY0NAotLS0gYS9zcmMvZGV2aWNlcy9ydW50aW1lX3BtLmNwcAorKysgYi9zcmMvZGV2aWNlcy9y
dW50aW1lX3BtLmNwcApAQCAtMTk0LDYgKzE5NCw3IEBAIHN0YXRpYyB2b2lkIGRvX2J1cyhjb25z
dCBjaGFyICpidXMpCiAJCWlmIChlbnRyeS0+ZF9uYW1lWzBdID09ICcuJykKIAkJCWNvbnRpbnVl
OwogCisJCXNucHJpbnRmKGZpbGVuYW1lLCBzaXplb2YoZmlsZW5hbWUpLCAiL3N5cy9idXMvJXMv
ZGV2aWNlcy8lcyIsIGJ1cywgZW50cnktPmRfbmFtZSk7CiAJCWRldiA9IG5ldyBjbGFzcyBydW50
aW1lX3BtZGV2aWNlKGVudHJ5LT5kX25hbWUsIGZpbGVuYW1lKTsKIAogCQlpZiAoc3RyY21wKGJ1
cywgImkyYyIpID09IDApIHsKLS0gCjIuNC4xMAoK

--===============0530694756147986494==--

