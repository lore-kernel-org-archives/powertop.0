Content-Type: multipart/mixed; boundary="===============5955900168191463524=="
MIME-Version: 1.0
From: Wout Mertens <wout.mertens at gmail.com>
Subject: Re: [Powertop] HIgh power concumption on network interface
Date: Thu, 20 Feb 2014 07:35:10 +0100
Message-ID: <CAO3V83+w2XL8aSAoLNbqrw4ArRVV+HSq1RpQaA4=Zm_oN2ueBw@mail.gmail.com>
In-Reply-To: CABsxX9JF6W7tQ4HanzyuR6an8Ji5OEgedYavx3X+qMfNNbBH6Q@mail.gmail.com
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============5955900168191463524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alright I'll give that a shot, thanks!

As a side question though, is 20W a reasonable idle power consumption for a
high-end recent laptop?

Cheers,

Wout.
On Feb 19, 2014 7:53 PM, "Kok, Auke-jan H" <auke-jan.h.kok(a)intel.com> wro=
te:

>
>
>
> On Wed, Feb 19, 2014 at 1:13 AM, Wout Mertens <wout.mertens(a)gmail.com>w=
rote:
>
>> kingma at bluewin.ch wrote on Wed Feb 12 23:32:27 PST 2014:
>>
>> > I observe a sustained high power consumption of 5- 10 W on the ehternet
>> adaptor e1000e on a lenovo thinkgpad t430s. Such I high power drain cann=
ot
>> be correct can it? the total power consumption is around 25 W which is a
>> concern for battery life.
>>
>> I'm noticing the same thing on my Dell Latitude E6540. It also has an
>> e1000 and powertop reports it as being the highest consumer, at around 1=
5W.
>> When I unplug the system, the battery reports a drain of about 20W while
>> idle which is pretty bad IMHO. With the 68Wh battery it translates to ab=
out
>> 2.5 hours battery life.
>>
>> Lowest I've seen for battery drain is 14W, with the screen at lowest
>> brightness, Google Chrome turned off, disk spun down. I'm using the
>> built-in Intel graphics and the system has 16GB of ram and a quad-core i=
7.
>>
>> I never ran windows on this laptop so I don't know what to expect but
>> reviews are claiming 7+ hours on the 90Wh battery. That would mean an
>> average of 13W, while doing actual work.
>>
>> So I'm really wondering: Is the e1000 really eating up 15W or is powertop
>> misreporting?
>>
>
>
> There have been plenty of reports that point to the calibration being
> incomplete (Let's just call it that).
>
> Obviously e1000 won't eat 15W of power - 15W could power a 10gig Fiber
> Optic transceiver (a high-powered laser, basically). Power consumption is
> more in the order of a few watts max, with idle power much, much lower.
>
> Calibration could fail if during the calibration phase powertop is unable
> to toggle power to components or enable/disable devices. As a fallback, y=
ou
> can run the calibration multiple times and vary the enabled devices in the
> system. You could for instance go into the BIOS and disable the ethernet
> device entirely, calibrate, reboot and enable the ethernet device, then
> calibrate again. The extra data points should improve the power estimates
> for devices.
>
> Cheers,
>
> Auke
>
>

--===============5955900168191463524==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPkFscmlnaHQgSSYjMzk7bGwgZ2l2ZSB0aGF0IGEgc2hvdCwgdGhhbmtzITwv
cD4KPHAgZGlyPSJsdHIiPkFzIGEgc2lkZSBxdWVzdGlvbiB0aG91Z2gsIGlzIDIwVyBhIHJlYXNv
bmFibGUgaWRsZSBwb3dlciBjb25zdW1wdGlvbiBmb3IgYSBoaWdoLWVuZCByZWNlbnQgbGFwdG9w
PzwvcD4KPHAgZGlyPSJsdHIiPkNoZWVycyw8L3A+CjxwIGRpcj0ibHRyIj5Xb3V0LjwvcD4KPGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEZlYiAxOSwgMjAxNCA3OjUzIFBNLCAmcXVvdDtLb2ss
IEF1a2UtamFuIEgmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzphdWtlLWphbi5oLmtva0BpbnRl
bC5jb20iPmF1a2UtamFuLmgua29rQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxiciB0eXBlPSJh
dHRyaWJ1dGlvbiI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+
CjxkaXYgZGlyPSJsdHIiPjxkaXY+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48
YnI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBXZWQsIEZlYiAxOSwgMjAxNCBhdCAx
OjEzIEFNLCBXb3V0IE1lcnRlbnMgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86
d291dC5tZXJ0ZW5zQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndvdXQubWVydGVuc0BnbWFp
bC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPgoKPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRo
OjFweDtib3JkZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO2JvcmRlci1sZWZ0LXN0eWxl
OnNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPmtpbmdtYSBhdCA8YSBocmVm
PSJodHRwOi8vYmx1ZXdpbi5jaCIgdGFyZ2V0PSJfYmxhbmsiPmJsdWV3aW4uY2g8L2E+IHdyb3Rl
IG9uIFdlZCBGZWIgMTIgMjM6MzI6MjcgUFNUIDIwMTQ6PGRpdj4KCjxkaXY+PGJyPjwvZGl2Pjxk
aXY+Jmd0OyBJIG9ic2VydmUgYSBzdXN0YWluZWQgaGlnaCBwb3dlciBjb25zdW1wdGlvbiBvZiA1
LSAxMCBXIG9uIHRoZSBlaHRlcm5ldCBhZGFwdG9yIGUxMDAwZSBvbiBhIGxlbm92byB0aGlua2dw
YWQgdDQzMHMuIFN1Y2ggSSBoaWdoIHBvd2VyIGRyYWluIGNhbm5vdCBiZSBjb3JyZWN0IGNhbiBp
dD8gdGhlIHRvdGFsIHBvd2VyIGNvbnN1bXB0aW9uIGlzIGFyb3VuZCAyNSBXIHdoaWNoIGlzIGEg
Y29uY2VybiBmb3IgYmF0dGVyeSBsaWZlLjwvZGl2PgoKCgo8ZGl2Pjxicj48L2Rpdj48L2Rpdj48
ZGl2PkkmIzM5O20gbm90aWNpbmcgdGhlIHNhbWUgdGhpbmcgb24gbXkgRGVsbCBMYXRpdHVkZSBF
NjU0MC4gSXQgYWxzbyBoYXMgYW4gZTEwMDAgYW5kIHBvd2VydG9wIHJlcG9ydHMgaXQgYXMgYmVp
bmcgdGhlIGhpZ2hlc3QgY29uc3VtZXIsIGF0IGFyb3VuZCAxNVcuIFdoZW4gSSB1bnBsdWcgdGhl
IHN5c3RlbSwgdGhlIGJhdHRlcnkgcmVwb3J0cyBhIGRyYWluIG9mIGFib3V0IDIwVyB3aGlsZSBp
ZGxlIHdoaWNoIGlzIHByZXR0eSBiYWQgSU1ITy4gV2l0aCB0aGUgNjhXaCBiYXR0ZXJ5IGl0IHRy
YW5zbGF0ZXMgdG8gYWJvdXQgMi41IGhvdXJzIGJhdHRlcnkgbGlmZS48L2Rpdj4KCgo8ZGl2Pjxi
cj48L2Rpdj48ZGl2Pkxvd2VzdCBJJiMzOTt2ZSBzZWVuIGZvciBiYXR0ZXJ5IGRyYWluIGlzIDE0
Vywgd2l0aCB0aGUgc2NyZWVuIGF0IGxvd2VzdCBicmlnaHRuZXNzLCBHb29nbGUgQ2hyb21lIHR1
cm5lZCBvZmYsIGRpc2sgc3B1biBkb3duLiBJJiMzOTttIHVzaW5nIHRoZSBidWlsdC1pbiBJbnRl
bCBncmFwaGljcyBhbmQgdGhlIHN5c3RlbSBoYXMgMTZHQiBvZiByYW0gYW5kIGEgcXVhZC1jb3Jl
IGk3LjwvZGl2PgoKCgo8ZGl2Pjxicj48L2Rpdj48ZGl2PkkgbmV2ZXIgcmFuIHdpbmRvd3Mgb24g
dGhpcyBsYXB0b3Agc28gSSBkb24mIzM5O3Qga25vdyB3aGF0IHRvIGV4cGVjdCBidXQgcmV2aWV3
cyBhcmUgY2xhaW1pbmcgNysgaG91cnMgb24gdGhlIDkwV2ggYmF0dGVyeS4gVGhhdCB3b3VsZCBt
ZWFuIGFuIGF2ZXJhZ2Ugb2YgMTNXLCB3aGlsZSBkb2luZyBhY3R1YWwgd29yay48L2Rpdj48ZGl2
Pjxicj48L2Rpdj4KCgoKPGRpdj5TbyBJJiMzOTttIHJlYWxseSB3b25kZXJpbmc6IElzIHRoZSBl
MTAwMCByZWFsbHkgZWF0aW5nIHVwIDE1VyBvciBpcyBwb3dlcnRvcCBtaXNyZXBvcnRpbmc/PC9k
aXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJh
Ij48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj5UaGVyZSBoYXZlIGJlZW4gcGxlbnR5IG9mIHJlcG9y
dHMgdGhhdCBwb2ludCB0byB0aGUgY2FsaWJyYXRpb24gYmVpbmcgaW5jb21wbGV0ZSAoTGV0JiMz
OTtzIGp1c3QgY2FsbCBpdCB0aGF0KS48L2Rpdj4KCjxkaXY+PGJyPjwvZGl2PjxkaXY+T2J2aW91
c2x5IGUxMDAwIHdvbiYjMzk7dCBlYXQgMTVXIG9mIHBvd2VyIC0gMTVXIGNvdWxkIHBvd2VyIGEg
MTBnaWcgRmliZXIgT3B0aWMgdHJhbnNjZWl2ZXIgKGEgaGlnaC1wb3dlcmVkIGxhc2VyLCBiYXNp
Y2FsbHkpLiBQb3dlciBjb25zdW1wdGlvbiBpcyBtb3JlIGluIHRoZSBvcmRlciBvZiBhIGZldyB3
YXR0cyBtYXgsIHdpdGggaWRsZSBwb3dlciBtdWNoLCBtdWNoIGxvd2VyLjwvZGl2PgoKPGRpdj48
YnI+PC9kaXY+PGRpdj5DYWxpYnJhdGlvbiBjb3VsZCBmYWlsIGlmIGR1cmluZyB0aGUgY2FsaWJy
YXRpb24gcGhhc2UgcG93ZXJ0b3AgaXMgdW5hYmxlIHRvIHRvZ2dsZSBwb3dlciB0byBjb21wb25l
bnRzIG9yIGVuYWJsZS9kaXNhYmxlIGRldmljZXMuIEFzIGEgZmFsbGJhY2ssIHlvdSBjYW4gcnVu
IHRoZSBjYWxpYnJhdGlvbiBtdWx0aXBsZSB0aW1lcyBhbmQgdmFyeSB0aGUgZW5hYmxlZCBkZXZp
Y2VzIGluIHRoZSBzeXN0ZW0uIFlvdSBjb3VsZCBmb3IgaW5zdGFuY2UgZ28gaW50byB0aGUgQklP
UyBhbmQgZGlzYWJsZSB0aGUgZXRoZXJuZXQgZGV2aWNlIGVudGlyZWx5LCBjYWxpYnJhdGUsIHJl
Ym9vdCBhbmQgZW5hYmxlIHRoZSBldGhlcm5ldCBkZXZpY2UsIHRoZW4gY2FsaWJyYXRlIGFnYWlu
LiBUaGUgZXh0cmEgZGF0YSBwb2ludHMgc2hvdWxkIGltcHJvdmUgdGhlIHBvd2VyIGVzdGltYXRl
cyBmb3IgZGV2aWNlcy48L2Rpdj4KCjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJzLDwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+QXVrZTwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2Pgo8
L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============5955900168191463524==--

