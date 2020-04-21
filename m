Content-Type: multipart/mixed; boundary="===============0655205024922895416=="
MIME-Version: 1.0
From: Michael Vetter <mvetter at suse.com>
Subject: [Powertop] closedir patch
Date: Tue, 21 Apr 2020 08:18:49 +0200
Message-ID: <20200421081849.73090b0e@maitreya>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============0655205024922895416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In case `dir` is NULL we should not call `closedir()` since it's
behaviour is implementation specific.

Patch attached. Please apply with `git am <
powertop-only-closedir.patch`.

--===============0655205024922895416==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="powertop-only-closedir.patch"

RnJvbSA1NTMyOTQ4MTM2MzVjMDc0MjMwYTlkOGJhMGQ3NzM2YzIzZjE1ZGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWVsIFZldHRlciA8anViYWxoQGlvZG9ydS5vcmc+CkRh
dGU6IFR1ZSwgMyBTZXAgMjAxOSAxMjo1NjowNCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGludGVs
X2NwdXMuY3BwOiBPbmx5IGNhbGwgY2xvc2VkaXIoKSBpZiBvcGVuZWQKCkluIGNhc2UgYGRpcmAg
aXMgTlVMTCB3ZSBzaG91bGQgbm90IGNhbGwgYGNsb3NlZGlyKClgIHNpbmNlIGl0J3MKYmVoYXZp
b3VyIGlzIGltcGxlbWVudGF0aW9uIHNwZWNpZmljLgotLS0KIHNyYy9jcHUvaW50ZWxfY3B1cy5j
cHAgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvY3B1L2ludGVsX2NwdXMuY3BwIGIvc3JjL2NwdS9p
bnRlbF9jcHVzLmNwcAppbmRleCA0ZGZmYWRjLi5hZjQ3M2VlIDEwMDY0NAotLS0gYS9zcmMvY3B1
L2ludGVsX2NwdXMuY3BwCisrKyBiL3NyYy9jcHUvaW50ZWxfY3B1cy5jcHAKQEAgLTE0MiwxMSAr
MTQyLDEyIEBAIGludGVsX3V0aWw6OmludGVsX3V0aWwoKQogdm9pZCBpbnRlbF91dGlsOjpieXRf
aGFzX2FoY2koKQogewogCWRpciA9IG9wZW5kaXIoIi9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6
MDA6MTMuMCIpOwotICAgICAgICBpZiAoIWRpcikKLSAgICAgICAgICAgICAgICBieXRfYWhjaV9z
dXBwb3J0PTA7Ci0JZWxzZQorCWlmICghZGlyKQorCQlieXRfYWhjaV9zdXBwb3J0PTA7CisJZWxz
ZSB7CiAJCWJ5dF9haGNpX3N1cHBvcnQ9MTsKLSAgICAgICAgY2xvc2VkaXIoZGlyKTsKKwkJY2xv
c2VkaXIoZGlyKTsKKwl9CiB9CiAKIGludCBpbnRlbF91dGlsOjpnZXRfYnl0X2FoY2lfc3VwcG9y
dCgpCg==

--===============0655205024922895416==--

