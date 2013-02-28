Content-Type: multipart/mixed; boundary="===============2984413280434263904=="
MIME-Version: 1.0
From: Ganapati Bhat <life.mytake at gmail.com>
Subject: [Powertop] Seg Fault due to function format_watts in file src/lib.cpp
Date: Thu, 28 Feb 2013 14:45:04 +0530
Message-ID: <CABa1t5xZAVYvWagoJR8n-K1iMUZGSJzWtsfmm3HC-FXF-B9hXw@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============2984413280434263904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear All,

I was compiling powertop as an Android external module and using the option
powertop --html. However, there used to be a segmentation fault. When i
looked into it, I observed that in the function format_watts in
src/lib.cpp, the last argument to mbstows was zero. By changing the
argument to len, which is itself an argument to the function format_watts,
powertop worked properly? Does this also happen on an x86 machine? ( I am
unable to verify this due to some problems in my laptop which I have not
yet resolved.) If not then can someone explain to me why is it happening in
the case of android?

Thanks and Regards,

Ganapati

--===============2984413280434263904==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+RGVhciBBbGwsPGRpdj48YnI+PC9kaXY+PGRpdj5JIHdhcyBjb21waWxp
bmcgcG93ZXJ0b3AgYXMgYW4gQW5kcm9pZCBleHRlcm5hbCBtb2R1bGUgYW5kIHVzaW5nIHRoZSBv
cHRpb24gcG93ZXJ0b3AgLS1odG1sLiBIb3dldmVyLCB0aGVyZSB1c2VkIHRvIGJlIGEgc2VnbWVu
dGF0aW9uIGZhdWx0LiBXaGVuIGkgbG9va2VkIGludG8gaXQsIEkgb2JzZXJ2ZWQgdGhhdCBpbiB0
aGUgZnVuY3Rpb24gZm9ybWF0X3dhdHRzIGluIHNyYy9saWIuY3BwLCB0aGUgbGFzdKBhcmd1bWVu
dKB0byBtYnN0b3dzIHdhcyB6ZXJvLiBCeSBjaGFuZ2luZyB0aGUgYXJndW1lbnQgdG8gbGVuLCB3
aGljaCBpcyBpdHNlbGYgYW4gYXJndW1lbnQgdG8gdGhlIGZ1bmN0aW9uIGZvcm1hdF93YXR0cywg
cG93ZXJ0b3Agd29ya2VkIHByb3Blcmx5PyBEb2VzIHRoaXMgYWxzbyBoYXBwZW4gb24gYW4geDg2
IG1hY2hpbmU/ICggSSBhbSB1bmFibGUgdG8gdmVyaWZ5IHRoaXMgZHVlIHRvIHNvbWUgcHJvYmxl
bXMgaW4gbXkgbGFwdG9wIHdoaWNoIEkgaGF2ZSBub3QgeWV0IHJlc29sdmVkLikgSWYgbm90IHRo
ZW4gY2FuIHNvbWVvbmUgZXhwbGFpbiB0byBtZSB3aHkgaXMgaXQgaGFwcGVuaW5nIGluIHRoZSBj
YXNlIG9mIGFuZHJvaWQ/PC9kaXY+CjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5bGU+VGhhbmtzIGFu
ZCBSZWdhcmRzLDwvZGl2PjxkaXYgc3R5bGU+PGJyPjwvZGl2PjxkaXYgc3R5bGU+R2FuYXBhdGk8
L2Rpdj4KPC9kaXY+Cg==

--===============2984413280434263904==--

