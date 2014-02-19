Content-Type: multipart/mixed; boundary="===============6550149130864593284=="
MIME-Version: 1.0
From: Wout Mertens <wout.mertens at gmail.com>
Subject: Re: [Powertop] HIgh power concumption on network interface
Date: Wed, 19 Feb 2014 10:13:48 +0100
Message-ID: <CAO3V83KaAWbeeDyW6vOMFihmpk2JNGa-6XQuChUGPW2fpDYqqg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============6550149130864593284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kingma at bluewin.ch wrote on Wed Feb 12 23:32:27 PST 2014:

> I observe a sustained high power consumption of 5- 10 W on the ehternet
adaptor e1000e on a lenovo thinkgpad t430s. Such I high power drain cannot
be correct can it? the total power consumption is around 25 W which is a
concern for battery life.

I'm noticing the same thing on my Dell Latitude E6540. It also has an e1000
and powertop reports it as being the highest consumer, at around 15W. When
I unplug the system, the battery reports a drain of about 20W while idle
which is pretty bad IMHO. With the 68Wh battery it translates to about 2.5
hours battery life.

Lowest I've seen for battery drain is 14W, with the screen at lowest
brightness, Google Chrome turned off, disk spun down. I'm using the
built-in Intel graphics and the system has 16GB of ram and a quad-core i7.

I never ran windows on this laptop so I don't know what to expect but
reviews are claiming 7+ hours on the 90Wh battery. That would mean an
average of 13W, while doing actual work.

So I'm really wondering: Is the e1000 really eating up 15W or is powertop
misreporting?

I already calibrated powertop, without a change.

Wout.

--===============6550149130864593284==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+a2luZ21hIGF0IDxhIGhyZWY9Imh0dHA6Ly9ibHVld2luLmNoIiB0YXJn
ZXQ9Il9ibGFuayI+Ymx1ZXdpbi5jaDwvYT4gd3JvdGUgb24gV2VkIEZlYiAxMiAyMzozMjoyNyBQ
U1QgMjAxNDo8ZGl2Pjxicj48L2Rpdj48ZGl2PiZndDsgSSBvYnNlcnZlIGEgc3VzdGFpbmVkIGhp
Z2ggcG93ZXIgY29uc3VtcHRpb24gb2YgNS0gMTAgVyBvbiB0aGUgZWh0ZXJuZXQgYWRhcHRvciBl
MTAwMGUgb24gYSBsZW5vdm8gdGhpbmtncGFkIHQ0MzBzLiBTdWNoIEkgaGlnaCBwb3dlciBkcmFp
biBjYW5ub3QgYmUgY29ycmVjdCBjYW4gaXQ/IHRoZSB0b3RhbCBwb3dlciBjb25zdW1wdGlvbiBp
cyBhcm91bmQgMjUgVyB3aGljaCBpcyBhIGNvbmNlcm4gZm9yIGJhdHRlcnkgbGlmZS48L2Rpdj4K
CjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBub3RpY2luZyB0aGUgc2FtZSB0aGluZyBvbiBt
eSBEZWxsIExhdGl0dWRlIEU2NTQwLiBJdCBhbHNvIGhhcyBhbiBlMTAwMCBhbmQgcG93ZXJ0b3Ag
cmVwb3J0cyBpdCBhcyBiZWluZyB0aGUgaGlnaGVzdCBjb25zdW1lciwgYXQgYXJvdW5kIDE1Vy4g
V2hlbiBJIHVucGx1ZyB0aGUgc3lzdGVtLCB0aGUgYmF0dGVyeSByZXBvcnRzIGEgZHJhaW4gb2Yg
YWJvdXQgMjBXIHdoaWxlIGlkbGUgd2hpY2ggaXMgcHJldHR5IGJhZCBJTUhPLiBXaXRoIHRoZSA2
OFdoIGJhdHRlcnkgaXQgdHJhbnNsYXRlcyB0byBhYm91dCAyLjUgaG91cnMgYmF0dGVyeSBsaWZl
LjwvZGl2Pgo8ZGl2Pjxicj48L2Rpdj48ZGl2Pkxvd2VzdCBJJiMzOTt2ZSBzZWVuIGZvciBiYXR0
ZXJ5IGRyYWluIGlzIDE0Vywgd2l0aCB0aGUgc2NyZWVuIGF0IGxvd2VzdCBicmlnaHRuZXNzLCBH
b29nbGUgQ2hyb21lIHR1cm5lZCBvZmYsIGRpc2sgc3B1biBkb3duLiBJJiMzOTttIHVzaW5nIHRo
ZSBidWlsdC1pbiBJbnRlbCBncmFwaGljcyBhbmQgdGhlIHN5c3RlbSBoYXMgMTZHQiBvZiByYW0g
YW5kIGEgcXVhZC1jb3JlIGk3LjwvZGl2PgoKPGRpdj48YnI+PC9kaXY+PGRpdj5JIG5ldmVyIHJh
biB3aW5kb3dzIG9uIHRoaXMgbGFwdG9wIHNvIEkgZG9uJiMzOTt0IGtub3cgd2hhdCB0byBleHBl
Y3QgYnV0IHJldmlld3MgYXJlIGNsYWltaW5nIDcrIGhvdXJzIG9uIHRoZSA5MFdoIGJhdHRlcnku
IFRoYXQgd291bGQgbWVhbiBhbiBhdmVyYWdlIG9mIDEzVywgd2hpbGUgZG9pbmcgYWN0dWFsIHdv
cmsuPC9kaXY+PGRpdj48YnI+PC9kaXY+Cgo8ZGl2PlNvIEkmIzM5O20gcmVhbGx5IHdvbmRlcmlu
ZzogSXMgdGhlIGUxMDAwIHJlYWxseSBlYXRpbmcgdXAgMTVXIG9yIGlzIHBvd2VydG9wIG1pc3Jl
cG9ydGluZz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYWxyZWFkeSBjYWxpYnJhdGVkIHBv
d2VydG9wLCB3aXRob3V0IGEgY2hhbmdlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V291dC48
L2Rpdj48L2Rpdj4K

--===============6550149130864593284==--

