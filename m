Content-Type: multipart/mixed; boundary="===============7308295350355656922=="
MIME-Version: 1.0
From: Jaeyeon Kihm <nexuter at gmail.com>
Subject: [Powertop] Anybody run powerTop2.0 on omap4 (pandaboard)?
Date: Tue, 20 Nov 2012 17:06:07 -0500
Message-ID: <CAGnkzTkoPDCdSntoD02Qd--VwSN94A5wJf2ujAduy7_SdeVXfQ@mail.gmail.com>
To: powertop@lists.01.org
List-ID: <powertop@lists.01.org>

--===============7308295350355656922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I tried to run powerTop to monitor power consumption on an omap4 board
(pandaboard) and actually it's running on. However, I couldn't get C-states
that I expected. Due to the omap4 characteristics, it's supposed to have C0
to C6 states but my powerTop has only C1 to C3.
Based on this manual (
http://processors.wiki.ti.com/index.php/Running_PowerTOP_on_OMAP35x_platfor=
m)
additional patch would be required to update c-states for omap architecture
but I couldn't find the files (powertop.c, powertop.h display.c) as
described in this manual.
Does anybody run powerTop on omap4 (or pandaboard) environment? Could you
share how did you set up powerTop on omap4 architecture?

Thanks,
Jaeyeon

--===============7308295350355656922==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEzcHgi
PkhpIGFsbCw8L3NwYW4+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtm
b250LXNpemU6MTNweCI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLHNh
bnMtc2VyaWY7Zm9udC1zaXplOjEzcHgiPkkgdHJpZWQgdG8gcnVuIHBvd2VyVG9wIHRvIG1vbml0
b3IgcG93ZXIgY29uc3VtcHRpb24gb24gYW4gb21hcDQgYm9hcmQgKHBhbmRhYm9hcmQpIGFuZCBh
Y3R1YWxseSBpdCYjMzk7cyBydW5uaW5nIG9uLiBIb3dldmVyLCBJIGNvdWxkbiYjMzk7dCBnZXQg
Qy1zdGF0ZXMgdGhhdCBJIGV4cGVjdGVkLiBEdWUgdG8gdGhlIG9tYXA0IGNoYXJhY3RlcmlzdGlj
cywgaXQmIzM5O3Mgc3VwcG9zZWQgdG8gaGF2ZSBDMCB0byBDNiBzdGF0ZXMgYnV0IG15IHBvd2Vy
VG9wIGhhcyBvbmx5IEMxIHRvIEMzLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlh
bCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxM3B4Ij5CYXNlZCBvbiB0aGlzIG1hbnVhbCAoPGEgaHJl
Zj0iaHR0cDovL3Byb2Nlc3NvcnMud2lraS50aS5jb20vaW5kZXgucGhwL1J1bm5pbmdfUG93ZXJU
T1Bfb25fT01BUDM1eF9wbGF0Zm9ybSIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9wcm9jZXNzb3Jz
Lndpa2kudGkuY29tL2luZGV4LnBocC9SdW5uaW5nX1Bvd2VyVE9QX29uX09NQVAzNXhfcGxhdGZv
cm08L2E+KSBhZGRpdGlvbmFsIHBhdGNoIHdvdWxkIGJlIHJlcXVpcmVkIHRvIHVwZGF0ZSBjLXN0
YXRlcyBmb3Igb21hcCBhcmNoaXRlY3R1cmUgYnV0IEkgY291bGRuJiMzOTt0IGZpbmQgdGhlIGZp
bGVzIChwb3dlcnRvcC5jLCBwb3dlcnRvcC5oIGRpc3BsYXkuYykgYXMgZGVzY3JpYmVkIGluIHRo
aXMgbWFudWFsLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlm
O2ZvbnQtc2l6ZToxM3B4Ij5Eb2VzIGFueWJvZHkgcnVuIHBvd2VyVG9wIG9uIG9tYXA0IChvciBw
YW5kYWJvYXJkKSBlbnZpcm9ubWVudD8gQ291bGQgeW91IHNoYXJlIGhvdyBkaWQgeW91IHNldCB1
cCBwb3dlclRvcCBvbiBvbWFwNCBhcmNoaXRlY3R1cmU/PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6YXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6MTNweCI+CqA8L2Rpdj48ZGl2IHN0eWxl
PSJmb250LWZhbWlseTphcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxM3B4Ij48ZGl2PlRoYW5r
cyygPGJyPjwvZGl2PkphZXllb248L2Rpdj4K

--===============7308295350355656922==--

