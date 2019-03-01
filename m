Content-Type: multipart/mixed; boundary="===============5640939026106426242=="
MIME-Version: 1.0
From: Sparr <sparr0 at gmail.com>
Subject: Re: [Powertop] Update on recent segfault issue with powertop
Date: Thu, 28 Feb 2019 21:38:44 -0800
Message-ID: <CANp3UNAtHStkfdiRCMob-2SqZ2ZAKJtE8FWQHswBuX_q5SMbWg@mail.gmail.com>
In-Reply-To: 2824B99DC70CE746926327C52CA42F76487E9C08@ORSMSX111.amr.corp.intel.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5640939026106426242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It appears to also be fixed in 5.0-rc8

On Thu, Feb 28, 2019 at 9:25 PM Kammela, Gayatri <gayatri.kammela(a)intel.c=
om>
wrote:

> Hi,
>
>
>
> As suspected, the segfault issue in stable releases
> (4.20.10/4.20.9/4.20.8) is due to the same patch that caused segfault in
> mainline 5.0-rc6.
>
> Here is the original patch https://lkml.org/lkml/2019/1/10/412  that
> caused the issue. It made in to 4.20.8 (
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-sta=
ble/+/refs/tags/v4.20.8/kernel/events/ring_buffer.c#737
> ) stable release and only fixed in 4.20.11(
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux-sta=
ble/+/refs/tags/v4.20.11/kernel/events/ring_buffer.c#737
> ).
>
>
>
> Thanks to everyone who tested it and reported!
>
>
>
> Thanks ,
>
> Gayatri Kammela
>
>
>

--===============5640939026106426242==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SXQgYXBwZWFycyB0byBhbHNvIGJlIGZpeGVkIGluIDUuMC1yYzg8L2Rp
dj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFp
bF9hdHRyIj5PbiBUaHUsIEZlYiAyOCwgMjAxOSBhdCA5OjI1IFBNIEthbW1lbGEsIEdheWF0cmkg
Jmx0OzxhIGhyZWY9Im1haWx0bzpnYXlhdHJpLmthbW1lbGFAaW50ZWwuY29tIj5nYXlhdHJpLmth
bW1lbGFAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KCgoKCgo8ZGl2
IGxhbmc9IkVOLVVTIj4KPGRpdiBjbGFzcz0iZ21haWwtbV8tODExOTYxOTAxNTc0Njg2OTM3M1dv
cmRTZWN0aW9uMSI+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpLDx1PjwvdT48dT48L3U+PC9wPgo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5BcyBzdXNwZWN0ZWQsIHRoZSBzZWdmYXVsdCBpc3N1ZSBpbiBzdGFibGUgcmVsZWFzZXMg
KDQuMjAuMTAvNC4yMC45LzQuMjAuOCkgaXMgZHVlIHRvIHRoZSBzYW1lIHBhdGNoIHRoYXQgY2F1
c2VkIHNlZ2ZhdWx0IGluIG1haW5saW5lIDUuMC1yYzYuCjx1PjwvdT48dT48L3U+PC9wPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5IZXJlIGlzIHRoZSBvcmlnaW5hbCBwYXRjaCA8YSBocmVmPSJodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOS8xLzEwLzQxMiIgdGFyZ2V0PSJfYmxhbmsiPgpodHRwczov
L2xrbWwub3JnL2xrbWwvMjAxOS8xLzEwLzQxMjwvYT4gwqB0aGF0IGNhdXNlZCB0aGUgaXNzdWUu
IEl0IG1hZGUgaW4gdG8gNC4yMC44ICg8YSBocmVmPSJodHRwczovL2tlcm5lbC5nb29nbGVzb3Vy
Y2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXgtc3RhYmxlLysvcmVm
cy90YWdzL3Y0LjIwLjgva2VybmVsL2V2ZW50cy9yaW5nX2J1ZmZlci5jIzczNyIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUvKy9yZWZzL3RhZ3MvdjQuMjAuOC9rZXJuZWwvZXZl
bnRzL3JpbmdfYnVmZmVyLmMjNzM3PC9hPgogKSBzdGFibGUgcmVsZWFzZSBhbmQgb25seSBmaXhl
ZCBpbiA0LjIwLjExKDxhIGhyZWY9Imh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUvKy9yZWZzL3RhZ3MvdjQu
MjAuMTEva2VybmVsL2V2ZW50cy9yaW5nX2J1ZmZlci5jIzczNyIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0
YWJsZS9saW51eC1zdGFibGUvKy9yZWZzL3RhZ3MvdjQuMjAuMTEva2VybmVsL2V2ZW50cy9yaW5n
X2J1ZmZlci5jIzczNzwvYT4KICkuIDx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MgdG8g
ZXZlcnlvbmUgd2hvIHRlc3RlZCBpdCBhbmQgcmVwb3J0ZWQhPHU+PC91Pjx1PjwvdT48L3A+Cjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPlRoYW5rcyAsPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkdheWF0
cmkgS2FtbWVsYTx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+
wqA8dT48L3U+PC9wPgo8L2Rpdj4KPC9kaXY+Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============5640939026106426242==--

