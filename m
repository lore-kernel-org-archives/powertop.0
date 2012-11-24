Content-Type: multipart/mixed; boundary="===============8202132161667100233=="
MIME-Version: 1.0
From: Justin Brown <justin.brown at fandingo.org>
Subject: [Powertop] Multiple Batteries
Date: Fri, 23 Nov 2012 22:55:48 -0600
Message-ID: <CAKZK7uy6QP7xHvUpbhzz-Yh+SK2rBdzVNDcsBTgHG+=eiqGp4w@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============8202132161667100233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm using Powertop 2.1, and I've noticed a somewhat minor bug. (I couldn't
find a public bug tracker, but would be more than happy to move this
discussion to one if someone could send me a URL.)

I have two batteries in my laptop, but Powertop does not recognize both
when calculating battery life remaining. For example Gnome-Shell reports
that my batteries are at 66% and 100% (85% combined) giving me 10 hours and
11 minutes of estimated time remaining. On the other hand, Powertop reports
just 3 hours 17  minutes of time. Both programs are reporting the proper
discharge rate. It just seems like Powertop is only using my smaller
battery (the currently active one).

I'm not sure if this issue has been reported, or if the developers even
have equipment with which to test. I'm more than willing to provide any
sort of debugging output or testing as needed. I could also probably create
a patch, but that's likely to take a lot longer for me to get setup with
development on this project.
It may be as simple as iterating over a directory in /sys/ or /proc to
gather stats on multiple batteries. An experienced dev might be able to fix
it quickly.

Cheers,
Justin

--===============8202132161667100233==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIHVzaW5nIFBvd2VydG9wIDIuMSwgYW5k
IEkmIzM5O3ZlIG5vdGljZWQgYSBzb21ld2hhdCBtaW5vciBidWcuIChJIGNvdWxkbiYjMzk7dCBm
aW5kIGEgcHVibGljIGJ1ZyB0cmFja2VyLCBidXQgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRv
IG1vdmUgdGhpcyBkaXNjdXNzaW9uIHRvIG9uZSBpZiBzb21lb25lIGNvdWxkIHNlbmQgbWUgYSBV
UkwuKTwvZGl2Pgo8ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaGF2ZSB0d28gYmF0dGVyaWVzIGluIG15
IGxhcHRvcCwgYnV0IFBvd2VydG9wIGRvZXMgbm90IHJlY29nbml6ZSBib3RoIHdoZW4gY2FsY3Vs
YXRpbmcgYmF0dGVyeSBsaWZlIHJlbWFpbmluZy4gRm9yIGV4YW1wbGUgR25vbWUtU2hlbGwgcmVw
b3J0cyB0aGF0IG15IGJhdHRlcmllcyBhcmUgYXQgNjYlIGFuZCAxMDAlICg4NSUgY29tYmluZWQp
IGdpdmluZyBtZSAxMCBob3VycyBhbmQgMTEgbWludXRlcyBvZiBlc3RpbWF0ZWQgdGltZSByZW1h
aW5pbmcuIE9uIHRoZSBvdGhlciBoYW5kLCBQb3dlcnRvcCByZXBvcnRzIGp1c3QgMyBob3VycyAx
NyCgbWludXRlcyBvZiB0aW1lLiBCb3RoIHByb2dyYW1zIGFyZSByZXBvcnRpbmcgdGhlIHByb3Bl
ciBkaXNjaGFyZ2UgcmF0ZS4gSXQganVzdCBzZWVtcyBsaWtlIFBvd2VydG9wIGlzIG9ubHkgdXNp
bmcgbXkgc21hbGxlciBiYXR0ZXJ5ICh0aGUgY3VycmVudGx5IGFjdGl2ZSBvbmUpLjwvZGl2Pgo8
ZGl2Pjxicj48L2Rpdj48ZGl2PkkmIzM5O20gbm90IHN1cmUgaWYgdGhpcyBpc3N1ZSBoYXMgYmVl
biByZXBvcnRlZCwgb3IgaWYgdGhlIGRldmVsb3BlcnMgZXZlbiBoYXZlIGVxdWlwbWVudCB3aXRo
IHdoaWNoIHRvIHRlc3QuIEkmIzM5O20gbW9yZSB0aGFuIHdpbGxpbmcgdG8gcHJvdmlkZSBhbnkg
c29ydCBvZiBkZWJ1Z2dpbmcgb3V0cHV0IG9yIHRlc3RpbmcgYXMgbmVlZGVkLiBJIGNvdWxkIGFs
c28gcHJvYmFibHkgY3JlYXRlIGEgcGF0Y2gsIGJ1dCB0aGF0JiMzOTtzIGxpa2VseSB0byB0YWtl
IGEgbG90IGxvbmdlciBmb3IgbWUgdG8gZ2V0IHNldHVwIHdpdGggZGV2ZWxvcG1lbnQgb24gdGhp
cyBwcm9qZWN0LqA8L2Rpdj4KPGRpdj5JdCBtYXkgYmUgYXMgc2ltcGxlIGFzIGl0ZXJhdGluZyBv
dmVyIGEgZGlyZWN0b3J5IGluIC9zeXMvIG9yIC9wcm9jIHRvIGdhdGhlciBzdGF0cyBvbiBtdWx0
aXBsZSBiYXR0ZXJpZXMuIEFuIGV4cGVyaWVuY2VkIGRldiBtaWdodCBiZSBhYmxlIHRvIGZpeCBp
dCBxdWlja2x5LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2PjxkaXY+SnVz
dGluPC9kaXY+Cg==

--===============8202132161667100233==--

