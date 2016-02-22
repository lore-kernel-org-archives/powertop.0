Content-Type: multipart/mixed; boundary="===============2380373488836080249=="
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov at gmail.com>
Subject: [Powertop] [PATCH 0/2] Few fixes
Date: Mon, 22 Feb 2016 17:24:40 +0300
Message-ID: <CADS+iDU4_6EEgwCXehcfssbgDX8OAgO_gLaDnSt7KKZ51RdFsA@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2380373488836080249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello! I've found two bugs in powertop. First one is that only first audio
card will be shown in Devices stats tab. Second one is that all PCI devices
shows usage as 00% in the same tab. Here are the patches against commit
180ac4fd196d169cd788ab13ccadf365d75d986b:

Yaroslav Isakov (2):
  Detect all audio cards in the system (not only card0)
  Fixed bug when all PCI devices usage is shown as 00%

 src/devices/alsa.cpp       | 6 +++---
 src/devices/runtime_pm.cpp | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

--===============2380373488836080249==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGVsbG8hIEkmIzM5O3ZlIGZvdW5kIHR3byBidWdzIGluIHBvd2VydG9w
LiBGaXJzdCBvbmUgaXMgdGhhdCBvbmx5IGZpcnN0IGF1ZGlvIGNhcmQgd2lsbCBiZSBzaG93biBp
biBEZXZpY2VzIHN0YXRzIHRhYi4gU2Vjb25kIG9uZSBpcyB0aGF0IGFsbCBQQ0kgZGV2aWNlcyBz
aG93cyB1c2FnZSBhcyAwMCUgaW4gdGhlIHNhbWUgdGFiLiBIZXJlIGFyZSB0aGUgcGF0Y2hlcyBh
Z2FpbnN0IGNvbW1pdCA8YnI+MTgwYWM0ZmQxOTZkMTY5Y2Q3ODhhYjEzY2NhZGYzNjVkNzVkOTg2
Yjo8YnI+PGJyPllhcm9zbGF2IElzYWtvdiAoMik6PGJyPsKgIERldGVjdCBhbGwgYXVkaW8gY2Fy
ZHMgaW4gdGhlIHN5c3RlbSAobm90IG9ubHkgY2FyZDApPGJyPsKgIEZpeGVkIGJ1ZyB3aGVuIGFs
bCBQQ0kgZGV2aWNlcyB1c2FnZSBpcyBzaG93biBhcyAwMCU8YnI+PGJyPsKgc3JjL2RldmljZXMv
YWxzYS5jcHDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLTxicj7CoHNyYy9kZXZpY2VzL3J1bnRpbWVf
cG0uY3BwIHwgMSArPGJyPsKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pPGJyPjxicj48L2Rpdj4K

--===============2380373488836080249==--

