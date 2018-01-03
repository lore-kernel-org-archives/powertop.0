Content-Type: multipart/mixed; boundary="===============1635947981629974699=="
MIME-Version: 1.0
From: Anthony Accioly <a.accioly at 7rtc.com>
Subject: [Powertop] Battery discharge rates and estimated remaining time are
 wrong (120+ hours of remaining time)
Date: Wed, 03 Jan 2018 21:21:05 +0000
Message-ID: <CAKftZeXPCpQ-rFr7PdD6MxrRcaFHTg9CNAz=n8bqYTnRss+gUg@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============1635947981629974699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Problem description: Currently PowerTop is reporting the wrong battery
discharge rate for my system.

Notebook: P150EM
Battery model: P150HMBAT-8
PowerTOP version v2.8
openSUSE Leap 42.3
Kernel: 4.4.103-36-default

PowerTop output:

The battery reports a discharge rate of 485 mW
The estimated remaining time is 122 hours, 25 minutes

upower output (still a little bit off, but way more accurate):

~ # upower -i /org/freedesktop/UPower/devices/battery_BAT0
  native-path:          BAT0
  vendor:               Clevo CO.
  model:                X51
  power supply:         yes
  updated:              Wed Jan  3 20:14:27 2018 (56 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               discharging
    warning-level:       none
    energy:              56.0624 Wh
    energy-empty:        0 Wh
    energy-full:         59.866 Wh
    energy-full-design:  65.12 Wh
    energy-rate:         56.2992 W
    voltage:             14.8 V
    time to empty:       59.7 minutes
    percentage:          93%
    capacity:            91.9318%
    technology:          lithium-ion
    icon-name:          'battery-full-symbolic'

Anyone knows how PowerTop obtains the battery discharge rate? I'm guessing
that "485 mW" is hard-coded somewhere (not necessarily in PowerTop), it
never changes.

Kind regards,

-- =

Anthony Accioly

--===============1635947981629974699==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj5Qcm9ibGVt
IGRlc2NyaXB0aW9uOiBDdXJyZW50bHkgUG93ZXJUb3AgaXMgcmVwb3J0aW5nIHRoZSB3cm9uZyBi
YXR0ZXJ5IGRpc2NoYXJnZSByYXRlIGZvciBteSBzeXN0ZW0uPGJyPjxicj48L2Rpdj5Ob3RlYm9v
azogUDE1MEVNPGJyPjwvZGl2PkJhdHRlcnkgbW9kZWw6IFAxNTBITUJBVC04PGJyPlBvd2VyVE9Q
IHZlcnNpb24gdjIuODxicj5vcGVuU1VTRSBMZWFwIDQyLjM8YnI+PC9kaXY+S2VybmVsOiA0LjQu
MTAzLTM2LWRlZmF1bHQ8YnI+PGJyPjwvZGl2PlBvd2VyVG9wIG91dHB1dDo8YnI+PGJyPlRoZSBi
YXR0ZXJ5IHJlcG9ydHMgYSBkaXNjaGFyZ2UgcmF0ZSBvZiA0ODUgbVc8YnI+VGhlIGVzdGltYXRl
ZCByZW1haW5pbmcgdGltZSBpcyAxMjIgaG91cnMsIDI1IG1pbnV0ZXM8YnI+PGJyPjwvZGl2PnVw
b3dlciBvdXRwdXQgKHN0aWxsIGEgbGl0dGxlIGJpdCBvZmYsIGJ1dCB3YXkgbW9yZSBhY2N1cmF0
ZSk6PGJyPjxicj5+ICMgdXBvd2VyIC1pIC9vcmcvZnJlZWRlc2t0b3AvVVBvd2VyL2RldmljZXMv
YmF0dGVyeV9CQVQwPGJyPsKgIG5hdGl2ZS1wYXRoOsKgwqDCoMKgwqDCoMKgwqDCoCBCQVQwPGJy
PsKgIHZlbmRvcjrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENsZXZvIENPLjxicj7CoCBt
b2RlbDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWDUxPGJyPsKgIHBvd2VyIHN1cHBs
eTrCoMKgwqDCoMKgwqDCoMKgIHllczxicj7CoCB1cGRhdGVkOsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFdlZCBKYW7CoCAzIDIwOjE0OjI3IDIwMTggKDU2IHNlY29uZHMgYWdvKTxicj7CoCBo
YXMgaGlzdG9yeTrCoMKgwqDCoMKgwqDCoMKgwqAgeWVzPGJyPsKgIGhhcyBzdGF0aXN0aWNzOsKg
wqDCoMKgwqDCoCB5ZXM8YnI+wqAgYmF0dGVyeTxicj7CoMKgwqAgcHJlc2VudDrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeWVzPGJyPsKgwqDCoCByZWNoYXJnZWFibGU6wqDCoMKgwqDCoMKgwqAg
eWVzPGJyPsKgwqDCoCBzdGF0ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpc2NoYXJn
aW5nPGJyPsKgwqDCoCB3YXJuaW5nLWxldmVsOsKgwqDCoMKgwqDCoCBub25lPGJyPsKgwqDCoCBl
bmVyZ3k6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNTYuMDYyNCBXaDxicj7CoMKgwqAgZW5l
cmd5LWVtcHR5OsKgwqDCoMKgwqDCoMKgIDAgV2g8YnI+wqDCoMKgIGVuZXJneS1mdWxsOsKgwqDC
oMKgwqDCoMKgwqAgNTkuODY2IFdoPGJyPsKgwqDCoCBlbmVyZ3ktZnVsbC1kZXNpZ246wqAgNjUu
MTIgV2g8YnI+wqDCoMKgIGVuZXJneS1yYXRlOsKgwqDCoMKgwqDCoMKgwqAgNTYuMjk5MiBXPGJy
PsKgwqDCoCB2b2x0YWdlOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxNC44IFY8YnI+wqDCoMKg
IHRpbWUgdG8gZW1wdHk6wqDCoMKgwqDCoMKgIDU5LjcgbWludXRlczxicj7CoMKgwqAgcGVyY2Vu
dGFnZTrCoMKgwqDCoMKgwqDCoMKgwqAgOTMlPGJyPsKgwqDCoCBjYXBhY2l0eTrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDkxLjkzMTglPGJyPsKgwqDCoCB0ZWNobm9sb2d5OsKgwqDCoMKgwqDCoMKg
wqDCoCBsaXRoaXVtLWlvbjxicj7CoMKgwqAgaWNvbi1uYW1lOsKgwqDCoMKgwqDCoMKgwqDCoCAm
IzM5O2JhdHRlcnktZnVsbC1zeW1ib2xpYyYjMzk7PGJyPjxicj48L2Rpdj5BbnlvbmUga25vd3Mg
aG93IFBvd2VyVG9wIG9idGFpbnMgdGhlIGJhdHRlcnkgZGlzY2hhcmdlIHJhdGU/IEkmIzM5O20g
Z3Vlc3NpbmcgdGhhdCAmcXVvdDs0ODUgbVcmcXVvdDsgaXMgaGFyZC1jb2RlZCBzb21ld2hlcmUg
KG5vdCBuZWNlc3NhcmlseSBpbiBQb3dlclRvcCksIGl0IG5ldmVyIGNoYW5nZXMuPGJyPjxicj48
L2Rpdj5LaW5kIHJlZ2FyZHMswqAgPGJyPjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxk
aXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48YnI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+
PGRpdj4tLSA8YnI+PGRpdiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5BbnRob255IEFjY2lvbHk8
L2Rpdj4NCjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2
PjwvZGl2Pg0K

--===============1635947981629974699==--

